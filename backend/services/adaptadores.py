def formatear_para_simplex(opciones_bd, cantidad: int):
    """
    Recibe opciones_db, que es la lista de productos encontrados por el buscador híbrido, y la cantidad deseada.
    Convierte la lista de productos encontrados en un diccionario para OR-Tools.
    Multiplica el precio unitario por la cantidad deseada.
    """
    precios_formateados = {}
    
    for opcion in opciones_bd:
        nombre_super = opcion["supermercado"]["nombre"].lower()
        
        precio_total_producto = float(opcion["precio"]) * cantidad
        
        if nombre_super not in precios_formateados or precio_total_producto < precios_formateados[nombre_super]["precio_calculado"]:
            precios_formateados[nombre_super] = {
                "precio_calculado": precio_total_producto,
                "producto_exacto": opcion
            }
            
    diccionario_limpio = {super: datos["precio_calculado"] for super, datos in precios_formateados.items()}
    
    return diccionario_limpio, precios_formateados