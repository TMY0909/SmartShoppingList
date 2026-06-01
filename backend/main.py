from fastapi import FastAPI, Depends, HTTPException, Query
from typing import List
from sqlalchemy.orm import joinedload, Session
from sqlalchemy import func
from db.models import *
from db.db import get_db
from schemas.schemas import *
from routers import optimizador, cargar_tiendas
from services.buscador import obtener_opciones_de_producto
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="API de SmartShoppingList",
    description="API para comprobar y gestionar productos de supermercados."
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],  
    allow_headers=["*"],
)

@app.get("/", tags=["Bienvenida"])
def root():
    return {"Hello" : "World!"}

app.include_router(optimizador.router)
app.include_router(cargar_tiendas.router)

@app.get("/categorias", response_model=List[dict], tags=["Usuario"])
def get_categorias(session: Session = Depends(get_db)):
    """
    Obtiene una lista con las categorías disponibles en la base de datos.
    """
    return session.query(Categorias).all()

@app.get("/categorias/{id}", response_model=List[str], tags=["Usuario"])
def get_subcategorias(id: int, session: Session = Depends(get_db)):
    """
    Obtiene una lista con las subcategorías asociadas a una categoría específica (según el id).
    """
    cat_query = session.query(Categorias).filter(Categorias.id == id).first()
    if not cat_query:
        raise HTTPException(status_code=404, detail="Categoría no encontrada")
    return [sub.nombre for sub in cat_query.subcategorias]

@app.get("/subcategorias/{id}", response_model=List[str], tags=["Usuario"])
def get_subcategorias(id: int, session: Session = Depends(get_db)):
    """
    Obtiene una lista con los nombres de los productos asociados a una subcategoría específica (según el id).
    Obtiene todos los nombres de productos de todos los supermercados.
    """
    scat_query = session.query(Subcategorias).filter(Subcategorias.id == id).first()
    if not scat_query:
        raise HTTPException(status_code=404, detail="Subcategoría no encontrada")
    return [prod.nombre for prod in scat_query.productos_super]

@app.get("/supermercados", response_model=List[dict], tags=["Usuario"])
def get_supermercados(session: Session = Depends(get_db)):
    """
    Obtiene una lista con todos los supermercados registrados en la base de datos.
    """
    super_query = session.query(Supermercados).all()
    if not super_query:
        raise HTTPException(status_code=404, detail="No se han encontrado supermercados")
    return [{"nombre": super.nombre, "id": str(super.id)} for super in super_query]
    
@app.get("/supermercados/{id_super}", response_model=List[str], tags=["Usuario"])
def get_supermercados_id(id_super: int, session: Session = Depends(get_db)):
    """
    Obtiene una lista con los códigos postales guardados en BD de un supermercado específico (según id).
    """
    super_query = session.query(Supermercados).options(joinedload(Supermercados.super_loc)).filter(Supermercados.id == id_super)
    if not super_query.first():
        raise HTTPException(status_code=404, detail="Supermercado no encontrado")
    return [str(loc.cp) for loc in super_query.first().super_loc]

@app.get("/superloc/{cp}", response_model=List[str], tags=["Admin"])
def get_productos_supermercado(cp: int, session: Session = Depends(get_db)):
    """
    Obtiene una lista con los nombres de productos disponibles en un supermercado específico (según cp).
    """
    superloc_query = session.query(SuperLoc).options(joinedload(SuperLoc.productos_super)).filter(SuperLoc.cp == cp)
    if not superloc_query.first():
        raise HTTPException(status_code=404, detail="Localización no encontrada")
    return [prod.nombre for prod in superloc_query.first().productos_super]

@app.post("/productos/id_scat", response_model=int, tags=["Sistema"])
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
        if prod:
            return prod.id_scat
            
    raise HTTPException(status_code=404, detail="Producto no clasificado previamente.")

@app.put("/supermercados", tags=["Admin"])
def introducir_supermercado_api(
    nombre_super: str = Query(..., description="Nombre del supermercado", example="mercadona"),
    session: Session = Depends(get_db)
):
    nombre_norm = nombre_super.strip().lower() # Forzamos minúsculas
    superm = session.query(Supermercados).filter(func.lower(Supermercados.nombre) == nombre_norm).first()
    
    if not superm:
        superm = Supermercados(nombre=nombre_norm)
        session.add(superm)
        session.commit()
        session.refresh(superm)
        
    return SupercheckResponse(
        status="ÉXITO",
        mensaje=f"El supermercado '{nombre_norm}' ha sido procesado.",
        id_super=superm.id
    )

@app.put("/superLoc", tags=["Admin"])
def introducir_supermercado_loc_api(
    nombre_super: str = Query(..., description="Nombre del supermercado", example="mercadona"), 
    cp_super: int = Query(..., description="Código postal de la tienda", example=41001), 
    session: Session = Depends(get_db)
):
    nombre_norm = nombre_super.strip().lower() # Forzamos minúsculas
    super_loc = session.query(SuperLoc).filter(func.lower(SuperLoc.nombre) == nombre_norm, SuperLoc.cp == cp_super).first()
    
    if not super_loc:
        res_super = introducir_supermercado_api(nombre_norm, session)
        super_loc = SuperLoc(id_super=res_super.id_super, nombre=nombre_norm, cp=cp_super, almacen="")
        session.add(super_loc)
        session.commit()
        session.refresh(super_loc)
        
    return SupercheckResponse(
        status="ÉXITO",
        mensaje=f"Localización {cp_super} para '{nombre_norm}' procesada.",
        id_super=super_loc.id_super
    )

@app.post("/productos", response_model=ProductoCheckResponse, tags=["Sistema"])
def comprobar_producto_api(
    producto: ProductoCheck,
    super_nombre: str = Query(..., description="Nombre del supermercado", example="mercadona"),
    cp: int = Query(..., description="Código postal de la tienda", example=41001),
    session: Session = Depends(get_db)
):
    """
    Comprueba si un producto existe en una ubicación específica.
    Si existe, verifica si su precio ha cambiado.
    """
    super_loc = session.query(SuperLoc).filter_by(nombre=super_nombre, cp=cp).first()

    if not super_loc:
        raise HTTPException(
            status_code=404,
            detail=f"No se encontró la ubicación para el supermercado '{super_nombre}' con CP '{cp}'."
        )

    prod = (
        session.query(ProductosSuper)
        .filter_by(
            nombre=producto.nombre,
            url=producto.url,
            id_loc=super_loc.id
        ).first()
    )

    if prod:
        prod.activo = True # El producto sigue estando en el catálogo, activo = true

        if prod.precio != producto.precio:
            prod.precio = producto.precio
            session.commit()
            return ProductoCheckResponse(
                status="PRECIO_CAMBIADO",
                mensaje=f"El precio de '{producto.nombre}' ha cambiado. El precio ha sido actualizado a {producto.precio}€.",
                nuevo_precio=producto.precio,
            )
        else:
            session.commit() # Para el prod.activo
            return ProductoCheckResponse(
                status="PRECIO_SIN_CAMBIOS",
                mensaje=f"El producto '{producto.nombre}' ya existe con el mismo precio.",
            )
    else:
        return ProductoCheckResponse(
            status="PRODUCTO_NO_ENCONTRADO",
            mensaje=f"El producto '{producto.nombre}' no existe y debe ser añadido.",
        )

@app.put("/productos", tags=["Sistema"])
def put_producto(
    producto: ProductoCheck,
    super_nombre: str = Query(..., description="Nombre del supermercado", example="mercadona"), 
    cp: int = Query(..., description="Código postal de la tienda", example=41001), 
    session: Session = Depends(get_db)
):
    """
    Introduce un nuevo producto en la base de datos si no existe.
    """
    comprobacion = comprobar_producto_api(producto, super_nombre, cp, session)

    if comprobacion.status == "PRODUCTO_NO_ENCONTRADO":
        if not producto.id_subcategoria:
            raise HTTPException(
                status_code=404, 
                detail=f"No se encontró la subcategoría con ID '{producto.id_subcategoria}'."
            )
        id_superLoc = session.query(SuperLoc).filter_by(nombre=super_nombre, cp=cp).first().id
        if not id_superLoc:
            id_superLoc = introducir_supermercado_loc_api(super_nombre, cp, session).id_super
        nuevo_producto = ProductosSuper(
            id_scat=producto.id_subcategoria,
            id_loc=id_superLoc,
            nombre=producto.nombre,
            precio=producto.precio,
            precio_unidad=producto.precio_unidad,
            unidad_medida=producto.unidad_medida,
            imagen=producto.imagen,
            url=producto.url
        )
        session.add(nuevo_producto)
        session.commit()
        return {"status": "ÉXITO", "mensaje": f"El producto '{producto.nombre}' ha sido introducido con éxito."}

@app.get("/productos/supermercados", response_model=List[dict], tags=["Usuario"])
def consultar_producto(
    nombre_producto: str = Query(..., description="Nombre del producto a consultar", example="Atún Claro en Aceite de Girasol"),
    super_nombre: str = Query(..., description="Nombre del supermercado donde se encuentra el producto", example="mercadona"),
    session: Session = Depends(get_db)
):
    """
    Obtiene el(los) supermercado(s) en los que se encuentra un producto consultado,
    además devuelve la información completa de este.
    """
    
    super_loc = session.query(SuperLoc).filter_by(nombre=super_nombre).all()
    if super_loc:
        resultados = []
        for loc in super_loc:
            productos = (
                session.query(ProductosSuper)
                .filter_by(nombre=nombre_producto, id_loc=loc.id)
                .all()
            )
            if productos:
                for prod in productos:
                    resultados.append({
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
        if resultados:
            return resultados
        else:
            raise HTTPException(status_code=404, detail="Producto no encontrado en el supermercado especificado")
    else:
        raise HTTPException(status_code=404, detail="Supermercado no encontrado")

@app.get("/productos/compararPrecio", tags=["Usuario"])
def comparar_precio_endpoint(
    nombre_producto: str = Query(..., description="Nombre del producto a consultar", example="principe"),
    max_resultados: int = Query(20, description="Número máximo de resultados a devolver", example=20),
    session: Session = Depends(get_db)
    ):
    return obtener_opciones_de_producto(session, nombre_producto, max_resultados)
    
@app.put("/tags/actualiza", tags=["Admin"])
def actualiza_tags_bd(
    session: Session = Depends(get_db)
):
    """
    Añade las tags, contenidas en el fichero JSON 'tagsOrdenadasCategorias.json', 
    que no existan en la BD.
    """
    import json
    with open('tagsOrdenadasCategorias.json', 'r', encoding='utf-8') as f:
        tags_data = json.load(f)
    
    for scat, listaTags in tags_data.items():
        scat_obj = session.query(Subcategorias).filter_by(nombre=scat).first()
        if scat_obj:
            for tag in listaTags:
                tag_db = session.query(Tags).filter_by(nombre=tag).first()
                if not tag_db:
                    nueva_tag = Tags(nombre=tag, id_scat=scat_obj.id)
                    session.add(nueva_tag)
    try:
        session.commit()
        return {"status": "ÉXITO", "mensaje": f"Las etiquetas han sido introducidas con éxito."}
    except Exception as e:
        session.rollback()
        raise HTTPException(status_code=500, detail=f"Error al actualizar las etiquetas: {str(e)}")
    
@app.get("/cp/producto", tags=["Usuario"])
def consultar_CP_producto(
    nombre_producto: str = Query(..., description="Nombre del producto a consultar", example="Atún Claro en Aceite de Girasol"),
    session: Session = Depends(get_db)):

    """
    Consulta un producto en un codigo postal dado
    """

    producto_palabras = nombre_producto.split()
    tags_coincidencia = []
    for p in producto_palabras:
        coincidencia = session.query(Tags).filter(nombre = p)
        if coincidencia:
            tags_coincidencia.append(coincidencia.id)

    cp_disponibles = []
    
    for t in tags_coincidencia:
        query_cp = session.query(ProductosSuper).join(ProductosTags).join(SuperLoc).filter(ProductosTags.id_tag == t).all()
        cp_disponibles.append(query_cp.cp)

    return cp_disponibles

@app.get("/subcategoria/cp", tags=["Usuario"])
def consultar_CP_producto(
    subcategoria: str = Query(..., description="Nombre de la subcategoría a consultar", example="Fruta y verdura"),
    cp_super: int = Query(..., description="Código postal de la tienda", example=41001),
    session: Session = Depends(get_db)):
    
    """
    Consulta los productos de una subcategoria completa de un CP dado
    """

    existe = session.query(SuperLoc).filter(SuperLoc.cp == cp_super).first()    
    if not existe:
        raise HTTPException(status_code=404, detail="Código postal no encontrado")

    prodcuctos_cp = session.query(ProductosSuper)\
        .join(Subcategorias).join(SuperLoc)\
        .filter(SuperLoc.cp == cp_super, Subcategorias.nombre == subcategoria).all()

    return prodcuctos_cp

@app.get("/subcategorias", response_model=int, tags=["Usuario"])
def obtener_id_subcategoria_nombre_api(
    subcategoria: str = Query(..., description="Nombre de la subcategoría a consultar", example="Fruta y verdura"),
    session: Session = Depends(get_db)
):
    """
    Obtiene el ID de una subcategoría a partir de su nombre.
    """
    resp = (
        session.query(Subcategorias)
        .filter(func.lower(Subcategorias.nombre) == subcategoria.lower())
        .first()
    )
    if resp: return resp.id
    raise HTTPException(status_code=404, detail="Subcategoría no encontrada")

@app.put("/productos/desactivar-todos", tags=["Sistema"])
def desactivar_productos_api(
    super_nombre: str = Query(..., description="Nombre del supermercado", example="mercadona"),
    cp: int = Query(..., description="Código postal de la tienda", example=41001),
    session: Session = Depends(get_db)
):
    """
    Marca todos los productos de un supermercado y CP específico como inactivos (activo = False)
    antes de iniciar la actualización del scraping. De esta forma vemos los productos que han sido
    descatalogados.
    """
    super_loc = session.query(SuperLoc).filter_by(nombre=super_nombre, cp=cp).first()
    
    if not super_loc:
        return {"status": "IGNORADO", "mensaje": "La localización no existe aún, no hay productos que desactivar."}

    session.query(ProductosSuper).filter(ProductosSuper.id_loc == super_loc.id).update({"activo": False})
    session.commit()
    
    return {"status": "ÉXITO", "mensaje": f"Productos de {super_nombre} (CP: {cp}) marcados como inactivos."}

@app.post("/supermercados/cps-validos", tags=["Admin"])
def cargar_cps_validos_api(
    lista_cps: List[CPWarehouse],
    nombre_super: str = Query(..., description="Nombre del supermercado", example="mercadona"),
    session: Session = Depends(get_db)
):
    """
    Recibe un JSON con la lista de Códigos Postales válidos y su almacén asociado, 
    y los guarda en la base de datos para el supermercado especificado.
    """
    nombre_norm = nombre_super.strip().lower() 
    superm = session.query(Supermercados).filter_by(nombre=nombre_norm).first() 
    if not superm:
        superm = Supermercados(nombre=nombre_norm)
        session.add(superm)
        session.flush()

    registros_nuevos = 0
    registros_actualizados = 0

    for item in lista_cps:
        loc = session.query(SuperLoc).filter_by(nombre=nombre_super, cp=item.cp).first()
        
        if not loc:
            nueva_loc = SuperLoc(
                id_super=superm.id, 
                nombre=nombre_super, 
                cp=item.cp, 
                almacen=item.warehouse 
            )
            session.add(nueva_loc)
            registros_nuevos += 1
        else:
            if loc.almacen != item.warehouse:
                loc.almacen = item.warehouse
                registros_actualizados += 1

    session.commit()
    
    return {
        "status": "ÉXITO", 
        "mensaje": f"Procesados {len(lista_cps)} CPs para '{nombre_super}'. {registros_nuevos} nuevos insertados y {registros_actualizados} actualizados."
    }

@app.put("/productos/tags", tags=["Sistema"])
def enlazar_tags_producto(
    payload: ProductoTagsInput,
    session: Session = Depends(get_db)
):
    """
    Enlaza una lista de etiquetas a todos los productos que coincidan con el nombre.
    """
    productos = session.query(ProductosSuper).filter_by(nombre=payload.nombre_producto).all()
    
    if not productos:
        raise HTTPException(status_code=404, detail="Producto no encontrado en la BD.")

    etiquetas_enlazadas = 0

    for prod in productos:
        for nombre_tag in payload.tags:
            tag_db = session.query(Tags).filter_by(nombre=nombre_tag).first()
            if tag_db:
                existe_enlace = session.query(ProductosTags).filter_by(
                    id_producto=prod.id, 
                    id_tag=tag_db.id
                ).first()
                
                if not existe_enlace:
                    nuevo_enlace = ProductosTags(id_producto=prod.id, id_tag=tag_db.id)
                    session.add(nuevo_enlace)
                    etiquetas_enlazadas += 1

    session.commit()
    return {"status": "ÉXITO", "mensaje": f"Se crearon {etiquetas_enlazadas} nuevos enlaces de etiquetas para '{payload.nombre_producto}'."}

@app.get("/productos/{nombre_super}/{cp}", tags=["Sistema"])
def obtener_cache_supermercado(nombre_super: str, cp: int, session: Session = Depends(get_db)):
    """Devuelve un diccionario con los productos, su id_scat, nombre de subcategoría y si tienen etiquetas."""
    super_loc = session.query(SuperLoc).filter_by(nombre=nombre_super, cp=cp).first()
    if not super_loc:
        return {}
    
    resultados = session.query(
        ProductosSuper.nombre,
        ProductosSuper.id_scat,
        Subcategorias.nombre.label('nombre_scat'),
        func.count(ProductosTags.id_tag).label('num_tags')
    ).join(Subcategorias, ProductosSuper.id_scat == Subcategorias.id)\
     .outerjoin(ProductosTags, ProductosSuper.id == ProductosTags.id_producto)\
     .filter(ProductosSuper.id_loc == super_loc.id)\
     .group_by(ProductosSuper.id, ProductosSuper.nombre, ProductosSuper.id_scat, Subcategorias.nombre).all()
     
    return {
        row.nombre: {
            "id_scat": row.id_scat,
            "nombre_scat": row.nombre_scat, 
            "tiene_tags": row.num_tags > 0
        } for row in resultados
    }

@app.put("/productos/bulk", tags=["Sistema"])
def put_productos_bulk(
    productos: List[ProductoCheck], 
    super_nombre: str = Query(...),
    cp: int = Query(...),
    session: Session = Depends(get_db)
):
    """
    Inserta o actualiza una lista masiva de productos de golpe.
    """
    nombre_norm = super_nombre.strip().lower()
    super_loc = session.query(SuperLoc).filter(func.lower(SuperLoc.nombre) == nombre_norm, SuperLoc.cp == cp).first()
    
    if not super_loc:
        raise HTTPException(status_code=404, detail="Localización no encontrada")

    productos_db = session.query(ProductosSuper).filter_by(id_loc=super_loc.id).all()
    dict_db = {p.nombre: p for p in productos_db}

    nuevos_productos = []

    for prod in productos:
        if prod.nombre in dict_db:
            p_existente = dict_db[prod.nombre]
            p_existente.activo = True
            if p_existente.precio != prod.precio:
                p_existente.precio = prod.precio
        else:
            if prod.id_subcategoria:
                nuevo = ProductosSuper(
                    id_scat=prod.id_subcategoria,
                    id_loc=super_loc.id,
                    nombre=prod.nombre,
                    precio=prod.precio,
                    precio_unidad=prod.precio_unidad,
                    unidad_medida=prod.unidad_medida,
                    imagen=prod.imagen,
                    url=prod.url,
                    activo=True
                )
                nuevos_productos.append(nuevo)
    
    if nuevos_productos:
        session.add_all(nuevos_productos)
    
    session.commit()
    return {"status": "ÉXITO", "mensaje": f"Se procesaron {len(productos)} productos masivamente."}
