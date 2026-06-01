import json
import time
from pathlib import Path
from urllib.parse import urlparse
import os
from datetime import datetime
from playwright.sync_api import sync_playwright, TimeoutError as PlaywrightTimeoutError
from playwright_stealth import Stealth

BASE_DIR = Path(__file__).resolve().parents[1]
PATH_CAT_CARREFOUR = BASE_DIR / "scraper/urlsCategoriasCarrefour.json"
RUTA_JSON = BASE_DIR / "scraper" / "scrapingCarrefour.json"
RUTA_LIMPIO = BASE_DIR / "scraper" / "scrapingCarrefour_limpio.json"
CP_BASE = 41001
CP_MAXIMO = 41099

def cpValidosCarrefour():
    ubicaciones_validas = []
    with Stealth().use_sync(sync_playwright()) as p:
        browser = p.chromium.launch(
            headless=True,
            channel="chrome", 
            args=[
                "--disable-blink-features=AutomationControlled",
                "--disable-infobars"
            ]
        )
            
        context = browser.new_context(
            user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36",
            viewport={"width": 1920, "height": 1080}
        )
        
        page = context.new_page()
        page.goto("https://www.carrefour.es/")
        time.sleep(2)

        try:
            page.locator("#onetrust-accept-btn-handler").click(timeout=10000)
            print("Cookies aceptadas con éxito para la sesión.")
            time.sleep(2)
        except Exception:
            print("No se encontró el diálogo de cookies.")

        for cp in range(CP_BASE, CP_MAXIMO + 1):
            str_cp = str(cp)
            try:
                page.reload()
                time.sleep(2)

                page.locator("div.salepoint-header-container__button_delivery").click(timeout=10000)
                page.locator("p.code_postal--changed").click(timeout=10000)
                
                input_cp = page.locator("input[name='postal-code']")
                input_cp.fill(str_cp)
                time.sleep(1)
                
                page.locator(".postal-code-dialog__footer button").first.click(timeout=10000)
                time.sleep(2)
                
                cookies = context.cookies()
                salepoint_cookie = next((c for c in cookies if c["name"] == "salepoint"), None)

                if salepoint_cookie:
                    valor_cookie = salepoint_cookie["value"]
                    division_wh = valor_cookie.split("||")
                    division_cp = division_wh[1].split("|")
                    cp_devuelto = division_cp[0]
                    warehouse = division_wh[0]

                    if cp_devuelto == str_cp:
                        ubicaciones_validas.append({
                            "cp": int(str_cp),
                            "warehouse": warehouse
                        })
                        print(f"Añadido Almacén: {warehouse}, CP: {str_cp}")
                    else:
                        print(f"El CP {str_cp} devolvió {cp_devuelto} (Probablemente sin reparto).")
                else:
                    print(f"ERROR: No se generó la cookie salepoint para {str_cp}.")
            except PlaywrightTimeoutError:
                print(f"Error de Timeout al procesar el CP {str_cp}.")
            except Exception as e:
                print(f"Error inesperado con {str_cp}: {e}")

        browser.close()
        
    ruta_fichero = BASE_DIR / "scraper" / "cpValidosCarrefour.json"
    ruta_fichero.parent.mkdir(parents=True, exist_ok=True) 
    
    with open(ruta_fichero, "w", encoding="utf-8") as f:
        json.dump(ubicaciones_validas, f, indent=4)
        
    print(f"Proceso finalizado. {len(ubicaciones_validas)} CPs guardados en {ruta_fichero}")

def urls_categorias_carrefour():
    with Stealth().use_sync(sync_playwright()) as p:
        browser = p.chromium.launch(
            headless=True,
            channel="chrome", 
            args=[
                "--disable-blink-features=AutomationControlled",
                "--disable-infobars"
            ]
        )
            
        context = browser.new_context(
            user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36",
            viewport={"width": 1920, "height": 1080}
        )
        
        page = context.new_page()
        page.goto("https://www.carrefour.es/")
        time.sleep(1)

        try:
            page.locator("#onetrust-accept-btn-handler").click(timeout=10000)
            print("Cookies aceptadas con éxito para la sesión.")
            time.sleep(1) 
        except Exception:
            print("No se encontró el diálogo de cookies.")

        botones_menu = page.locator("button[aria-label='Ir a menú'], .collage-menu__trigger").all()
        menu_abierto = False
        for btn in botones_menu:
            if btn.is_visible():
                btn.click()
                menu_abierto = True
                time.sleep(1.5) 
                break
                
        if not menu_abierto:
            print("ERROR: No se encontró ningún menú visible.")
            browser.close()
            return

        categorias_padre = [
            "https://carrefour.es/supermercado",
            "https://carrefour.es/parafarmacia-y-belleza",
            "https://carrefour.es/cuidado-personal-y-salud",
            "https://carrefour.es/mascotas"
        ]

        urls_nietas = []
        selector_hijas = "div.collage-new-menu__panel_container_2 li.menu-entry" 
        selector_nietas = "div.collage-new-menu__panel_container_3 li.menu-entry"
        selector_volver = "div.collage-new-menu__back button"

        for cat_url in categorias_padre:
            print(f"\nExplorando sección: {cat_url}")
            page.locator(f"li[url='{cat_url}']").click()
            time.sleep(2)

            hijas_count = page.locator(selector_hijas).count()
            print(f"Hay {hijas_count} subcategorias dentro del panel 2 de {cat_url}")
            
            for i in range(1, hijas_count): 
                hija_actual = page.locator(selector_hijas).nth(i)
                hija_url = hija_actual.get_attribute("url")

                es_hoja_final = hija_actual.locator("a.anchor").count() > 0

                if es_hoja_final:
                    print(f"Categoría final directa (sin nietas): {hija_url}")
                    if hija_url and hija_url not in urls_nietas:
                        urls_nietas.append(hija_url)
                    continue

                hija_actual.click()
                time.sleep(1.5)

                nietas = page.locator(selector_nietas).all()
                for nieta in nietas:
                    href = nieta.get_attribute("url")
                    if href and href not in urls_nietas:
                        urls_nietas.append(href)

                botones_volver = page.locator(selector_volver).all()
                botones_visibles = [btn for btn in botones_volver if btn.is_visible()]
                if botones_visibles:
                    botones_visibles[-1].click()
                time.sleep(1)

        browser.close()

    ruta_categorias = BASE_DIR / "scraper" / "urlsCategoriasCarrefour.json"
    ruta_categorias.parent.mkdir(parents=True, exist_ok=True)
    with open(ruta_categorias, "w", encoding="utf-8") as f:
        json.dump({"urls_nietas": urls_nietas}, f, indent=4)

    print(f"Extracción completada: {len(urls_nietas)} subcategorías guardadas en {ruta_categorias}.")

def extraer_datos_producto(item):
    imgs = item.get("images", {})
    imagen_url = imgs.get("desktop") or imgs.get("mobile")
    return {
        "nombre": item.get("name") or item.get("display_name"),
        "precio": item.get("active_price") or item.get("price"),
        "precio_unidad": item.get("price_per_unit") or item.get("unit_price"),
        "unidad_medida": item.get("measure_unit"), 
        "imagen": imagen_url,
        "url": f"https://www.carrefour.es{item.get('url')}" if item.get("url") else None
    }

def buscar_productos(d):
    prods = []
    pag = {}
    def rastrear(nodo):
        nonlocal prods, pag
        if isinstance(nodo, dict):
            if "total_results" in nodo:
                pag = nodo
            elif "pagination" in nodo and isinstance(nodo["pagination"], dict):
                pag = nodo["pagination"]
            for k, v in nodo.items():
                if isinstance(v, list) and len(v) > 0:
                    p = v[0]
                    if isinstance(p, dict) and ("name" in p or "display_name" in p):
                        if "active_price" in p or "price" in p:
                            if len(v) > len(prods):
                                prods = v
                rastrear(v)
        elif isinstance(nodo, list):
            for i in nodo:
                rastrear(i)
    rastrear(d)
    return {"items": prods, "pagination": pag}

def carrefourScraper(cp, warehouse):
    productos = {}
    hechas = set()
    ruta = BASE_DIR / "scraper" / "scrapingCarrefour.json"

    if os.path.exists(ruta):
        try:
            with open(ruta, "r", encoding="utf-8") as f:
                productos = json.load(f)
                for cat in productos.keys():
                    hechas.add(cat)
            print(f"Retomando. Categorias completadas: {len(hechas)}")
        except Exception as e:
            print(f"Error leyendo JSON: {e}")
            productos = {}

    try:
        with Stealth().use_sync(sync_playwright()) as p:
            browser = p.chromium.launch(
                headless=True,
                args=[
                    "--disable-blink-features=AutomationControlled",
                    "--disable-infobars"
                ]
            )
            
            context = browser.new_context(
                user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36",
                viewport={"width": 1920, "height": 1080}
            )
            
            page = context.new_page()
            path_cat = BASE_DIR / "scraper" / "urlsCategoriasCarrefour.json"
            with open(path_cat, "r", encoding="utf-8") as f:
                urls = json.load(f).get("urls_nietas", [])

            print(f"\nIniciando sesion para CP: {cp}")
            page.goto("https://www.carrefour.es/")
            
            try:
                page.locator("#onetrust-accept-btn-handler").click(timeout=10000)
                time.sleep(1)
                
                page.locator("div.salepoint-header-container__button_delivery").click(timeout=10000)
                page.locator("p.code_postal--changed").click(timeout=10000)
                
                inp = page.locator("input[name='postal-code']")
                inp.fill(str(cp))
                time.sleep(1)
                
                page.locator(".postal-code-dialog__footer button").first.click(timeout=10000)
                time.sleep(3)
            except Exception as e:
                print(f"Error config inicial: {e}")

            print(f"[{cp}] Iniciando proceso de scraping...")

            for u in urls:
                path = urlparse(u).path
                cat = path.split('/')[-3].replace('-', ' ').title()
                
                if cat in hechas:
                    print(f"Saltando: {cat}")
                    continue
                    
                print(f"\nCategoria: {cat}")
                
                if cat not in productos:
                    productos[cat] = []
                    
                offset = 0
                continuar = True
                error = False
                
                page.goto(u)
                time.sleep(2) 
                
                while continuar:
                    try:
                        res = {}
                        api_type = "plp-food-papi" if "/supermercado" in path else "plp-nonfood-papi"
                        api = f"https://www.carrefour.es/cloud-api/{api_type}/v1{path}?offset={offset}&platform=Desktop"

                        if offset == 0:
                            data1 = page.evaluate("() => window.__INITIAL_STATE__")
                            if data1:
                                res = buscar_productos(data1)
                            
                            if not res.get("items"):
                                data2 = page.evaluate("""async (url) => {
                                    try {
                                        let r = await fetch(url);
                                        return await r.json();
                                    } catch (e) {
                                        return {"error": true};
                                    }
                                }""", api)
                                if data2 and not data2.get("error"):
                                    res = buscar_productos(data2)
                        else:
                            data2 = page.evaluate("""async (url) => {
                                try {
                                    let r = await fetch(url);
                                    return await r.json();
                                } catch (e) {
                                    return {"error": true};
                                }
                            }""", api)
                            if data2 and not data2.get("error"):
                                res = buscar_productos(data2)
                            else:
                                print(f"Fallo fetch offset {offset}")
                                continuar = False
                                error = True
                                continue
                            time.sleep(0.5) 
                        
                        items = res.get("items", [])
                        
                        if not items:
                            if offset == 0:
                                print(f"Error: 0 items en offset 0. Fallo en la busqueda de {cat}.")
                                error = True
                            continuar = False
                            continue

                        for p in items:
                            productos[cat].append(extraer_datos_producto(p))
                        
                        print(f"Offset {offset} OK ({len(items)} items)")

                        pag = res.get("pagination", {})
                        total = pag.get("total_results", 0)
                        size = pag.get("page_size", 24)
                        
                        offset += size
                        if offset >= total or total == 0:
                            continuar = False
                            
                    except Exception as e:
                        print(f"Error en offset {offset}: {e}")
                        continuar = False
                        error = True

                if not error:
                    total_ext = sum(len(l) for l in productos.values())
                    print(f"Guardando progreso. Total en BBDD: {total_ext}")
                    with open(ruta, "w", encoding="utf-8") as f:
                        json.dump(productos, f, indent=4, ensure_ascii=False)
                    hechas.add(cat)

            browser.close()

    except Exception as e:
        print(f"[Carrefour] Error al procesar el supermercado: {e}")
    finally:
        total_fin = sum(len(l) for l in productos.values())
        print(f"[{cp}] Proceso finalizado, se han guardado {total_fin} productos.")
        if productos:
            limpiar_duplicados(cp)
        time.sleep(1)

def limpiar_duplicados(cp):
    ruta = BASE_DIR / "scraper" / "scrapingCarrefour.json"
    if not os.path.exists(ruta):
        print("Error: No existe el archivo original.")
        return

    with open(ruta, "r", encoding="utf-8") as f:
        data = json.load(f)

    total_inicial = sum(len(lista) for lista in data.values())
    nuevo_data = {}
    firmas = set()
    duplicados = 0

    for cat, lista_prod in data.items():
        nuevo_data[cat] = []
        for p in lista_prod:
            firma = (p.get("nombre"), p.get("marca"), p.get("precio"), p.get("precio_unidad"))
            if firma in firmas:
                duplicados += 1
            else:
                firmas.add(firma)
                nuevo_data[cat].append(p)
        if not nuevo_data[cat]:
            del nuevo_data[cat]

    total_final = sum(len(lista) for lista in nuevo_data.values())
    fecha = datetime.now().strftime("%d%m%Y%H%M")
    nombre_supermercado = "carrefour"
    ruta_salida = Path("./salida_scraper/") 
    ruta_salida.mkdir(parents=True, exist_ok=True)
    fichero_resultado = ruta_salida / f"{nombre_supermercado}_{str(cp)}_{fecha}.json"

    with open(fichero_resultado, "w", encoding="utf-8") as f:
        json.dump(nuevo_data, f, indent=4, ensure_ascii=False)

    print(f"Eliminando archivo original: {ruta}")
    time.sleep(1)
    os.remove(ruta)

    print("\nRESUMEN DE LIMPIEZA (FORMATO DICCIONARIO)")
    print(f"Total productos procesados: {total_inicial}")
    print(f"Duplicados eliminados: {duplicados}")
    print(f"Total productos unicos: {total_final}")
    print(f"Categorias procesadas: {len(nuevo_data)}")