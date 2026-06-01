from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from db.db import get_db
from schemas.schemas import OptimizacionRequest
from services.buscador import obtener_opciones_de_producto
from services.adaptadores import formatear_para_simplex
from services.optimizador_math import solve_shopping_optimization
import pgeocode
import math
from db.models import TiendasFisicas, Supermercados, ProductosSuper, SuperLoc
from services.logistica import calcular_distancia_haversine, estimar_costes_viaje

router = APIRouter()

@router.post("/optimizarLista", tags=["Optimizador Simplex"])
def optimizar_lista_compra(request: OptimizacionRequest, session: Session = Depends(get_db)):
    productos_encontrados = []
    productos_no_encontrados = []
    pool_todas_las_opciones = []
    precios_pool_simplex = {}    
    diccionario_recuperacion = {} 
    
    for item in request.lista_compra:      
        if item.ids_fijados and len(item.ids_fijados) > 0:
            productos_fijados = session.query(ProductosSuper).filter(ProductosSuper.id.in_(item.ids_fijados)).all()
            opciones_crudas = []
            for prod in productos_fijados:
                loc = session.query(SuperLoc).filter_by(id=prod.id_loc).first()
                opciones_crudas.append({
                    "id_frontend": item.id_frontend,
                    "id_producto_bd": prod.id,
                    "nombre": prod.nombre,
                    "precio": prod.precio,
                    "precio_unidad": prod.precio_unidad,
                    "unidad_medida": prod.unidad_medida,
                    "imagen": prod.imagen,
                    "url": prod.url,
                    "supermercado": {
                        "nombre": loc.nombre,
                        "cp": loc.cp,
                        "almacen": loc.almacen
                    }
                })
        else:
            opciones_crudas = obtener_opciones_de_producto(
                session=session, 
                nombre_producto=item.termino_busqueda, 
                solo_original=item.restriccion_marca_original,
                super_fijado=item.restriccion_supermercado
            )
            for o in opciones_crudas:
                o["id_frontend"] = item.id_frontend
                
        if not opciones_crudas:
            productos_no_encontrados.append({
                "id_frontend": item.id_frontend,
                "nombre_buscado": item.termino_busqueda
            })
            continue

        pool_todas_las_opciones.extend(opciones_crudas)
        productos_encontrados.append(item.id_frontend)
        precios_simplex, info_completa = formatear_para_simplex(opciones_crudas, item.cantidad)
        
        precios_pool_simplex[item.id_frontend] = precios_simplex
        diccionario_recuperacion[item.id_frontend] = info_completa

    if not productos_encontrados:
        raise HTTPException(status_code=400, detail="No se ha podido encontrar absolutamente ninguno de los productos de tu lista.")

    cp_usuario = str(request.preferencias.codigo_postal)
    motor_geografico = pgeocode.Nominatim('es')
    datos_cp = motor_geografico.query_postal_code(cp_usuario)

    if isinstance(datos_cp.latitude, float) and math.isnan(datos_cp.latitude):
        raise HTTPException(status_code=400, detail=f"El código postal {cp_usuario} no es válido o no existe en España.")

    latitud_usuario = datos_cp.latitude
    longitud_usuario = datos_cp.longitude

    tiendas_bd = session.query(TiendasFisicas, Supermercados).join(
        Supermercados, TiendasFisicas.id_super == Supermercados.id
    ).all()

    datos_supermercados = {}
    RADIO_MAXIMO_KM = 2.0 

    for tienda, marca in tiendas_bd:
        nombre_marca = marca.nombre.lower()
        
        dist_recta = calcular_distancia_haversine(
            latitud_usuario, longitud_usuario,
            tienda.latitud, tienda.longitud
        )

        if dist_recta <= RADIO_MAXIMO_KM:
            logistica = estimar_costes_viaje(dist_recta)
            
            if nombre_marca not in datos_supermercados or logistica["distancia_km"] < datos_supermercados[nombre_marca]["distancia_km"]:
                datos_supermercados[nombre_marca] = {
                    "distancia_km": logistica["distancia_km"],
                    "tiempo_h": logistica["tiempo_h"],
                    "tienda_lat": tienda.latitud,
                    "tienda_lon": tienda.longitud,
                    "distancia_real_km": round(dist_recta, 2)
                }

    if not datos_supermercados:
        raise HTTPException(status_code=400, detail=f"No hay supermercados disponibles a menos de {RADIO_MAXIMO_KM}km de tu ubicación.")
    
    if request.preferencias.tiempo_libre:
        peso_tiempo_hora = 10.0  # 10€/hora
    else:
        peso_tiempo_hora = 50.0

    try:
        resultado_matematico = solve_shopping_optimization(
            productos=productos_encontrados,
            datos_supermercados=datos_supermercados,
            precios=precios_pool_simplex,
            valor_tiempo=peso_tiempo_hora, 
            max_supermercados=request.preferencias.max_supermercados_visitar 
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error matemático: {str(e)}")
    
    if resultado_matematico["estado"] != "Solución encontrada":
         raise HTTPException(status_code=400, detail="El modelo matemático no encontró una combinación factible.")

    cesta_final = []
    coste_total_compra = 0.0
    supers_a_visitar = set()

    for id_frontend, super_elegido in resultado_matematico["decisiones"].items():
        supers_a_visitar.add(super_elegido)
        producto_ganador = diccionario_recuperacion[id_frontend][super_elegido]["producto_exacto"]
        precio_calculado = diccionario_recuperacion[id_frontend][super_elegido]["precio_calculado"]
        
        info_tienda = datos_supermercados[super_elegido]

        producto_dict = {
            "nombre": producto_ganador["nombre"],
            "precio": float(producto_ganador["precio"]),
            "precio_unidad": float(producto_ganador["precio_unidad"]),
            "unidad_medida": producto_ganador["unidad_medida"],
            "imagen": producto_ganador["imagen"],
            "url": producto_ganador["url"],
            "supermercado_fisico": {
                "marca": super_elegido,
                "latitud": info_tienda["tienda_lat"],
                "longitud": info_tienda["tienda_lon"],
                "distancia_desde_centroide": info_tienda["distancia_real_km"]
            }
        }

        cesta_final.append({
            "id_frontend": id_frontend,
            "supermercado_asignado": super_elegido,
            "precio_total_asignado": precio_calculado,
            "detalle_producto": producto_dict
        })
        coste_total_compra += precio_calculado

    distancia_total = 0.0
    tiempo_total_h = 0.0
    coste_logistico_estimado = 0.0
    COSTE_POR_KM = 0.26

    for s in supers_a_visitar:
        dist = datos_supermercados[s]["distancia_km"]
        tiempo = datos_supermercados[s]["tiempo_h"]
        
        distancia_total += dist
        tiempo_total_h += tiempo
        coste_logistico_estimado += (dist * COSTE_POR_KM) + (tiempo * peso_tiempo_hora)

    ahorro_calculado = calcular_ahorro_maximo(
        lista_compra_usuario=request.lista_compra,
        opciones_crudas=pool_todas_las_opciones,
        coste_optimizado=coste_total_compra
    )

    return {
        "mensaje": "Optimización completada con éxito",
        "resumen_logistico": {
            "coste_total_compra_euros": round(coste_total_compra, 2),
            "coste_logistico_estimado_euros": round(coste_logistico_estimado, 2),
            "distancia_total_km": round(distancia_total, 2),
            "tiempo_total_minutos": round(tiempo_total_h * 60, 0),
            "ahorro_maximo_conseguido_euros": ahorro_calculado,
            "supermercados_a_visitar": list(supers_a_visitar)
        },
        "productos_no_encontrados": productos_no_encontrados,
        "cesta_optimizada": cesta_final
    }

def calcular_ahorro_maximo(lista_compra_usuario, opciones_crudas, coste_optimizado):
    """
    Calcula el coste del carrito en cada supermercado por separado.
    Compara el coste del supermercado más caro contra el coste optimizado por el Simplex.
    """
    supermercados_existentes = set(opt["supermercado"]["nombre"] for opt in opciones_crudas)
    
    max_precio_por_item = {}
    for item in lista_compra_usuario:
        opciones_item = [o for o in opciones_crudas if o["id_frontend"] == item.id_frontend]
        if opciones_item:
            max_precio_por_item[item.id_frontend] = max(float(o["precio"]) for o in opciones_item)
        else:
            max_precio_por_item[item.id_frontend] = 0.0

    costes_por_super = {super_nombre: 0.0 for super_nombre in supermercados_existentes}

    for item in lista_compra_usuario:
        cant = item.cantidad
        opciones_item = [o for o in opciones_crudas if o["id_frontend"] == item.id_frontend]

        for super_nombre in supermercados_existentes:
            opc_super = [o for o in opciones_item if o["supermercado"]["nombre"] == super_nombre]

            if opc_super:
                mejor_precio_aqui = min(float(o["precio"]) for o in opc_super)
                costes_por_super[super_nombre] += mejor_precio_aqui * cant
            else:
                costes_por_super[super_nombre] += max_precio_por_item.get(item.id_frontend, 0.0) * cant

    # El "Peor Carrito Posible" es el total del supermercado más caro    
    peor_carrito_posible = max(costes_por_super.values()) if costes_por_super else float(coste_optimizado)
    
    ahorro = float(peor_carrito_posible) - float(coste_optimizado)

    return round(max(0.0, ahorro), 2)
