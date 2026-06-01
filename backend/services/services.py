from fastapi import Depends, HTTPException, Query
from sqlalchemy.orm import Session
from db.models import *
from db.db import get_db
from schemas.schemas import *

def obtener_id_subcategoria_api(
    nombre_producto: str = Query(..., description="Nombre del producto a consultar el id_scat", example="Conservas de Pescado"), 
    nombre_super: str = Query(..., description="Nombre del supermercado donde se encuentra el producto", example="mercadona"), 
    session: Session = Depends(get_db)
):
    """
    Obtiene el ID de una subcategoría a la que pertenece un producto dado.
    """
    super_loc = session.query(SuperLoc).filter_by(nombre=nombre_super).first()
    if super_loc:
        prod = (
            session.query(ProductosSuper)
            .filter_by(nombre=nombre_producto, id_loc=super_loc.id)
            .first()
        )
        return prod.id_scat if prod else None
    return None


def introducir_supermercado_api(
    nombre_super: str = Query(..., description="Nombre del supermercado", example="mercadona"), 
    session: Session = Depends(get_db)
):
    """
    Introduce un nuevo supermercado en la base de datos si no existe.
    """
    superm = session.query(Supermercados).filter_by(nombre=nombre_super).first()
    if not superm:
        superm = Supermercados(nombre=nombre_super)
        session.add(superm)
        session.flush()
    session.commit()
    return SupercheckResponse(
        status="ÉXITO",
        mensaje=f"El supermercado '{nombre_super}' ha sido introducido o ya existía.",
        id_super=superm.id
    )

def introducir_supermercado_loc_api(
    nombre_super: str = Query(..., description="Nombre del supermercado", example="mercadona"), 
    cp_super: int = Query(..., description="Código postal de la tienda", example=41001), 
    session: Session = Depends(get_db)
):
    """
    Introduce una nueva localización (código postal) para un supermercado en la base de datos si no existe.
    """
    super_loc = session.query(SuperLoc).filter_by(nombre=nombre_super, cp=cp_super).first()
    if not super_loc:
        id = introducir_supermercado_api(nombre_super, session).id_super
        super_loc = SuperLoc(id_super=id, nombre=nombre_super, cp=cp_super, direccion="")
        session.add(super_loc)
        session.flush()
    session.commit()
    return SupercheckResponse(
        status="ÉXITO",
        mensaje=f"La localización con CP '{cp_super}' para el supermercado '{nombre_super}' ha sido introducida o ya existía.",
        id_super=super_loc.id_super
    )

def comprobar_producto_api(
    producto: ProductoCheck, 
    super_nombre: str = Query(..., description="Nombre del supermercado", example="mercadona"), 
    cp: int = Query(..., description="Código postal de la tienda", example=41001), 
    session: Session = Depends(get_db)
):
    """
    Consulta de la existencia de un producto en BD, si existe se consulta su precio para saber si ha variado.
    """
    super_loc = introducir_supermercado_loc_api(super_nombre, cp, session)

    if not super_loc:
        raise HTTPException(
            status_code=404,
            detail=f"No se encontró la ubicación para el supermercado '{super_nombre}' con CP '{cp}'."
        )

    prod = (
        session.query(ProductosSuper)
        .filter_by(
            nombre=producto.nombre,
            envase=producto.envase,
            size=producto.size,
            id_loc=super_loc.id_super
        )
        .first()
    )

    if prod:  
        if prod.precio != producto.precio:
            return ProductoCheckResponse(
                status="PRECIO_CAMBIADO",
                mensaje=f"El precio de '{producto.nombre}' ha cambiado. Nuevo precio: {producto.precio}€.",
                nuevo_precio=producto.precio
            )
        else:  
            return ProductoCheckResponse(
                status="PRECIO_SIN_CAMBIOS",
                mensaje=f"El producto '{producto.nombre}' ya existe con el mismo precio."
            )
    else: 
        return ProductoCheckResponse(
            status="PRODUCTO_NO_ENCONTRADO",
            mensaje=f"El producto '{producto.nombre}' no existe en esta ubicación y debe ser añadido."
        )