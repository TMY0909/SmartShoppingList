from pydantic import BaseModel, Field
from typing import Optional, List

# Modelo de datos con Pydantic para la validación y documentación
class ProductoCheck(BaseModel):
    """Modelo para los datos del producto que se envían en el cuerpo de la petición POST."""
    nombre: str = Field(..., description="Nombre completo del producto.", example="Atún Claro en Aceite de Girasol")
    precio: float = Field(..., description="Precio actual del producto a comprobar.", example=1.25)
    precio_unidad: float = Field(..., description="Precio por unidad (Kg/Litros) del producto a comprobar.", example=4)
    unidad_medida: str = Field(None, description="Unidad de medida del producto.", example="Kg")
    imagen: str = Field(None, description="URL de la imagen.")
    url: str = Field(None, description="URL del producto.")
    id_subcategoria: int = Field(..., description="ID de la subcategoría del producto.", example=1)
    
class ProductoCheckResponse(BaseModel):
    """Modelo para la respuesta estructurada de la API."""
    status: str = Field(..., description="Resultado de la comprobación.", example="PRECIO_CAMBIADO")
    mensaje: str = Field(..., description="Mensaje descriptivo para el cliente.")
    nuevo_precio: Optional[float] = Field(None, description="El nuevo precio si ha cambiado.")
    id_tagsProducto: int = Field(None, description="Lista de tags asociados al producto.")

class SupercheckResponse(BaseModel):
    """Modelo para la respuesta estructurada de la API."""
    status: str = Field(..., description="Resultado de la operación.", example="ÉXITO")
    mensaje: str = Field(..., description="Mensaje descriptivo para el cliente.")
    id_super: int = Field(..., description="ID del supermercado en la base de datos.", example=3)

class CPWarehouse(BaseModel):
    """Modelo para recibir la lista de CPs y sus almacenes."""
    cp: int = Field(..., description="Código postal válido", example=41001)
    warehouse: str = Field(..., description="Identificador del almacén asociado", example="svq1")

class ProductoTagsInput(BaseModel):
    nombre_producto: str
    tags: List[str]

class ItemCompra(BaseModel):
    id_frontend: str = Field(..., description="ID temporal generado por el frontend", example="item1")
    termino_busqueda: str = Field(..., description="Nombre del producto, ej: 'coca cola'", example="coca cola")
    cantidad: int = Field(1, ge=1, description="Unidades que quiere comprar", example=1)
    restriccion_marca_original: bool = Field(False, description="True si solo quiere la marca exacta", example=False)
    restriccion_supermercado: Optional[str] = Field(None, description="Obliga a comprar en este súper (ej: 'mercadona')", example="mercadona")
    ids_fijados: Optional[List[int]] = Field(None, description="Lista de IDs de productos validados manualmente por el usuario")
    
class PreferenciasUsuario(BaseModel):
    tiempo_libre: bool = Field(True, description="True(1): Tiene tiempo (coste bajo), False(0): Va justo de tiempo (coste alto)", example=True)
    max_supermercados_visitar: int = Field(2, ge=1, description="Límite máximo de supermercados a pisar", example=2)
    codigo_postal: int = Field(..., description="Código postal del usuario para calcular distancias reales", example=41001)

class OptimizacionRequest(BaseModel):
    preferencias: PreferenciasUsuario
    lista_compra: List[ItemCompra]