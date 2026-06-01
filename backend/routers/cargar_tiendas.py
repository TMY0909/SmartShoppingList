import csv
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from db.models import Supermercados, TiendasFisicas
from db.db import get_db 

router = APIRouter()

@router.post("/cargarTiendas", tags=["Admin"])
def cargar_tiendas_desde_csv(session: Session = Depends(get_db)):
    registros_insertados = 0
    marcas_db = session.query(Supermercados).all()
    mapa_marcas = {marca.nombre.lower(): marca.id for marca in marcas_db}
    
    if not mapa_marcas:
         raise HTTPException(status_code=400, detail="La tabla Supermercados está vacía.")

    try:
        with open('tiendas_sevilla.csv', mode='r', encoding='utf-8') as file:
            reader = csv.DictReader(file, delimiter='\t')
            for row in reader:
                marca_osm = row.get('brand', '').lower()
                id_marca = None
                
                if 'mercadona' in marca_osm and 'mercadona' in mapa_marcas:
                    id_marca = mapa_marcas['mercadona']
                elif 'carrefour' in marca_osm and 'carrefour' in mapa_marcas:
                    id_marca = mapa_marcas['carrefour']
                elif 'dia' in marca_osm and 'dia' in mapa_marcas:
                    id_marca = mapa_marcas['dia']
                else:
                    continue

                nueva_tienda = TiendasFisicas(
                    id_super=id_marca,
                    latitud=float(row['@lat']),
                    longitud=float(row['@lon'])
                )
                session.add(nueva_tienda)
                registros_insertados += 1
                
            session.commit()
    except Exception as e:
        session.rollback()
        raise HTTPException(status_code=500, detail=str(e))

    return {"mensaje": f"Se han creado {registros_insertados} sucursales físicas."}