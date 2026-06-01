from pathlib import Path
import json
from collections import defaultdict
import re
from unicodedata import normalize, category

BASE_DIR = Path(__file__).resolve().parents[1]  

PATH_CATEGORIZACION = BASE_DIR / "llm/datasets/miCategorizacion.json"
PATH_TAGS = BASE_DIR / "llm/datasets/tagsOrdenadasCategorias.json"
PATH_RESULTADOS = list((BASE_DIR / "llm/resultados").glob("*.txt"))

try:
    with open(PATH_CATEGORIZACION, "r", encoding="utf-8") as f:
        CATEGORIAS_MAP = json.load(f)

    with open(PATH_TAGS, "r", encoding="utf-8") as f:
        TAGS_CATEGORIA = json.load(f) 

except FileNotFoundError as e:
    print(f"Error: No se pudo encontrar {e.filename}")
    exit()

def parsear_errores(filepath):
    # Realimentación de errores de clasificación anteriores
    errores = []
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            error_pattern = re.compile(r"❌ '(.+?)' → (.+?) \(Esperado: (.+?)\)")
            for line in f:
                match = error_pattern.search(line)
                if match:
                    producto, predicho, esperado = match.groups()
                    errores.append({"producto": producto.strip().lower(), "predicho": predicho.strip(), "esperado": esperado.strip()})
    except FileNotFoundError:
        print(f"Aviso: No se encontró el fichero de resultados {filepath}. Se continuará sin él.")
    return errores

def realimentacion_errores():
    # Crea una base de datos de correcciones: {nombre_producto: [{"predicho": "X", "esperado": "Y"}, ...]}
    corrections_db = defaultdict(list)
    print("Analizando ejecuciones anteriores para aprender de los errores...")
    for path in PATH_RESULTADOS:
        errores_pasados = parsear_errores(path)
        for error in errores_pasados:
            if error not in corrections_db[error["producto"]]:
                corrections_db[error["producto"]].append(error)
    print(f"Se han encontrado {sum(len(v) for v in corrections_db.values())} errores únicos en {len(corrections_db)} productos para usar como referencia.")
    return corrections_db

def agrupar_tagsCategoria():
    # Crea un prompt con todas las subcategorías y sus respectivos tags asociados
    todas_subcategorias = []
    for lista_subcat in CATEGORIAS_MAP.values():
        if lista_subcat:
            for sublist in lista_subcat:
                todas_subcategorias.append(sublist)
        else:
            print("Aviso: No se ha encontrado 'miCategorizacion.json'.")
            return None, None
    
    lista_subcategorias_prompt = ", ".join(todas_subcategorias)

    lista_tags_prompt = ""
    for subcat, tags in TAGS_CATEGORIA.items():
        if subcat in todas_subcategorias:
            lista_tags_prompt += f"- {subcat}: {', '.join(tags[:300])}\n"

    print("Las subcategorias y tags se han agrupado correctamente.")    
    return lista_subcategorias_prompt, lista_tags_prompt    
    
def normalizar_texto(texto):
    # Elimina acentos y convierte a minúsculas
    s = ''.join(c for c in normalize('NFD', texto) if category(c) != 'Mn')
    return s.lower().strip()
    
def limpiar_respuesta(respuesta):
    # Normaliza la respuesta y la compara con las subcategorías válidas
    # devuelve la subcategoría original si coincide
    todas_subcategorias = []
    for lista_subcat in CATEGORIAS_MAP.values():    
        if lista_subcat:
            for sublist in lista_subcat:
                todas_subcategorias.append(sublist)

    lista_subcategorias_normalizadas = [
        normalizar_texto(subcat) for subcat in todas_subcategorias
    ]

    respuesta_normalizada = normalizar_texto(respuesta)

    for subcat_norm in lista_subcategorias_normalizadas:
        """ Si la respuesta coincide con una subcategoría válida (una de las que hay en miCategorizacion.json) 
            entonces devuelve la subcategoría de miCategorizacion"""
        if re.search(r'\b' + re.escape(subcat_norm) + r'\b', respuesta_normalizada):
            for original in todas_subcategorias:
                if normalizar_texto(original) == subcat_norm:
                    return original
            
    return "CATEGORIA_INVALIDA"


def extraer_info_super(nombre_super):
    # Extrae el nombre del supermercado y el código postal del nombre del fichero
    match = re.match(r"(\w+)_([0-9]{5})_([0-9]{12})\.json", nombre_super) # Formato: {nombre_supermercado}_{cp}_{fecha(DDMMAAAAHHmm)}.json
    if match:
        nombre_supermercado = match.group(1).lower()
        cp = match.group(2)
        fecha = match.group(3)
        if nombre_supermercado and cp and fecha:
            return nombre_supermercado, cp, fecha
    else:
        return None, None, None
    
