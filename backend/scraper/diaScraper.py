import json
from pathlib import Path
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import StaleElementReferenceException, TimeoutException
import time
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parents[1]

from scraper.driver import inicializar_driver

def urls_categorias_dia():
    driver = inicializar_driver()
    url_base = "https://www.dia.es"
    urls_dia = []
   
    try:
        driver.get(url_base)
        time.sleep(2)
        
        try:
            btn_cookies = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.ID, "onetrust-accept-btn-handler"))
            )
            btn_cookies.click()
            time.sleep(2) 
        except TimeoutException:
            pass

        try:
            botones_menu = WebDriverWait(driver, 10).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, "button[aria-label='categories list menú button'], .category-button dia-icon-dehaze"))
            )
            for btn in botones_menu:
                if btn.is_displayed():
                    driver.execute_script("arguments[0].click();", btn)
                    time.sleep(1.5)
        except TimeoutException:
            pass

        padres = WebDriverWait(driver, 10).until(
            EC.presence_of_all_elements_located((By.CSS_SELECTOR, "li[data-test-id='categories-list-element'] > a[data-test-id='category-item-link']"))
        )
        num_padres = len(padres)

        for i in range(num_padres):
            padres_actualizados = WebDriverWait(driver, 10).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, "li[data-test-id='categories-list-element'] > a[data-test-id='category-item-link']"))
            )
            padre = padres_actualizados[i]
            driver.execute_script("arguments[0].click();", padre)
            time.sleep(1.5) 

            subcategorias_hijas = WebDriverWait(driver, 5).until(
                EC.presence_of_all_elements_located((By.CSS_SELECTOR, "ul[data-test-id='sub-categories-list'] a[data-test-id='sub-category-item-link']"))
            )

            for sub in subcategorias_hijas[1:]:
                try:
                    uri = sub.get_attribute('href')
                    if uri not in urls_dia:
                        urls_dia.append(uri)
                except StaleElementReferenceException:
                    continue

    except Exception:
        pass
        
    finally:
        if driver:
            driver.quit()

    ruta_categorias = BASE_DIR / "scraper" / "urlsCategoriasDia.json"
    ruta_categorias.parent.mkdir(parents=True, exist_ok=True)
    
    estructura_final = {"urls_dia": urls_dia}
    
    with open(ruta_categorias, 'w', encoding='utf-8') as f:
        json.dump(estructura_final, f, ensure_ascii=False, indent=4)


def diaScraper(cp):
    driver = inicializar_driver()
    url_base = "https://www.dia.es"
    path_cat = BASE_DIR / "scraper" / "urlsCategoriasDia.json"
    productos_agrupados = {}

    with open(path_cat, "r", encoding="utf-8") as f:
        urls = json.load(f).get("urls_dia", [])
   
    try:
        driver.get(url_base)
        time.sleep(2)
        
        try:
            btn_cookies = WebDriverWait(driver, 5).until(
                EC.element_to_be_clickable((By.ID, "onetrust-accept-btn-handler"))
            )
            btn_cookies.click()
            time.sleep(2) 
        except TimeoutException:
            pass

        try:
            wait = WebDriverWait(driver, 10)
            btn_del = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "div.postal-code-button")))
            btn_del.click()

            inp = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "input[data-test-id='postal-code-modal-input']")))
            inp.clear()
            inp.send_keys(cp)
            time.sleep(1)
            
            btn_sav = wait.until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button[data-test-id='postal-code-modal-btn']")))
            driver.execute_script("arguments[0].click();", btn_sav)
            time.sleep(3)
        except Exception:
            pass

        script_js = """
        var url = arguments[0];
        var cb = arguments[arguments.length - 1];
        fetch(url)
            .then(r => r.json())
            .then(d => cb(d))
            .catch(e => cb({"error": true}));
        """

        print(f"[{cp}] Iniciando proceso de scraping...")

        for url in urls:
            api_url = url.replace("https://www.dia.es/", "https://www.dia.es/api/v1/plp-back/reduced/")
            
            fragmentos = url.split('/')
            subcategoria = fragmentos[4].replace('-', ' ').capitalize()

            if subcategoria not in productos_agrupados:
                productos_agrupados[subcategoria] = []

            pagina_actual = 1
            total_paginas = 1

            while pagina_actual <= total_paginas:
                url_paginada = f"{api_url}?page={pagina_actual}"
                
                try:
                    data = driver.execute_async_script(script_js, url_paginada)
                    
                    if data and not data.get("error"):
                        if pagina_actual == 1:
                            paginacion = data.get("pagination", {})
                            total_paginas = paginacion.get("total_pages", 1)

                        items = data.get("plp_items", [])
                        
                        if len(items) == 0:
                            break

                        for item in items:
                            precios = item.get("prices", {})
                            
                            relative_url = item.get("url", "")
                            url_producto = f"https://www.dia.es{relative_url}" if relative_url else None
                            relative_foto = item.get("image", "")
                            foto_producto = f"https://www.dia.es{relative_foto}" if relative_foto else None
                            
                            productos_agrupados[subcategoria].append({
                                "nombre": item.get("display_name"),
                                "precio": precios.get("price"),
                                "precio_unidad": precios.get("price_per_unit"),
                                "unidad_medida": precios.get("measure_unit"),
                                "imagen": foto_producto,
                                "url": url_producto
                            })
                        
                        pagina_actual += 1
                        time.sleep(0.5)
                    else:
                        break  
                except Exception:
                    break


        fecha = datetime.now().strftime("%d%m%Y%H%M")
        nombre_supermercado = "dia"
        
        ruta_salida = Path("./salida_scraper/") 
        ruta_salida.mkdir(parents=True, exist_ok=True)
        fichero_resultado = ruta_salida / f"{nombre_supermercado}_{str(cp)}_{fecha}.json"

        with open(fichero_resultado, 'w', encoding='utf-8') as f:
            json.dump(productos_agrupados, f, ensure_ascii=False, indent=4)

        print(f"[{cp}] Proceso finalizado, se han guardado {sum(len(v) for v in productos_agrupados.values())} productos.")

    except Exception:
        pass
    finally:
        driver.quit()
