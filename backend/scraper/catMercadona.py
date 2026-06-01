import requests
import time
import json

RANGO_IDS = range(1, 300)
URL_BASE = "https://tienda.mercadona.es/api/categories/"

def categoriasValidasMercadona():
    categorias_validas = []

    for cat_id in RANGO_IDS:
        url = f"{URL_BASE}{cat_id}/"
        try:
            response = requests.get(url, timeout=5)
            if response.status_code == 200:
                print(f"La ID '{cat_id}' existe.")
                categorias_validas.append(cat_id)
            else:
                print(f"La ID '{cat_id}' no existe.")
        except requests.RequestException as e:
            print(f"Error al solicitar la ID '{cat_id}': {e}")
        time.sleep(0.1)

    # Guardar los resultados en un JSON
    with open("categoriasValidasMercadona.json", "w") as f:
        json.dump(categorias_validas, f)

    print(f"\nProceso completado. Se guardaron {len(categorias_validas)} categorías válidas en 'categoriasValidasMercadona.json'")
