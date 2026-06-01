# Generado con sqlacodegen

from typing import List
from pydantic import BaseModel, Field
from sqlalchemy import ForeignKeyConstraint, Integer, Numeric, PrimaryKeyConstraint, String, ForeignKey, Boolean, Float
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship
import decimal

class Base(DeclarativeBase):
    pass

class Categorias(Base):
    __tablename__ = 'categorias'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='categorias_pkey'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    nombre: Mapped[str] = mapped_column(String(50))

    subcategorias: Mapped[List['Subcategorias']] = relationship('Subcategorias', back_populates='categorias')


class Supermercados(Base):
    __tablename__ = 'supermercados'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='supermercados_pkey'),
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    nombre: Mapped[str] = mapped_column(String(50))
    tiendas_fisicas: Mapped[List['TiendasFisicas']] = relationship('TiendasFisicas', back_populates='supermercados')
    super_loc: Mapped[List['SuperLoc']] = relationship('SuperLoc', back_populates='supermercados')


class Subcategorias(Base):
    __tablename__ = 'subcategorias'
    __table_args__ = (
        ForeignKeyConstraint(['id_cat'], ['categorias.id'], name='subcategorias_id_cat_fkey'),
        PrimaryKeyConstraint('id', name='subcategorias_pkey')
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    id_cat: Mapped[int] = mapped_column(Integer)
    nombre: Mapped[str] = mapped_column(String(50))

    categorias: Mapped['Categorias'] = relationship('Categorias', back_populates='subcategorias')
    productos_super: Mapped[List['ProductosSuper']] = relationship('ProductosSuper', back_populates='subcategorias')
    tags: Mapped[List['Tags']] = relationship('Tags', back_populates='subcategorias')


class SuperLoc(Base):
    __tablename__ = 'super_loc'
    __table_args__ = (
        ForeignKeyConstraint(['id_super'], ['supermercados.id'], name='super_loc_id_super_fkey'),
        PrimaryKeyConstraint('id', name='super_loc_pkey')
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    id_super: Mapped[int] = mapped_column(Integer)
    nombre: Mapped[str] = mapped_column(String(100))
    cp: Mapped[int] = mapped_column(Integer)
    almacen: Mapped[str] = mapped_column(String(30))

    supermercados: Mapped['Supermercados'] = relationship('Supermercados', back_populates='super_loc')
    productos_super: Mapped[List['ProductosSuper']] = relationship('ProductosSuper', back_populates='super_loc')


class ProductosSuper(Base):
    __tablename__ = 'productos_super'
    __table_args__ = (
        ForeignKeyConstraint(['id_loc'], ['super_loc.id'], name='productos_super_id_loc_fkey'),
        ForeignKeyConstraint(['id_scat'], ['subcategorias.id'], name='productos_super_id_scat_fkey'),
        PrimaryKeyConstraint('id', name='productos_super_pkey')
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    id_scat: Mapped[int] = mapped_column(Integer)
    id_loc: Mapped[int] = mapped_column(Integer)
    nombre: Mapped[str] = mapped_column(String(500))
    precio: Mapped[decimal.Decimal] = mapped_column(Numeric(10, 2))
    precio_unidad: Mapped[decimal.Decimal] = mapped_column(Numeric(10, 2))
    unidad_medida: Mapped[str] = mapped_column(String(50))
    imagen: Mapped[str] = mapped_column(String(500))
    url: Mapped[str] = mapped_column(String(500))   
    activo: Mapped[bool] = mapped_column(Boolean, default=True)

    super_loc: Mapped['SuperLoc'] = relationship('SuperLoc', back_populates='productos_super')
    subcategorias: Mapped['Subcategorias'] = relationship('Subcategorias', back_populates='productos_super')
    tags: Mapped[List['Tags']] = relationship('Tags', secondary='productos_tags', back_populates='productos_super')


class Tags(Base):
    __tablename__ = 'tags'
    __table_args__ = (
        ForeignKeyConstraint(['id_scat'], ['subcategorias.id'], name='tags_id_scat_fkey'),
        PrimaryKeyConstraint('id', name='tags_pkey')
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    nombre: Mapped[str] = mapped_column(String(50))
    id_scat: Mapped[int] = mapped_column(Integer)

    productos_super: Mapped[List['ProductosSuper']] = relationship('ProductosSuper', secondary='productos_tags', back_populates='tags')
    subcategorias: Mapped['Subcategorias'] = relationship('Subcategorias', back_populates='tags')


class ProductosTags(Base):
    __tablename__ = 'productos_tags'
    id_producto: Mapped[int] = mapped_column(Integer, ForeignKey('productos_super.id'), primary_key=True)
    id_tag: Mapped[int] = mapped_column(Integer, ForeignKey('tags.id'), primary_key=True)

class TiendasFisicas(Base):
    __tablename__ = 'tiendas_fisicas'
    __table_args__ = (
        ForeignKeyConstraint(['id_super'], ['supermercados.id'], name='tiendas_fisicas_id_super_fkey'),
        PrimaryKeyConstraint('id', name='tiendas_fisicas_pkey')
    )

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    id_super: Mapped[int] = mapped_column(Integer)
    latitud: Mapped[float] = mapped_column(Float)
    longitud: Mapped[float] = mapped_column(Float)

    supermercados: Mapped['Supermercados'] = relationship('Supermercados', back_populates='tiendas_fisicas')
    