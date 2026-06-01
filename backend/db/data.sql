CREATE TABLE supermercados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL 
);

CREATE TABLE subcategorias (
    id SERIAL PRIMARY KEY,
	id_cat INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
	FOREIGN KEY (id_cat) REFERENCES categorias(id)
);

CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL, -- Nombre de la etiqueta
    id_scat INTEGER NOT NULL, -- ID de la categoría a la que pertenece la etiqueta
    FOREIGN KEY (id_scat) REFERENCES subcategorias(id)
);

CREATE TABLE super_loc (
    id SERIAL PRIMARY KEY,
    id_super INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    cp INTEGER NOT NULL, -- Código postal
    almacen VARCHAR(30), -- Almacen del supermercado
    FOREIGN KEY (id_super) REFERENCES supermercados(id)
);

CREATE TABLE productos_super (
    id SERIAL PRIMARY KEY,
    id_scat INTEGER NOT NULL,
    id_loc INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    precio_unidad DECIMAL(10, 2) NOT NULL,
    unidad_medida VARCHAR(50) NOT NULL, -- Tamaño del producto (litros, gramos, etc.) 
    imagen VARCHAR(250) NOT NULL,
    url VARCHAR(250) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_scat) REFERENCES subcategorias(id),
    FOREIGN KEY (id_loc) REFERENCES super_loc(id)
);

CREATE TABLE productos_tags (
    id_producto INTEGER NOT NULL,
    id_tag INTEGER NOT NULL,
    PRIMARY KEY (id_producto, id_tag),
    FOREIGN KEY (id_producto) REFERENCES productos_super(id),
    FOREIGN KEY (id_tag) REFERENCES tags(id)
);
