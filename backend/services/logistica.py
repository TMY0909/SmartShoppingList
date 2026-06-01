import math

def calcular_distancia_haversine(lat1: float, lon1: float, lat2: float, lon2: float) -> float:
    """
    Calcula la distancia en línea recta entre dos puntos de la Tierra en kilómetros.
    """
    R = 6371.0 # Radio de la Tierra en kilómetros

    dlat = math.radians(lat2 - lat1)
    dlon = math.radians(lon2 - lon1)

    # Fórmula de trigonometría esférica
    a = (math.sin(dlat / 2)**2 + 
         math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dlon / 2)**2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

    distancia_linea_recta = R * c
    return distancia_linea_recta


def estimar_costes_viaje(distancia_haversine_km: float) -> dict:
    """
    Convierte la distancia en línea recta a distancia real de conducción y tiempo estimado.
    Utiliza un factor de 1.3 para convertir la distancia en línea recta a distancia real de conducción.
    Se estima un tiempo de estancia de 30 minutos en el supermercado y una velocidad media de 25 km/h en ciudad.
    """
    distancia_real_km = distancia_haversine_km * 1.3
    velocidad_media_kmh = 25.0
    tiempo_viaje_h = (distancia_real_km * 2) / velocidad_media_kmh
    
    tiempo_estancia_h = 0.5
    tiempo_total_h = tiempo_viaje_h + tiempo_estancia_h
    
    return {
        "distancia_km": round(distancia_real_km, 2),
        "tiempo_h": round(tiempo_total_h, 2)
    }