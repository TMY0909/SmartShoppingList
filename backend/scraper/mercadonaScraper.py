import time
import json
from datetime import datetime
from scraper.catMercadona import categoriasValidasMercadona
import os
from pathlib import Path
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import TimeoutException, NoSuchElementException, ElementClickInterceptedException

from scraper.driver import inicializar_driver

BASE_DIR = Path(__file__).resolve().parents[1]  
PATH_CATEGORIAS_VALIDAS = BASE_DIR / "scraper/categoriasValidasMercadona.json"

def cpValidosMercadona():
    
    CP_BASE = 41001
    CP_MAXIMO = 41099

    driver = inicializar_driver()
    ubicaciones_validas = []

    for cp in range(CP_BASE, CP_MAXIMO + 1):
        try:
            driver.delete_all_cookies()

            driver.get("https://tienda.mercadona.es/")
            wait = WebDriverWait(driver, 10)
            
            search = wait.until(EC.visibility_of_element_located(
                (By.XPATH, '//input[@name="postalCode"]')
            ))
            search.clear()
            search.send_keys(str(cp))
            search.send_keys(Keys.ENTER)
            
            time.sleep(3)
            
            cookies = driver.get_cookies()
            mo_cookie = next((c for c in cookies if c["name"] == "__mo_da"), None)

            if mo_cookie and mo_cookie.get('value'):
                cookie_data = json.loads(mo_cookie['value'])
                cp_recibido = cookie_data.get('postalCode')
                warehouse = cookie_data.get('warehouse')
                
                # La comprobación de que existe un mercadona es la siguiente:
                    # Se comprueba que tanto el warehouse como el CP que la API envia, no están vacios.
                    # Luego se comprueba que el CP recibido en la cookie coincide con el enviado.
                # Si todo es correcto el CP es válido.
                if warehouse and cp_recibido and str(cp_recibido) == str(cp):
                    print(f"CP VÁLIDO: {cp} | Almacén asignado: {warehouse}")
                    location_info = {'cp': cp, 'warehouse': warehouse}
                    ubicaciones_validas.append(location_info)
                    
                else:
                    print(f"CP INVÁLIDO: {cp} (Cookie generada pero sin almacén)")
            else:
                print(f"CP INVÁLIDO: {cp} (No se generó cookie de sesión)")

        except TimeoutException:
            print(f"Error Crítico: No se pudo cargar la página o encontrar el input para el CP {cp}.")
        except Exception as e:
            print(f"Error inesperado con {cp}: {e}")
    
    ruta_fichero_cp_validos = BASE_DIR / "scraper/cpValidosMercadona.json"
    
    with open(ruta_fichero_cp_validos, "w", encoding="utf-8") as f:
        json.dump(ubicaciones_validas, f, indent=4)

    driver.quit()
    print(f"\nProceso completado, se han registrado {len(ubicaciones_validas)} ubicaciones válidas (CP + Almacén).")

def mercadonaScraper(cp, warehouse):
    if not os.path.exists(PATH_CATEGORIAS_VALIDAS):
        categoriasValidasMercadona()

    datos_categorias = {}

    driver = inicializar_driver()

    try:
        wait = WebDriverWait(driver, 10)
        print(f"[{cp}] Navegando a la página principal...")
        driver.get("https://tienda.mercadona.es/")
        
        try:
            print(f"[{cp}] Intentando aceptar el diálogo de cookies...")
            reject_cookies_button = wait.until(
                EC.element_to_be_clickable((By.XPATH, "//button[normalize-space()='Rechazar']"))
            )
            reject_cookies_button.click()
            print(f"[{cp}] Diálogo de cookies rechazado.")
            time.sleep(1) 
        except (TimeoutException, NoSuchElementException):
            print(f"[{cp}] No se encontró el diálogo de cookies o ya fue aceptado. Continuando.")
        except ElementClickInterceptedException:
            print(f"[{cp}] El clic en el botón de cookies fue interceptado. Probablemente un elemento superpuesto.")
            pass

        search = wait.until(EC.visibility_of_element_located(
            (By.XPATH, '//input[@name="postalCode"]')
        ))
        search.clear()
        search.send_keys(str(cp))
        search.send_keys(Keys.ENTER)

        try:
            print(f"[{cp}] Comprobando si aparece la lista de calles...")
            short_wait = WebDriverWait(driver, 5)
            first_street = short_wait.until(EC.element_to_be_clickable(
                (By.CSS_SELECTOR, "[data-test='address-result-0']")
            ))
            print(f"[{cp}] Lista de calles encontrada. Seleccionando la primera.")
            first_street.click()
        except TimeoutException:
            print(f"[{cp}] Lista de calles no encontrada. Asumiendo carga directa a la tienda.")
            pass
        
        print(f"[{cp}] Esperando a que cargue la página de la tienda...")
        wait.until(EC.presence_of_element_located((By.ID, "search")))
        print(f"Scraper para CP {cp} ha cargado la página correctamente.")

        script_js = """
        var url = arguments[0];
        var cb = arguments[arguments.length - 1];
        fetch(url)
            .then(r => r.json())
            .then(d => cb(d))
            .catch(e => cb({"error": true}));
        """

        URL_BASE = "https://tienda.mercadona.es/api/categories/"
        
        with open(PATH_CATEGORIAS_VALIDAS, "r", encoding="utf-8") as categorias_validas_file:
            categorias_validas = json.load(categorias_validas_file)

        for cat_id in categorias_validas:
            api_url = f"{URL_BASE}{cat_id}/?lang=es&wh={warehouse}"

            try:
                data = driver.execute_async_script(script_js, api_url)
                
                if data and not data.get("error"):
                    categoria_principal = data.get("name", "Desconocida")
                    subcategorias = data.get("categories", [])
                    
                    articulos_procesados = 0

                    for subcat in subcategorias:
                        nombre_subcategoria = subcat.get("name", "Desconocida")
                        
                        if nombre_subcategoria not in datos_categorias:
                            datos_categorias[nombre_subcategoria] = []
                            
                        productos = subcat.get("products", [])
                        
                        for prod in productos:
                            price_info = prod.get("price_instructions", {})
                            
                            try:
                                precio = float(price_info.get("unit_price", 0))
                            except (TypeError, ValueError):
                                precio = 0.0
                                
                            try:
                                precio_unidad = float(price_info.get("bulk_price", 0))
                            except (TypeError, ValueError):
                                precio_unidad = 0.0

                            datos_categorias[nombre_subcategoria].append({
                                "nombre": prod.get("display_name"),
                                "precio": precio,
                                "precio_unidad": precio_unidad,
                                "unidad_medida": price_info.get("size_format"),
                                "imagen": prod.get("thumbnail"),
                                "url": prod.get("share_url")
                            })
                            articulos_procesados += 1

                    print(f"Categoría principal '{categoria_principal}' procesada. Artículos extraídos: {articulos_procesados}")
                else:
                    print(f"No se pudo extraer la categoría ID '{cat_id}'")

            except Exception as e:
                print(f"Error al procesar la categoría '{cat_id}': {e}")
            
            time.sleep(0.5)

        fecha = datetime.now().strftime("%d%m%Y%H%M")
        nombre_supermercado = "mercadona"
        
        ruta_salida = Path("./salida_scraper/") 
        ruta_salida.mkdir(parents=True, exist_ok=True)
        fichero_resultado = ruta_salida / f"{nombre_supermercado}_{str(cp)}_{fecha}.json"
        
        with open(fichero_resultado, "w", encoding="utf-8") as f:
            json.dump(datos_categorias, f, indent=4, ensure_ascii=False)
            
        total_productos = sum(len(v) for v in datos_categorias.values())
        print(f"[{cp}] Proceso finalizado. Se han guardado {total_productos} productos en {fichero_resultado}")
        
    except Exception as e:
        print(f"Error crítico en el scraper: {e}")
    finally:
        if driver:
            driver.quit()