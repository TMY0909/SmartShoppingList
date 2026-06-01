import ollama
import json
import re
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from ollama import Client

cliente_ia = Client(host='http://ollama:11434')
MODELO_BASE = "llama32_3b_etiquetador"
MAX_WORKERS = 6
BASE_DIR = Path(__file__).resolve().parents[1]
PATH_TAGS = BASE_DIR / "llm/tagsOrdenadasCategorias.json" 

PROMPT_TEMPLATE = """
PRODUCTO: "{producto}"
LISTA_DE_ETIQUETAS:
{lista_etiquetas_fragmento}
INSTRUCCIONES: Genera un JSON siguiendo las instrucciones del Modelfile. 
Añade todas las etiquetas que consideres necesarias para describir a un producto, siempre que estén en la lista.
Responde estrictamente con el formato: {{"tags": ["tag1", "tag2", "tagn"]}}
"""

def cargar_tags_por_categoria():
    """Carga el JSON de tags completo."""
    try:
        with open(PATH_TAGS, "r", encoding="utf-8") as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"ERROR: No se encontró {PATH_TAGS}")
        return {}
    
def etiquetar_prod(lista_tags: list, nombre_producto: str) -> tuple:
    if not lista_tags:
        return nombre_producto, [], "SIN_TAGS_CANDIDATAS"

    tags_str = json.dumps(lista_tags, ensure_ascii=False)
    prompt_completo = PROMPT_TEMPLATE.format(
        producto=nombre_producto,
        lista_etiquetas_fragmento=tags_str
    )
    
    try:
        respuesta = cliente_ia.chat(
            model=MODELO_BASE,
            messages=[{"role": "user", "content": prompt_completo}],
            format="json",
            options={
                "temperature": 0.0,
                "top_p": 1.0,
                "num_ctx": 4096
            }
        )
        
        raw_json = respuesta['message']['content']
        json_match = re.search(r'\{.*?\}', raw_json, re.DOTALL)        
        if not json_match:
            return nombre_producto, [], "ERROR_JSON"

        datos_json = json.loads(json_match.group(0))
        
        etiquetas = []
        if nombre_producto in datos_json:
            etiquetas = datos_json[nombre_producto]
        elif "tags" in datos_json:
            etiquetas = datos_json["tags"]
        elif datos_json.values():
            val = list(datos_json.values())[0]
            if isinstance(val, list):
                etiquetas = val
        
        etiquetas_validas = [t for t in etiquetas if t in lista_tags]
        etiquetas_limitadas = etiquetas_validas[:5]

        return nombre_producto, etiquetas_limitadas, "OK"

    except Exception as e:
        return nombre_producto, [], f"ERROR_EXCEPCION: {str(e)}"

def ejecutar_etiquetador(productos_con_categoria: dict):
    diccionario_tags_cat = cargar_tags_por_categoria()
    
    if not productos_con_categoria:
        print("No hay productos para etiquetar.")
        return {}

    output_path = BASE_DIR / "productos" / "etiquetado_checkpoint.json"
    resultados_etiquetado = {}
    if output_path.exists():
        print("Cargando progreso de etiquetado previo...")
        with open(output_path, "r", encoding="utf-8") as f:
            try:
                resultados_etiquetado = json.load(f)
            except json.JSONDecodeError:
                print("El archivo de checkpoint estaba corrupto. Empezando de cero.")

    productos_pendientes = {p: c for p, c in productos_con_categoria.items() if p not in resultados_etiquetado}

    print(f"\nIniciando etiquetado de {len(productos_pendientes)} productos (omitidos {len(productos_con_categoria) - len(productos_pendientes)} ya procesados) con {MAX_WORKERS} hilos...")
    print("-" * 60)

    futures = []
    contador_guardado = 0
    total_pendientes = len(productos_pendientes)

    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        for prod, cat in productos_pendientes.items():
            tags_candidatas = diccionario_tags_cat.get(cat, [])
            future = executor.submit(etiquetar_prod, tags_candidatas, prod)
            futures.append(future)

        for future in as_completed(futures):
            prod, tags, estado = future.result()
            resultados_etiquetado[prod] = tags
            
            contador_guardado += 1 
            
            if estado == "OK":
                print(f"[{contador_guardado}/{total_pendientes}] {prod} => {tags}") 
            else:
                print(f"ERROR en etiquetador: {prod} => Fallo ({estado})")
                
            if contador_guardado % 100 == 0:
                print(f"[{contador_guardado}/{total_pendientes}] Guardando checkpoint de etiquetas...")
                with open(output_path, "w", encoding="utf-8") as f:
                    json.dump(resultados_etiquetado, f, ensure_ascii=False, indent=4)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(resultados_etiquetado, f, ensure_ascii=False, indent=4)

    print("-" * 60)
    return resultados_etiquetado
