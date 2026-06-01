from sqlalchemy.orm import Session
from sqlalchemy import func, or_
from db.models import ProductosSuper, ProductosTags, Tags, SuperLoc
import nltk
from nltk.corpus import stopwords
import unicodedata

try:
    stopwords.words('spanish')
except LookupError:
    nltk.download('stopwords', quiet=True)

def limpiar_busqueda(texto: str) -> list:
    """
    Filtra preposiciones, artículos y maneja plurales básicos.
    """
    palabras = texto.lower().split()

    stop_words_espanol = set(stopwords.words('spanish'))
    palabras_utiles = [p for p in palabras if p not in stop_words_espanol]
    
    palabras_finales = []
    for p in palabras_utiles:
        if len(p) > 3:
            if p.endswith('es') and p[-3] not in 'aeiouáéíóú':
                palabras_finales.append(p[:-2]) # limones -> limon
            elif p.endswith('s'):
                palabras_finales.append(p[:-1]) # galletas -> galleta
            else:
                palabras_finales.append(p)
        else:
            palabras_finales.append(p)
            
    return palabras_finales

def normalizar_texto(texto: str) -> str:
    """Elimina acentos y pasa a minúsculas para comparar con precisión en Python"""
    if not texto: return ""
    return ''.join(c for c in unicodedata.normalize('NFD', str(texto)) if unicodedata.category(c) != 'Mn').lower()

def obtener_opciones_de_producto(session: Session, nombre_producto, max_resultados=20, solo_original=False, super_fijado=None):    
    nombre_limpio = nombre_producto.replace(" & ", "&")
    palabras = limpiar_busqueda(nombre_limpio)
    if not palabras:
        return []
    
    resultados_dict = {}

    condiciones_nombre = [
        func.unaccent(ProductosSuper.nombre).ilike(func.unaccent(f"%{palabra}%"))
        for palabra in palabras
    ]
    candidatos_anclas = session.query(ProductosSuper).filter(or_(*condiciones_nombre)).all()

    anclas = []
    if candidatos_anclas:
        candidatos_puntuados = []
        for prod in candidatos_anclas:
            nombre_norm = normalizar_texto(prod.nombre)
            score = sum(1 for palabra in palabras if normalizar_texto(palabra) in nombre_norm)
            candidatos_puntuados.append({"producto": prod, "score": score})

        max_score = max(c["score"] for c in candidatos_puntuados)
        anclas = [c["producto"] for c in candidatos_puntuados if c["score"] == max_score]

        for a in anclas:
            resultados_dict[a.id] = {"producto": a, "es_original": True, "coincidencias": max_score * 1000} 

        anclas_ids = [a.id for a in anclas]
        tags_anclas = session.query(ProductosTags.id_tag).filter(ProductosTags.id_producto.in_(anclas_ids)).all()
        ids_tags_unicos = list(set([t[0] for t in tags_anclas]))

        if ids_tags_unicos:
            alternativas_bd = (
                session.query(ProductosTags.id_producto, func.count(ProductosTags.id_tag).label('coincidencias'))
                .filter(ProductosTags.id_tag.in_(ids_tags_unicos))
                .group_by(ProductosTags.id_producto)
                .all()
            )

            if alternativas_bd:
                tags_objs = session.query(Tags.nombre).filter(Tags.id.in_(ids_tags_unicos)).all()
                nombres_tags = [normalizar_texto(t[0]) for t in tags_objs]
                terminos_clave = set([normalizar_texto(p) for p in palabras] + nombres_tags)

                alternativas_top = sorted(alternativas_bd, key=lambda x: x.coincidencias, reverse=True)[:30] # top 30 productos con mas coincidencias de tags 
                alt_ids = [alt.id_producto for alt in alternativas_top]
                productos_bulk = session.query(ProductosSuper).filter(ProductosSuper.id.in_(alt_ids)).all()
                prod_map = {p.id: p for p in productos_bulk}

                for alt_id, num_tags in alternativas_top:
                    if alt_id not in resultados_dict:
                        prod = prod_map.get(alt_id)
                        if prod:
                            palabras_alt_limpias = [normalizar_texto(p) for p in limpiar_busqueda(prod.nombre)]
                            bonus_texto = sum(100 for termino in terminos_clave if termino in palabras_alt_limpias)
                            
                            score_final = num_tags + bonus_texto
                            resultados_dict[alt_id] = {"producto": prod, "es_original": False, "coincidencias": score_final}

    else: # si no hay anclas, buscamos por tags 
        tags_coincidencia_ids = []
        for p in palabras:
            coincidencia = session.query(Tags).filter(func.lower(Tags.nombre) == p.lower()).first()
            if coincidencia:
                tags_coincidencia_ids.append(coincidencia.id)

        if tags_coincidencia_ids:
            alternativas_bd = (
                session.query(ProductosTags.id_producto, func.count(ProductosTags.id_tag).label('coincidencias'))
                .filter(ProductosTags.id_tag.in_(tags_coincidencia_ids))
                .group_by(ProductosTags.id_producto)
                .all()
            )

            if alternativas_bd:
                terminos_clave = set([normalizar_texto(p) for p in palabras])

                alternativas_top = sorted(alternativas_bd, key=lambda x: x.coincidencias, reverse=True)[:30]
                alt_ids = [alt.id_producto for alt in alternativas_top]
                productos_bulk = session.query(ProductosSuper).filter(ProductosSuper.id.in_(alt_ids)).all()
                prod_map = {p.id: p for p in productos_bulk}

                for alt_id, num_tags in alternativas_top:
                    if alt_id not in resultados_dict:
                        prod = prod_map.get(alt_id)
                        if prod:
                            palabras_alt_limpias = [normalizar_texto(p) for p in limpiar_busqueda(prod.nombre)]
                            
                            bonus_texto = sum(100 for termino in terminos_clave if termino in palabras_alt_limpias)
                            
                            score_final = num_tags + bonus_texto
                            resultados_dict[alt_id] = {"producto": prod, "es_original": False, "coincidencias": score_final}

    if not resultados_dict:
       return []

    resultados_finales = []
    for info in resultados_dict.values():
        prod = info["producto"]
        loc = session.query(SuperLoc).filter_by(id=prod.id_loc).first()

        if solo_original and not info["es_original"]:
            continue 

        if super_fijado and loc.nombre.lower() != super_fijado.lower():
            continue 

        resultados_finales.append({
            "id_producto_bd": prod.id,
            "nombre": prod.nombre,
            "precio": prod.precio,
            "precio_unidad": prod.precio_unidad,
            "unidad_medida": prod.unidad_medida,
            "imagen": prod.imagen,
            "url": prod.url,
            "es_original": info["es_original"],
            "coincidencias": info["coincidencias"],
            "supermercado": {
                "nombre": loc.nombre,
                "cp": loc.cp,
                "almacen": loc.almacen
            }
        })

    opciones_por_super = {}
    for res in resultados_finales:
        super_nombre = res["supermercado"]["nombre"]
        if super_nombre not in opciones_por_super:
            opciones_por_super[super_nombre] = {"originales": [], "alternativas": []}
            
        if res["es_original"]:
            opciones_por_super[super_nombre]["originales"].append(res)
        else:
            opciones_por_super[super_nombre]["alternativas"].append(res)
        
    mejores_precios = []
    num_supers = len(opciones_por_super)
    
    if num_supers > 0:
        limite_por_super = max(1, max_resultados // num_supers)
    else:
        limite_por_super = max_resultados

    for super_nombre, categorias in opciones_por_super.items():
        cupo_originales = max(1, limite_por_super // 2)
        cupo_alternativas = limite_por_super - cupo_originales 

        orig_ordenados = sorted(categorias["originales"], key=lambda x: x["precio_unidad"])
        alt_ordenadas = sorted(categorias["alternativas"], key=lambda x: (-x["coincidencias"], x["precio_unidad"]))

        seleccion_orig = orig_ordenados[:cupo_originales]
        seleccion_alt = alt_ordenadas[:cupo_alternativas]

        if len(seleccion_orig) < cupo_originales:
            faltan = cupo_originales - len(seleccion_orig)
            seleccion_alt = alt_ordenadas[:cupo_alternativas + faltan]
        elif len(seleccion_alt) < cupo_alternativas:
            faltan = cupo_alternativas - len(seleccion_alt)
            seleccion_orig = orig_ordenados[:cupo_originales + faltan]

        mejores_precios.extend(seleccion_orig)
        mejores_precios.extend(seleccion_alt)
        
    return mejores_precios