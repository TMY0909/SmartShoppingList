import json
import ollama
from ollama import Client
from pathlib import Path
import time
import re
import sys
from llm.funcionesClasificador import *

MODELO = "mistral"
cliente_ia = Client(host='http://ollama:11434')
BASE_DIR = Path(__file__).resolve().parents[1] 
sys.path.append(str(BASE_DIR))

PATH_PROMPT = BASE_DIR / "llm/prompts/prompt.txt"
PATH_PROMPT_SIMPLE = BASE_DIR / "llm/prompts/prompt_simple.txt"

try:
    with open(PATH_PROMPT, "r", encoding="utf-8") as f:
        PROMPT_TEMPLATE = f.read() 
    with open(PATH_PROMPT_SIMPLE, "r", encoding="utf-8") as f:
        PROMPT_SIMPLE_TEMPLATE = f.read()
except FileNotFoundError as e:
    print(f"Error: No se pudo encontrar {e.filename}")
    exit()

BD_ERRORES = realimentacion_errores()
PROMPT_SUBCATEGORIAS, PROMPT_TAGS = agrupar_tagsCategoria()

ESTADOS_DE_ERROR = [
    "CATEGORIA_INVALIDA", 
    "ERROR_JSON_NO_ENCONTRADO", 
    "ERROR_JSON_SIN_CLAVE", 
    "ERROR_JSON_INVALIDO", 
    "ERROR_MODELO"
]

def clasificar(producto, prompt_template):  
    corrections_db = BD_ERRORES
    modelo = MODELO
    lista_subcategorias_prompt = PROMPT_SUBCATEGORIAS
    guia_tags_prompt = PROMPT_TAGS

    historial_errores = corrections_db.get(producto, [])
    historial_prompt = ""

    if historial_errores:
        historial_prompt = "Has clasificado incorrectamente este producto antes. Aquí están los detalles para que aprendas:\n"
        for error in historial_errores:
            historial_prompt += f"  - Intento fallido: '{error['predicho']}'. La respuesta correcta era: '{error['esperado']}'.\n"
    else:
        historial_prompt = "No hay errores previos registrados para este producto."

    prompt = prompt_template.replace("{{producto}}", producto)
    prompt = prompt.replace("{{LISTA_SUBCATEGORIAS}}", lista_subcategorias_prompt)
    prompt = prompt.replace("{{GUIA_TAGS}}", guia_tags_prompt)
    prompt = prompt.replace("{{HISTORIAL_ERRORES}}", historial_prompt)    

    try:
        respuesta = cliente_ia.chat(
            model=modelo,
            messages=[{"role": "user", "content": prompt}],
            options={"temperature": 0.0,    
                     "top_p": 1}                     
        )

        raw_response = respuesta['message']['content']
    
        try:
            json_match = re.search(r'\{.*\}', raw_response, re.DOTALL)
            if not json_match:
                return "ERROR_JSON_NO_ENCONTRADO"

            parsed_json = json.loads(json_match.group(0))
            prediccion = parsed_json.get("subcategoria")

            if not prediccion:
                return "ERROR_JSON_SIN_CLAVE"
            
            prediccion_validada = limpiar_respuesta(respuesta.message.content)
            if not "CATEGORIA_INVALIDA" in prediccion_validada:
                return prediccion_validada
            else:
                return "CATEGORIA_INVALIDA"
            
        except json.JSONDecodeError:
            print(f"\nERROR: No se pudo decodificar el JSON de la respuesta: {raw_response}")
            return "ERROR_JSON_INVALIDO"
        
    except Exception as e:
        print(f"\nERROR: Error al contactar el modelo {modelo}: {e}")
        return "ERROR_MODELO", 0

def clasificador():
    print("Iniciando clasificación (con guardado continuo y reanudación)...")
    print("-" * 60)
 
    PATH_PRODUCTOS = list((BASE_DIR / "productos/productosClasificar").glob("*.json"))
    output_path = BASE_DIR / "productos" / f"clasificacion_llm.json"
    output_path.parent.mkdir(parents=True, exist_ok=True)  

    resultados_por_super = {}
    if output_path.exists():
        print("Se ha detectado un archivo de clasificación previo. Cargando progreso...")
        with open(output_path, "r", encoding="utf-8") as f:
            try:
                resultados_por_super = json.load(f)
            except json.JSONDecodeError:
                print("El archivo previo estaba corrupto. Empezando de cero.")

    for filepath in PATH_PRODUCTOS:
        with open(filepath, "r", encoding="utf-8") as f:
            productos = json.load(f)
            
        if not productos: continue

        for nombre_super, lista_productos in productos.items():
            print(f"\nClasificando productos del bloque: {nombre_super}")
            
            if nombre_super not in resultados_por_super:
                resultados_por_super[nombre_super] = {}
            
            productos_clasificados = resultados_por_super[nombre_super]
            total_productos = len(lista_productos)
            print(f"Productos totales en este bloque: {total_productos}")
            print(f"Productos ya clasificados previamente: {len(productos_clasificados)}")

            contador_guardado = 0

            for idx, producto in enumerate(lista_productos):
                nombre_producto = producto.get("nombre")
                if not nombre_producto: continue

                if nombre_producto in productos_clasificados:
                    continue

                print(f"[{idx+1}/{total_productos}] Clasificando: {nombre_producto} ...")
                nombre_producto_norm = nombre_producto.strip().lower()
                respuesta_clasificador = clasificar(nombre_producto_norm, PROMPT_TEMPLATE)

                if respuesta_clasificador in ESTADOS_DE_ERROR:
                    print(f"Error al clasificar '{nombre_producto}': {respuesta_clasificador}. Reintentando...")
                    MAX_INTENTOS = 3
                    intentos = 0
                    while intentos < MAX_INTENTOS:
                        intentos += 1
                        respuesta_clasificador = clasificar(nombre_producto_norm, PROMPT_SIMPLE_TEMPLATE)
                        if respuesta_clasificador not in ESTADOS_DE_ERROR: break
                        time.sleep(1) 

                producto_clasificado = {
                    "nombre": nombre_producto,
                    "precio": producto.get("precio"),
                    "precio_unidad": producto.get("precio_unidad"),
                    "unidad_medida" : producto.get("unidad_medida"),
                    "imagen" : producto.get("imagen"),
                    "url" : producto.get("url"),
                    "subcategoria": respuesta_clasificador
                }
                productos_clasificados[nombre_producto] = producto_clasificado
                
                contador_guardado += 1
                if contador_guardado % 100 == 0:
                    print("Guardando progreso parcial al disco...")
                    with open(output_path, "w", encoding="utf-8") as f:
                        json.dump(resultados_por_super, f, ensure_ascii=False, indent=4)

            with open(output_path, "w", encoding="utf-8") as f:
                json.dump(resultados_por_super, f, ensure_ascii=False, indent=4)

    print("\nClasificación total completada.")