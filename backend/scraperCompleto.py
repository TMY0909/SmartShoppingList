import os
import json
import re
import shutil
import time
import random
import requests
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor

from llm.funcionesClasificador import extraer_info_super
from llm.clasificador import clasificador
from llm.etiquetador import ejecutar_etiquetador
from scraper.mercadonaScraper import mercadonaScraper, cpValidosMercadona
from scraper.carrefourScraper import carrefourScraper, cpValidosCarrefour
from scraper.diaScraper import diaScraper

import sys
import datetime

BASE_DIR = Path(__file__).resolve().parent
API_URL = "http://app-api-1:8000"

PATH_CP_VALIDOS_MERCADONA = BASE_DIR / "scraper/cpValidosMercadona.json"
PATH_CP_VALIDOS_CARREFOUR = BASE_DIR / "scraper/cpValidosCarrefour.json"
PATH_SALIDA_SCRAPER_DIR = BASE_DIR / "salida_scraper"

PATH_PRODUCTOS_DIR = BASE_DIR / "productos"
PATH_PRODUCTOS_CLASIFICAR_DIR = PATH_PRODUCTOS_DIR / "productosClasificar"
PATH_PRODUCTOS_ETIQUETAR_DIR = PATH_PRODUCTOS_DIR / "productosEtiquetar"
PATH_HISTORICO_DIR = PATH_PRODUCTOS_DIR / "historico"
PATH_PRE_HISTORICO_DIR = PATH_PRODUCTOS_DIR / "pre_historico"


class LoggerDoble:
    def __init__(self, nombre_archivo):
        self.terminal = sys.stdout
        self.log = open(nombre_archivo, "a", encoding="utf-8")

    def write(self, mensaje):
        self.terminal.write(mensaje)
        self.log.write(mensaje)
        self.log.flush() 

    def flush(self):
        self.terminal.flush()
        self.log.flush()

fecha_hoy = datetime.datetime.now().strftime("%d-%m-%Y_%H-%M")
archivo_log = BASE_DIR / f"log/log_ejecucion_{fecha_hoy}.txt"
archivo_log.parent.mkdir(parents=True, exist_ok=True)

sys.stdout = LoggerDoble(archivo_log)
sys.stderr = sys.stdout

print(f"--- INICIANDO SESIÓN DE SCRAPING: {fecha_hoy} ---")


def limpiar_procesos():
    """Mata procesos huérfanos de Chrome y Chromedriver en Windows."""
    print("Limpiando procesos residuales de navegadores previos a scraping...")
    os.system("taskkill /f /im chromedriver.exe >nul 2>&1")
    os.system("taskkill /f /im chrome.exe >nul 2>&1")
    time.sleep(2)

def hacer_peticion_con_reintentos(metodo, url, max_intentos=3, timeout=120, **kwargs):
    for intento in range(max_intentos):
        try:
            if metodo == "GET":
                respuesta = requests.get(url, timeout=timeout, **kwargs)
            elif metodo == "POST":
                respuesta = requests.post(url, timeout=timeout, **kwargs)
            elif metodo == "PUT":
                respuesta = requests.put(url, timeout=timeout, **kwargs)
            else:
                return None
            
            if respuesta.status_code in [200, 201, 404]:
                return respuesta
            print(f"[Intento {intento+1}/{max_intentos}] Status {respuesta.status_code} en {url}")
            print(f"Detalle del error: {respuesta.text}")
            
        except requests.exceptions.RequestException as e:
            print(f"[Intento {intento+1}/{max_intentos}] Error de red en {url}: {e}")
        
        if intento < max_intentos - 1:
            time.sleep(random.uniform(1.0, 3.0))
            
    print(f"Fallo definitivo tras {max_intentos} intentos en la ruta: {url}")
    return None

def procesar_super_por_almacen(nombre, path_cp, func_generar_cp, func_scraper):
    print(f"\n[{nombre}] Iniciando proceso...")
    if not os.path.exists(path_cp):
        print(f"[{nombre}] No existe fichero de CP válidos, iniciando la búsqueda...")
        func_generar_cp()

    try:
        with open(path_cp, "r", encoding="utf-8") as f:
            cp_validos = json.load(f)

        if cp_validos:
            hacer_peticion_con_reintentos("POST", f"{API_URL}/supermercados/cps-validos", json=cp_validos, params={"nombre_super": nombre})
            
            warehouses_procesados = set()
            for item in cp_validos:
                id_warehouse = item.get("warehouse")
                if id_warehouse not in warehouses_procesados:
                    cp_scrapear = item.get("cp")
                    print(f"[{nombre}] Scrapeando primer CP del almacén {id_warehouse}: {cp_scrapear}")
                    func_scraper(cp_scrapear, id_warehouse) 
                    
                    ficheros_temp = list(PATH_SALIDA_SCRAPER_DIR.glob(f"{nombre.lower()}_{cp_scrapear}_*.json"))
                    if not ficheros_temp:
                        print(f"[{nombre}] No se detectó fichero generado para CP {cp_scrapear}. Posible error en scraper.")
                    
                    warehouses_procesados.add(id_warehouse)
            print(f"[{nombre}] Todas las tareas de scrapeo han finalizado.")
    except Exception as e:
        print(f"[{nombre}] Error al procesar el supermercado: {e}")

def limpiar_precio(precio_raw):
    if isinstance(precio_raw, (float, int)):
        return float(precio_raw)
    if not isinstance(precio_raw, str) or not precio_raw.strip():
        return 0.0
    precio_limpio_str = re.sub(r"[^\d,\.]", "", precio_raw).replace(",", ".")
    if not precio_limpio_str: return 0.0
    try: return float(precio_limpio_str)
    except (ValueError, TypeError): return 0.0

def procesar_fichero_scraper(filepath):
    print(f"[THREAD] Iniciando procesamiento de: {filepath.name}")
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            SALIDA_SCRAPER = json.load(f)
        
        productos_clasificar = []
        productos_etiquetar = {}
        productos_historico = []
        nombre_super, cp, fecha_scrapeo = extraer_info_super(filepath.name)
        
        print(f"Procesando supermercado: {nombre_super} | CP: {cp}")
        
        hacer_peticion_con_reintentos("PUT", f"{API_URL}/superLoc", params={"nombre_super": nombre_super, "cp_super": cp})
        hacer_peticion_con_reintentos("PUT", f"{API_URL}/productos/desactivar-todos", params={"super_nombre": nombre_super, "cp": cp})

        respuesta_cache = hacer_peticion_con_reintentos("GET", f"{API_URL}/productos/{nombre_super}/{cp}")
        cache_productos = respuesta_cache.json() if respuesta_cache and respuesta_cache.status_code == 200 else {}

        productos_actualizar_bulk = []

        for subcategoria, productos in SALIDA_SCRAPER.items():
            for producto in productos:
                nombre_producto = producto.get("nombre")
                if not nombre_producto: continue
              
                producto["precio"] = limpiar_precio(producto.get("precio"))
                producto["precio_unidad"] = limpiar_precio(producto.get("precio_unidad"))

                datos_producto = cache_productos.get(nombre_producto)

                if datos_producto:
                    id_scat = datos_producto["id_scat"]
                    tiene_tags = datos_producto.get("tiene_tags", True)
                    nombre_scat = datos_producto.get("nombre_scat", "")

                    productos_actualizar_bulk.append({
                        "nombre": nombre_producto, 
                        "precio": producto["precio"],
                        "precio_unidad": producto["precio_unidad"], 
                        "unidad_medida": producto.get("unidad_medida", ""),
                        "imagen": producto.get("imagen", ""), 
                        "url": producto.get("url", ""),
                        "id_subcategoria": id_scat
                    })
                    
                    if not tiene_tags and nombre_scat:
                        productos_etiquetar[nombre_producto] = nombre_scat
                        
                    producto["subcategoria"] = nombre_scat
                    productos_historico.append(producto)
                else:
                    producto["subcategoria"] = None
                    productos_clasificar.append(producto)
                    productos_historico.append(producto)

        if productos_actualizar_bulk:
            print(f"[{cp}] Enviando {len(productos_actualizar_bulk)} productos conocidos a la BD...")
            hacer_peticion_con_reintentos("PUT", f"{API_URL}/productos/bulk", json=productos_actualizar_bulk, params={"super_nombre": nombre_super, "cp": cp})

        carpeta_destino = PATH_SALIDA_SCRAPER_DIR / "scraping_procesado" 
        carpeta_destino.mkdir(exist_ok=True)
        shutil.move(str(filepath), str(carpeta_destino / filepath.name))

        PATH_PRODUCTOS_CLASIFICAR_DIR.mkdir(parents=True, exist_ok=True)
        with open(PATH_PRODUCTOS_CLASIFICAR_DIR / f"{nombre_super}_{cp}_{fecha_scrapeo}.json", "w", encoding="utf-8") as f:
            json.dump({f"{nombre_super}_{cp}_{fecha_scrapeo}": productos_clasificar}, f, indent=4, ensure_ascii=False)
    
        PATH_PRODUCTOS_ETIQUETAR_DIR.mkdir(parents=True, exist_ok=True)
        with open(PATH_PRODUCTOS_ETIQUETAR_DIR / f"{nombre_super}_{cp}_{fecha_scrapeo}.json", "w", encoding="utf-8") as f:
            json.dump({f"{nombre_super}_{cp}_{fecha_scrapeo}": productos_etiquetar}, f, indent=4, ensure_ascii=False)

        PATH_PRE_HISTORICO_DIR.mkdir(parents=True, exist_ok=True)
        with open(PATH_PRE_HISTORICO_DIR / f"{nombre_super}_{cp}_{fecha_scrapeo}.json", "w", encoding="utf-8") as f:
            json.dump({f"{nombre_super}_{cp}_{fecha_scrapeo}": productos_historico}, f, indent=4, ensure_ascii=False)

    except Exception as e:
        print(f"ERROR procesando {filepath.name}: {e}")
    return f"Procesamiento de {filepath.name} completado."


def procesar_post_clasificacion():
    print("\nINICIANDO FUSIÓN POST-CLASIFICACIÓN Y GUARDADO EN BD")
    mapa_scats = {} 
    
    fichero_llm = PATH_PRODUCTOS_DIR / "clasificacion_llm.json"
    mapa_ia = {}
    if fichero_llm.exists():
        with open(fichero_llm, "r", encoding="utf-8") as f:
            datos_ia = json.load(f)
            for _, dict_prods in datos_ia.items():
                if isinstance(dict_prods, dict):
                    for nombre, detalles in dict_prods.items():
                        subcat = detalles.get("subcategoria")
                        if subcat and subcat != "CATEGORIA_INVALIDA":
                            mapa_ia[nombre] = subcat
                            mapa_scats[nombre] = subcat
        print(f"Cargadas {len(mapa_ia)} clasificaciones del clasificador.")

    archivos_originales = list(PATH_PRE_HISTORICO_DIR.glob("*.json"))
    
    for f_orig in archivos_originales:
        nombre_super, cp, fecha_scrapeo = extraer_info_super(f_orig.name)
        if not nombre_super: continue

        print(f"\nProcesando {nombre_super.upper()} (CP: {cp})...")
        hacer_peticion_con_reintentos("PUT", f"{API_URL}/superLoc", params={"nombre_super": nombre_super, "cp_super": cp})

        with open(f_orig, "r", encoding="utf-8") as f:
            datos_fichero = json.load(f)
        
        productos_nuevos_bulk = []
        error_guardado = []
        lista_completa_historico = []

        lista_productos_crudos = []
        if isinstance(datos_fichero, list):
            lista_productos_crudos = datos_fichero
        elif isinstance(datos_fichero, dict):
            for valores in datos_fichero.values():
                lista_productos_crudos.extend(valores)

        for prod in lista_productos_crudos:
            nombre = prod.get("nombre")
            subcat_actual = prod.get("subcategoria")
            
            es_nuevo = False
            if not subcat_actual:
                subcat_actual = mapa_ia.get(nombre)
                es_nuevo = True

            if subcat_actual:
                prod["subcategoria"] = subcat_actual
                
                if es_nuevo:
                    resp_id = hacer_peticion_con_reintentos("GET", f"{API_URL}/subcategorias", params={"subcategoria": subcat_actual})
                    if resp_id and resp_id.status_code == 200:
                        productos_nuevos_bulk.append({
                            "nombre": nombre,
                            "precio": limpiar_precio(prod.get("precio")),
                            "precio_unidad": limpiar_precio(prod.get("precio_unidad")),
                            "unidad_medida": prod.get("unidad_medida", ""),
                            "imagen": prod.get("imagen", ""),
                            "url": prod.get("url", ""),
                            "id_subcategoria": resp_id.json()
                        })
                    else:
                        error_guardado.append(prod)
            else:
                error_guardado.append(prod)
                
            lista_completa_historico.append(prod)

        if productos_nuevos_bulk:
            print(f"[{cp}] Insertando {len(productos_nuevos_bulk)} productos recién clasificados en BD...")
            hacer_peticion_con_reintentos("PUT", f"{API_URL}/productos/bulk", json=productos_nuevos_bulk, params={"super_nombre": nombre_super, "cp": cp})

        PATH_HISTORICO_DIR.mkdir(parents=True, exist_ok=True)
        with open(PATH_HISTORICO_DIR / f_orig.name, "w", encoding="utf-8") as f_hist:
            clave_hist = f"{nombre_super}_{cp}_{fecha_scrapeo}"
            json.dump({clave_hist: lista_completa_historico}, f_hist, indent=4, ensure_ascii=False)
            
        os.remove(f_orig) 

        if error_guardado:
            PATH_PRODUCTOS_CLASIFICAR_DIR.mkdir(parents=True, exist_ok=True) 
            with open(PATH_PRODUCTOS_CLASIFICAR_DIR / f"{nombre_super}_{cp}_{fecha_scrapeo}_errores.json", "w", encoding="utf-8") as f:
                json.dump({f"{nombre_super}_{cp}_{fecha_scrapeo}": error_guardado}, f, indent=4, ensure_ascii=False)
                
    return mapa_scats

def main():
    limpiar_procesos()
    procesar_super_por_almacen("mercadona", PATH_CP_VALIDOS_MERCADONA, cpValidosMercadona, mercadonaScraper)
    limpiar_procesos()
    procesar_super_por_almacen("carrefour", PATH_CP_VALIDOS_CARREFOUR, cpValidosCarrefour, carrefourScraper)
    limpiar_procesos()
    print("\n[Dia] Iniciando scraping asumiendo almacén único...")
    diaScraper("41013")
    
    PATH_PRODUCTOS_CLASIFICAR_DIR.mkdir(parents=True, exist_ok=True)
    PATH_PRODUCTOS_ETIQUETAR_DIR.mkdir(parents=True, exist_ok=True)
    PATH_HISTORICO_DIR.mkdir(parents=True, exist_ok=True)
    PATH_PRE_HISTORICO_DIR.mkdir(parents=True, exist_ok=True)

    ficheros_a_procesar = list(PATH_SALIDA_SCRAPER_DIR.glob("*.json"))
    if ficheros_a_procesar:
        with ThreadPoolExecutor(max_workers=5) as executor:
            for result in executor.map(procesar_fichero_scraper, ficheros_a_procesar):
                print(result)

    productos_clasificar = list(PATH_PRODUCTOS_CLASIFICAR_DIR.glob("*.json"))
    if productos_clasificar:
        productos_unicos_globales = {"productos_a_clasificar": []}
        nombres_vistos = set()
        for filepath in productos_clasificar:
            with open(filepath, "r", encoding="utf-8") as f:
                for super_key, productos in json.load(f).items():
                    for prod in productos:
                        if prod.get("nombre") not in nombres_vistos:
                            productos_unicos_globales["productos_a_clasificar"].append(prod)
                            nombres_vistos.add(prod.get("nombre"))
            os.remove(filepath) 
        
        filepath_clasificar = PATH_PRODUCTOS_CLASIFICAR_DIR / "productos_clasificar.json"
        with open(filepath_clasificar, "w", encoding="utf-8") as f:
            json.dump(productos_unicos_globales, f, indent=4, ensure_ascii=False)
        
        clasificador()

    mapa_scats = procesar_post_clasificacion()

    productos_para_etiquetar = {}
    for filepath in PATH_PRODUCTOS_ETIQUETAR_DIR.glob("*.json"):
        with open(filepath, "r", encoding="utf-8") as f:
            datos_etiqueta = json.load(f)
            for _, dict_prods in datos_etiqueta.items():
                productos_para_etiquetar.update(dict_prods)
        os.remove(filepath)

    productos_para_etiquetar.update(mapa_scats)

    if productos_para_etiquetar:
        resultados_tags = ejecutar_etiquetador(productos_para_etiquetar)
        
        print("\nGuardando etiquetas en la base de datos...")
        for nombre_prod, tags in resultados_tags.items():
            if tags:
                hacer_peticion_con_reintentos(
                    "PUT", 
                    f"{API_URL}/productos/tags", 
                    json={"nombre_producto": nombre_prod, "tags": tags}
                )
    else:
        print("\nNo se encontraron productos para etiquetar en esta ejecución.")

    print("\nLimpiando ficheros temporales de procesamiento de productos...")
    for fichero in PATH_PRODUCTOS_CLASIFICAR_DIR.glob("*.json"):
        try:
            os.remove(fichero)
        except OSError as e:
            print(f"Error al eliminar {fichero.name}: {e}")

    for fichero in PATH_PRODUCTOS_DIR.glob("*.json"):
        try:
            os.remove(fichero)
        except OSError as e:
            print(f"Error al eliminar {fichero.name}: {e}")

if __name__ == "__main__":
    main()