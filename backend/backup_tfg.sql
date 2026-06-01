--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- Name: productos_super; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_super (
    id integer NOT NULL,
    id_scat integer NOT NULL,
    id_loc integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio numeric(10,2) NOT NULL,
    precio_unidad numeric(10,2) NOT NULL,
    unidad_medida character varying(50) NOT NULL,
    imagen character varying(250) NOT NULL,
    url character varying(250) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.productos_super OWNER TO postgres;

--
-- Name: productos_super_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_super_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_super_id_seq OWNER TO postgres;

--
-- Name: productos_super_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_super_id_seq OWNED BY public.productos_super.id;


--
-- Name: productos_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_tags (
    id_producto integer NOT NULL,
    id_tag integer NOT NULL
);


ALTER TABLE public.productos_tags OWNER TO postgres;

--
-- Name: subcategorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategorias (
    id integer NOT NULL,
    id_cat integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.subcategorias OWNER TO postgres;

--
-- Name: subcategorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategorias_id_seq OWNER TO postgres;

--
-- Name: subcategorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategorias_id_seq OWNED BY public.subcategorias.id;


--
-- Name: super_loc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_loc (
    id integer NOT NULL,
    id_super integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cp integer NOT NULL,
    almacen character varying(30)
);


ALTER TABLE public.super_loc OWNER TO postgres;

--
-- Name: super_loc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.super_loc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.super_loc_id_seq OWNER TO postgres;

--
-- Name: super_loc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.super_loc_id_seq OWNED BY public.super_loc.id;


--
-- Name: supermercados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supermercados (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.supermercados OWNER TO postgres;

--
-- Name: supermercados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supermercados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supermercados_id_seq OWNER TO postgres;

--
-- Name: supermercados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supermercados_id_seq OWNED BY public.supermercados.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    id_scat integer NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- Name: productos_super id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_super ALTER COLUMN id SET DEFAULT nextval('public.productos_super_id_seq'::regclass);


--
-- Name: subcategorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategorias ALTER COLUMN id SET DEFAULT nextval('public.subcategorias_id_seq'::regclass);


--
-- Name: super_loc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_loc ALTER COLUMN id SET DEFAULT nextval('public.super_loc_id_seq'::regclass);


--
-- Name: supermercados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supermercados ALTER COLUMN id SET DEFAULT nextval('public.supermercados_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre) FROM stdin;
1	Alimentación
2	Bebidas
3	Frescos
4	Infantil
5	Hogar y limpieza
6	Higiene y maquillaje
7	Mascotas
\.


--
-- Data for Name: productos_super; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_super (id, id_scat, id_loc, nombre, precio, precio_unidad, unidad_medida, imagen, url, activo) FROM stdin;
1	37	1	Pera Ercolina	0.47	3.90	kg	https://prod-mercadona.imgix.net/images/533ebe592abe9ee9a6b79cb1b3a7e8ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3170/pera-ercolina-pieza	t
2	37	1	Mandarina	0.26	2.35	kg	https://prod-mercadona.imgix.net/images/7fde4546900f0fbd38e02be6cc4ea6ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3238/mandarina-pieza	t
3	37	1	Mandarina	3.90	1.95	kg	https://prod-mercadona.imgix.net/images/5144ebfa635f621317c91bcd491972f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5504/mandarina-malla	t
4	37	1	Naranja de mesa	0.59	1.95	kg	https://prod-mercadona.imgix.net/images/e9ff28c3b115649df7138f0f51dd1f9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3235/naranja-mesa-pieza	t
5	18	1	Ensalada César	2.60	12.38	kg	https://prod-mercadona.imgix.net/images/6f8ccad4b9d4bc691f5b72c6736dbd05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69849/ensalada-cesar-compuesta-hortalizas-frescas-pollo-queso-picatostes-salsas-incluye-tenedor-bol	t
6	18	1	Ensalada California	2.60	13.54	kg	https://prod-mercadona.imgix.net/images/9a77cee58d49199c38031540d40c258e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69714/ensalada-california-compuesta-mezcla-hortalizas-frescas-nueces-picatostes-bacon-cebolla-frita-uvas-pasas-salsa-miel-mostaza-incluye-tenedor-bol	t
7	18	1	Wraps Texas	3.10	10.33	kg	https://prod-mercadona.imgix.net/images/8d7e5cfe79776867d71e9e551533d06c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69850/wraps-texas-compuesto-hortalizas-frescas-pollo-queso-salsa-tortillas-trigo-incluye-tenedor-bol	t
8	18	1	Ensalada de la casa	2.15	5.38	kg	https://prod-mercadona.imgix.net/images/c4092bd3f3214960c9f747912a50be40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69756/ensalada-casa-compuesta-escarola-lisa-achicoria-escarola-rizada-maiz-dulce-tomate-cherry-zanahoria-aceitunas-verdes-bol	t
9	18	1	Ensalada ensatún	2.60	10.40	kg	https://prod-mercadona.imgix.net/images/d90a20ad3e45b63ae278f9700c9fe117.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69872/ensalada-ensatun-compuesta-zanahoria-mozzarella-aceitunas-verdes-lechuga-iceberg-lechuga-hoja-roble-maiz-atun-aceite-vegetal-tomate-cherry-aceite-sal-vinagre-incluye-tenedor-bol	t
10	18	1	Ensalada de pasta	2.60	10.40	kg	https://prod-mercadona.imgix.net/images/ae77ea3f2cfbc1ecb9326ce77fed7232.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69461/ensalada-pasta-compuesta-pasta-fiambre-jamon-pavo-salsa-yogur-incluye-tenedor-bol	t
11	18	1	Ensalada queso de cabra	2.80	18.30	kg	https://prod-mercadona.imgix.net/images/ba4ed40c4ad629b070b2c21726a23fed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69474/ensalada-queso-cabra-compuesta-brotes-manzana-queso-cabra-frutos-secos-vinagreta-balsamica-incluye-tenedor-bol	t
12	18	1	Ensalada de pasta Listo para Comer	4.00	4.00	kg	https://prod-mercadona.imgix.net/images/6604913c5a5d31159a6c090c3e84f38d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13241/ensalada-pasta-listo-comer-compuesta-atun-huevo-cocido-surimi-mix-queso-cebolla-con-monodosis-bol	t
13	4	1	Tomate frito estilo casero Hacendado	1.20	3.16	kg	https://prod-mercadona.imgix.net/images/b316f525c80033093912e2829796b5cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17153/tomate-frito-estilo-casero-hacendado-con-aceite-oliva-brick	t
14	20	1	Tomate troceado pelado Hacendado	0.80	1.95	kg	https://prod-mercadona.imgix.net/images/f57a95e6f3f0cce02e36ec9bd75cbfc9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16022/tomate-troceado-pelado-hacendado-freir-bote	t
15	20	1	Fritada pisto Hacendado	1.30	3.42	kg	https://prod-mercadona.imgix.net/images/3adb057bffc798dbc9f4a5240d663f01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17112/fritada-pisto-hacendado-brick	t
16	4	1	Tomate frito sin azúcares añadidos Hacendado	1.10	1.96	kg	https://prod-mercadona.imgix.net/images/0680dffe67fb4eac8c3423ddd35f15a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17330/tomate-frito-sin-azucares-anadidos-hacendado-tarro	t
17	20	1	Tomate doble concentrado Hacendado extra	1.05	6.18	kg	https://prod-mercadona.imgix.net/images/21524237f9e676cb0c075d38a8ff1578.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16074/tomate-doble-concentrado-hacendado-extra-freir-bote	t
18	20	1	Tomate tamizado sin piel Hacendado	0.90	2.31	kg	https://prod-mercadona.imgix.net/images/9f10fd49b839d3ba386a892572ffdf79.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16012/tomate-tamizado-sin-piel-hacendado-freir-brick	t
19	20	1	Tomate seco Hacendado en aceite de oliva	2.30	12.11	kg	https://prod-mercadona.imgix.net/images/583806865dd5df9204520ea70f4f4287.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16046/tomate-seco-hacendado-aceite-oliva-tarro	t
20	36	1	Salmón a rodajas	40.73	10.95	kg	https://prod-mercadona.imgix.net/images/efde699df9d548c2e8a9887daf63cd7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81649.1/salmon-rodajas-pieza	t
21	36	1	Salmón media pieza a rodajas	18.94	10.95	kg	https://prod-mercadona.imgix.net/images/3cb80836bc33e899bc88c403a7dbdf05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81649.4/salmon-media-pieza-rodajas-12-pieza	t
22	36	1	Salmón abierto en libro sin cabeza y sin espina	40.73	10.95	kg	https://prod-mercadona.imgix.net/images/0ab4d3bebe2987d4c536456e2b2397b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81649.2/salmon-abierto-libro-sin-cabeza-sin-espina-pieza	t
23	36	1	Salmón media pieza abierto en libro sin cabeza y sin espina	18.94	10.95	kg	https://prod-mercadona.imgix.net/images/9e3d2b0d70964b5e08e4430a34872631.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81649.5/salmon-media-pieza-abierto-libro-sin-cabeza-sin-espina-12-pieza	t
24	36	1	Salmón sin aletas y sin escamas	40.73	10.95	kg	https://prod-mercadona.imgix.net/images/951a3919c430a3945602d4f82ba89f23.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81649.3/salmon-sin-aletas-sin-escamas-pieza	t
25	36	1	Salmón media pieza sin aletas y sin escamas	18.94	10.95	kg	https://prod-mercadona.imgix.net/images/2a83560771de82f2644054222802f106.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81649.6/salmon-media-pieza-sin-aletas-sin-escamas-12-pieza	t
26	36	1	Medio salmón	17.85	21.00	kg	https://prod-mercadona.imgix.net/images/da236aaa8e3f4a760d95f063ec5a1638.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87208/medio-salmon-bandeja	t
27	36	1	Filete de salmón	8.40	24.00	kg	https://prod-mercadona.imgix.net/images/b072fbeed617fa30e152c33cd8eb8fbb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87204/filete-salmon-bandeja	t
28	36	1	Escalopin de salmón	8.92	25.50	kg	https://prod-mercadona.imgix.net/images/2df072f2dd7c97b13e248c47f576b11e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87203/escalopin-salmon-bandeja	t
29	36	1	Rodaja de salmón	7.00	20.00	kg	https://prod-mercadona.imgix.net/images/5e79ea62e9617114a5871d9e62e087aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87205/rodaja-salmon-bandeja	t
30	36	1	Dorada limpia con cabeza	6.27	9.95	kg	https://prod-mercadona.imgix.net/images/436b010dcbc6108690d724afe2d95b97.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81234.1/dorada-limpia-con-cabeza-pieza	t
31	36	1	Dorada abierta a la espalda con espinas y con cabeza	6.27	9.95	kg	https://prod-mercadona.imgix.net/images/b00be480049e6df6699dfcc258e77d84.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81234.2/dorada-abierta-espalda-con-espinas-con-cabeza-pieza	t
32	36	1	Dorada a filetes sin cabeza y sin espina	6.27	9.95	kg	https://prod-mercadona.imgix.net/images/63343ce507fc67170a68187887e2a908.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81234.5/dorada-filetes-sin-cabeza-sin-espina-pieza	t
33	36	1	Dorada abierta en libro sin cabeza y sin espina	6.27	9.95	kg	https://prod-mercadona.imgix.net/images/2957b087240ec84fa053668b79413731.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81234.4/dorada-abierta-libro-sin-cabeza-sin-espina-pieza	t
34	36	1	Dorada sin limpiar	6.27	9.95	kg	https://prod-mercadona.imgix.net/images/5a648f8a69f2dd2d87d7049b8e604499.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81234.3/dorada-sin-limpiar-hacer-sal-pieza	t
35	36	1	Filetes de dorada	6.90	23.00	kg	https://prod-mercadona.imgix.net/images/3280796f6d931b64ee082213adb0b7a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87302/filetes-dorada-bandeja	t
36	36	1	Lubina limpia con cabeza	4.82	10.95	kg	https://prod-mercadona.imgix.net/images/7b996b05f032204332216f5e6a72b129.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81241.1/lubina-limpia-con-cabeza-pieza	t
37	36	1	Lubina abierta a la espalda con espinas y con cabeza	4.82	10.95	kg	https://prod-mercadona.imgix.net/images/45f37ee9fbccebfd1cde069320cc9b3b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81241.2/lubina-abierta-espalda-con-espinas-con-cabeza-pieza	t
38	36	1	Lubina a filetes sin cabeza y sin espina	4.82	10.95	kg	https://prod-mercadona.imgix.net/images/08fb245b6763997aa1ec02d8a537c03f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81241.5/lubina-filetes-sin-cabeza-sin-espina-pieza	t
39	36	1	Lubina abierta en libro sin cabeza y sin espina	4.82	10.95	kg	https://prod-mercadona.imgix.net/images/a81a713fad959d63b5ab54f2d11cff23.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81241.4/lubina-abierta-libro-sin-cabeza-sin-espina-pieza	t
40	36	1	Lubina sin limpiar	4.82	10.95	kg	https://prod-mercadona.imgix.net/images/079d2d1fac75b66dea891397f9744121.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81241.3/lubina-sin-limpiar-hacer-sal-pieza	t
41	36	1	Filete de lubina	6.58	23.50	kg	https://prod-mercadona.imgix.net/images/368f56db42723921152f308e2c2bdf30.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87313/filete-lubina-bandeja	t
42	36	1	Porciones de merluza del Cabo	9.10	26.00	kg	https://prod-mercadona.imgix.net/images/bea41a8d6e71b06f341ab617c65c87ee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87240/porciones-merluza-cabo-bandeja	t
43	36	1	Bacalao al punto de sal descongelado	9.00	20.00	kg	https://prod-mercadona.imgix.net/images/ca53c73b6afd0d72635caaec9e3e3420.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87211/bacalao-punto-sal-descongelado-con-agua-anadida-bandeja	t
44	36	1	Hoja de bacalao Hacendado	15.92	19.90	kg	https://prod-mercadona.imgix.net/images/dabf7ce1f5a77ead5fbc4e6e6fbd7167.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80644/hoja-bacalao-paquete	t
45	36	1	Corvina limpia con cabeza	12.77	11.50	kg	https://prod-mercadona.imgix.net/images/914aa9f7dc7c62ac7ca4a4126e45b5b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81055.1/corvina-limpia-con-cabeza-pieza	t
46	36	1	Corvina abierta a la espalda con espinas y con cabeza	12.77	11.50	kg	https://prod-mercadona.imgix.net/images/e9ae60ccbc54da434f15d6fc359697ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81055.2/corvina-abierta-espalda-con-espinas-con-cabeza-pieza	t
47	36	1	Corvina a filetes	12.77	11.50	kg	https://prod-mercadona.imgix.net/images/c24e26cdf25836aff4838e4dfafaf136.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81055.3/corvina-filetes-pieza	t
48	36	1	Sepia limpia	9.09	15.95	kg	https://prod-mercadona.imgix.net/images/d048cb65e9ae4c19d14d81a31fecc1dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81704/sepia-pieza	t
49	36	1	Calamar pequeño limpio patagónico	6.00	20.00	kg	https://prod-mercadona.imgix.net/images/a5c55081636517ba27b09fac2f7cedfe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87177/calamar-pequeno-limpio-patagonico-bandeja	t
50	36	1	Patas de pulpo cocido	10.50	42.00	kg	https://prod-mercadona.imgix.net/images/795bc1fca211e3f1b296a8515b8f4a9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87775/patas-pulpo-cocido-bandeja	t
51	36	1	Trucha abierta en libro con cabeza	7.07	8.95	kg	https://prod-mercadona.imgix.net/images/661d69880016e9ebeb58a4f23465e397.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81200.1/trucha-abierta-libro-con-cabeza-pieza	t
52	36	1	Trucha abierta en libro sin cabeza y sin espina	7.07	8.95	kg	https://prod-mercadona.imgix.net/images/f59e557239c2f912e794f4f6ca61df0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81200.2/trucha-abierta-libro-sin-cabeza-sin-espina-pieza	t
53	36	1	Trucha sin aletas	7.07	8.95	kg	https://prod-mercadona.imgix.net/images/c4b028bd334f4ff5a51c67f4a736d9c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81200.3/trucha-sin-aletas-pieza	t
54	36	1	Filetes de trucha Arco iris	4.63	15.95	kg	https://prod-mercadona.imgix.net/images/8378fa17c4433262d3d7b105ca561c17.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87342/filetes-trucha-arco-iris-bandeja	t
55	36	1	Boquerón limpio sin cabeza	1.39	6.95	kg	https://prod-mercadona.imgix.net/images/b55f89c3aefe2502e390182d9f47657a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81661.2/boqueron-limpio-sin-cabeza-sin-tripa-granel	t
56	36	1	Filete de rodaballo	8.25	33.00	kg	https://prod-mercadona.imgix.net/images/12eacd7cd23e1b43dcef62e9a1d0ba01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87163/filete-rodaballo-bandeja	t
57	36	1	Sardina sin limpiar	1.39	6.95	kg	https://prod-mercadona.imgix.net/images/5b92b803a7932c1cd2ece3e80d11a853.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81100.1/sardina-sin-limpiar-granel	t
58	36	1	Sardina limpia sin cabeza	1.39	6.95	kg	https://prod-mercadona.imgix.net/images/2b65dea09c00f7ea0a265455ce20ff1a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81100.2/sardina-limpia-sin-cabeza-sin-tripa-granel	t
59	36	1	Acedía sin cabeza y sin piel oscura	3.79	18.95	kg	https://prod-mercadona.imgix.net/images/7575a69dc3e7a2399b4c085c06b9dee1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81638.1/acedia-sin-cabeza-sin-piel-oscura-granel	t
60	36	1	Acedía sin escamas	3.79	18.95	kg	https://prod-mercadona.imgix.net/images/3567c3dff51052ca0bc571eba47e0559.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/81638.2/acedia-sin-escamas-granel	t
61	36	1	Emperador marinado	5.39	23.45	kg	https://prod-mercadona.imgix.net/images/4c3262070ccdb14de608995bd731c8dd.jpeg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27629/emperador-marinado-bandeja	t
62	36	1	Huevas de merluza cocidas Hacendado	1.95	21.67	kg	https://prod-mercadona.imgix.net/images/63a10641d8e22485afd7fe6c208c0d85.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62037/huevas-merluza-cocidas-hacendado-pieza	t
63	36	1	Huevas de merluza cocidas Hacendado	4.95	24.75	kg	https://prod-mercadona.imgix.net/images/ce1df6c146b132132bc61f61f1765c1f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62038/huevas-merluza-cocidas-hacendado-paquete	t
64	36	1	Merluza rebozada	3.90	16.96	kg	https://prod-mercadona.imgix.net/images/94f24c23621346e37d26d06e4b6e3f0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87734/merluza-rebozada-bandeja	t
65	25	1	Crema de leche para café Campina	1.40	7.00	kg	https://prod-mercadona.imgix.net/images/d60fe3bcdd22baf485111a85653587d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10449/crema-leche-cafe-campina-paquete	t
66	11	1	Cereales solubles con achicoria Hacendado	2.15	14.33	kg	https://prod-mercadona.imgix.net/images/196406a5c892ae3b99ffbc8c56b3e202.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11187/cereales-solubles-con-achicoria-hacendado-bote	t
67	11	1	Filtros de café para cafeteras tamaño 2 y 4 Bosque Verde	2.20	0.02	ud	https://prod-mercadona.imgix.net/images/b91e713f26b09a19383a915938d9833c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60515/filtros-cafe-cafeteras-tamano-2-4-bosque-verde-caja	t
68	18	1	Patatas bravas con mayonesa y salsa picante Hacendado	2.60	5.53	kg	https://prod-mercadona.imgix.net/images/fbdc880b401f7317bb763fded881eedb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11669/patatas-bravas-con-mayonesa-salsa-picante-hacendado-bandeja	t
69	18	1	Empanados vegetales con proteína de soja Tivall	2.80	15.56	kg	https://prod-mercadona.imgix.net/images/c6b302b81366b56254817463ded87533.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23249/empanados-vegetales-con-proteina-soja-tivall-bandeja	t
70	18	1	Patatas fritas con carne kebab y salsa Hacendado	3.50	9.46	kg	https://prod-mercadona.imgix.net/images/90046f95d6ac8c59b8cbf2871212d14c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60652/patatas-fritas-con-carne-kebab-salsa-hacendado-bandeja	t
71	18	1	Sándwiches jamón y queso Hacendado	2.80	5.83	kg	https://prod-mercadona.imgix.net/images/714e9d8e90c452951fc6f71c3d58fdf0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59032/sandwiches-jamon-queso-hacendado-paquete	t
72	53	1	Alimento completo conejos enanos Granzoo	1.70	2.13	kg	https://prod-mercadona.imgix.net/images/5c9beda4b732f73ef50e0d266c0082bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/38007/alimento-completo-conejos-enanos-granzoo-paquete	t
73	21	1	Preparado de paella y sopa Hacendado ultracongelado	4.25	6.20	kg	https://prod-mercadona.imgix.net/images/f6f62c8df2949dff816f73f274bfd2b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62048/preparado-paella-sopa-hacendado-ultracongelado-paquete	t
74	21	1	Gambón congelado	1282.05	12.95	kg	https://prod-mercadona.imgix.net/images/8a6cce24488444736497d91a7a5ec404.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24147/gambon-congelado-granel	t
75	21	1	Gambón grande congelado	23.00	11.50	kg	https://prod-mercadona.imgix.net/images/ff9bd73ef2417d0f9850f64ffc62514f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24260/gambon-grande-congelado-caja	t
76	21	1	Langostino crudo Hacendado ultracongelado	5.95	9.92	kg	https://prod-mercadona.imgix.net/images/c48b090bf241f8eb71d0d3aa2fc36bed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24712/langostino-crudo-ultracongelado-caja	t
77	21	1	Gamba arrocera pequeña Hacendado congelada	9.72	14.95	kg	https://prod-mercadona.imgix.net/images/9c857dfc9708a23ce8acf927e1637c51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62750/gamba-arrocera-pequena-hacendado-congelada-caja	t
78	21	1	Gamba pelada cruda tamaño mediano Hacendado ultracongelada	5.00	13.89	kg	https://prod-mercadona.imgix.net/images/d30570f6f373cc3362b6175e3d7ddd4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24181/gamba-pelada-cruda-tamano-mediano-hacendado-ultracongelada-paquete	t
79	21	1	Gamba pelada cruda tamaño grande Hacendado ultracongelada	6.35	17.64	kg	https://prod-mercadona.imgix.net/images/eb489ee3fd6cd37618ac310691927ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24230/gamba-pelada-cruda-tamano-grande-hacendado-ultracongelada-paquete	t
80	21	1	Camarón boreal cocido y pelado Royal Greenland ultracongelado	4.25	21.25	kg	https://prod-mercadona.imgix.net/images/2ac4f940765eb3fb780fb7df6d99d9f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24267/camaron-boreal-cocido-pelado-royal-greenland-ultracongelado-paquete	t
81	21	1	Langostino cocido y pelado Hacendado ultracongelado	5.00	22.73	kg	https://prod-mercadona.imgix.net/images/84fa5a12f206ec1bebb88e0a6e28af47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24477/langostino-cocido-pelado-hacendado-ultracongelado-bandeja	t
82	21	1	Langostino crudo y pelado Hacendado ultracongelado	3.95	17.95	kg	https://prod-mercadona.imgix.net/images/f1d0ac68049e49c543f0f63afb6d08b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24486/langostino-crudo-pelado-hacendado-ultracongelado-bandeja	t
83	36	1	Bogavante americano mediano crudo Hacendado	14.85	33.00	kg	https://prod-mercadona.imgix.net/images/e8b22464869872af1b6f7c6882920957.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62380/bogavante-americano-mediano-crudo-hacendado-pieza	t
84	21	1	Buey de mar cocido Hacendado congelado	11.68	16.33	kg	https://prod-mercadona.imgix.net/images/ea2198e5d117e12b77e586caa5db3663.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62320/buey-mar-cocido-hacendado-congelado-pieza	t
85	21	1	Colas de gambón crudo Hacendado congelado	6.55	26.20	kg	https://prod-mercadona.imgix.net/images/67b3c6eac598009c6a8dc78fc99f4b8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24102/colas-gambon-crudo-hacendado-congelado-bandeja	t
86	21	1	Preparado de paella y sopa Hacendado ultracongelado	4.25	6.20	kg	https://prod-mercadona.imgix.net/images/f6f62c8df2949dff816f73f274bfd2b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62048/preparado-paella-sopa-hacendado-ultracongelado-paquete	t
87	21	1	Gambón congelado	1282.05	12.95	kg	https://prod-mercadona.imgix.net/images/8a6cce24488444736497d91a7a5ec404.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24147/gambon-congelado-granel	t
88	21	1	Gambón grande congelado	23.00	11.50	kg	https://prod-mercadona.imgix.net/images/ff9bd73ef2417d0f9850f64ffc62514f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24260/gambon-grande-congelado-caja	t
89	21	1	Langostino crudo Hacendado ultracongelado	5.95	9.92	kg	https://prod-mercadona.imgix.net/images/c48b090bf241f8eb71d0d3aa2fc36bed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24712/langostino-crudo-ultracongelado-caja	t
90	21	1	Gamba arrocera pequeña Hacendado congelada	9.72	14.95	kg	https://prod-mercadona.imgix.net/images/9c857dfc9708a23ce8acf927e1637c51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62750/gamba-arrocera-pequena-hacendado-congelada-caja	t
91	21	1	Langostino cocido y pelado Hacendado ultracongelado	5.00	22.73	kg	https://prod-mercadona.imgix.net/images/84fa5a12f206ec1bebb88e0a6e28af47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24477/langostino-cocido-pelado-hacendado-ultracongelado-bandeja	t
92	21	1	Gamba pelada cruda tamaño mediano Hacendado ultracongelada	5.00	13.89	kg	https://prod-mercadona.imgix.net/images/d30570f6f373cc3362b6175e3d7ddd4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24181/gamba-pelada-cruda-tamano-mediano-hacendado-ultracongelada-paquete	t
93	21	1	Langostino crudo y pelado Hacendado ultracongelado	3.95	17.95	kg	https://prod-mercadona.imgix.net/images/f1d0ac68049e49c543f0f63afb6d08b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24486/langostino-crudo-pelado-hacendado-ultracongelado-bandeja	t
94	21	1	Camarón boreal cocido y pelado Royal Greenland ultracongelado	4.25	21.25	kg	https://prod-mercadona.imgix.net/images/2ac4f940765eb3fb780fb7df6d99d9f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24267/camaron-boreal-cocido-pelado-royal-greenland-ultracongelado-paquete	t
95	21	1	Gamba pelada cruda tamaño grande Hacendado ultracongelada	6.35	17.64	kg	https://prod-mercadona.imgix.net/images/eb489ee3fd6cd37618ac310691927ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24230/gamba-pelada-cruda-tamano-grande-hacendado-ultracongelada-paquete	t
96	21	1	Colas de gambón crudo Hacendado congelado	6.55	26.20	kg	https://prod-mercadona.imgix.net/images/67b3c6eac598009c6a8dc78fc99f4b8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24102/colas-gambon-crudo-hacendado-congelado-bandeja	t
97	36	1	Bogavante americano mediano crudo Hacendado	14.85	33.00	kg	https://prod-mercadona.imgix.net/images/e8b22464869872af1b6f7c6882920957.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62380/bogavante-americano-mediano-crudo-hacendado-pieza	t
98	21	1	Buey de mar cocido Hacendado congelado	11.68	16.33	kg	https://prod-mercadona.imgix.net/images/ea2198e5d117e12b77e586caa5db3663.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62320/buey-mar-cocido-hacendado-congelado-pieza	t
99	21	1	Carne de mejillón de Chile cocido Hacendado ultracongelado	2.50	9.09	kg	https://prod-mercadona.imgix.net/images/14a10d8ef846475b0a78866b254ef2ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62396/carne-mejillon-chile-cocido-hacendado-ultracongelado-paquete	t
100	21	1	Mejillón de Chile entero cocido Hacendado ultracongelado	3.25	7.22	kg	https://prod-mercadona.imgix.net/images/b4e4b2663ea1d17228e8500f39b911d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62401/mejillon-chile-entero-cocido-hacendado-ultracongelado-caja	t
101	21	1	Almeja Hacendado congelada	1.80	4.00	kg	https://prod-mercadona.imgix.net/images/5077ee2d933dcad572b8a81e0ade8a2f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60874/almeja-hacendado-congelada-paquete	t
102	21	1	Palitos de surimi Hacendado ultracongelados	2.50	4.17	kg	https://prod-mercadona.imgix.net/images/50b16e7d62acb06ea3b3983c4bd5e7fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62403/palitos-surimi-hacendado-ultracongelados-paquete	t
103	21	1	Filetes de panga Hacendado ultracongelados	4.90	5.44	kg	https://prod-mercadona.imgix.net/images/e5cb902b5acb5cd8f005ba60630c6973.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62191/filetes-panga-hacendado-ultracongelados-paquete	t
104	21	1	Filetes de merluza Argentina sin piel Hacendado ultracongelados	5.00	8.33	kg	https://prod-mercadona.imgix.net/images/26de3ac3c550e20905396965af457da7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62162/filetes-merluza-argentina-sin-piel-hacendado-ultracongelados-paquete	t
105	21	1	Rodaja de emperador Hacendado ultracongelado	4.47	14.90	kg	https://prod-mercadona.imgix.net/images/9b313b8406d0805cab22b0e1ff0c4d61.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24345/rodaja-emperador-hacendado-ultracongelado-pieza	t
106	21	1	Filetes de bacalao MareDeus ultracongelado	6.60	17.60	kg	https://prod-mercadona.imgix.net/images/92f2af11cb0b8c2b0cbe9c4ff2ba0b5c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24016/filetes-bacalao-maredeus-ultracongelado-punto-sal-paquete	t
107	21	1	Filete de salmón rosado salvaje con piel Hacendado ultracongelado	4.05	13.50	kg	https://prod-mercadona.imgix.net/images/9433ea335072ed81924f318ac4cdb24e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24350/filete-salmon-rosado-salvaje-con-piel-hacendado-ultracongelado-pieza	t
108	21	1	Lomos de merluza del Cabo Hacendado ultracongelados	4.90	12.25	kg	https://prod-mercadona.imgix.net/images/715dbe2c32c48f777052fa4c80c3e5d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62112/lomos-centros-merluza-cabo-hacendado-ultracongelados-caja	t
109	21	1	Fritura de pescado Hacendado ultracongelada	5.45	9.08	kg	https://prod-mercadona.imgix.net/images/18312a8e575e7902e507aad71287ae9d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62012/fritura-pescado-hacendado-ultracongelada-paquete	t
110	21	1	Porciones de bacalao sin piel MareDeus ultracongeladas	6.40	16.00	kg	https://prod-mercadona.imgix.net/images/6c5cff018c59d7f8938badf11d0f896b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62049/porciones-bacalao-punto-sal-maredeus-ultracongelado-paquete	t
111	21	1	Rodaja de tintorera sin piel Hacendado ultracongelada	3.13	6.95	kg	https://prod-mercadona.imgix.net/images/b658b0cecb2dc44fb6e74074a0151c46.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24383/rodaja-tintorera-sin-piel-hacendado-ultracongelada-pieza	t
112	21	1	Porciones de merluza del Cabo sin piel Hacendado ultracongeladas	4.90	9.80	kg	https://prod-mercadona.imgix.net/images/793cbce6a84e3f0fb9a3af1fb4ab7d0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62103/porciones-merluza-cabo-sin-piel-hacendado-ultracongeladas-paquete	t
139	21	1	Tubo de pota Argentina limpio Hacendado congelado	1.50	15.00	kg	https://prod-mercadona.imgix.net/images/5ff143c1862acfe64f7e80f72e0b3742.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24203/tubo-pota-argentina-limpia-congelado-pieza	t
113	21	1	Pescadilla de merluza sin cabeza Hacendado ultracongelada	5.25	5.25	kg	https://prod-mercadona.imgix.net/images/83fae83249fcbd7cca958cf607bf7ebc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62176/pescadilla-merluza-sin-cabeza-hacendado-ultracongelada-paquete	t
114	21	1	Cola de rape del Cabo sin piel Hacendado ultracongelada	8.98	17.95	kg	https://prod-mercadona.imgix.net/images/b2acb68233a4b02ac3191c9bf2a7e584.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24340/cola-rape-cabo-hacendado-ultracongelada-pieza	t
115	21	1	Merluza del Cabo sin cabeza Hacendado ultracongelada	5.77	8.25	kg	https://prod-mercadona.imgix.net/images/69a206b4ff70bba92ec3f4949835b98b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24324/merluza-cabo-sin-cabeza-hacendado-ultracongelada-pieza	t
116	21	1	Migas de bacalao sin piel MareDeus ultracongeladas	4.90	16.33	kg	https://prod-mercadona.imgix.net/images/4df996fce1de2f2fd46cb8ef14a1a2a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24023/migas-bacalao-sin-espinas-sin-piel-maredeus-ultra-congeladas-punto-sal-paquete	t
117	21	1	Migas de bacalao dorado con cebolla y patatas paja Hacendado congelado	2.60	10.83	kg	https://prod-mercadona.imgix.net/images/d6e7c22f60ce4e3ace5ebb38f2f64c69.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63023/migas-bacalao-dorado-con-cebolla-patatas-paja-hacendado-congelado-caja	t
118	21	1	Rodajas de atún de aleta amarilla Hacendado congelado	4.38	17.50	kg	https://prod-mercadona.imgix.net/images/2044dea67f3208de4b6c1cc55a693b7e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24357/rodajas-atun-aleta-amarilla-hacendado-congelado-bandeja	t
119	21	1	Tacos de atún Hacendado congelado	3.85	13.75	kg	https://prod-mercadona.imgix.net/images/1222abc8e5d72f2ccbc49f640cce296c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24458/tacos-atun-hacendado-congelado-aleta-amarilla-bandeja	t
120	21	1	Rodajas de merluza Argentina Hacendado ultracongeladas	4.50	7.50	kg	https://prod-mercadona.imgix.net/images/b02df74e62131f045906d715da702676.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26764/rodajas-merluza-argentina-hacendado-ultracongeladas-paquete	t
121	21	1	Rodaja de marrajo Hacendado ultracongelado	2.87	11.95	kg	https://prod-mercadona.imgix.net/images/8eea8d5c8d4c10d961fdaa0b891862ff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24384/rodaja-marrajo-hacendado-ultracongelado-pieza	t
122	21	1	Acedía entera Hacendado ultracongelada	7.00	11.67	kg	https://prod-mercadona.imgix.net/images/563433cc2282ce404cf8a482bcf3f79a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62033/acedia-entera-hacendado-ultracongelada-paquete	t
123	21	1	Lomo de bacalao MareDeus ultracongelado	7.68	20.00	kg	https://prod-mercadona.imgix.net/images/aa68741e624d6f99903465294f3de2aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62050/lomo-bacalao-maredeus-ultracongelado-punto-sal-paquete	t
124	21	1	Colas de merluza Argentina Hacendado ultracongeladas	5.25	5.25	kg	https://prod-mercadona.imgix.net/images/81b4027016c9656609b818c841519f13.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62165/colas-merluza-argentina-hacendado-ultracongeladas-paquete	t
125	21	1	Aritos de surimi a la romana Hacendado ultracongelados	3.30	5.50	kg	https://prod-mercadona.imgix.net/images/86e727c2c5327ac01ebaf9e752d3ccca.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63238/aritos-surimi-romana-ultracongelados-paquete	t
126	21	1	Merluza empanada pan fino Hacendado ultracongelada	4.00	7.84	kg	https://prod-mercadona.imgix.net/images/3a2d84d03fc17dd0645cf0bcc9231d83.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63140/merluza-empanada-pan-fino-hacendado-ultracongelada-paquete	t
127	36	1	Filetes de merluza al huevo Hacendado ultracongelados	5.15	8.58	kg	https://prod-mercadona.imgix.net/images/37236640f0698a8f89c437e33e578030.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63101/filetes-merluza-huevo-hacendado-ultracongelados-paquete	t
128	21	1	Varitas de merluza empanadas Hacendado ultracongeladas	4.25	10.63	kg	https://prod-mercadona.imgix.net/images/fbdf0c98ef14c40886949d2fd5cc22fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63170/varitas-merluza-empanadas-hacendado-ultracongeladas-paquete	t
129	21	1	Empanadillas de atún Hacendado ultracongeladas	1.90	3.80	kg	https://prod-mercadona.imgix.net/images/b2b646cfbda7f90d096057410e8ea17a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63407/empanadillas-atun-hacendado-ultracongeladas-caja	t
130	21	1	Palitos de merluza a la romana Hacendado ultracongelados	2.75	5.50	kg	https://prod-mercadona.imgix.net/images/ee8c09059091a07b3982f17ae35551f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63151/palitos-merluza-romana-hacendado-ultracongelados-paquete	t
131	21	1	Figuritas de merluza empanadas Hacendado ultracongeladas	3.60	7.20	kg	https://prod-mercadona.imgix.net/images/9f980df4041647987946b516409b7a34.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63159/figuritas-merluza-empanadas-hacendado-ultracongeladas-paquete	t
132	21	1	Langostino caballitos rebozados Hacendado ultracongelados	3.25	10.83	kg	https://prod-mercadona.imgix.net/images/c1311c0c6d0ca23b106986ff1efa861d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63144/langostino-caballitos-rebozados-hacendado-ultracongelados-paquete	t
133	21	1	Filetes de boquerón en tempura Hacendado ultracongelado	3.75	9.38	kg	https://prod-mercadona.imgix.net/images/e1c45e3dcc2f0814c0e2b792eb13c755.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63114/filetes-boqueron-tempura-hacendado-ultracongelado-paquete	t
134	21	1	Buñuelos de bacalao Hacendado ultracongelados	3.85	9.63	kg	https://prod-mercadona.imgix.net/images/b5708a2f75c5db5db4300e6fa65db783.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63425/bunuelos-bacalao-hacendado-ultracongelados-paquete	t
135	21	1	Tortillitas de camarones Hacendado ultracongeladas	2.75	7.86	kg	https://prod-mercadona.imgix.net/images/f5f1b3ecb898393d9a2b6082499f4138.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63168/tortillitas-camarones-hacendado-ultracongeladas-paquete	t
136	21	1	Rabas empanadas Hacendado ultracongeladas	4.05	8.10	kg	https://prod-mercadona.imgix.net/images/ae0f4559bacac7ce8201fc6a252c04ae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63161/rabas-empanadas-hacendado-ultracongeladas-paquete	t
137	21	1	Anillas de pota a la romana Hacendado ultracongeladas	5.25	10.50	kg	https://prod-mercadona.imgix.net/images/4542899594f37cc30305cfc3c678406b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63163/anillas-pota-romana-hacendado-ultracongeladas-paquete	t
138	21	1	Croquetas de merluza Hacendado ultracongelados	2.30	6.57	kg	https://prod-mercadona.imgix.net/images/56dee60d51ff1446c840d33ef4f2075c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60954/croquetas-merluza-hacendado-ultracongelados-paquete	t
140	21	1	Sepia faraónica limpia Hacendado congelada	6.40	16.00	kg	https://prod-mercadona.imgix.net/images/8c6b3609d7edb066186b5a2fc74eebe8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24200/sepia-limpia-congelada-pieza	t
141	21	1	Huevas de sepia Hacendado congeladas	6.95	19.86	kg	https://prod-mercadona.imgix.net/images/f23b1b11d0b8eae3e25ea91fb2ead1bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24412/huevas-sepia-hacendado-congeladas-bandeja	t
142	21	1	Sepia faraónica troceada limpia Hacendado congelada	6.00	16.67	kg	https://prod-mercadona.imgix.net/images/6030d5a8702a32ce6d75e12d5e233c7d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24274/sepia-limpia-troceada-hacendado-congelada-paquete	t
143	21	1	Calamar troceado limpio Hacendado congelado	6.00	12.63	kg	https://prod-mercadona.imgix.net/images/2c316c4572b58be6a109d7f3375ffa40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24242/calamar-limpio-troceado-hacendado-congelado-paquete	t
144	21	1	Rodaja de potón del Pacífico cocido Hacendado congelado	6.50	13.68	kg	https://prod-mercadona.imgix.net/images/587b220da60ea73445aca0a0b65ae6c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24234/rodaja-poton-pacifico-cocido-hacendado-congelado-paquete	t
145	21	1	Tiras de potón del Pacífico Hacendado congeladas	4.95	12.38	kg	https://prod-mercadona.imgix.net/images/4fdab476ef08c8dc8e5af196af075723.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24341/tiras-poton-hacendado-congeladas-paquete	t
146	21	1	Tinta de sepia Nortindal congelada	2.75	85.94	kg	https://prod-mercadona.imgix.net/images/f79ea5c38c9b67475afbea2b10e718a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24256/tinta-sepia-nortindal-congelada-paquete	t
147	21	1	Anillas de pota Argentina Hacendado congeladas	5.75	15.97	kg	https://prod-mercadona.imgix.net/images/74bb5e68f4415013d30547d41fcdc7c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24249/anillas-pota-hacendado-congeladas-paquete	t
148	21	1	Puntilla de la Índia Hacendado congelada	4.70	10.44	kg	https://prod-mercadona.imgix.net/images/1ebaa43d9a97fe2bcb1eb704d7190662.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24291/chipiron-puntilla-hacendado-congelado-paquete	t
149	21	1	Calamar patagónico pequeño Hacendado ultracongelado	5.50	11.00	kg	https://prod-mercadona.imgix.net/images/6644c2c1c3e1d966a84745b6a9c88e03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63432/calamar-patagonico-pequeno-hacendado-ultracongelado-paquete	t
150	21	1	Calamar grande Hacendado congelado	3.50	17.50	kg	https://prod-mercadona.imgix.net/images/f932659cddf67f574bb41f1d4c775830.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24417/calamar-grande-hacendado-congelado-pieza	t
151	36	1	Boquerones en vinagre Hacendado en aceite de girasol	1.65	20.63	kg	https://prod-mercadona.imgix.net/images/6e1955c6b54f9b25bcbea77d28d248db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80405/boquerones-vinagre-hacendado-aceite-girasol-bandeja	t
152	36	1	Boquerones al vinagre Hacendado en aceite de girasol	5.60	16.97	kg	https://prod-mercadona.imgix.net/images/1ae52aa9697fa04273f1b5561a149c6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23122/boquerones-vinagre-hacendado-aceite-girasol-tarrina	t
153	36	1	Filetes de anchoa en aceite de oliva Hacendado	1.30	30.95	kg	https://prod-mercadona.imgix.net/images/295dcdb95ca41e7576a396a533584e18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18433/filetes-anchoa-aceite-oliva-hacendado-lata	t
154	36	1	Filetes de anchoa en aceite de oliva Hacendado	2.90	24.17	kg	https://prod-mercadona.imgix.net/images/e96b227b0623ad993f6595fe117dbca5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18408/filetes-anchoa-aceite-oliva-hacendado-pack-3	t
155	36	1	Migas de bacalao desaladas Hacendado	7.27	25.50	kg	https://prod-mercadona.imgix.net/images/bedf3ce630eced0b26ff534f942487f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26995/migas-bacalao-desaladas-hacendado-bandeja	t
156	36	1	Filetes de sardina marinada Hacendado en aceite de oliva virgen extra	1.55	19.38	kg	https://prod-mercadona.imgix.net/images/3326133dfcb357a04bfc5a85629f3e2f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80412/filetes-sardina-marinada-hacendado-aceite-oliva-virgen-extra-bandeja	t
157	36	1	Sucedáneo de caviar negro Ubago Caviartic	1.95	26.00	kg	https://prod-mercadona.imgix.net/images/f411c973732753399e55fcc282519560.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18808/sucedaneo-caviar-negro-ubago-caviartic-tarro	t
158	36	1	Pavías de bacalao salado Hacendado	5.04	22.91	kg	https://prod-mercadona.imgix.net/images/fc07da060212eee004c7ba44e37da9e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26903/pavias-bacalao-salado-hacendado-bandeja	t
159	36	1	Filetes de anchoa en aceite de oliva Hacendado	6.75	48.21	kg	https://prod-mercadona.imgix.net/images/c68c86888d778e0ece5c589622dbd2dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18402/filetes-anchoa-aceite-oliva-hacendado-bandeja	t
160	36	1	Filetes de anchoa en aceite de oliva Hacendado	3.65	49.32	kg	https://prod-mercadona.imgix.net/images/9a7778131b8713e8a177a827544489f4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80418/filetes-anchoa-aceite-oliva-hacendado-lata	t
161	36	1	Boquerones aliñados Hacendado	1.70	21.25	kg	https://prod-mercadona.imgix.net/images/a684e4c575e2e7a19c068b579afa2dc0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52451/boquerones-alinados-hacendado-bandeja	t
162	36	1	Hoja de bacalao Hacendado	15.92	19.90	kg	https://prod-mercadona.imgix.net/images/dabf7ce1f5a77ead5fbc4e6e6fbd7167.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80644/hoja-bacalao-paquete	t
163	36	1	Salmón ahumado Hacendado	3.80	38.00	kg	https://prod-mercadona.imgix.net/images/80565fbe85f53b259dea2a15845ee08e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53444/salmon-ahumado-hacendado-paquete	t
164	36	1	Salmón ahumado Hacendado	10.80	36.00	kg	https://prod-mercadona.imgix.net/images/e1ad29ad8ea58c630d90ae813bb2f42d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53445/salmon-ahumado-hacendado-pack-2	t
165	36	1	Bacalao ahumado Hacendado en aceite de girasol	4.45	40.45	kg	https://prod-mercadona.imgix.net/images/ca3ceda75726781294e90f803e596c32.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13787/bacalao-ahumado-hacendado-aceite-girasol-bandeja	t
166	36	1	Salmón marinado Hacendado	3.50	43.75	kg	https://prod-mercadona.imgix.net/images/39224e678bfa489afb1e5357982d7148.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53446/salmon-marinado-hacendado-paquete	t
167	36	1	Filetes de sardina ahumada Hacendado en aceite de girasol	2.15	25.29	kg	https://prod-mercadona.imgix.net/images/c6505f49247832835afcd3eddc8f0f2d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18436/filetes-sardina-ahumada-hacendado-aceite-girasol-bandeja	t
168	36	1	Taquitos de salmón ahumado Hacendado	3.80	38.00	kg	https://prod-mercadona.imgix.net/images/8fcc57e7b49d3a0d3416acd77110e8f0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22612/taquitos-salmon-ahumado-hacendado-paquete	t
169	36	1	Mojama de atún extra Hacendado lonchas	3.50	70.00	kg	https://prod-mercadona.imgix.net/images/0b4dc75f5bfef8a4c412c43bb7391441.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11966/mojama-atun-extra-hacendado-lonchas-paquete	t
170	35	1	Costillas de cerdo carnosas a tacos	4.96	8.00	kg	https://prod-mercadona.imgix.net/images/2a9034fed753ec9f2947d36f73bebbf3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2811/costillas-cerdo-carnosas-tacos-bandeja	t
171	35	1	Filetes lomo de cerdo familiar	6.80	6.80	kg	https://prod-mercadona.imgix.net/images/7865223a99982e513a1e44182bf0edd4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3395/filetes-lomo-cerdo-familiar-bandeja	t
172	35	1	Carrillada de cerdo	5.76	13.10	kg	https://prod-mercadona.imgix.net/images/cebcd0e5e43fec643cc13b5ce2c1fa5f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2810/carrillada-cerdo-bandeja	t
173	35	1	Costilla de cerdo ibérico adobada	3.78	7.55	kg	https://prod-mercadona.imgix.net/images/af452ee749d0981858f5bfd393dccf15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1564/costilla-cerdo-iberico-adobada-bandeja	t
174	35	1	Chuletas de cerdo sajonia	3.76	9.40	kg	https://prod-mercadona.imgix.net/images/f27090a52a211af71289bfd5f60a689d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23305/chuletas-cerdo-sajonia-bandeja	t
175	35	1	Costilla de cerdo churrasco	5.13	5.70	kg	https://prod-mercadona.imgix.net/images/e72b7164b19595dbe99345d258156dc7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35286/costilla-cerdo-churrasco-pieza	t
176	35	1	Panceta de cerdo	3.13	5.50	kg	https://prod-mercadona.imgix.net/images/d3aebc50f3c2fdb3bbf81d728bc5c7e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2815/panceta-bandeja	t
177	35	1	Manos de cerdo	3.90	7.80	kg	https://prod-mercadona.imgix.net/images/f4fadadb46a1e5864af2836e7fd30667.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2851/manos-cerdo-bandeja	t
178	35	1	Cerdo a tacos	3.22	5.75	kg	https://prod-mercadona.imgix.net/images/3e3b46478252539e490d17eac79f3e42.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2813/cerdo-tacos-bandeja	t
179	35	1	Filetes lomo de cerdo adobado	3.61	6.95	kg	https://prod-mercadona.imgix.net/images/f1c9dda0bf7290499534dbe4776c6207.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2715/lomo-cerdo-adobado-bandeja	t
180	35	1	Filetes lomo de cerdo adobado familiar	6.50	6.70	kg	https://prod-mercadona.imgix.net/images/55cc474c76c30984dc63a16c30fcbc67.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5046/lomo-cerdo-adobado-familiar-bandeja	t
181	35	1	San Jacobos de cerdo sin gluten	2.64	6.60	kg	https://prod-mercadona.imgix.net/images/496d5a9a9de7faa2cf2b14354963a567.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14298/san-jacobos-cerdo-sin-gluten-bandeja	t
182	35	1	Filetes lomo de cerdo cabeza	4.42	6.70	kg	https://prod-mercadona.imgix.net/images/2b88a5d154cc77e60b79bf3265a31886.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2817/filetes-lomo-cerdo-cabeza-bandeja	t
183	18	1	Flautas de bacón y queso	2.20	7.86	kg	https://prod-mercadona.imgix.net/images/efd938ceb30081a8b1c076c1d4a08bd9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2169/flautas-bacon-queso-bandeja	t
184	16	1	Fiambre de magro de cerdo adobado	2.80	7.57	kg	https://prod-mercadona.imgix.net/images/35d3a3b57c5ee4d74e778939d27be3d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23308/fiambre-magro-cerdo-adobado-paquete	t
185	35	1	Filetes hígado de cerdo	3.37	6.60	kg	https://prod-mercadona.imgix.net/images/9951e656fbfeee7cba092b0205c4a464.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2859/filetes-higado-cerdo-bandeja	t
186	35	1	Presa de cerdo ibérico	8.64	27.00	kg	https://prod-mercadona.imgix.net/images/1de21efa96eccfd49e7201c9fcd4497c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4915/presa-cerdo-iberico-bandeja	t
187	35	1	Pluma de cerdo ibérico	7.29	27.00	kg	https://prod-mercadona.imgix.net/images/9a7f40fc01e22b6c0075939517631c8f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4916/pluma-cerdo-iberico-bandeja	t
188	35	1	Secreto de cerdo ibérico	6.25	25.00	kg	https://prod-mercadona.imgix.net/images/7059a3b35b05beffcd608eb14e2240ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4919/secreto-cerdo-iberico-bandeja	t
189	35	1	Medallones preparado de solomillo cerdo provenzal	4.44	11.10	kg	https://prod-mercadona.imgix.net/images/de9b0edb5cd84e63381ab3085220eee1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4152/medallones-preparado-solomillo-cerdo-provenzal-bandeja	t
190	35	1	Pinchos de cerdo adobado sin varilla	4.13	8.10	kg	https://prod-mercadona.imgix.net/images/ecf7155c382139064443e6c57b40c98f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2839/pinchos-cerdo-sin-varilla-bandeja	t
191	35	1	Chuletas aguja de cerdo	4.20	5.60	kg	https://prod-mercadona.imgix.net/images/de21659e8cf73b2e5f49153bedcd394d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4900/chuletas-aguja-cerdo-bandeja	t
192	35	1	Filetes lomo de cerdo ibérico	6.67	23.40	kg	https://prod-mercadona.imgix.net/images/3f0036a41134e5e1c6f391bd9bf3ac1a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4918/lomo-cerdo-iberico-bandeja	t
193	35	1	Lagarto de cerdo	4.00	8.00	kg	https://prod-mercadona.imgix.net/images/60d54558c1ae206bfd074c1a983ad1f6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4949/lagarto-cerdo-bandeja	t
194	35	1	Filetes lomo de cerdo extra tiernos	4.08	7.70	kg	https://prod-mercadona.imgix.net/images/96b976a2ee3a7047843870ef6ccc857e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2849/filetes-lomo-cerdo-extra-tiernos-bandeja	t
195	35	1	Fiambre de magreta de cerdo al ajillo	3.00	8.57	kg	https://prod-mercadona.imgix.net/images/10d7d9c616136bd6f29ca8d9ce54e47a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23310/fiambre-magreta-cerdo-ajillo-bandeja	t
196	35	1	Lomo de cerdo trozo	5.89	4.95	kg	https://prod-mercadona.imgix.net/images/2b0e15571b25cf3c1cd19194a73faf5c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4590/lomo-cerdo-trozo-pieza	t
197	35	1	Pieza cabeza lomo de cerdo	5.34	4.90	kg	https://prod-mercadona.imgix.net/images/9fde328faea02b49f032104eba79ced2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3554/pieza-magro-cabeza-cerdo-pieza	t
198	35	1	Solomillo de cerdo ibérico	9.33	21.20	kg	https://prod-mercadona.imgix.net/images/d2341bb96f9881f4343053cb292a5fb8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67599/solomillo-cerdo-iberico-paquete	t
199	35	1	Costilleja de cerdo ibérica	4.76	8.50	kg	https://prod-mercadona.imgix.net/images/e04e0ee8d3e5bbaf4bf93bd14295237f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14797/costilleja-cerdo-iberica-pieza	t
200	35	1	Cerdo a tacos familiar	5.09	5.65	kg	https://prod-mercadona.imgix.net/images/47784d4110d554470474a0a584ab6938.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4529/cerdo-tacos-familiar-bandeja	t
201	35	1	Lagarto de cerdo ibérico	5.64	21.30	kg	https://prod-mercadona.imgix.net/images/e75e438bd1a47060370b127819020b96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4922/lagarto-cerdo-iberico-bandeja	t
202	35	1	Abanico de cerdo ibérico	4.54	18.90	kg	https://prod-mercadona.imgix.net/images/409c402561f2f931b619ca0cde75bf96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4925/abanico-cerdo-iberico-bandeja	t
203	35	1	Carrillada de cerdo ibérica	8.50	17.90	kg	https://prod-mercadona.imgix.net/images/fd0999926b707959716ef53f33fb2248.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4923/carrillada-cerdo-iberica-bandeja	t
204	35	1	Zurrapa de lomo de cerdo roja Moreno plaza	2.60	11.82	kg	https://prod-mercadona.imgix.net/images/fc75a08adf12c2948339fa3623137c56.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53216/zurrapa-lomo-cerdo-roja-moreno-plaza-tarrina	t
205	35	1	Secreto de cerdo	4.65	6.20	kg	https://prod-mercadona.imgix.net/images/d52bf018e206d27fa759bc250840cae1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13046/secreto-cerdo-paquete	t
206	35	1	Chuletas lomo de cerdo finas	3.11	6.90	kg	https://prod-mercadona.imgix.net/images/9d75b9c7cefcede381c5cc40bcccab72.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12792/chuletas-lomo-cerdo-finas-bandeja	t
207	35	1	Filetes secreto de cerdo	3.24	6.90	kg	https://prod-mercadona.imgix.net/images/149f82ef7720bdb5e5037e38dd57cb72.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12793/filetes-secreto-cerdo-bandeja	t
208	35	1	Entrecot aguja de cerdo Duroc	5.04	8.00	kg	https://prod-mercadona.imgix.net/images/21f5a86973def639aa986031aab20081.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86928/entrecot-aguja-cerdo-duroc-bandeja	t
209	35	1	Taquitos de cerdo	2.12	5.30	kg	https://prod-mercadona.imgix.net/images/d38b81d9adf42e9b09d6a42107338ac5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14943/taquitos-cerdo-bandeja	t
210	35	1	Filetes pechuga de pavo	5.16	8.75	kg	https://prod-mercadona.imgix.net/images/c91b2f7aa5a6c53a62e40318e876dc06.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2794/filetes-pechuga-pavo-bandeja	t
211	35	1	Chuletas de pavo contramuslo	4.72	7.15	kg	https://prod-mercadona.imgix.net/images/f6fb2a154f10203b512bb229cf58890d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4523/chuletas-pavo-contramuslo-bandeja	t
212	35	1	Tacos de pavo	4.16	7.30	kg	https://prod-mercadona.imgix.net/images/236519bc870dd27a3bb74ca6c1ba4fb1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12874/tacos-pavo-bandeja	t
213	35	1	Solomillo de pavo	4.80	8.00	kg	https://prod-mercadona.imgix.net/images/7dec8c680db2281af94262095695fc04.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9995/solomillo-pavo-paquete	t
214	35	1	Filetes de pavo contramuslo	4.92	8.20	kg	https://prod-mercadona.imgix.net/images/b38ff8fb86b804be87286dc6b6b13f2a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4109/filetes-pavo-contramuslo-bandeja	t
215	16	1	Foie gras de pato fresco	11.50	85.19	kg	https://prod-mercadona.imgix.net/images/d9f5cd097f679110eb93ec7cc5d9e2a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35396/foie-gras-pato-fresco-martiko-paquete	t
216	35	1	Codornices	4.20	12.00	kg	https://prod-mercadona.imgix.net/images/02ac7c0bdb153d47d679639e0745d71c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2796/codornices-bandeja	t
217	35	1	Magret de pato	9.12	24.00	kg	https://prod-mercadona.imgix.net/images/b65770159f003d414571d62076c5b6d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25629/magret-pato-pieza	t
218	35	1	Filetes pechuga de pavo extra tiernos	5.40	9.00	kg	https://prod-mercadona.imgix.net/images/a0fb852cf4203be99caa41e863ae94ca.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14031/filetes-pechuga-pavo-extra-tiernos-bandeja	t
219	35	1	Filetes pechuga de pollo corte fino	4.67	8.20	kg	https://prod-mercadona.imgix.net/images/c89d28c5929f14861da52e2508912e3d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3400/filetes-pechuga-pollo-corte-fino-minimo-10-filetes-bandeja	t
220	35	1	Filetes pechuga de pollo	4.31	7.30	kg	https://prod-mercadona.imgix.net/images/cfbe3b741d3a64cc637efe0c7bf0bb93.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2787/filetes-pechuga-pollo-bandeja	t
221	35	1	Contramuslos de pollo deshuesados y sin piel	4.03	6.50	kg	https://prod-mercadona.imgix.net/images/6f014202bb9ed41e5125106c87ef1c74.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2789/contramuslos-pollo-deshuesados-sin-piel-bandeja	t
222	35	1	Solomillos de pollo	2.80	8.00	kg	https://prod-mercadona.imgix.net/images/f244d52e4c7843df0f8a23aa464ddde2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2786/solomillos-pollo-bandeja	t
223	35	1	Pechugas enteras familiar de pollo	6.76	6.20	kg	https://prod-mercadona.imgix.net/images/e20a225bd8032beb2866a2a0716809ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3682/pechugas-enteras-pollo-bandeja	t
224	35	1	Pechugas enteras de pollo	4.32	6.65	kg	https://prod-mercadona.imgix.net/images/626ed2bc08b4d92dc0d786b7c368a8c9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3724/pechugas-enteras-pollo-bandeja	t
225	35	1	Cuartos traseros familiar de pollo	4.64	2.90	kg	https://prod-mercadona.imgix.net/images/79b5a7244ff93c42acf5917150bca750.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3680/cuartos-traseros-familiar-pollo-bandeja	t
226	35	1	Cuartos traseros de pollo	2.64	3.30	kg	https://prod-mercadona.imgix.net/images/ef4d972abf6b39c469ba11d25eecf306.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3727/cuartos-traseros-pollo-bandeja	t
227	35	1	Muslos de pollo deshuesados con piel	2.44	5.55	kg	https://prod-mercadona.imgix.net/images/8cfc723d78c28867e24d49022d5e0441.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2788/muslos-pollo-deshuesados-con-piel-bandeja	t
228	35	1	Medio pollo troceado	4.54	4.20	kg	https://prod-mercadona.imgix.net/images/78c6373538c9cae1793f4d41024c024c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2779/medio-pollo-troceado-bandeja	t
229	35	1	Jamoncitos de pollo	3.22	3.50	kg	https://prod-mercadona.imgix.net/images/bdb83c7c681de567327ae97747a5d2bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2778/jamoncitos-pollo-bandeja	t
230	35	1	Alas partidas de pollo	3.12	5.20	kg	https://prod-mercadona.imgix.net/images/dc49d9d7c2badc6e75fc0efd12b078e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2785/alas-partidas-pollo-bandeja	t
231	35	1	Alas partidas de pollo	5.05	5.10	kg	https://prod-mercadona.imgix.net/images/ede5538914ce8073545beba4e7cc13e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4195/alas-partidas-pollo-bandeja	t
232	35	1	Carcasa y espinazo de pollo	0.93	1.10	kg	https://prod-mercadona.imgix.net/images/5e85a7c4d66fe891192d6c6175a2f1a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2853/carcasa-espinazo-pollo-bandeja	t
233	35	1	Filetes pechuga de pollo marinadas empanadas sin gluten	4.09	8.70	kg	https://prod-mercadona.imgix.net/images/42ed3d070937a1a4ae9d33d65e6aa1a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21227/pechugas-pollo-marinadas-empanadas-sin-gluten-bandeja	t
234	35	1	Filetes pechuga de pollo finas hierbas marinadas	4.92	8.20	kg	https://prod-mercadona.imgix.net/images/b41d5df0b7894464440dc93ad577066f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2833/pechugas-pollo-finas-hierbas-marinadas-bandeja	t
235	35	1	Filetes pechuga de pollo certificado alimentado con un 50% de maíz	4.80	9.60	kg	https://prod-mercadona.imgix.net/images/c0902c682f4d28953dc3dbf54cfbca00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2791/filetes-pechuga-pollo-certificado-alimentado-con-50-maiz-bandeja	t
236	18	1	Flautas de pollo y queso	2.20	7.86	kg	https://prod-mercadona.imgix.net/images/0ae8e36ead1e2d24d6f95c6abffe5e14.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2137/flautas-pollo-queso-bandeja	t
237	35	1	Hígados y corazones de pollo	1.52	4.00	kg	https://prod-mercadona.imgix.net/images/fc4beae71e0b59997815d674c1288f66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2857/higados-corazones-pollo-bandeja	t
238	35	1	Cuartos traseros de pollo certificado alimentado con un 50% de maíz	3.95	4.70	kg	https://prod-mercadona.imgix.net/images/4c371b41c61e93aa727ed205939fe77f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2783/cuartos-traseros-pollo-certificado-alimentado-con-50-maiz-bandeja	t
239	35	1	Alas de pollo	4.07	4.15	kg	https://prod-mercadona.imgix.net/images/9de7c0c7e523b36a96341a167d63aaf7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2784/alas-pollo-bandeja	t
240	35	1	Alas de pollo adobadas	3.47	5.60	kg	https://prod-mercadona.imgix.net/images/9c0c83c985fce305964a324078f2119e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2832/alas-pollo-adobadas-bandeja	t
241	35	1	Contramuslos de pollo sin piel	3.11	4.20	kg	https://prod-mercadona.imgix.net/images/696ce36da90626d3a36ae59f056f32dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2777/contramuslos-pollo-sin-piel-bandeja	t
242	35	1	Mollejas de pollo	2.09	5.35	kg	https://prod-mercadona.imgix.net/images/ad2e1acc853b585c2256a69da7b5ca05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2856/mollejas-pollo-tarrina	t
243	35	1	Sangre hervida de pollo	2.20	4.40	kg	https://prod-mercadona.imgix.net/images/6d113fe2acb8dc1f409a7c3b2926ea18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4270/sangre-hervida-pollo-paquete	t
244	35	1	Patas de pollo	2.07	4.60	kg	https://prod-mercadona.imgix.net/images/35af05185d53494427962bf7dd09b12c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25243/patas-pollo-bandeja	t
245	35	1	Filetes pechuga de pollo extra tiernos	4.26	7.60	kg	https://prod-mercadona.imgix.net/images/0108ba50479f08dcb3214bade012e048.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3653/filetes-pechuga-pollo-extra-tiernos-bandeja	t
246	35	1	Lagrimitas de pollo al limón empanadas sin gluten	3.44	8.40	kg	https://prod-mercadona.imgix.net/images/f9c43f2bec935f80a1bd2adb3b62216c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21235/lagrimitas-pollo-limon-empanadas-sin-gluten-bandeja	t
247	35	1	Filetes solomillos de pollo marinados empanados sin gluten	4.84	8.80	kg	https://prod-mercadona.imgix.net/images/8c1bca47470d3fef820cbbb9eb194c97.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52514/solomillos-pollo-marinados-empanados-sin-gluten-bandeja	t
248	35	1	Cuellos de pollo	1.75	5.00	kg	https://prod-mercadona.imgix.net/images/9dfa7157eb5609724cf334e3c73b8961.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60601/cuellos-pollo-bandeja	t
249	35	1	Alas de pollo adobadas picantes	3.26	6.40	kg	https://prod-mercadona.imgix.net/images/7dad7f5c3c8a5f55b76155f9b34be2b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8970/alas-pollo-adobadas-picantes-bandeja	t
250	35	1	Pinchos de pollo sin varilla adobados	4.30	8.60	kg	https://prod-mercadona.imgix.net/images/18faa0d5d1fb660eeb970c0958d22bb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3456/pinchos-pollo-sin-varilla-adobados-bandeja	t
251	35	1	Pincho Mexicano de pollo con varilla	4.84	10.30	kg	https://prod-mercadona.imgix.net/images/d15a89a092b17cc5b236c12867a2eb78.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8252/pincho-mexicano-pollo-con-varilla-bandeja	t
252	35	1	Pollo adobado y verduras	3.17	6.90	kg	https://prod-mercadona.imgix.net/images/fb76755ac7fafe84affcf68d4fd692df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8958/wok-pollo-adobado-verduras-bandeja	t
253	35	1	Contramuslos deshuesados y sin piel de pollo certificado alimentado con un 50% de maíz	4.50	9.00	kg	https://prod-mercadona.imgix.net/images/8ef9192a66905a66da019dcb53551d0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25258/contramuslos-deshuesados-sin-piel-pollo-certificado-alimentado-con-50-maiz-bandeja	t
254	35	1	Empanados de pollo picantes sin gluten	3.10	8.61	kg	https://prod-mercadona.imgix.net/images/dda158759a1d705e4090839daf4db91b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11687/filetes-pechuga-pollo-marinadas-empanadas-picantes-sin-gluten-bandeja	t
255	35	1	Filetes de vacuno 1º B añojo para plancha o guisar	10.08	18.00	kg	https://prod-mercadona.imgix.net/images/68cb1d966e649ca0bc9d11fdf0487100.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2712/filetes-vacuno-1o-b-anojo-plancha-guisar-bandeja	t
256	35	1	Tacos de vacuno añojo para guisar	8.75	16.20	kg	https://prod-mercadona.imgix.net/images/bb6c3295dc5d004452de360f942afc6c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2807/tacos-vacuno-anojo-guisar-bandeja	t
257	35	1	Filetes lomo de vacuno añojo para plancha	11.10	22.20	kg	https://prod-mercadona.imgix.net/images/dcae522134c9d1ae379f9c3f3de3ff1b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2800/lomo-vacuno-anojo-plancha-bandeja	t
258	35	1	Solomillo de vacuno añojo para plancha	12.21	40.70	kg	https://prod-mercadona.imgix.net/images/45a7a7c8b998f114941d4bb5f9fe27ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2804/solomillo-vacuno-anojo-plancha-bandeja	t
259	35	1	Carpaccio de vacuno	4.10	37.27	kg	https://prod-mercadona.imgix.net/images/920087fbcb8bea3e467e0217a5a6605b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2632/carpaccio-vacuno-bandeja	t
260	35	1	Filetes de vacuno añojo para plancha	10.01	18.20	kg	https://prod-mercadona.imgix.net/images/ca0c8c633e43b0e51ac882279b8ad4da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2900/filetes-vacuno-anojo-plancha-bandeja	t
261	35	1	Entrecot de vacuno añojo fino para barbacoa o plancha	12.85	25.70	kg	https://prod-mercadona.imgix.net/images/3d1ca4c74731cbfaac070f196a6af3fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3461/entrecot-vacuno-anojo-fino-barbacoa-plancha-bandeja	t
262	35	1	Entrecot de vacuno añojo grueso para barbacoa o plancha	9.77	25.70	kg	https://prod-mercadona.imgix.net/images/6d66214b4871e728de8989e05733c29d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3460/entrecot-vacuno-anojo-grueso-barbacoa-plancha-bandeja	t
263	35	1	Filetes hígado de vacuno	4.58	10.40	kg	https://prod-mercadona.imgix.net/images/e27b0171a2d1096ec088c36d580dd98c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2861/filetes-higado-vacuno-anojo-bandeja	t
264	35	1	Filetes de vacuno marinado extra tiernos	8.85	17.70	kg	https://prod-mercadona.imgix.net/images/be858d59782ec94b3fd348008807287f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60633/filetes-vacuno-marinado-extra-tiernos-bandeja	t
265	35	1	Steak Tartar de vacuno marinado	5.40	27.00	kg	https://prod-mercadona.imgix.net/images/fbacb9bddbd9c1d6c796ebea48fc2e93.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8308/steak-tartar-vacuno-marinado-bandeja	t
266	35	1	Medio conejo troceado	6.20	9.40	kg	https://prod-mercadona.imgix.net/images/f1dd2afe2729b8a5a95104788147cd27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25972/medio-conejo-troceado-bandeja	t
267	35	1	Chuletas de cordero palo y riñonada	15.50	31.00	kg	https://prod-mercadona.imgix.net/images/243063a08ffb7136c594f37b6ab8eae1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4363/chuletas-cordero-palo-rinonada-bandeja	t
268	35	1	Burger de cordero al romero	3.50	14.58	kg	https://prod-mercadona.imgix.net/images/ea1c49c71c2424324ad4ac73badbfedf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8839/burger-cordero-romero-paquete	t
269	16	1	Longaniza magro fresca	3.21	6.00	kg	https://prod-mercadona.imgix.net/images/435b9b2aa7b8fcafab0c64763e5a5fe9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6040/longaniza-magro-fresca-bandeja	t
270	16	1	Longaniza fresca sin tripa	3.30	5.89	kg	https://prod-mercadona.imgix.net/images/fe4d83378f79d9ad0509b46e5916226f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6043/longaniza-fresca-sin-tripa-bandeja	t
271	16	1	Longaniza fresca de pollo	4.13	7.50	kg	https://prod-mercadona.imgix.net/images/9509b9d588cb37aca8f104bac1f6c1c1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6041/longaniza-fresca-pollo-bandeja	t
272	16	1	Chorizo oreado	2.57	7.15	kg	https://prod-mercadona.imgix.net/images/e57f9a3c9969167182a14b78559d511d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6048/chorizo-oreado-bandeja	t
273	16	1	Chistorra	1.40	6.36	kg	https://prod-mercadona.imgix.net/images/43ee4457e389171f6893c9d1b6698eb1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2864/chistorra-paquete	t
274	16	1	Longaniza fresca estilo criollo	3.34	8.80	kg	https://prod-mercadona.imgix.net/images/e1caa3e12a0819df627d8a895ad3bb15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6045/longaniza-fresca-estilo-criollo-bandeja	t
275	16	1	Butifarra fresca	3.46	5.40	kg	https://prod-mercadona.imgix.net/images/725678a552c6bc61ff7fc8ead5003d80.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6044/butifarra-fresca-bandeja	t
276	16	1	Morcilla de arroz y cebolla	1.96	5.45	kg	https://prod-mercadona.imgix.net/images/0405d211265796755365fabbfd7fd172.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2876/morcilla-arroz-cebolla-paquete	t
277	16	1	Chorizo aperitivo	2.59	8.65	kg	https://prod-mercadona.imgix.net/images/a88a8a03ffc2f682cb3c1ab46308855b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6046/chorizo-aperitivo-bandeja	t
278	16	1	Chorizo picante aperitivo	2.59	8.65	kg	https://prod-mercadona.imgix.net/images/8bf834ec0eb4671abd16f388a0fe05f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6047/chorizo-picante-aperitivo-bandeja	t
279	16	1	Chorizo fresco Ibérico	3.11	11.10	kg	https://prod-mercadona.imgix.net/images/0c1c8b3143e27ed9e52c21194e95f147.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1279/chorizo-fresco-iberico-bandeja	t
280	16	1	Morcilla	2.54	7.25	kg	https://prod-mercadona.imgix.net/images/96b4f088c0491077a8a4bdf8f3e4ab3b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15264/morcilla-bandeja	t
281	35	1	Burger de cerdo	2.70	5.00	kg	https://prod-mercadona.imgix.net/images/7656b030e2c1cf92058d0d69e0166ebe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52672/burger-cerdo-bandeja	t
282	35	1	Burger de vacuno y cerdo	4.50	8.33	kg	https://prod-mercadona.imgix.net/images/e5279086a2d46bed3787947f6a620949.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2872/burger-vacuno-cerdo-bandeja	t
283	35	1	Burger de vacuno	6.20	11.48	kg	https://prod-mercadona.imgix.net/images/09de086f011cef23ee2910e3aa6e983d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2873/burger-vacuno-bandeja	t
284	35	1	Burger de pollo	3.95	7.31	kg	https://prod-mercadona.imgix.net/images/bf1bd3c34696dbcfc3c3b608ca0f0c4d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2622/burger-pollo-bandeja	t
285	35	1	Burger de pollo gruesa	3.20	8.89	kg	https://prod-mercadona.imgix.net/images/e62de035b39351e90b69a682a966c271.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86911/burger-pollo-gruesa-bandeja	t
286	35	1	Burger de vacuno gruesas	5.10	14.17	kg	https://prod-mercadona.imgix.net/images/d3bb2192a1500c898c75b9c4780a8e94.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3547/burger-vacuno-gruesas-bandeja	t
287	35	1	Burger de vacuno y cerdo con jamón y cebolla caramelizada	2.80	11.67	kg	https://prod-mercadona.imgix.net/images/b5b402ed0066a733539eca7905eddc2a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4155/burger-vacuno-cerdo-con-jamon-cebolla-caramelizada-bandeja	t
288	35	1	Burger de pavo y espinacas	2.40	10.00	kg	https://prod-mercadona.imgix.net/images/03d25c351238f8a2d3f1a2ab6a61b764.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3976/burger-pavo-espinacas-bandeja	t
289	35	1	Mini burgers de pollo	2.90	10.36	kg	https://prod-mercadona.imgix.net/images/4a2cb5989f97fa42b4dcdf415abd6fcd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10467/mini-burgers-pollo-bandeja	t
290	35	1	Mini burgers de vacuno y cerdo	3.10	11.07	kg	https://prod-mercadona.imgix.net/images/b9beadec6e479798f27f209466d7a813.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10453/mini-burgers-vacuno-cerdo-bandeja	t
291	35	1	Burger americana gruesas	3.20	8.89	kg	https://prod-mercadona.imgix.net/images/b7ebf4e3c94b8649ad4ab4262d41b09e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3979/burger-americana-gruesas-bandeja	t
292	35	1	Burger Crunchy Chicken	2.00	8.33	kg	https://prod-mercadona.imgix.net/images/7134bb1517ab827aa5614ab6d5f6b1d6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4079/burger-crunchy-chicken-bandeja	t
293	35	1	Hamburguesa de lomo de vacuno	4.00	16.67	kg	https://prod-mercadona.imgix.net/images/fb42955265ec4782f2e54200235d54ba.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35884/hamburguesa-lomo-vacuno-paquete	t
294	35	1	Burger de vaca madurada	2.90	16.11	kg	https://prod-mercadona.imgix.net/images/e4b180e10d26bc1bdbfda52acb3fea5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8840/burger-vaca-madurada-paquete	t
295	35	1	Burger de cordero al romero	3.50	14.58	kg	https://prod-mercadona.imgix.net/images/ea1c49c71c2424324ad4ac73badbfedf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8839/burger-cordero-romero-paquete	t
296	35	1	Preparado de carne picada vacuno y cerdo	4.30	8.60	kg	https://prod-mercadona.imgix.net/images/3ff4619c75302a2ae20831ae3ffe6c1c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2869/preparado-carne-picada-vacuno-cerdo-bandeja	t
297	35	1	Preparado de carne picada vacuno y cerdo	8.40	8.40	kg	https://prod-mercadona.imgix.net/images/5abc17f64c9721afe904923d5b12ecd2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3453/preparado-carne-picada-vacuno-cerdo-bandeja	t
298	35	1	Preparado de carne picada cerdo	2.75	5.50	kg	https://prod-mercadona.imgix.net/images/2781547566ca8d299f1e2e0d9cdccd4f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2867/preparado-carne-picada-cerdo-bandeja	t
299	35	1	Preparado de carne picada vacuno	5.50	11.00	kg	https://prod-mercadona.imgix.net/images/9b98483e96624180d8a01e2f7e085f87.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2868/preparado-carne-picada-vacuno-bandeja	t
300	35	1	Preparado de carne picada vacuno	10.80	10.80	kg	https://prod-mercadona.imgix.net/images/568b0075f1c53000f2a26946b6539e0c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3454/preparado-carne-picada-vacuno-bandeja	t
301	35	1	Preparado de carne picada pollo	3.95	7.90	kg	https://prod-mercadona.imgix.net/images/50a22eff94bcd78d616ede310499a235.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35774/preparado-carne-picada-pollo-bandeja	t
302	35	1	Albóndigas de cerdo	4.55	5.42	kg	https://prod-mercadona.imgix.net/images/087eaf211a0fc38ef1ced35ff9b44a18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2871/albondigas-cerdo-bandeja	t
303	35	1	Albóndigas de pollo	6.00	7.14	kg	https://prod-mercadona.imgix.net/images/0591c4d2bdb7d3c9c067d97673a592b7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23632/albondigas-pollo-bandeja	t
304	35	1	Preparado de carne picada vacuno	5.40	13.50	kg	https://prod-mercadona.imgix.net/images/9e60addfb3a01586c9009f3eec045ce9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52776/preparado-carne-picada-vacuno-paquete	t
305	21	1	Nuggets de pollo Hacendado ultracongelados	2.70	5.40	kg	https://prod-mercadona.imgix.net/images/a83470c87a6d3342c96dd0a449237604.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63323/nuggets-pollo-hacendado-ultracongelados-paquete	t
306	21	1	Delicias de pollo Hacendado ultracongeladas	3.70	7.40	kg	https://prod-mercadona.imgix.net/images/69c43cac064a4c03f04c7e07bf3b617a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63322/delicias-pollo-hacendado-ultracongeladas-con-empanado-base-maiz-paquete	t
307	21	1	Croquetas de cocido Hacendado ultracongeladas	2.00	5.71	kg	https://prod-mercadona.imgix.net/images/1528c21f212a7b7eb203724cba48cfe9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13496/croquetas-cocido-hacendado-ultracongeladas-paquete	t
308	21	1	Nuggets de pavo Hacendado ultracongelados	3.40	8.50	kg	https://prod-mercadona.imgix.net/images/2fdc9b83394eee29e89c2779fa919b6b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63007/nuggets-pavo-hacendado-ultracongelados-paquete	t
309	21	1	Pollo marinado rebozado Crispy American Style Hacendado ultracongelado	4.90	9.80	kg	https://prod-mercadona.imgix.net/images/1c8a4177bc4a03294292496e2806fdb8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60306/pollo-marinado-rebozado-crispy-american-style-hacendado-ultracongeladas-paquete	t
310	18	1	Flautas de pollo y queso	2.20	7.86	kg	https://prod-mercadona.imgix.net/images/0ae8e36ead1e2d24d6f95c6abffe5e14.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2137/flautas-pollo-queso-bandeja	t
311	18	1	Flautas de bacón y queso	2.20	7.86	kg	https://prod-mercadona.imgix.net/images/efd938ceb30081a8b1c076c1d4a08bd9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2169/flautas-bacon-queso-bandeja	t
312	35	1	Filetes lomo de cerdo adobado	3.61	6.95	kg	https://prod-mercadona.imgix.net/images/f1c9dda0bf7290499534dbe4776c6207.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2715/lomo-cerdo-adobado-bandeja	t
313	35	1	Filetes lomo de cerdo adobado familiar	6.50	6.70	kg	https://prod-mercadona.imgix.net/images/55cc474c76c30984dc63a16c30fcbc67.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5046/lomo-cerdo-adobado-familiar-bandeja	t
314	35	1	San Jacobos de cerdo sin gluten	2.64	6.60	kg	https://prod-mercadona.imgix.net/images/496d5a9a9de7faa2cf2b14354963a567.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14298/san-jacobos-cerdo-sin-gluten-bandeja	t
315	35	1	Filetes pechuga de pollo finas hierbas marinadas	4.92	8.20	kg	https://prod-mercadona.imgix.net/images/b41d5df0b7894464440dc93ad577066f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2833/pechugas-pollo-finas-hierbas-marinadas-bandeja	t
316	35	1	Filetes pechuga de pollo marinadas empanadas sin gluten	4.09	8.70	kg	https://prod-mercadona.imgix.net/images/42ed3d070937a1a4ae9d33d65e6aa1a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21227/pechugas-pollo-marinadas-empanadas-sin-gluten-bandeja	t
317	35	1	Pinchos de cerdo adobado sin varilla	4.13	8.10	kg	https://prod-mercadona.imgix.net/images/ecf7155c382139064443e6c57b40c98f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2839/pinchos-cerdo-sin-varilla-bandeja	t
318	35	1	Medallones preparado de solomillo cerdo provenzal	4.44	11.10	kg	https://prod-mercadona.imgix.net/images/de9b0edb5cd84e63381ab3085220eee1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4152/medallones-preparado-solomillo-cerdo-provenzal-bandeja	t
319	35	1	Alas de pollo adobadas	3.47	5.60	kg	https://prod-mercadona.imgix.net/images/9c0c83c985fce305964a324078f2119e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2832/alas-pollo-adobadas-bandeja	t
320	16	1	Fiambre de magro de cerdo adobado	2.80	7.57	kg	https://prod-mercadona.imgix.net/images/35d3a3b57c5ee4d74e778939d27be3d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23308/fiambre-magro-cerdo-adobado-paquete	t
321	35	1	Costilla de cerdo ibérico adobada	3.78	7.55	kg	https://prod-mercadona.imgix.net/images/af452ee749d0981858f5bfd393dccf15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1564/costilla-cerdo-iberico-adobada-bandeja	t
322	16	1	Fiambre de pechuga de pavo adobada	3.80	10.27	kg	https://prod-mercadona.imgix.net/images/0c394c4ef89ad72fa0123d9ea75a008b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23306/fiambre-pechuga-pavo-adobada-bandeja	t
323	35	1	Chuletas de cerdo sajonia	3.76	9.40	kg	https://prod-mercadona.imgix.net/images/f27090a52a211af71289bfd5f60a689d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23305/chuletas-cerdo-sajonia-bandeja	t
324	35	1	Callos preparados de ternera Rogusa	4.10	8.20	kg	https://prod-mercadona.imgix.net/images/417269bc66066ea7cfcb5b3419aacfc7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2179/callos-preparados-ternera-rogusa-paquete	t
325	35	1	Pinchos de pollo sin varilla adobados	4.30	8.60	kg	https://prod-mercadona.imgix.net/images/18faa0d5d1fb660eeb970c0958d22bb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3456/pinchos-pollo-sin-varilla-adobados-bandeja	t
326	35	1	Lagrimitas de pollo al limón empanadas sin gluten	3.44	8.40	kg	https://prod-mercadona.imgix.net/images/f9c43f2bec935f80a1bd2adb3b62216c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21235/lagrimitas-pollo-limon-empanadas-sin-gluten-bandeja	t
327	35	1	Filetes solomillos de pollo marinados empanados sin gluten	4.84	8.80	kg	https://prod-mercadona.imgix.net/images/8c1bca47470d3fef820cbbb9eb194c97.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52514/solomillos-pollo-marinados-empanados-sin-gluten-bandeja	t
328	35	1	Flamenquín de pollo marinado con jamón y queso	5.69	12.65	kg	https://prod-mercadona.imgix.net/images/cc080145ec251420ed01be746c645d41.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52778/flamenquin-pollo-marinado-con-jamon-queso-bandeja	t
329	35	1	Empanados de pollo picantes sin gluten	3.10	8.61	kg	https://prod-mercadona.imgix.net/images/dda158759a1d705e4090839daf4db91b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11687/filetes-pechuga-pollo-marinadas-empanadas-picantes-sin-gluten-bandeja	t
330	35	1	Trozo de vacuno para cocido	4.53	15.10	kg	https://prod-mercadona.imgix.net/images/6fe193c645c153379609367513afd859.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2692/trozo-vacuno-cocido-bandeja	t
331	35	1	Compango	2.60	10.40	kg	https://prod-mercadona.imgix.net/images/835f012a3de84ca497446fcb701c06ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53011/compango-asturiano-paquete	t
332	16	1	Hueso garrón	1.16	4.00	kg	https://prod-mercadona.imgix.net/images/1f6928a432081cf7c4bb36c66a4dd305.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58307/hueso-garron-incarlopsa-pieza	t
333	35	1	Manos de cerdo	3.90	7.80	kg	https://prod-mercadona.imgix.net/images/f4fadadb46a1e5864af2836e7fd30667.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2851/manos-cerdo-bandeja	t
334	16	1	Chorizo asturiano	2.80	11.20	kg	https://prod-mercadona.imgix.net/images/e3d5d0a71e1aeb4f384910f2c8aebeda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59154/chorizo-asturiano-paquete	t
335	35	1	Espinazo de cerdo salado	1.89	5.40	kg	https://prod-mercadona.imgix.net/images/f53a3dd27cc3cf5108d9ab0ae1801989.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1945/espinazo-cerdo-salado-bandeja	t
336	35	1	Costilla de cerdo salada	2.62	7.50	kg	https://prod-mercadona.imgix.net/images/fb5fca5752b644c2c70822aa7ea07d38.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1897/costilla-cerdo-salada-bandeja	t
337	35	1	Puchero vacuno y pollo	8.76	7.30	kg	https://prod-mercadona.imgix.net/images/53d2ed210a279980300f5ea9664a94f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5358/puchero-vacuno-pollo-bandeja	t
338	16	1	Hueso de cerdo salado	1.82	5.70	kg	https://prod-mercadona.imgix.net/images/538783cfff9371a57b911c97113ba743.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1946/hueso-cerdo-salado-bandeja	t
339	16	1	Tocino de cerdo ibérico con secreto salado	2.40	7.50	kg	https://prod-mercadona.imgix.net/images/aac410d460820d098863d3cd88c1d53f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3391/tocino-cerdo-iberico-con-secreto-salado-bandeja	t
340	35	1	Preparado Andaluz	2.60	5.20	kg	https://prod-mercadona.imgix.net/images/eeae7d21f2e7e9955794518e1efd762c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1895/preparado-andaluz-bandeja	t
341	16	1	Tocino de cerdo con corteza añejo	2.28	7.60	kg	https://prod-mercadona.imgix.net/images/b289f55b028baae94a45631f683f2847.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1896/tocino-cerdo-con-corteza-anejo-caja	t
342	16	1	Tocino de cerdo ibérico	2.12	7.30	kg	https://prod-mercadona.imgix.net/images/9b208bb56fc10794ae4623d4554b0644.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2116/tocino-cerdo-iberico-paquete	t
343	21	1	Jamoncitos de pollo congelados	3.30	3.30	kg	https://prod-mercadona.imgix.net/images/bebaada78c49c64b7dda4cf6b5726cf0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25183/jamoncitos-pollo-congelados-paquete	t
344	21	1	Alas de pollo congeladas	3.50	3.50	kg	https://prod-mercadona.imgix.net/images/7a797d7ecd729457ebb2712aaf361062.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25184/alas-pollo-congeladas-paquete	t
345	21	1	Medallones preparado de solomillo cerdo congelados marinados	3.11	10.36	kg	https://prod-mercadona.imgix.net/images/11bcd6090bd578b0427ad1cbb3f63474.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4176/medallones-preparado-solomillo-cerdo-congelados-marinados-paquete	t
346	21	1	Solomillo de pavo marinado congelado	3.12	7.80	kg	https://prod-mercadona.imgix.net/images/5bb818d0e9762e82d926efb3ce16c8a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25353/solomillo-pavo-marinado-congelado-paquete	t
347	21	1	Cuartos traseros de pollo congelados	5.70	2.85	kg	https://prod-mercadona.imgix.net/images/64a92b8526d3a6544a6dfcba18b78e82.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25182/cuartos-traseros-pollo-congelados-paquete	t
348	21	1	Solomillo de cerdo marinado congelado	6.24	7.80	kg	https://prod-mercadona.imgix.net/images/ca9de27c3cc48047eb795200ae5f5a5f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2228/solomillo-cerdo-marinado-congelado-paquete	t
349	21	1	Jamoncitos de pavo duplo congelados	3.74	4.35	kg	https://prod-mercadona.imgix.net/images/82b26d67c39b10ad7c6ed5b8bf758c60.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25376/jamoncitos-pavo-duplo-congelados-paquete	t
350	21	1	Rabo de vacuno añojo congelado	18.70	17.00	kg	https://prod-mercadona.imgix.net/images/d5ac4015bab4d6cbbbf82c8ad51cff07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2266/rabo-vacuno-anojo-congelado-paquete	t
351	21	1	Chuletas cordero de lechal congeladas	15.40	28.00	kg	https://prod-mercadona.imgix.net/images/326f3c03b33c5d1390a84db3c748b7ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4334/chuletas-cordero-lechal-congeladas-paquete	t
352	21	1	Carrillada de cerdo congelada	5.75	12.50	kg	https://prod-mercadona.imgix.net/images/00bf9ecaba2c069b2182a91edba66196.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4425/carrillada-cerdo-congelada-paquete	t
353	21	1	Alas de pollo barbacoa congeladas	3.70	4.93	kg	https://prod-mercadona.imgix.net/images/778aff71ecab4df9feea58e5b571d1c4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52426/alas-pollo-barbacoa-congeladas-paquete	t
354	16	1	Pechuga de pavo bajo en sal Hacendado finas lonchas	3.95	9.88	kg	https://prod-mercadona.imgix.net/images/0743c4f754d2155a541a9363a5bf373c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86786/pechuga-pavo-bajo-sal-hacendado-finas-lonchas-pack-2	t
355	16	1	Pechuga de pavo bajo en sal Hacendado finas lonchas	2.50	11.11	kg	https://prod-mercadona.imgix.net/images/49d21ca3fcddbcc679eb677e61337d1b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60243/pechuga-pavo-bajo-sal-hacendado-finas-lonchas-paquete	t
356	16	1	Pechuga de pavo finas lonchas Hacendado	2.30	11.50	kg	https://prod-mercadona.imgix.net/images/8987d5ff5420c83d5be5a3dc6e3ebcbb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60244/pechuga-pavo-finas-lonchas-hacendado-paquete	t
357	16	1	Tiras de pechuga pollo al horno Hacendado	2.25	16.07	kg	https://prod-mercadona.imgix.net/images/a771c6adb7a421fa3c83983defee636c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/56652/tiras-pechuga-pollo-horno-hacendado-paquete	t
358	16	1	Jamón de pavo Hacendado finas lonchas	1.90	8.44	kg	https://prod-mercadona.imgix.net/images/b7691fb2718bc66ad695bb0454823efe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/56619/jamon-pavo-hacendado-finas-lonchas-paquete	t
359	16	1	Tiras de pechuga de pollo al natural Hacendado	2.25	16.07	kg	https://prod-mercadona.imgix.net/images/aece46064c7f86ca0d02cda808d4ba74.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/56661/tiras-pechuga-pollo-natural-hacendado-paquete	t
360	16	1	Pechuga de pollo braseada Hacendado finas lonchas	2.30	11.50	kg	https://prod-mercadona.imgix.net/images/b7fa10ba93f2ac018c73776e7ddff803.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/56169/pechuga-pollo-braseada-hacendado-finas-lonchas-paquete	t
361	16	1	Pechuga de pavo al horno de leña Campofrío lonchas	1.85	14.80	kg	https://prod-mercadona.imgix.net/images/4d0aeb86816023033231a708eeb0f7cb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53140/pechuga-pavo-horno-lena-campofrio-lonchas-pavofrio-paquete	t
362	16	1	Pechuga 92% pavo Hacendado lonchas	2.85	14.25	kg	https://prod-mercadona.imgix.net/images/42caa18db79c87be197d47cdb41c0e28.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5710/pechuga-pavo-92-hacendado-lonchas-paquete	t
363	16	1	Pechuga de pavo Noel lonchas muy finas	2.45	12.25	kg	https://prod-mercadona.imgix.net/images/918213955ad9fe95742e4abe7665f787.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59283/pechuga-pavo-noel-lonchas-muy-finas-paquete	t
364	16	1	Pollo 97% relleno La Carloteña asado al horno lonchas	2.40	16.00	kg	https://prod-mercadona.imgix.net/images/c0a4ea8f1fe98e43e957b317ac9c3d07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/56084/pollo-relleno-asado-horno-carlotena-lonchas-paquete	t
365	16	1	Jamón de pavo Hacendado	2.85	5.70	kg	https://prod-mercadona.imgix.net/images/0a4b8f824e5ea4032abcee4e75a9092a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59218/jamon-pavo-hacendado-pieza	t
366	16	1	Longaniza de pavo Imperial extra Hacendado	4.20	17.87	kg	https://prod-mercadona.imgix.net/images/4093763502649349ae957fce8993e19c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/55136/longaniza-pavo-imperial-extra-hacendado-pieza	t
367	16	1	Budín de cerdo Hacendado finas lonchas	1.45	9.67	kg	https://prod-mercadona.imgix.net/images/791746738d4f288fabfe91f7bb9d579f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59368/budin-cerdo-hacendado-finas-lonchas-paquete	t
368	16	1	Carne mechada de cerdo al horno Hacendado lonchas	2.70	18.00	kg	https://prod-mercadona.imgix.net/images/2b1be0aec80b852989a0aecbccbb2963.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59272/carne-mechada-cerdo-horno-hacendado-lonchas-paquete	t
369	16	1	Pechuguita de pollo 99% La Carloteña asada al horno lonchas	2.50	20.00	kg	https://prod-mercadona.imgix.net/images/1e13c330e4bce89f5a37d8e709c976a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22332/pechuguita-pollo-asada-carlotena-lonchas-paquete	t
370	16	1	Maxi pavo Hacendado finas lonchas	3.05	7.63	kg	https://prod-mercadona.imgix.net/images/18d308abcd2a05dcec6ee3cc012d6e86.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22430/maxi-pavo-hacendado-finas-lonchas-paquete	t
371	16	1	Lomo asado La Carloteña lonchas	2.50	20.00	kg	https://prod-mercadona.imgix.net/images/1ad85ae3023b7f755f0e9dfbc5d03fdb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11507/lomo-asado-carlotena-lonchas-paquete	t
372	16	1	Jamón cocido extra Hacendado finas lonchas	3.45	7.67	kg	https://prod-mercadona.imgix.net/images/1d55b8dee62ffbda171bbfa8a346a9d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86074/jamon-cocido-extra-hacendado-finas-lonchas-pack-2	t
373	16	1	Jamón cocido extra Hacendado finas lonchas	2.00	10.00	kg	https://prod-mercadona.imgix.net/images/d070e4c58948dba0b36098e312bb401b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60329/jamon-cocido-extra-hacendado-finas-lonchas-paquete	t
374	16	1	Jamón cocido Hacendado lonchas	2.25	11.25	kg	https://prod-mercadona.imgix.net/images/9beeb85074dfd583cf1e87fb8e11935d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59256/jamon-cocido-hacendado-lonchas-paquete	t
375	16	1	Maxi york Hacendado finas lonchas	2.30	4.60	kg	https://prod-mercadona.imgix.net/images/0fee1c398bf5d54ea64c5944a7ae2e02.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/56115/maxi-york-hacendado-finas-lonchas-paquete	t
376	16	1	Jamón cocido extra Noel lonchas	2.25	11.25	kg	https://prod-mercadona.imgix.net/images/bc9bf557bde7e95168ae5471a7d2a3a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59143/jamon-cocido-extra-noel-lonchas-paquete	t
377	16	1	Jamón cocido jugoso Hacendado	1.80	8.00	kg	https://prod-mercadona.imgix.net/images/3ddc470e5ae64f414cc013facf9adc15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59233/jamon-cocido-jugoso-hacendado-paquete	t
378	16	1	Jamón cocido braseado Noel lonchas	2.25	11.25	kg	https://prod-mercadona.imgix.net/images/ad28305fe300da29a67a967e556427ca.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59164/jamon-cocido-braseado-noel-lonchas-paquete	t
379	16	1	Jamón cocido Noel lonchas	2.30	19.17	kg	https://prod-mercadona.imgix.net/images/7671e4ddcd4200449dc2821d5a32ec1c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59167/jamon-cocido-noel-lonchas-paquete	t
380	16	1	Magro de cerdo cocido Coren	2.69	11.21	kg	https://prod-mercadona.imgix.net/images/885af3abf0838fe6f72786cc4e689c6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52051/magro-cerdo-cocido-coren-lata	t
381	16	1	Maxi york Hacendado	5.95	2.98	kg	https://prod-mercadona.imgix.net/images/f0dd4aa7513f31156a6f40a0f6afa0f6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59223/maxi-york-hacendado-pieza	t
382	16	1	Lacón al horno Noel lonchas	2.10	10.50	kg	https://prod-mercadona.imgix.net/images/5e0c24eee8f4ac0955eff1911f87d34e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59216/lacon-horno-noel-lonchas-paquete	t
383	35	1	Pechuga de pollo 92% Hacendado lonchas	2.85	14.25	kg	https://prod-mercadona.imgix.net/images/487f790bff56fce10fb0570a57ee5c2e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8667/pechuga-pollo-92-hacendado-lonchas-paquete	t
384	16	1	Chopped cerdo Hacendado lonchas	1.40	5.60	kg	https://prod-mercadona.imgix.net/images/59bedc6d8dd8c9065606c681133564ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59333/chopped-cerdo-hacendado-lonchas-paquete	t
385	16	1	Chopped cocido en lata Hacendado finas lonchas	1.85	9.25	kg	https://prod-mercadona.imgix.net/images/bae0e034c73faaccdb51afee5e63e43b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16260/chopped-cocido-lata-hacendado-finas-lonchas-paquete	t
386	16	1	Chopped Hacendado	2.25	4.50	kg	https://prod-mercadona.imgix.net/images/060c5b9c8648531dd42ecb71516339e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59332/chopped-hacendado-pieza	t
387	16	1	Mortadela Hacendado lonchas	1.25	5.00	kg	https://prod-mercadona.imgix.net/images/6f1df289bb3e8d11e2ce88b802bdbf6c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59334/mortadela-hacendado-lonchas-paquete	t
388	16	1	Mortadela con aceitunas Hacendado lonchas	1.25	5.00	kg	https://prod-mercadona.imgix.net/images/8a5713abe83ad7bcc04f99512e95f903.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59335/mortadela-con-aceitunas-hacendado-lonchas-paquete	t
389	16	1	Mortadela italiana Hacendado finas lonchas	1.95	9.75	kg	https://prod-mercadona.imgix.net/images/adafd083a25a02e42dfd832a3ed35870.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14354/mortadela-italiana-hacendado-finas-lonchas-paquete	t
390	16	1	Galantina con pistacho y trufa Hacendado finas lonchas	1.85	12.33	kg	https://prod-mercadona.imgix.net/images/252dd9981d09640a18449bec4ef3e2d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16861/galantina-con-pistacho-trufa-hacendado-finas-lonchas-paquete	t
391	16	1	Mortadela de pavo Hacendado finas lonchas	1.50	7.50	kg	https://prod-mercadona.imgix.net/images/3829a2027b28e1445d76d6d4c7fcfc12.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11969/mortadela-pavo-hacendado-finas-lonchas-paquete	t
392	16	1	Mortadela de pavo con aceitunas Hacendado finas lonchas	1.50	7.50	kg	https://prod-mercadona.imgix.net/images/a0ccae0279715d862a6bd615fd53776a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11973/mortadela-pavo-con-aceitunas-hacendado-finas-lonchas-paquete	t
393	16	1	Jamón serrano Incarlopsa lonchas extrafinas	2.45	20.42	kg	https://prod-mercadona.imgix.net/images/11f69d3855987b8c43d0f810286bf1ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59151/jamon-serrano-incarlopsa-lonchas-extrafinas-paquete	t
394	16	1	Jamón serrano lonchas Incarlopsa	4.10	17.08	kg	https://prod-mercadona.imgix.net/images/8cd51bd549863aafc57f255abea88529.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59124/jamon-serrano-incarlopsa-lonchas-paquete	t
395	16	1	Jamón serrano cortado a máquina	4.75	25.00	kg	https://prod-mercadona.imgix.net/images/6d26633366edf93e61f6a53062aaa0df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15700/jamon-serrano-cortado-maquina-envasado-vacio-paquete	t
396	16	1	Jamón serrano reserva cortado a tapas	3.60	40.00	kg	https://prod-mercadona.imgix.net/images/fa034a182cb15b78ecb44918885d7c64.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58274/jamon-serrano-reserva-cortado-cuchillo-envasado-vacio-paquete	t
397	16	1	Paleta curada lonchas Paletas Marpa	2.50	20.83	kg	https://prod-mercadona.imgix.net/images/08b26cb262625ec4073ce6a5daf80175.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86404/paleta-curada-lonchas-paletas-marpa-paquete	t
398	16	1	Taco jamón curado	3.85	17.50	kg	https://prod-mercadona.imgix.net/images/fac296ac2b65148ac00bb901a4599284.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58711/taco-jamon-curado-pieza	t
399	16	1	Hueso garrón	1.16	4.00	kg	https://prod-mercadona.imgix.net/images/1f6928a432081cf7c4bb36c66a4dd305.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58307/hueso-garron-incarlopsa-pieza	t
400	16	1	Surtido de ibéricos La Hacienda del ibérico	6.50	32.50	kg	https://prod-mercadona.imgix.net/images/e2a85eb77431e734496498c30e0599b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58230/surtido-ibericos-hacienda-iberico-contiene-jamon-cebo-chorizo-cana-lomo-cebo-salchichon-paquete	t
401	16	1	Panceta salada ibérica La Hacienda del ibérico	3.60	10.00	kg	https://prod-mercadona.imgix.net/images/e8def2c47d494dda5c777a09ad68ec64.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58220/panceta-salada-iberica-hacienda-iberico-paquete	t
402	16	1	Cecina ahumada natural Embutidos Pajariel lonchas	4.20	42.00	kg	https://prod-mercadona.imgix.net/images/9fafaca032855566b0a01a80b88fba09.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59101/cecina-ahumada-natural-embutidos-pajariel-lonchas-paquete	t
403	16	1	Jamón serrano gran reserva Costa Brava sin aditivos lonchas	2.30	25.56	kg	https://prod-mercadona.imgix.net/images/397ce752ca6a9b01f9829674a3d5876a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15628/jamon-serrano-gran-reserva-costa-brava-sin-aditivos-lonchas-paquete	t
404	16	1	Paleta de cebo ibérica 50% Flor Sierra de Aracena	4.90	49.00	kg	https://prod-mercadona.imgix.net/images/2120aa6902dd61acfda4ab3f337b10b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23074/paleta-cebo-iberica-50-flor-sierra-aracena-paquete	t
405	16	1	Jamón serrano Incarlopsa	65.00	9.56	kg	https://prod-mercadona.imgix.net/images/7d4f3e6af6728a424824294cc851940a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58293/jamon-serrano-incarlopsa-pieza	t
406	16	1	Jamón de cebo ibérico Flor Sierra de Aracena	153.00	18.00	kg	https://prod-mercadona.imgix.net/images/9dbc6567f1631d3281ffbf2574d60d5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86432/jamon-cebo-iberico-flor-sierra-aracena-pieza	t
407	16	1	Jamón de bellota ibérico 100% Flor Sierra de Aracena	532.00	56.00	kg	https://prod-mercadona.imgix.net/images/35bf7341643fc4e4bfaa584fa00e5166.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58312/jamon-bellota-iberico-100-flor-sierra-aracena-pieza	t
408	16	1	Jamón de bellota ibérico 50% Flor Sierra de Aracena	414.00	46.00	kg	https://prod-mercadona.imgix.net/images/a439e6bb046cc69f3885ff84243e94b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58315/jamon-bellota-iberico-50-flor-sierra-aracena-pieza	t
409	16	1	Paleta de cebo ibérica Flor Sierra de Aracena	75.00	18.75	kg	https://prod-mercadona.imgix.net/images/9455cd8ab656d584eecc3bc52fae67f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58322/paleta-cebo-iberica-flor-sierra-aracena-pieza	t
410	16	1	Paleta de cerdo curada Incarlopsa	30.00	7.50	kg	https://prod-mercadona.imgix.net/images/59521cd2b7bc79c720a50b0990ee5eb4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19966/paleta-cerdo-curada-incarlopsa-pieza	t
411	16	1	Paleta de cerdo curada Incarlopsa	35.00	8.75	kg	https://prod-mercadona.imgix.net/images/628b9e1d730c365bac4ae7ee0a911770.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58712/paleta-cerdo-curada-incarlopsa-pieza	t
412	16	1	Sticks longaniza extra Hacendado	1.10	22.00	kg	https://prod-mercadona.imgix.net/images/045933b7238ece7f9e1a3ce781526df6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59078/sticks-longaniza-extra-hacendado-paquete	t
413	16	1	Salchichón extra pimienta Hacendado finas lonchas	1.85	18.50	kg	https://prod-mercadona.imgix.net/images/4fd8f29a0ccd03bdaddad105947bbc89.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59077/salchichon-extra-pimienta-hacendado-finas-lonchas-paquete	t
414	16	1	Salchichón de cebo ibérico cortado a máquina	3.19	29.00	kg	https://prod-mercadona.imgix.net/images/85d79ed9618f2d1128d08afc33614661.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58267/salchichon-cebo-iberico-cortado-maquina-envasado-vacio-paquete	t
415	16	1	Salchichón de bellota ibérico cortado a máquina	4.07	37.00	kg	https://prod-mercadona.imgix.net/images/3869e45491c5ebf1848c319eb2e8699c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58489/salchichon-bellota-iberico-cortado-maquina-envasado-vacio-paquete	t
416	16	1	Longaniza de pavo Imperial extra Hacendado	4.20	17.87	kg	https://prod-mercadona.imgix.net/images/4093763502649349ae957fce8993e19c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/55136/longaniza-pavo-imperial-extra-hacendado-pieza	t
417	16	1	Salchichón cular ibérico extra La Hacienda del ibérico	9.50	19.00	kg	https://prod-mercadona.imgix.net/images/27c7d31a62690fc18656d9b229685f90.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58159/salchichon-cular-iberico-extra-hacienda-iberico-pieza	t
418	16	1	Mini salchichón ibérico extra La Hacienda del ibérico	2.65	13.25	kg	https://prod-mercadona.imgix.net/images/903ab8d040b24e8e6418557225ab8196.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58248/mini-salchichon-iberico-extra-hacienda-iberico-pieza	t
419	16	1	Salchichón cular ibérico extra La Hacienda del ibérico	15.58	19.00	kg	https://prod-mercadona.imgix.net/images/f390189ea730855f5eb6358635fbe104.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58266/salchichon-cular-iberico-extra-hacienda-iberico-pieza	t
420	16	1	Salchichón de bellota ibérico La Hacienda del Ibérico	27.00	27.00	kg	https://prod-mercadona.imgix.net/images/420d821f390df93d3dfbc9c4c0ab99c6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58488/salchichon-bellota-iberico-hacienda-iberico-pieza	t
421	16	1	Sticks de salami extra Hacendado	1.10	22.00	kg	https://prod-mercadona.imgix.net/images/bd6ce2b573aca66394975375841918e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15530/sticks-salami-extra-hacendado-paquete	t
422	16	1	Pepperoni en lonchas Hacendado	1.60	21.33	kg	https://prod-mercadona.imgix.net/images/93aa87d3317ec621febadb831d1b56ca.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60964/pepperoni-lonchas-hacendado-paquete	t
423	16	1	Salami extra pimienta Hacendado finas lonchas	1.75	17.50	kg	https://prod-mercadona.imgix.net/images/da27f66328ca7a70582a90ce0cca55e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8553/salami-extra-pimienta-hacendado-finas-lonchas-paquete	t
424	16	1	Chorizo picante extra Hacendado	2.49	8.89	kg	https://prod-mercadona.imgix.net/images/cad7876f3efdee02d2a54ff0e5eea423.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/54210/chorizo-picante-extra-hacendado-pieza	t
425	16	1	Chorizo extra pimienta Hacendado finas lonchas	1.85	18.50	kg	https://prod-mercadona.imgix.net/images/81f1695cec923c15abc720e678eb1816.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59080/chorizo-extra-pimienta-hacendado-finas-lonchas-paquete	t
426	16	1	Chorizo de cebo ibérico cortado a máquina	3.19	29.00	kg	https://prod-mercadona.imgix.net/images/f3eca271e76cd582f4b99407735bbd7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58265/chorizo-cebo-iberico-cortado-maquina-envasado-vacio-paquete	t
427	16	1	Chorizo de bellota ibérico cortado a máquina	4.07	37.00	kg	https://prod-mercadona.imgix.net/images/7fa26055a72de04ac0ad047d3c592817.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58271/chorizo-bellota-iberico-cortado-maquina-envasado-vacio-paquete	t
428	16	1	Chorizo dulce extra Hacendado	2.49	8.89	kg	https://prod-mercadona.imgix.net/images/f2d96c0aab16d620c294c8121ddaa3b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/54209/chorizo-dulce-extra-hacendado-pieza	t
429	16	1	Mini chorizo ibérico extra La Hacienda del ibérico	2.65	13.25	kg	https://prod-mercadona.imgix.net/images/dc134ad77e68f1b9e89b4c2ce4f35ad4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58247/mini-chorizo-iberico-extra-hacienda-iberico-pieza	t
430	16	1	Chorizo cular ibérico extra La Hacienda del ibérico	9.50	19.00	kg	https://prod-mercadona.imgix.net/images/0d34bb57bf8937b93a13f1738056ec2a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58160/chorizo-cular-iberico-extra-hacienda-iberico-pieza	t
431	16	1	Chorizo cular ibérico extra La Hacienda del ibérico	18.62	19.00	kg	https://prod-mercadona.imgix.net/images/c8fc9cc072021fd94b83d1115b646245.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58264/chorizo-cular-iberico-extra-hacienda-iberico-pieza	t
1607	13	1	Súper Cuquis	1.10	30.56	kg	https://prod-mercadona.imgix.net/images/187d1100d40ecff4507954421d03ee86.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8915/super-cuquis	t
432	16	1	Chorizo de bellota ibérico cular Covap	27.00	27.00	kg	https://prod-mercadona.imgix.net/images/0067da30f4a35ff1f4b9775674e1a518.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58270/chorizo-bellota-iberico-cular-covap-pieza	t
433	16	1	Lomo de cebo ibérico cortado a máquina	6.33	57.50	kg	https://prod-mercadona.imgix.net/images/636ae4407fb5ee589939e62acb3ba6b7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16179/lomo-cebo-iberico-cortado-maquina-envasado-vacio-paquete	t
434	16	1	Surtido de ibéricos La Hacienda del ibérico	6.50	32.50	kg	https://prod-mercadona.imgix.net/images/e2a85eb77431e734496498c30e0599b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58230/surtido-ibericos-hacienda-iberico-contiene-jamon-cebo-chorizo-cana-lomo-cebo-salchichon-paquete	t
435	35	1	Lomo Hacendado	7.00	17.50	kg	https://prod-mercadona.imgix.net/images/7147e883ae9a96d0f38020aca77e1dd0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/54053/lomo-hacendado-pieza	t
436	16	1	Bacón ahumado La Selva lonchas	2.30	10.22	kg	https://prod-mercadona.imgix.net/images/d457d5a7acd285343abe503dad001827.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21628/bacon-ahumado-selva-lonchas-paquete	t
437	16	1	Bacón Oscar Mayer lonchas	2.35	15.67	kg	https://prod-mercadona.imgix.net/images/bd977d11a572cea8180647f16adfffdf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53500/bacon-oscar-mayer-lonchas-paquete	t
438	16	1	Bacón ahumado sin corteza La Selva	2.89	9.65	kg	https://prod-mercadona.imgix.net/images/232a272ef1e45b6cb345adcd9b999f35.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/59160/bacon-ahumado-sin-corteza-selva-pieza	t
439	16	1	Panceta salada ibérica La Hacienda del ibérico	3.60	10.00	kg	https://prod-mercadona.imgix.net/images/e8def2c47d494dda5c777a09ad68ec64.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/58220/panceta-salada-iberica-hacienda-iberico-paquete	t
440	16	1	Panceta oreada	3.47	13.10	kg	https://prod-mercadona.imgix.net/images/113b953f32f2eb1ebd94331e39739a2b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1894/panceta-oreada-paquete	t
441	16	1	Panceta curada sin corteza La Selva lonchas	2.65	13.25	kg	https://prod-mercadona.imgix.net/images/e36d77fec872a6ca1491b09b9531dea7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29606/panceta-curada-sin-corteza-selva-lonchas-paquete	t
442	16	1	Salchichas cocidas hot dog bocadillo Oscar Mayer Classic de pollo y cerdo sabor ahumado	1.85	6.73	kg	https://prod-mercadona.imgix.net/images/a6b6e3f0bd9a9ca915e2e3c248aceea7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53015/salchichas-cocidas-hot-dog-bocadillo-oscar-mayer-classic-pollo-cerdo-sabor-ahumado-paquete	t
443	16	1	Salchichas cocidas Frankfurt La Selva	2.40	5.22	kg	https://prod-mercadona.imgix.net/images/d56e302573078dd6ae6af008a0fbf549.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53041/salchichas-cocidas-frankfurt-selva-tarro	t
444	16	1	Salchichas cocidas de cerdo Hacendado estilo parrillero	2.60	8.67	kg	https://prod-mercadona.imgix.net/images/a4422aeb427938f9309efa518752f4e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11516/salchichas-cocidas-estilo-parrillero-hacendado-cerdo-paquete	t
445	17	1	Queso untar suave de vaca Hacendado	1.45	4.83	kg	https://prod-mercadona.imgix.net/images/18901ca537c8de2c4c77f69baf4ee430.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51203/queso-untar-suave-vaca-hacendado-tarrina	t
446	17	1	Queso untar original Philadelphia	2.30	8.52	kg	https://prod-mercadona.imgix.net/images/1489ec9201bb07df10b421e1598217e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51073/queso-untar-original-philadelphia-tarrina	t
447	17	1	Queso untar light Philadelphia	2.30	8.52	kg	https://prod-mercadona.imgix.net/images/1a7ff652c2508d92c72cd6058c70a29a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51079/queso-untar-light-philadelphia-tarrina	t
448	17	1	Queso untar light de vaca Hacendado	1.45	4.83	kg	https://prod-mercadona.imgix.net/images/1d2818584e9062155452c615168af0c1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51223/queso-untar-light-vaca-hacendado-tarrina	t
449	17	1	Crema de queso camembert Hacendado	1.80	12.00	kg	https://prod-mercadona.imgix.net/images/7c54037f0113375790b2d78b3746c75b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51181/crema-queso-camembert-hacendado-tarrina	t
450	17	1	Mousse de queso de vaca con ajo y finas hierbas Hacendado	1.65	11.00	kg	https://prod-mercadona.imgix.net/images/020c63a196138f9f1209fd8cc6845f79.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51167/mousse-queso-vaca-con-ajo-finas-hierbas-hacendado-tarrina	t
451	17	1	Queso untar de vaca con finas hierbas Hacendado	1.85	9.25	kg	https://prod-mercadona.imgix.net/images/c4e1e4b4bde56c545484ee43f051e8d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51208/queso-untar-vaca-con-finas-hierbas-hacendado-tarrina	t
452	17	1	Queso untar con queso azul de vaca Hacendado	1.90	9.50	kg	https://prod-mercadona.imgix.net/images/c9d50bec731f012ba2eca8db98d90442.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51211/queso-untar-con-queso-azul-vaca-hacendado-tarrina	t
453	17	1	Queso untar sin lactosa de vaca Hacendado	1.90	9.50	kg	https://prod-mercadona.imgix.net/images/7cf5aa8500e1805409a2362c79012fdf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51212/queso-untar-sin-lactosa-vaca-hacendado-tarrina	t
454	17	1	Crema de queso viejo tostado mezcla Hacendado	1.74	11.60	kg	https://prod-mercadona.imgix.net/images/1aa1c7b76f5a83e54d74d4a97030c15c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22780/crema-queso-viejo-tostado-mezcla-hacendado-tarrina	t
455	17	1	Mozzarella fresca de vaca Hacendado	0.90	3.60	kg	https://prod-mercadona.imgix.net/images/82991bcf404ead6164e1b3b4ad79eeea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51050/mozzarella-fresca-vaca-hacendado-paquete	t
456	17	1	Queso feta mezcla Hacendado en dados	2.40	6.49	kg	https://prod-mercadona.imgix.net/images/32a48eaa259c9728b5f4e60333eb2fea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51197/queso-feta-mezcla-hacendado-dados-tarrina	t
457	17	1	Mozzarella fresca de vaca Hacendado en perlas	1.90	6.33	kg	https://prod-mercadona.imgix.net/images/d603407549e943bb79d0b03d3c8147c8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51052/mozzarella-fresca-vaca-hacendado-perlas-tarrina	t
458	17	1	Queso fresco de cabra Hacendado	2.90	11.60	kg	https://prod-mercadona.imgix.net/images/c816bf3bb186167d5b835c4654c165fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51194/queso-fresco-cabra-hacendado-tarrina	t
459	17	1	Queso fresco mascarpone de vaca Hacendado	2.75	11.00	kg	https://prod-mercadona.imgix.net/images/eec701a15d0cb0fdda6f4fcd32dabcbb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51072/queso-fresco-mascarpone-vaca-hacendado-tarrina	t
460	17	1	Queso fresco de vaca Hacendado	1.70	6.80	kg	https://prod-mercadona.imgix.net/images/b06c07419501f3ff1f89dac54ad5fb9a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51191/queso-fresco-vaca-hacendado-tarrina	t
461	17	1	Mozzarella fresca di bufala campana Hacendado	1.85	6.61	kg	https://prod-mercadona.imgix.net/images/414bf4e87775a2c715a1f2cb1182402f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51201/mozzarella-fresca-di-bufala-campana-hacendado-tarrina	t
462	17	1	Queso fresco light de vaca Hacendado	2.20	8.80	kg	https://prod-mercadona.imgix.net/images/a4b60f9c10fe0184d26f319dc57b7afc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51192/queso-fresco-light-vaca-hacendado-tarrina	t
463	17	1	Requesón mezcla Hacendado	1.00	5.00	kg	https://prod-mercadona.imgix.net/images/a0caeed9828e9be37906b74458bc830c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51012/requeson-mezcla-montesinos-tarrina	t
464	17	1	Queso ricotta mezcla Hacendado	1.60	8.00	kg	https://prod-mercadona.imgix.net/images/d23d75db49d283dc3c92f3ca9ff8789f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51228/queso-ricotta-mezcla-hacendado-tarrina	t
465	17	1	Mozzarella fresca light de vaca Hacendado	1.00	4.00	kg	https://prod-mercadona.imgix.net/images/bdbe0563030e7e0f61365d18e467bd41.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51230/mozzarella-fresca-light-vaca-hacendado-paquete	t
466	17	1	Burrata fresca Hacendado	2.30	9.20	kg	https://prod-mercadona.imgix.net/images/9b525ff0441a89b64ba570dd20f08f70.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51218/burrata-fresca-hacendado-tarrina	t
467	17	1	Queso fresco cottage semidesnatado de vaca Hacendado	1.35	6.75	kg	https://prod-mercadona.imgix.net/images/ccf937c7331c2fb05567eda981b55fbc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60963/queso-fresco-cottage-semidesnatado-vaca-hacendado-tarrina	t
468	17	1	Queso fresco de vaca y cabra Hacendado	2.35	9.40	kg	https://prod-mercadona.imgix.net/images/d97c10bcf0afa7fbbf2ef818d6579fa0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51200/queso-fresco-vaca-cabra-hacendado-tarrina	t
469	17	1	Queso fresco de vaca y cabra Hacendado	4.20	8.40	kg	https://prod-mercadona.imgix.net/images/0b21beadc8ae36f402ec88f7bcd994f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51226/queso-fresco-vaca-cabra-hacendado-tarrina	t
470	17	1	Queso rulo de cabra Hacendado	2.55	12.75	kg	https://prod-mercadona.imgix.net/images/5e1814a3522c87ad5e0a3d748278037c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50021/queso-rulo-cabra-hacendado-paquete	t
471	17	1	Queso roquefort  de oveja Hacendado	1.95	19.50	kg	https://prod-mercadona.imgix.net/images/8c56d52889b3953d268c5b50730a071b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86276/queso-roquefort-oveja-hacendado-pieza	t
472	17	1	Queso camembert de vaca Marcillat	2.00	8.33	kg	https://prod-mercadona.imgix.net/images/f0a656c1468da1084f89081ef070c1bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51621/queso-camembert-vaca-marcillat-caja	t
473	17	1	Queso azul de vaca Hacendado	2.40	13.33	kg	https://prod-mercadona.imgix.net/images/b4c1536ca2733eea0acbaca8ac4f6810.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51627/queso-azul-vaca-hacendado-pieza	t
474	17	1	Queso rulo con piña y almendra Liptana	1.50	15.00	kg	https://prod-mercadona.imgix.net/images/29f74b4eec7a17d711864fd9462bef29.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51619/queso-rulo-con-pina-almendra-liptana-bandeja	t
475	17	1	Queso brie marcillat de vaca Plaisir de Roy	1.65	8.25	kg	https://prod-mercadona.imgix.net/images/c2446828dd55519f7d18b21249e5e38c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50619/queso-brie-marcillat-vaca-plaisir-roy-pieza	t
476	17	1	Queso gorgonzola de vaca Hacendado	2.09	12.30	kg	https://prod-mercadona.imgix.net/images/351bb005af78cbd5d4cbae3adc36ba24.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50613/queso-gorgonzola-vaca-hacendado-pieza	t
477	17	1	Queso provolone de vaca Hacendado	2.60	13.00	kg	https://prod-mercadona.imgix.net/images/fa5a68a5090c9a809f5b42c4a4e5af43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4848/queso-provolone-vaca-hacendado-paquete	t
478	17	1	Queso precortado de cabra Hacendado	2.75	13.75	kg	https://prod-mercadona.imgix.net/images/fc820e556adafef4bfb5b53e1da02caf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4929/queso-precortado-cabra-hacendado-paquete	t
479	17	1	Queso curado mezcla Hacendado cortado en cuñitas	4.69	14.20	kg	https://prod-mercadona.imgix.net/images/bebb4ccbd7718c152e3212a4abeec174.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50966/queso-curado-mezcla-hacendado-cortado-cunitas-pieza	t
480	17	1	Queso curado mezcla Hacendado	4.67	11.40	kg	https://prod-mercadona.imgix.net/images/17ca4b46343fc3ef8c6a2efdb7be9c53.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50965/queso-curado-mezcla-hacendado-pieza	t
481	17	1	Queso grana padano Zanetti	3.77	16.40	kg	https://prod-mercadona.imgix.net/images/418183dd6b420070ef1dffb28b2d572b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50008/queso-grana-padano-zanetti-pieza	t
482	17	1	Queso viejo tostado mezcla Hacendado	20.94	13.42	kg	https://prod-mercadona.imgix.net/images/252e2c9dddda3d3aa043deccc1695996.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50985/queso-viejo-tostado-mezcla-hacendado-pieza	t
483	17	1	Queso viejo tostado mezcla Hacendado	5.59	14.15	kg	https://prod-mercadona.imgix.net/images/9124c0261e7d38fcdcd6c5f0392c1eea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50971/queso-viejo-tostado-mezcla-hacendado-pieza	t
484	17	1	Queso viejo tostado mezcla Hacendado cortado en cuñitas	5.42	16.95	kg	https://prod-mercadona.imgix.net/images/450922545867de9834578a57c1fc23f2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7966/queso-viejo-tostado-mezcla-hacendado-cortado-cunitas-pieza	t
485	17	1	Queso curado y cheddar Hacendado en dados	1.15	9.20	kg	https://prod-mercadona.imgix.net/images/7219aeaaf255a484b871a06e9bbe1f85.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51111/queso-curado-cheddar-hacendado-dados-paquete	t
486	17	1	Queso viejo de oveja Hacendado	19.25	12.50	kg	https://prod-mercadona.imgix.net/images/81019a97fe8588ab08f3d475169fb8c8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50984/queso-viejo-oveja-hacendado-pieza	t
487	17	1	Queso añejo fuerte de oveja Hacendado	6.04	18.30	kg	https://prod-mercadona.imgix.net/images/7c345b7547f9405537d744b1fcd5a6cd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50975/queso-anejo-fuerte-oveja-hacendado-pieza	t
488	17	1	Queso añejo fuerte de oveja Hacendado cortado en cuñitas	6.96	21.10	kg	https://prod-mercadona.imgix.net/images/0aba58f8ef8b00c750fbae4535c330b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11680/queso-anejo-fuerte-oveja-hacendado-cortado-cunitas-pieza	t
489	17	1	Tabla de quesos nacionales Hacendado	5.00	20.83	kg	https://prod-mercadona.imgix.net/images/34622efd99048d8c8fc92fcad7f0b0c8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50999/tabla-quesos-nacionales-hacendado-bandeja	t
490	17	1	Queso viejo ahumado de oveja Hacendado cortado en cuñitas	6.83	20.70	kg	https://prod-mercadona.imgix.net/images/399ca16259a9262224a9755bd9b92c41.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11671/queso-viejo-ahumado-oveja-hacendado-cortado-cunitas-pieza	t
491	17	1	Queso Arzúa-Ulloa de vaca Punteiro	7.45	9.55	kg	https://prod-mercadona.imgix.net/images/ed685abd82649cd657383bbab5d326d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50929/queso-arzua-ulloa-vaca-punteiro-pieza	t
492	17	1	Queso curado cheddar Hacendado	3.15	10.50	kg	https://prod-mercadona.imgix.net/images/c536cb9dab18824330d0a9958c08dd37.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51630/queso-curado-cheddar-hacendado-pieza	t
493	17	1	Queso añejo de oveja al romero Hacendado	5.18	19.20	kg	https://prod-mercadona.imgix.net/images/823418b426f436db98d2da0428e973b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50959/queso-anejo-oveja-romero-hacendado-pieza	t
494	17	1	Queso curado DOP manchego de oveja Hacendado	5.83	20.10	kg	https://prod-mercadona.imgix.net/images/e802c7400b8db1203d22e5c39efb0e5e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50589/queso-curado-dop-manchego-oveja-hacendado-pieza	t
495	17	1	Queso grana padano Hacendado en escamas	2.40	24.00	kg	https://prod-mercadona.imgix.net/images/c91798065a7ad0354f5ae9e86c710abd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23037/queso-grana-padano-hacendado-escamas-bote	t
496	17	1	Queso añejo tostado mezcla Hacendado	6.19	16.74	kg	https://prod-mercadona.imgix.net/images/c427745ef5eb7029152c476a811d1433.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50952/queso-anejo-tostado-mezcla-hacendado-pieza	t
497	17	1	Queso viejo de cabra Hacendado	5.91	19.70	kg	https://prod-mercadona.imgix.net/images/d34e85b1a34fbe6f3f08edf58799d352.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86127/queso-viejo-cabra-hacendado-pieza	t
498	17	1	Queso curado mezcla madurado en madera Hacendado	3.73	14.90	kg	https://prod-mercadona.imgix.net/images/8c86242c05277d1c509132e685053f0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50994/queso-viejo-madurado-cava-mezcla-hacendado-pieza	t
499	17	1	Queso añejo ibérico mezcla Hacendado cortado en cuñitas	6.08	19.00	kg	https://prod-mercadona.imgix.net/images/489448f63b8a9fa323a1e3d285be58cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5548/queso-anejo-iberico-mezcla-hacendado-cortado-cunitas-pieza	t
500	17	1	Queso curado mezcla con trufa Hacendado	6.04	22.36	kg	https://prod-mercadona.imgix.net/images/cdba4ef5f02f0cbfbdc95300f7e1280e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4883/queso-curado-mezcla-con-trufa-hacendado-pieza	t
501	17	1	Queso curado mezcla afrutado Hacendado cortado en cuñitas	4.83	14.65	kg	https://prod-mercadona.imgix.net/images/556f4a82e81c1dbd72c3e8b52d1421b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11682/queso-curado-mezcla-afrutado-hacendado-cortado-cunitas-pieza	t
502	17	1	Queso semicurado mezcla Hacendado	14.49	9.41	kg	https://prod-mercadona.imgix.net/images/226430ffd0927fc4ab3c0f93831b5fe6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50946/queso-semicurado-mezcla-hacendado-pieza	t
503	17	1	Queso semicurado mezcla Hacendado	4.14	9.85	kg	https://prod-mercadona.imgix.net/images/15998e3937eafce26125047dde97e3ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50943/queso-semicurado-mezcla-hacendado-pieza	t
504	17	1	Queso semicurado mezcla Hacendado cortado en cuñitas	4.30	12.65	kg	https://prod-mercadona.imgix.net/images/0e7fc066a86aefbf2f47ae394c23d3cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50944/queso-semicurado-mezcla-hacendado-cortado-cunitas-pieza	t
505	17	1	Queso semicurado de cabra Hacendado	4.54	15.15	kg	https://prod-mercadona.imgix.net/images/1c14b15aa6d7743e1e8d30907d8a8ea9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50942/queso-semicurado-cabra-hacendado-pieza	t
506	17	1	Queso semicurado sin lactosa mezcla Hacendado	5.63	13.10	kg	https://prod-mercadona.imgix.net/images/72d74e624439e4a4cff9da77eea90c6b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50941/queso-semicurado-sin-lactosa-mezcla-hacendado-pieza	t
507	17	1	Queso semicurado de oveja Hacendado cortado en cuñitas	4.56	16.30	kg	https://prod-mercadona.imgix.net/images/2a59669adcc4eec99eca527742c1cd02.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11672/queso-semicurado-oveja-hacendado-cortado-cunitas-pieza	t
508	17	1	Queso emmental de vaca Hacendado	3.00	8.57	kg	https://prod-mercadona.imgix.net/images/59f451f75ce0ef7b7d82bc610d115ad0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23561/queso-emmental-vaca-hacendado-pieza	t
509	17	1	Queso tierno de vaca Hacendado cortado en cuñitas	2.62	8.20	kg	https://prod-mercadona.imgix.net/images/186dfb670bf13288034301d6a83b155f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50916/queso-tierno-vaca-hacendado-cortado-cunitas-pieza	t
510	17	1	Queso tierno mezcla Hacendado	10.61	8.70	kg	https://prod-mercadona.imgix.net/images/9379089121c56177044af4e3763129be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50919/queso-tierno-mezcla-hacendado-pieza	t
511	17	1	Queso tierno mezcla Hacendado	3.13	8.95	kg	https://prod-mercadona.imgix.net/images/78c744ea97cd0cf9311b659bd58a220d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50917/queso-tierno-mezcla-hacendado-pieza	t
512	17	1	Queso tierno mezcla Hacendado cortado en cuñitas	3.82	11.75	kg	https://prod-mercadona.imgix.net/images/b4a7a056f264b59418bf6602426ede49.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50918/queso-tierno-mezcla-hacendado-cortado-cunitas-pieza	t
513	17	1	Queso tierno bajo en sal mezcla Hacendado	3.87	11.05	kg	https://prod-mercadona.imgix.net/images/82bed1f7916ed6b6cefbd53fd44cd326.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50915/queso-tierno-bajo-sal-mezcla-hacendado-pieza	t
514	17	1	Queso tierno maasdam de vaca Holland Corona	3.30	8.25	kg	https://prod-mercadona.imgix.net/images/4c4553f602e70ffccb2fb128c705b2ae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50480/queso-tierno-maasdam-vaca-holland-corona-pieza	t
515	17	1	Queso tierno bola edam de vaca Holland Corona	3.60	7.91	kg	https://prod-mercadona.imgix.net/images/c0a573a5531aa0148e69817a4fb19640.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50483/queso-tierno-bola-edam-vaca-holland-corona-pieza	t
516	17	1	Queso lonchas cremoso de vaca Hacendado	2.95	9.83	kg	https://prod-mercadona.imgix.net/images/25fe53131f87dfeba20008ce868de29c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50545/queso-lonchas-cremoso-havarti-vaca-hacendado-paquete	t
517	17	1	Queso lonchas tierno mezcla Entrepinares	2.49	9.95	kg	https://prod-mercadona.imgix.net/images/64c70ea48d0a710780a67971c70f7e54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50385/queso-lonchas-tierno-mezcla-entrepinares-paquete	t
518	17	1	Queso lonchas cremoso light de vaca Hacendado	3.00	10.00	kg	https://prod-mercadona.imgix.net/images/bf40cbb31507eaf48225f29f65c325b9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50546/queso-lonchas-cremoso-light-havarti-vaca-hacendado-paquete	t
519	17	1	Queso lonchas semicurado mezcla Entrepinares	2.57	12.25	kg	https://prod-mercadona.imgix.net/images/717ff26ca49d56dd956fad414961c020.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50148/queso-lonchas-semicurado-mezcla-entrepinares-paquete	t
520	17	1	Queso lonchas fundido sándwich mezcla Hacendado	1.25	6.25	kg	https://prod-mercadona.imgix.net/images/466833190111f32b6901258f9ebe4265.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50371/queso-lonchas-fundido-sandwich-mezcla-hacendado-paquete	t
521	17	1	Queso lonchas gouda de vaca Hacendado	2.15	7.17	kg	https://prod-mercadona.imgix.net/images/3c0bd3e0e3803f38df0677d86b8c8b43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50654/queso-lonchas-gouda-vaca-hacendado-paquete	t
522	17	1	Queso lonchas de cabra Hacendado	3.41	15.50	kg	https://prod-mercadona.imgix.net/images/83876b302b8f4bafde5749db67fdfc0b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50153/queso-lonchas-cabra-entrepinares-paquete	t
523	17	1	Queso lonchas tierno de vaca Entrepinares	2.55	8.50	kg	https://prod-mercadona.imgix.net/images/7fd31869c4e06d13baac0bdc8970e2e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50543/queso-lonchas-tierno-vaca-entrepinares-paquete	t
524	17	1	Queso lonchas fundido suave mezcla Hacendado	2.35	4.23	kg	https://prod-mercadona.imgix.net/images/d6d49f98b5ad0ebd7d7604ab48e47a8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51182/queso-lonchas-fundido-suave-mezcla-hacendado-paquete	t
525	17	1	Queso lonchas edam de vaca Holland Corona	2.10	7.00	kg	https://prod-mercadona.imgix.net/images/f30a5f14122dc2e4ede36df9dc80a881.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50459/queso-lonchas-edam-vaca-holland-corona-paquete	t
526	17	1	Queso lonchas mozzarella de vaca Hacendado	1.80	9.00	kg	https://prod-mercadona.imgix.net/images/4d983df1f2f673db71d7a5b53fa3cc7b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51126/queso-lonchas-mozzarella-vaca-hacendado-paquete	t
527	17	1	Queso lonchas cheddar de vaca Hacendado	1.85	9.25	kg	https://prod-mercadona.imgix.net/images/c7817f8a9f30b9b439897d8007825ca7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8180/queso-lonchas-cheddar-vaca-hacendado-paquete	t
528	17	1	Queso lonchas emmental de vaca Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/875611713160608d482a7856b3324512.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60710/queso-lonchas-emmental-vaca-hacendado-paquete	t
529	17	1	Queso lonchas sin lactosa de vaca Hacendado	2.60	13.00	kg	https://prod-mercadona.imgix.net/images/41e0218522470559822527317e7c5568.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12846/queso-lonchas-sin-lactosa-vaca-hacendado-paquete	t
530	17	1	Queso lonchas de oveja Entrepinares	2.89	13.75	kg	https://prod-mercadona.imgix.net/images/42c41d47391b7f165e9c19f13a2ab40d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50151/queso-lonchas-oveja-entrepinares-paquete	t
531	17	1	Queso lonchas fundido burger mezcla Hacendado	1.90	6.33	kg	https://prod-mercadona.imgix.net/images/7bd7b58ec4f47a62db26456bdf66ba1a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51198/queso-lonchas-fundido-burger-mezcla-hacendado-paquete	t
532	17	1	Queso rallado emmental gratinar Hacendado	1.65	8.25	kg	https://prod-mercadona.imgix.net/images/bfc088bcd08f0dc6e421323e51b5d9fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22216/queso-rallado-emmental-gratinar-hacendado-paquete	t
533	17	1	Queso rallado mozzarella pizza-Roma de vaca Hacendado	1.65	8.25	kg	https://prod-mercadona.imgix.net/images/78c2ab6019d6ae5ef8934ee4a10cef80.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51110/queso-rallado-mozzarella-pizza-roma-vaca-hacendado-paquete	t
534	17	1	Queso en polvo especial pasta mezcla Hacendado	1.25	8.33	kg	https://prod-mercadona.imgix.net/images/80ee5b96b8090f21c040774ba4f5b2f0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51151/queso-polvo-especial-pasta-mezcla-hacendado-paquete	t
535	17	1	Queso rallado 4 quesos Hacendado	1.85	9.25	kg	https://prod-mercadona.imgix.net/images/8358f4ee3c96a19e215c46bfa39ec0d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21581/queso-rallado-4-quesos-hacendado-paquete	t
536	17	1	Queso en polvo grana padano Hacendado	1.70	17.00	kg	https://prod-mercadona.imgix.net/images/d053faaab49fc2cde99875dffb3eaee9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51146/queso-polvo-grana-padano-hacendado-paquete	t
537	17	1	Queso rallado especial fundir mezcla Hacendado	2.20	5.50	kg	https://prod-mercadona.imgix.net/images/aa127a068121be5a0a5dfd543ddb2fa0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23622/queso-rallado-especial-fundir-mezcla-hacendado-paquete	t
538	17	1	Queso rallado especial fundir mezcla Hacendado	1.25	6.25	kg	https://prod-mercadona.imgix.net/images/1ddf478e8a82a6c7386e9aea1b442b33.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23621/queso-rallado-especial-fundir-mezcla-hacendado-paquete	t
539	17	1	Queso rallado sin lactosa de vaca Hacendado	1.80	12.00	kg	https://prod-mercadona.imgix.net/images/1789e099c343b7a0eda70dd1a38a9c63.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51236/queso-rallado-sin-lactosa-vaca-hacendado-paquete	t
540	17	1	Queso en porciones Hacendado	2.10	5.60	kg	https://prod-mercadona.imgix.net/images/62e21e9aeaf9f20b7c81fc2ff229c976.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52405/queso-porciones-hacendado-caja	t
541	17	1	Queso en porciones light Hacendado	1.60	6.40	kg	https://prod-mercadona.imgix.net/images/66ba7ab8e03fba0930d149762ec484a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51232/queso-porciones-light-hacendado-caja	t
542	17	1	Queso en porciones mini Babybel	3.90	24.38	kg	https://prod-mercadona.imgix.net/images/860d756d2962ad4e593a3c2b98e253dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51504/queso-porciones-mini-babybel-malla	t
543	17	1	Queso fundido con palitos La vaca que ríe	2.59	18.50	kg	https://prod-mercadona.imgix.net/images/7027ead26435570257e96d68796759e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/51068/queso-fundido-con-palitos-vaca-rie-caja	t
544	16	1	Paté de cerdo con finas hierbas Hacendado	1.10	6.88	kg	https://prod-mercadona.imgix.net/images/1380201b6dba332c30b7681a82dc0c95.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52307/pate-cerdo-con-finas-hierbas-hacendado-tarro	t
545	16	1	Paté de cerdo con pimienta Hacendado	1.10	6.88	kg	https://prod-mercadona.imgix.net/images/0070b073daac1a776c0c1a9f9fda8ee4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52311/pate-cerdo-con-pimienta-hacendado-tarro	t
546	16	1	Paté de cerdo con pimienta verde Hacendado	1.45	14.50	kg	https://prod-mercadona.imgix.net/images/364d84fe2c81334f69afce580971cc9c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52099/pate-cerdo-con-pimienta-verde-hacendado-bandeja	t
547	16	1	Paté de cerdo con finas hierbas Hacendado	1.45	14.50	kg	https://prod-mercadona.imgix.net/images/2056328c985360dbce89da97d1ef27ac.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52100/pate-cerdo-con-finas-hierbas-hacendado-bandeja	t
548	16	1	Paté de salmón Hacendado	1.10	6.88	kg	https://prod-mercadona.imgix.net/images/23f1824d81823378bd3eb3adc85d9320.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52336/pate-salmon-hacendado-tarro	t
549	16	1	Paté de jamón Hacendado	1.10	6.88	kg	https://prod-mercadona.imgix.net/images/dfd26106c1c279737f5fcd848590c226.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52335/pate-jamon-hacendado-tarro	t
550	16	1	Paté de anchoa Hacendado	1.65	10.31	kg	https://prod-mercadona.imgix.net/images/a76cb96ad02e382dc7cbf1035dc9220c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52337/pate-anchoa-hacendado-tarro	t
551	16	1	Paté de cerdo y pollo con trufa y arándanos Hacendado	1.85	18.50	kg	https://prod-mercadona.imgix.net/images/a934d649a0d255eed26810f4804eb6d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52157/pate-cerdo-pollo-con-trufa-arandanos-hacendado-paquete	t
552	16	1	Mousse de pato Hacendado	1.90	19.00	kg	https://prod-mercadona.imgix.net/images/22479f2754a9f7d930d6d6b3243c0d15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52167/mousse-pato-hacendado-bandeja	t
553	16	1	Foie gras entero de pato Hacendado	8.30	83.00	kg	https://prod-mercadona.imgix.net/images/837216cbb60f3fb578ed8dd5e95c9e3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52170/foie-gras-entero-pato-hacendado-paquete	t
554	16	1	Bloc foie gras de pato Hacendado	5.25	52.50	kg	https://prod-mercadona.imgix.net/images/6189ab3ce8f96d81411ced070846f9c5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52171/bloc-foie-gras-pato-hacendado-paquete	t
555	16	1	Paté de pollo asado Hacendado	1.10	6.88	kg	https://prod-mercadona.imgix.net/images/1a115f6c94fd3b3e0d590d0e3748dddd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23596/pate-pollo-asado-hacendado-tarro	t
556	16	1	Paté de perdiz Real Carolina	3.40	20.00	kg	https://prod-mercadona.imgix.net/images/f0cb8fd8367654c2dec240d037b7875a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52049/pate-perdiz-real-carolina-lata	t
557	16	1	Paté de sardina Hacendado	0.95	14.62	kg	https://prod-mercadona.imgix.net/images/569eb7281f465a03f490928222d4ae89.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52343/pate-sardina-hacendado-lata	t
558	16	1	Crema para untar de jamón york Iberitos	2.40	9.60	kg	https://prod-mercadona.imgix.net/images/c823869bac90ccecc14354fb3fac9dca.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11684/crema-untar-jamon-york-iberitos-lata	t
559	16	1	Sobrasada selecta L'Illa especialidades	2.05	8.20	kg	https://prod-mercadona.imgix.net/images/bad94f7dc3e84c4c720ee93d35217629.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53116/sobrasada-selecta-lilla-especialidades-tarrina	t
560	16	1	Sobrasada ibérica L'Illa especialidades	2.50	10.00	kg	https://prod-mercadona.imgix.net/images/c54460fb508308e81afca2de0ed1743c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/53122/sobrasada-iberica-lilla-especialidades-tarrina	t
561	23	1	Baguette sin gluten	1.95	11.14	kg	https://prod-mercadona.imgix.net/images/30fba96b365c6c3c4e687aef790c21eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82753/baguette-sin-gluten-paquete	t
562	23	1	5 Barras de pan 51% integral	1.35	2.16	kg	https://prod-mercadona.imgix.net/images/145fcd2de95532d134a4a0078da2af2d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83452/5-barras-pan-51-integral-pack-5	t
563	23	1	6 Panes de leche 3%	1.51	3.15	kg	https://prod-mercadona.imgix.net/images/40e7eb342245e8ac03222b69274cebb2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14431/6-panes-leche-3-bolsa	t
564	23	1	6 Panes pulguitas sin aditivos	1.05	4.38	kg	https://prod-mercadona.imgix.net/images/95cb736d41facafa9094ab7232126eef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83292/6-panes-pulguitas-sin-aditivos-pack-6	t
565	23	1	6 Panes de centeno 51%	1.47	3.16	kg	https://prod-mercadona.imgix.net/images/02216c41098c1435d23cc9da18b632b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83056/6-panes-centeno-51-pack-6	t
566	23	1	11 Panecillos	1.14	2.30	kg	https://prod-mercadona.imgix.net/images/97ee542fb54a114e4bc485fbfeeecbb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40339/11-panecillos	t
567	23	1	3 Panes molletes	1.20	3.81	kg	https://prod-mercadona.imgix.net/images/b9db21b2c0e6715ce71937a84d42164e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83908/3-panes-molletes-pack-3	t
568	23	1	6 Panecillos integrales 100%	1.05	3.89	kg	https://prod-mercadona.imgix.net/images/947b9af889d3a349d57ca43b8e95eb6a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22388/6-panecillos-integrales-100	t
569	23	1	6 Panes serranos	1.40	3.89	kg	https://prod-mercadona.imgix.net/images/ca230117da59866f72bf61c28574064d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87312/6-panes-serranos-pack-6	t
570	23	1	3 Panes bollo	1.25	3.33	kg	https://prod-mercadona.imgix.net/images/3eb449d5fb374e70b37586ddcfaf7768.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9209/3-panes-bollo	t
571	23	1	Pan de molde blanco sin corteza Hacendado	1.13	2.51	kg	https://prod-mercadona.imgix.net/images/7931704a16106081eb2e0d81c340306c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82322/pan-molde-blanco-sin-corteza-hacendado-paquete	t
572	23	1	Pan de molde blanco Hacendado	0.80	1.74	kg	https://prod-mercadona.imgix.net/images/37367d7a79c63686cbdb1cdad6b5e927.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13810/pan-molde-blanco-hacendado-paquete	t
573	23	1	Pan de molde 100% integral familiar Hacendado	1.18	1.44	kg	https://prod-mercadona.imgix.net/images/bb4bc87dd5cde05303b1e222c2131fb0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83886/pan-molde-100-integral-familiar-hacendado-paquete	t
574	23	1	Pan de molde 100% integral sin corteza Hacendado	1.23	2.73	kg	https://prod-mercadona.imgix.net/images/3c3a0ceabc49c8022b255bb92751d3d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23643/pan-molde-100-integral-sin-corteza-hacendado-0-azucares-anadidos-paquete	t
575	23	1	Pan de molde blanco natural rústico Hacendado	1.51	2.75	kg	https://prod-mercadona.imgix.net/images/f959357511174b86d32065978125d81e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23359/pan-molde-blanco-natural-rustico-hacendado-0-azucares-anadidos-paquete	t
576	23	1	Pan de molde blanco rebanada gruesa Hacendado	1.70	2.07	kg	https://prod-mercadona.imgix.net/images/d364635710f8dcbfee0bdca12889d3c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1699/pan-molde-blanco-rebanada-gruesa-hacendado-paquete	t
577	23	1	Pan de molde cereales sin gluten Hacendado	2.74	5.83	kg	https://prod-mercadona.imgix.net/images/a8c90aab11776a9f62a00b0a10634ad7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86750/pan-molde-cereales-sin-gluten-hacendado-paquete	t
578	23	1	Pan de molde sin gluten blanco Hacendado	2.74	5.48	kg	https://prod-mercadona.imgix.net/images/4b2fd6f2a42c76ccb71db2be51fa7ec5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35711/pan-molde-sin-gluten-blanco-hacendado-paquete	t
579	23	1	Pan 5 semillas	1.50	3.00	kg	https://prod-mercadona.imgix.net/images/b5cb45757818023d59a9e7e39d90fd06.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83558/pan-5-semillas-cortado-paquete	t
580	23	1	Barra de pan tradicional	1.28	1.83	kg	https://prod-mercadona.imgix.net/images/25c4bc7eecd7bb503f2339aac9059af4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83560/barra-pan-tradicional-cortada-paquete	t
581	23	1	Pan de molde con 35% avena Hacendado 0% azúcares añadidos con harina 100% integral	1.37	2.98	kg	https://prod-mercadona.imgix.net/images/cfc13f1dfe16be2a774a9ca380b7184d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82295/pan-molde-con-35-avena-hacendado-0-azucares-anadidos-con-harina-100-integral-paquete	t
582	23	1	Pan de molde semillas y pipas de calabaza Hacendado	1.65	2.84	kg	https://prod-mercadona.imgix.net/images/2c503fa3d2fb1a21bf062e8a9b9affae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83869/pan-molde-semillas-pipas-calabaza-hacendado-paquete	t
583	23	1	Pan de molde con 55% centeno Hacendado	1.47	2.04	kg	https://prod-mercadona.imgix.net/images/f9b68761bf2dfe1c91dabcb96b64afe5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82302/pan-molde-con-55-centeno-hacendado-paquete	t
584	23	1	Pan de molde 12 cereales y semillas Hacendado	1.61	2.37	kg	https://prod-mercadona.imgix.net/images/bf669c3d9063dfe4e7ba8f105f36b704.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83547/pan-molde-12-cereales-semillas-hacendado-paquete	t
585	23	1	Hogaza sin gluten	2.96	9.87	kg	https://prod-mercadona.imgix.net/images/af38980c089d2ef99559f4ecaa47cc7d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82735/hogaza-sin-gluten-cortada-paquete	t
586	23	1	Pan Brioche Hacendado	2.35	5.88	kg	https://prod-mercadona.imgix.net/images/4675712ad496fc20ab76102547f667e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22899/pan-brioche-hacendado-paquete	t
587	23	1	Molletes San Roque de Antequera	1.00	5.00	kg	https://prod-mercadona.imgix.net/images/6f49d9f869ef8cdde4b386aeeb98da45.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83903/molletes-san-roque-antequera-paquete	t
588	23	1	Pan Bagel Hacendado	1.42	4.73	kg	https://prod-mercadona.imgix.net/images/deb6982c67ead259fb2a94c2c7492225.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23843/pan-bagel-hacendado-paquete	t
589	23	1	Pan redondo sin gluten Hacendado	1.93	12.06	kg	https://prod-mercadona.imgix.net/images/a3a8bd862ae9048c2fb1b2c56523bcad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35849/pan-redondo-sin-gluten-hacendado-paquete	t
590	23	1	Tortillas de trigo Hacendado	1.15	3.19	kg	https://prod-mercadona.imgix.net/images/ed65b3b242f3ea0ffb63bdc75878a1d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80859/tortillas-trigo-hacendado-paquete	t
591	23	1	Pan hot dog Hacendado	0.90	2.73	kg	https://prod-mercadona.imgix.net/images/1a4384796c10baa72355deb00039cbd4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82332/pan-hot-dog-hacendado-paquete	t
592	23	1	Pan maxi hamburguesa Hacendado	0.85	2.83	kg	https://prod-mercadona.imgix.net/images/004af95bdcfc0463e7d806f7919fc90a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13803/pan-maxi-hamburguesa-hacendado-paquete	t
593	23	1	Tortillas de trigo integrales Hacendado	1.55	4.31	kg	https://prod-mercadona.imgix.net/images/d1fdbb3de0ddaacc3f3f76526fd2bc4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80942/tortillas-trigo-integrales-hacendado-paquete	t
594	23	1	Pan de hamburguesa Brioche Hacendado	1.10	7.33	kg	https://prod-mercadona.imgix.net/images/c4f9f0e92cd76bbb10bb9761df1ca7b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52602/pan-hamburguesa-brioche-hacendado-paquete	t
595	23	1	Maxi tortillas de trigo Hacendado	1.50	4.17	kg	https://prod-mercadona.imgix.net/images/9bbd7b9434f81a70eb1514d235587d1f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80870/maxi-tortillas-trigo-hacendado-paquete	t
596	23	1	Pan Mini bocados Hacendado	1.20	7.27	kg	https://prod-mercadona.imgix.net/images/2bd3a8a79f94c5c3e9c4763d912e6e75.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84429/pan-mini-bocados-hacendado-paquete	t
597	23	1	Pan de hamburguesa Hacendado Rústico 100% integral	1.18	3.58	kg	https://prod-mercadona.imgix.net/images/34879362d8edbe89390733a68c46fac4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60251/pan-hamburguesa-hacendado-rustico-100-integral-paquete	t
598	15	1	Tortillas de avena 51% Hacendado	1.85	5.14	kg	https://prod-mercadona.imgix.net/images/52880df57b58670b6e58e1cae226663d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80531/tortillas-avena-51-hacendado-paquete	t
599	15	1	Tortillas de maíz Hacendado	1.85	8.89	kg	https://prod-mercadona.imgix.net/images/5846b002f93e90fe75ef639f619bf409.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86328/tortillas-maiz-hacendado-paquete	t
600	23	1	Pan de pita Mission	2.00	6.67	kg	https://prod-mercadona.imgix.net/images/4af89bf80e15b2a11b57f8e001013cc4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14378/pan-pita-mission-paquete	t
601	23	1	Pan tostado classic Hacendado	1.70	3.09	kg	https://prod-mercadona.imgix.net/images/1d7a425e6f2f3c735d48c7c2393f0fbf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82287/pan-tostado-classic-hacendado-paquete	t
602	23	1	Pan tostado cereales y semillas Hacendado	2.22	4.04	kg	https://prod-mercadona.imgix.net/images/804d415f8f4701b031f6662c2ba6ae52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82290/pan-tostado-cereales-semillas-hacendado-paquete	t
603	23	1	Pan tostado pasas Hacendado	1.15	9.58	kg	https://prod-mercadona.imgix.net/images/46f587a35d70540904e0c4b9a2ac931f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82665/pan-tostado-pasas-hacendado-paquete	t
604	23	1	Pan tostado 100% espelta integral Hacendado	1.47	5.88	kg	https://prod-mercadona.imgix.net/images/72a54e7ef736024a01f13af1eb3e3f5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82842/pan-tostado-100-espelta-integral-hacendado-paquete	t
605	23	1	Panecillo tostado classic Hacendado	1.13	3.77	kg	https://prod-mercadona.imgix.net/images/26f58c6958d86d63e9139103b3591e39.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82277/panecillo-tostado-classic-hacendado-paquete	t
606	23	1	Pan tostado 100% integral	1.80	3.27	kg	https://prod-mercadona.imgix.net/images/5de413d561d2f5a1df428beaeb6746cb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86008/pan-tostado-100-integral-paquete	t
607	23	1	Panecillos tostados cereales y semillas Hacendado	1.28	5.12	kg	https://prod-mercadona.imgix.net/images/171913b8556b651c1ca21737751c3cbe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82417/panecillos-tostados-cereales-semillas-hacendado-paquete	t
608	23	1	Panecillo tostado 100% integral de trigo Hacendado	1.13	3.77	kg	https://prod-mercadona.imgix.net/images/caff6c645ee3e37f0166ee087b1c8890.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13445/panecillo-tostado-100-integral-trigo-hacendado-paquete	t
609	23	1	Pan tostado 100% integral bajo en sal y en azúcares Hacendado	2.17	4.02	kg	https://prod-mercadona.imgix.net/images/04649845ba2e5c3286480fb1c73d84f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83789/pan-tostado-100-integral-bajo-sal-azucares-hacendado-paquete	t
610	23	1	Pan tostado vitalité Wasa	2.45	8.75	kg	https://prod-mercadona.imgix.net/images/63e432c47ae97f5fa2b874121c221207.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82150/pan-tostado-vitalite-wasa-paquete	t
611	23	1	Pan tostado con tomate Hacendado	1.28	7.53	kg	https://prod-mercadona.imgix.net/images/6e9f47916f81a70709740fc6f61d703d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82190/pan-tostado-con-tomate-hacendado-paquete	t
612	23	1	Pan tostado con ajo y perejil Hacendado	1.28	7.53	kg	https://prod-mercadona.imgix.net/images/4897d5374277c5144e00b31f9d6d0f73.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82199/pan-tostado-con-ajo-perejil-hacendado-paquete	t
613	23	1	Pan rallado Hacendado	0.85	1.13	kg	https://prod-mercadona.imgix.net/images/fe031df985de4909241d4503364df110.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82219/pan-rallado-hacendado-paquete	t
614	23	1	Pan rallado con ajo y perejil Hacendado	1.00	2.00	kg	https://prod-mercadona.imgix.net/images/618fc5e463121c35126427369486d7bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82227/pan-rallado-con-ajo-perejil-hacendado-paquete	t
615	23	1	Pan rallado casero Hacendado	1.00	2.00	kg	https://prod-mercadona.imgix.net/images/7d68ff5676a8158bdcb746652bb3a8f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82352/pan-rallado-casero-hacendado-paquete	t
616	23	1	Preparado crujiente Hacendado	1.60	4.00	kg	https://prod-mercadona.imgix.net/images/e9ec77c1a7ee1591601a91070f573282.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22932/preparado-crujiente-hacendado-paquete	t
617	23	1	Crackers integrales de espelta Bachman	1.65	6.88	kg	https://prod-mercadona.imgix.net/images/6de7ba28de627f11939368aae2f75e84.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82626/crackers-integrales-espelta-bachman-caja	t
618	23	1	Pan de fibra y sésamo Hacendado	1.13	4.52	kg	https://prod-mercadona.imgix.net/images/a3392f9e5392dfbc6be285a4864bb40a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82655/pan-fibra-sesamo-hacendado-paquete	t
619	15	1	Galletas saladas salpicks Galbusera	1.90	4.75	kg	https://prod-mercadona.imgix.net/images/c166d5d04824d9186de1c69f72b37f76.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82585/galletas-saladas-salpicks-galbusera-paquete	t
620	23	1	Crackers 30% integral	1.85	3.70	kg	https://prod-mercadona.imgix.net/images/14f6456edc57e35d89792eed4bcf779c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82412/crackers-30-integral-galbusera-paquete	t
621	23	1	Crackers con sal Hacendado	1.85	3.70	kg	https://prod-mercadona.imgix.net/images/f5125d813bec51c9ca4ed56b9c30201c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82439/crackers-con-sal-galbusera-paquete	t
622	23	1	Crackers sin gluten Hacendado con romero	1.70	8.50	kg	https://prod-mercadona.imgix.net/images/b28caee5ee014ab96fa6a73c490e9f1e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82651/crackers-sin-gluten-hacendado-con-romero-paquete	t
623	23	1	Picos saladitos Hacendado	1.13	4.52	kg	https://prod-mercadona.imgix.net/images/8c7a4edac6f9b2c4542585553eb7e15a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13631/picos-saladitos-hacendado-paquete	t
624	23	1	Picos 100% integrales Hacendado	0.80	3.20	kg	https://prod-mercadona.imgix.net/images/598ca988465c5dcaeaa4ee7b866b2570.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86215/picos-100-integrales-hacendado-paquete	t
625	23	1	Picos Hacendado	0.80	3.20	kg	https://prod-mercadona.imgix.net/images/11a2123906a90bc11ab9ac4ae40a125a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82279/picos-hacendado-paquete	t
626	23	1	Regañá Hacendado	1.04	4.16	kg	https://prod-mercadona.imgix.net/images/25b45637d60017a6943cceb6ca780eb8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82365/regana-hacendado-paquete	t
627	23	1	Piquitos bajos en sal Hacendado con orégano y tomillo	1.23	4.92	kg	https://prod-mercadona.imgix.net/images/693306dbd17faa41cefd17a1a16b1627.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22249/piquitos-bajos-sal-hacendado-paquete	t
628	23	1	Grissini palitos de pan con sésamo Hacendado	1.42	7.10	kg	https://prod-mercadona.imgix.net/images/a37ca456b4ae38be1b9455576b2daa6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82464/grissini-palitos-pan-con-sesamo-hacendado-pack-2	t
629	23	1	Rosquillas Hacendado	0.99	3.96	kg	https://prod-mercadona.imgix.net/images/229c99184a9f4afa85396c53db78d029.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82268/rosquillas-hacendado-paquete	t
630	23	1	Grissini palitos de pan Hacendado	1.65	6.60	kg	https://prod-mercadona.imgix.net/images/1d0dc4dab9f80d77210e894048052a84.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82599/grissini-palitos-pan-hacendado-caja	t
631	23	1	Picos sin gluten Hacendado	1.42	14.20	kg	https://prod-mercadona.imgix.net/images/53c6cee3fd4b8508b66c1068d4561738.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13450/picos-sin-gluten-hacendado-paquete	t
632	23	1	Picos reventaos Hacendado	0.99	3.96	kg	https://prod-mercadona.imgix.net/images/500cbab5e18b8e7e71546aba58b3510d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82270/picos-reventaos-hacendado-paquete	t
633	23	1	Piquitos San Roque	0.90	6.34	kg	https://prod-mercadona.imgix.net/images/0497cea3b5dee1f77189f9a8e844b918.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82220/piquitos-san-roque-paquete	t
634	23	1	Picos camperos Hacendado	0.99	3.96	kg	https://prod-mercadona.imgix.net/images/5d0ced457e2d15b4c9a1b5fa6b71fa19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67953/picos-camperos-jerez-hacendado-paquete	t
635	23	1	Piquitos con salvado San Roque	0.90	6.34	kg	https://prod-mercadona.imgix.net/images/5876a2896745677371fd23dc63f79bd2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82222/piquitos-con-salvado-san-roque-paquete	t
636	23	1	Regañá artesana Hacendado	1.50	7.50	kg	https://prod-mercadona.imgix.net/images/58c8ab616334a7f5dc14c12451ddc4ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86832/regana-artesana-hacendado-paquete	t
637	23	1	Palitos de pan con pipas Anitin	1.32	7.95	kg	https://prod-mercadona.imgix.net/images/f619a6ff08937f86201dfde8dbabb6c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82765/palitos-pan-con-pipas-anitin-pack-2	t
638	23	1	Palitos con frutos secos Hacendado	1.04	8.00	kg	https://prod-mercadona.imgix.net/images/ef6131d666e79ec8c292ba28e0692aed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13372/palitos-con-frutos-secos-hacendado-pack-2	t
639	23	1	Palitos de pan 100% trigo espelta integral Anitin	1.32	8.80	kg	https://prod-mercadona.imgix.net/images/2c7ed49985b4fb8ee808adbfdd499b05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86559/palitos-pan-100-trigo-espelta-integral-anitin-pack-2	t
640	23	1	Palitos de pan con queso Anitin	1.32	9.30	kg	https://prod-mercadona.imgix.net/images/91bbc9b83c4f1bd646799c45273acd39.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82892/palitos-pan-con-queso-anitin-pack-2	t
641	23	1	Panes especiales con tomate y orégano Hacendado	0.85	10.63	kg	https://prod-mercadona.imgix.net/images/0d92b58d808b8569d896b359abfa934d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22396/panes-especiales-con-tomate-oregano-hacendado-anitines-paquete	t
642	23	1	Panes especiales sabor pizza con queso Hacendado	0.85	10.63	kg	https://prod-mercadona.imgix.net/images/836a03b4a090848b15043ebe56036e39.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22397/panes-especiales-sabor-pizza-con-queso-hacendado-anitines-paquete	t
643	23	1	Picatostes fritos Hacendado	0.80	8.00	kg	https://prod-mercadona.imgix.net/images/4a4fa51c062aaddd537594c044af1961.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82786/picatostes-fritos-hacendado-paquete	t
644	23	1	Picatostes fritos con ajo Hacendado	0.80	8.00	kg	https://prod-mercadona.imgix.net/images/a3a3c3c2ad9b19c15d1f827b4cdc3d31.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82787/picatostes-fritos-con-ajo-hacendado-paquete	t
645	23	1	Picatostes tostados Hacendado	0.70	7.00	kg	https://prod-mercadona.imgix.net/images/42af13250bbaf1e610029a8b35c8cbb9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82788/picatostes-tostados-hacendado-paquete	t
646	24	1	Croissant de mantequilla 26%	0.55	11.00	kg	https://prod-mercadona.imgix.net/images/e3db82c4bd5fc7b2e956d3e76b1e8c62.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84692/croissant-mantequilla-26-pieza	t
647	24	1	Pastel de crema 65%	0.55	10.00	kg	https://prod-mercadona.imgix.net/images/736dc66fe73ff429bef9e9b8c59d3b89.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83664/pastel-crema-65-pieza	t
648	24	1	12 Mini croissants de mantequilla	2.15	8.96	kg	https://prod-mercadona.imgix.net/images/55dfb0de5a832d479c76f2e25c653d4b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84629/12-mini-croissants-mantequilla-bolsa	t
649	24	1	6 Croissant rellenos de cacao	1.75	6.36	kg	https://prod-mercadona.imgix.net/images/448b70af6205b50bf11f7994c0eb52c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84688/6-croissant-rellenos-cacao-bolsa	t
650	24	1	Bizcocho de yogur Hacendado	3.50	4.38	kg	https://prod-mercadona.imgix.net/images/0c05756038a9bae7f5c3bd613ab76732.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83995/bizcocho-yogur-hacendado-paquete	t
651	24	1	Berlina glacé	1.35	6.75	kg	https://prod-mercadona.imgix.net/images/fe1f277a10ee34a021457159b63a1d70.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84710/berlina-glace-paquete	t
652	24	1	Berlina al cacao	1.55	6.46	kg	https://prod-mercadona.imgix.net/images/f747d407f820ed49d4376d4ad21b8325.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84785/berlina-cacao-paquete	t
653	24	1	Rosquillas al cacao	1.55	8.52	kg	https://prod-mercadona.imgix.net/images/6e8e2e6638dd917efd7d1471910d2c9b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84654/rosquillas-cacao-paquete	t
654	24	1	Trenza con nueces 4%	1.00	12.50	kg	https://prod-mercadona.imgix.net/images/b3f51a8fa6c6d25bdfbc143ccf4d6beb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84458/trenza-con-nueces-4-pieza	t
655	24	1	Caracola con pasas 10%	1.00	9.71	kg	https://prod-mercadona.imgix.net/images/1a356cacaaf45ca0408c99dfc108ecf1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84663/caracola-con-pasas-10-pieza	t
656	24	1	Muffin chocolate 3%	1.45	12.08	kg	https://prod-mercadona.imgix.net/images/7ec1f98a59da321737d9820d5a67973e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84754/muffin-chocolate-3-pieza	t
657	24	1	Bizcocho de cacao	3.20	7.80	kg	https://prod-mercadona.imgix.net/images/055a5ce9e4d2ba337d6dd20e444d0dc9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12809/bizcocho-chocolate-paquete	t
658	24	1	Bizcocho con azúcar moreno y nueces	3.35	8.38	kg	https://prod-mercadona.imgix.net/images/a1be45d525db48eb2a1cf77ff37b4301.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9965/bizcocho-con-azucar-moreno-nueces-bandeja	t
659	24	1	Bizcocho de chocolate sin gluten y sin lactosa	3.15	10.50	kg	https://prod-mercadona.imgix.net/images/dc81211122046f2f184596736f63b646.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84736/bizcocho-chocolate-sin-gluten-sin-lactosa-paquete	t
660	23	1	Empanada de atún	3.60	7.20	kg	https://prod-mercadona.imgix.net/images/af643679aebe19a4769c91976f9585b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84284/empanada-atun-pieza	t
661	23	1	Empanada de atún grande	7.20	6.43	kg	https://prod-mercadona.imgix.net/images/7db27ca0b22ffa3d9ebf1db18bf2392e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84287/empanada-atun-grande-pieza	t
662	23	1	Empanada rellena de pollo y setas con crema de queso	3.65	7.30	kg	https://prod-mercadona.imgix.net/images/1e017096d4ae940a9c4ceb15c7f28cb6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84289/empanada-rellena-pollo-setas-con-crema-queso-pieza	t
663	23	1	12 Mini saladas surtidas	1.40	7.18	kg	https://prod-mercadona.imgix.net/images/8b231c42fd0c486732b5e2d792920d58.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84638/12-mini-saladas-bolsa	t
664	23	1	Hojaldre sabor pizza	1.30	13.00	kg	https://prod-mercadona.imgix.net/images/88fa8735cf0dba2e9256bfba9a839635.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14725/hojaldre-sabor-pizza-pieza	t
665	24	1	Napolitana mixta	0.90	6.92	kg	https://prod-mercadona.imgix.net/images/6ac934c3f8cbc0b3e383197edebb097c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/84940/napolitana-mixta-pieza	t
666	23	1	Empanadilla de pollo 10% y bechamel	1.30	13.27	kg	https://prod-mercadona.imgix.net/images/fca8ea787af9601db902466b8c8adb3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4912/empanadilla-pollo-10-bechamel-pieza	t
667	23	1	Empanadilla de atún 16%	1.30	10.40	kg	https://prod-mercadona.imgix.net/images/f1306bdb6ec098d1b05b7d02039e19de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4911/empanadilla-atun-16-pieza	t
668	24	1	Valencianas Hacendado	2.50	3.57	kg	https://prod-mercadona.imgix.net/images/86a9fa950e3879e0daf0ca36180aee83.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82032/valencianas-hacendado-paquete	t
669	24	1	Croissant Hacendado	1.85	4.30	kg	https://prod-mercadona.imgix.net/images/2c82ab40cdbb12f72fb5c116d1887d0e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82931/croissant-hacendado-paquete	t
670	24	1	Croissant relleno de crema al cacao Hacendado	1.95	5.20	kg	https://prod-mercadona.imgix.net/images/cc93709a5e1b83443f90f51845f6f30e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82932/croissant-relleno-crema-cacao-hacendado-paquete	t
671	24	1	Bollo con pepitas de chocolate Hacendado Choco Buns	1.50	6.00	kg	https://prod-mercadona.imgix.net/images/3c54fa2c63572efdb7ca3059458fada9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82609/bollo-con-pepitas-chocolate-hacendado-choco-buns-paquete	t
672	24	1	Ensaimadas Hacendado	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/77b0a5b3d76ae942055a99cefa8d6c36.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82090/ensaimadas-hacendado-paquete	t
673	24	1	Pan de leche Hacendado	1.85	3.85	kg	https://prod-mercadona.imgix.net/images/91121503647f92da9fa6d7d56357c99c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82933/pan-leche-hacendado-paquete	t
674	24	1	Bocaditos bañados al cacao Hacendado	2.30	4.60	kg	https://prod-mercadona.imgix.net/images/fb140c6c8aa6d25567c5947d86a13a26.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82098/bocaditos-banados-cacao-hacendado-paquete	t
675	24	1	Sobaos Hacendado	2.10	4.38	kg	https://prod-mercadona.imgix.net/images/da9142870ffe1a47746b2c3f02c71716.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82699/sobaos-hacendado-paquete	t
676	24	1	Crepes rellenos de chocolate Hacendado	1.45	7.55	kg	https://prod-mercadona.imgix.net/images/8defc27a8756cc97b46e42337d79e6a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82551/crepes-rellenos-chocolate-hacendado-paquete	t
677	24	1	Palmeritas Hacendado	1.55	5.74	kg	https://prod-mercadona.imgix.net/images/1c31c013d2a77630ca2e2a81b36275a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82905/palmeritas-hacendado-paquete	t
678	24	1	Gofres clásicos Hacendado	1.30	5.91	kg	https://prod-mercadona.imgix.net/images/8e72c208a9987840d91034512fe2d64b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52891/gofres-clasicos-hacendado-paquete	t
679	24	1	Gofres con chocolate Hacendado	1.55	5.54	kg	https://prod-mercadona.imgix.net/images/e892d887f86cd335b084fc60d887da02.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52892/gofres-con-chocolate-hacendado-paquete	t
680	24	1	Napolitanas con relleno de cacao Hacendado	1.80	4.86	kg	https://prod-mercadona.imgix.net/images/761e1310d9efe5ec24a4d022990904bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23373/napolitanas-con-relleno-cacao-hacendado-paquete	t
681	24	1	Rosegones pasta de almendras Hacendado	1.90	7.60	kg	https://prod-mercadona.imgix.net/images/8b0cc78315d96d2300bac835e17ad8ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82900/rosegones-pasta-almendras-hacendado-paquete	t
682	24	1	Bizcochos Hacendado	2.00	6.67	kg	https://prod-mercadona.imgix.net/images/4fba1503f1b274ccc7be9f90f5c05bf4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82099/bizcochos-hacendado-paquete	t
683	24	1	Bizcochos de huevo Hacendado	1.80	4.50	kg	https://prod-mercadona.imgix.net/images/56d1314642bdc0901cfaa35526b58af8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23372/bizcochos-huevo-hacendado-pack-4	t
684	24	1	Napolitanas con relleno sabor crema Hacendado	1.80	4.86	kg	https://prod-mercadona.imgix.net/images/48758998252cd09150326823332c4aa7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23374/napolitanas-con-relleno-sabor-crema-hacendado-paquete	t
685	15	1	Tortas de aceite Inés Rosales	2.15	11.94	kg	https://prod-mercadona.imgix.net/images/bcb8a5cfcad3ae65cbb352ddf3ecb3f4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82908/tortas-aceite-ines-rosales-paquete	t
686	15	1	Tortas de aceite Inés Rosales sin azúcar	2.70	18.00	kg	https://prod-mercadona.imgix.net/images/e3b8dced93aa8bba139818095046b1dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82920/tortas-aceite-ines-rosales-sin-azucar-paquete	t
687	24	1	Bizcocho de chocolate sin gluten Hacendado	2.20	11.00	kg	https://prod-mercadona.imgix.net/images/5c22bf9d9a7c840d7483976458541c6c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82744/bizcocho-chocolate-sin-gluten-hacendado-paquete	t
688	24	1	Magdalenas sin gluten Hacendado	2.65	12.62	kg	https://prod-mercadona.imgix.net/images/14cbe7e926f4bd03128e83ecbf68f406.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82757/magdalenas-sin-gluten-hacendado-paquete	t
689	24	1	Magdalenas integrales 0% azúcares añadidos Hacendado	2.10	7.50	kg	https://prod-mercadona.imgix.net/images/1a0047b48d62648f3d434dcd02e83bfd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82732/magdalenas-integrales-0-azucares-anadidos-hacendado-paquete	t
690	24	1	Magdalenas al cacao Hacendado	2.10	6.00	kg	https://prod-mercadona.imgix.net/images/b79a0bc39f0b3aeb894799ea40216295.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82731/magdalenas-cacao-hacendado-paquete	t
691	24	1	Cortadillo con cabello de Ángel Ines Rosales	1.85	8.56	kg	https://prod-mercadona.imgix.net/images/6e609a863f32c45681b775b395f36f93.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82910/cortadillo-con-cabello-angel-ines-rosales-paquete	t
692	15	1	Tortitas con canela Ines Rosales	1.70	9.44	kg	https://prod-mercadona.imgix.net/images/7bb986899e47af1e37e708f7fd477cc2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82906/tortitas-con-canela-ines-rosales-paquete	t
693	23	1	Molletes con salvado San Roque de Antequera	1.00	5.00	kg	https://prod-mercadona.imgix.net/images/46c769e8972cc3b7661bef2402e0330a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/83907/molletes-con-salvado-san-roque-antequera-paquete	t
694	23	1	Mantecadas Hacendado	2.30	4.42	kg	https://prod-mercadona.imgix.net/images/5239b02817b66a43202bf44b09c77a4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16317/mantecadas-hacendado-paquete	t
695	15	1	Tortas Banitas Aguilera	1.40	3.50	kg	https://prod-mercadona.imgix.net/images/657bd96b158652b1f462f30cffc96851.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14409/tortas-banitas-aguilera-paquete	t
696	24	1	Mini magdalenas con pepitas de chocolate con leche Hacendado	1.90	7.04	kg	https://prod-mercadona.imgix.net/images/c016e796dbf8a761318f4793d2986b48.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35941/mini-magdalenas-con-pepitas-chocolate-con-leche-hacendado-paquete	t
697	24	1	Caña de hojaldre rellena de crema sabor vainilla Hacendado con cobertura de cacao	1.70	6.67	kg	https://prod-mercadona.imgix.net/images/0dd24a938f5454c6f59f941436425a26.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52992/cana-hojaldre-rellena-crema-sabor-vainilla-hacendado-con-cobertura-cacao-paquete	t
698	24	1	Trenza hojaldre de mantequilla Hacendado congelada	6.50	15.12	kg	https://prod-mercadona.imgix.net/images/013775bc9301b5808eb9211164fde3de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87616/trenza-hojaldre-mantequilla-hacendado-congelada-bandeja	t
699	24	1	Trenza hojaldre de mantequilla Hacendado congelada	6.50	15.12	kg	https://prod-mercadona.imgix.net/images/013775bc9301b5808eb9211164fde3de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87616/trenza-hojaldre-mantequilla-hacendado-congelada-bandeja	t
700	23	1	Harina de trigo grande Hacendado	2.95	0.59	kg	https://prod-mercadona.imgix.net/images/709e881751a26e426fcf038f3e750cd0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29106/harina-trigo-grande-hacendado-paquete	t
701	23	1	Harina de fuerza Hacendado	0.95	0.95	kg	https://prod-mercadona.imgix.net/images/441dfa0025219209e124c8bd3314976d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29019/harina-fuerza-hacendado-paquete	t
702	23	1	Harina de maíz blanco precocida Hacendado	1.60	1.60	kg	https://prod-mercadona.imgix.net/images/82286fa9fada11e8e7721656ca066ce6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29165/harina-maiz-blanco-precocida-hacendado-paquete	t
703	23	1	Harina fina de maíz Hacendado	1.20	3.00	kg	https://prod-mercadona.imgix.net/images/069cfa02e3a4332a949c399243ff319e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9588/harina-fina-maiz-hacendado-paquete	t
704	23	1	Harina integral de trigo Hacendado	0.90	0.90	kg	https://prod-mercadona.imgix.net/images/810ed30517964c49fc51a8e728247be2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29134/harina-integral-trigo-hacendado-paquete	t
705	23	1	Preparado para pizzas Hacendado	1.45	1.45	kg	https://prod-mercadona.imgix.net/images/4c7fdbea75eb11bc718063f3f39f1183.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23646/preparado-pizzas-hacendado-paquete	t
706	23	1	Harina de espelta Hacendado 100% integral	1.45	1.45	kg	https://prod-mercadona.imgix.net/images/01f80ec215d9662d4e97a7a8cfe1d10d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29174/harina-espelta-hacendado-100-integral-paquete	t
707	23	1	Harina semolosa de trigo Hacendado especial para fritos	1.20	1.20	kg	https://prod-mercadona.imgix.net/images/c5359da64c7dfe2b653cdb01b6085bee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29180/harina-semolosa-trigo-hacendado-especial-fritos-paquete	t
708	23	1	Harina de arroz Hacendado	1.31	2.62	kg	https://prod-mercadona.imgix.net/images/914803265b7c94915e6cb6fc92fdb407.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29130/harina-arroz-hacendado-paquete	t
709	23	1	Sémola de trigo Hacendado	1.30	1.30	kg	https://prod-mercadona.imgix.net/images/f2442195e628a9432cd9cdedc32cc813.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13045/semola-trigo-hacendado-paquete	t
710	24	1	Preparado para repostería y panificación Hacendado	2.70	2.70	kg	https://prod-mercadona.imgix.net/images/96ef96c6bc3264a4a9bad6b4a2e22f80.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80292/preparado-reposteria-panificacion-hacendado-paquete	t
711	23	1	Harina de garbanzo Hacendado	2.00	4.00	kg	https://prod-mercadona.imgix.net/images/618e741aec78f29e6da87ec913990715.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29373/harina-garbanzo-hacendado-paquete	t
712	23	1	Harina semolosa de trigo Las Panaeras Sevillanas para freír	1.46	1.46	kg	https://prod-mercadona.imgix.net/images/4e8019f6f1cc6970261004ed75db4edb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29117/harina-semolosa-trigo-panaeras-sevillanas-freir-paquete	t
713	23	1	Levadura fresca Levital	0.50	10.00	kg	https://prod-mercadona.imgix.net/images/a61f9bff30d673cbd0bfb25518258879.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/87811/levadura-fresca-levital-paquete	t
714	8	1	Chocolate negro fundir Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/c402c82c0caf8ff549ec508651892379.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12531/chocolate-negro-fundir-hacendado-tableta	t
715	23	1	Impulsor gasificante en polvo Royal uso alimentario	2.25	28.13	kg	https://prod-mercadona.imgix.net/images/d3ce7684ef4eb5bee0b36e68a57f0d73.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29225/impulsor-gasificante-polvo-royal-uso-alimentario-caja	t
716	24	1	Impulsor gasificante repostería Hacendado para uso alimentario	0.70	7.78	kg	https://prod-mercadona.imgix.net/images/c7e429c5e340c5953cda7704dc9d2dd2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80293/impulsor-gasificante-hacendado-uso-alimentario-caja	t
717	24	1	Preparado en polvo cuajada azucarada Royal sabor lácteo	1.45	30.21	kg	https://prod-mercadona.imgix.net/images/c0cd591955bba66ca4ed6eb64cd55189.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32358/preparado-polvo-cuajada-azucarada-royal-sabor-lacteo-16-raciones-caja	t
718	8	1	Gotas de chocolate negro para fundir Hacendado	2.60	10.40	kg	https://prod-mercadona.imgix.net/images/5a6ad3c58e5310b8079675594f796bab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12544/gotas-chocolate-negro-fundir-hacendado-paquete	t
719	24	1	Preparado en polvo flan Hacendado	1.40	7.37	kg	https://prod-mercadona.imgix.net/images/f8cd02243436e271c1af207055edbfe5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32045/preparado-polvo-flan-hacendado-8-raciones-contiene-azucar-caramelo-liquido-caja	t
720	8	1	Chocolate blanco fundir Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/cef676972da3b5f5e3690314aead47ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12543/chocolate-blanco-fundir-hacendado-tableta	t
721	24	1	Preparado en polvo flanes y natillas Maizena Potax	1.75	9.11	kg	https://prod-mercadona.imgix.net/images/368cd013a6dc45cb0a8e17313d94c186.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32030/preparado-polvo-flanes-natillas-maizena-potax-24-flanes-caja	t
722	24	1	Aroma de vainilla Hacendado	2.00	13.33	l	https://prod-mercadona.imgix.net/images/d26501b06d4ae4933d8ca6c4dce51018.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32524/aroma-vainilla-hacendado-bote	t
723	24	1	Preparado en polvo natillas Hacendado	1.40	15.73	kg	https://prod-mercadona.imgix.net/images/c3ed3d477066402bfb8f5d0840fc7fb1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32329/preparado-polvo-natillas-hacendado-21-raciones-contiene-canela-molida-caja	t
724	24	1	Preparado en polvo gelatina fresa Hacendado	1.50	8.82	kg	https://prod-mercadona.imgix.net/images/5a21ad8817db920bb4d3ee9f3042a1b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32361/preparado-polvo-gelatina-fresa-hacendado-caja	t
725	24	1	Preparado en polvo gelatina arándano Hacendado 0% azúcar	2.00	64.52	kg	https://prod-mercadona.imgix.net/images/5a16936329e8693fef1afaa9c877e958.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32369/preparado-polvo-gelatina-arandano-hacendado-0-azucar-caja	t
726	8	1	Chocolate negro 70% cacao fundir Hacendado 0% azúcares añadidos	3.25	16.25	kg	https://prod-mercadona.imgix.net/images/e8e32a0506510cdb96d0eb3211d9ac8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12530/chocolate-negro-70-cacao-fundir-hacendado-0-azucares-anadidos-tableta	t
727	8	1	Chocolate con leche fundir Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/5230162330fda1f7d9e46152ba7a087d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12533/chocolate-con-leche-fundir-hacendado-tableta	t
728	23	1	Levadura de panadería Hacendado	1.60	22.86	kg	https://prod-mercadona.imgix.net/images/1d5f5c153bdb7d00e9647f338f4f3d6b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86998/levadura-panaderia-hacendado-paquete	t
729	24	1	Preparado en polvo instantáneo para crepes Hacendado	2.00	11.76	kg	https://prod-mercadona.imgix.net/images/337f39d17b2810c960618df9b12e9083.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11601/preparado-polvo-instantaneo-crepes-hacendado-bote	t
730	23	1	Masa para empanadillas y postres Buitoni	1.25	7.81	kg	https://prod-mercadona.imgix.net/images/e3fb42812aad0e4fc3fd87524c5b4333.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63440/masa-empanadillas-postres-buitoni-paquete	t
731	23	1	Masa de hojaldre sin gluten Hacendado	2.80	10.00	kg	https://prod-mercadona.imgix.net/images/ea237d03af34736621e3320dc8b15e7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63657/masa-hojaldre-sin-gluten-hacendado-paquete	t
732	23	1	Masa filo	1.95	7.80	kg	https://prod-mercadona.imgix.net/images/806f2ed143b17d07647ddc719652c2bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10459/masa-filo-bella-8-10-hojas-paquete	t
733	23	1	Masa gruesa para empanadas Buitoni estilo Argentino	2.40	6.86	kg	https://prod-mercadona.imgix.net/images/c71a5a15e5966deba8d943fa5dc756a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9860/masa-gruesa-empanadas-buitoni-estilo-argentino-paquete	t
734	45	1	Vela de cumpleaños 0 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/45183d7119ceca5970daa4832ff5aeff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49970/vela-cumpleanos-0-hacendado-paquete	t
735	45	1	Vela de cumpleaños 1 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/5ba85000072fc13d1b6c027e3cd99793.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49971/vela-cumpleanos-1-hacendado-paquete	t
736	45	1	Vela de cumpleaños 2 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/5af149434f48e5af05ec3c21ed761ca3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49972/vela-cumpleanos-2-hacendado-paquete	t
737	45	1	Vela de cumpleaños 3 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/64d9f5c904bb110bbe8b7a506b01a0d6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49973/vela-cumpleanos-3-hacendado-paquete	t
738	45	1	Vela de cumpleaños 4 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/5038846d596736e8bb3b25bb38eb7da8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49974/vela-cumpleanos-4-hacendado-paquete	t
739	45	1	Vela de cumpleaños 5 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/875e4c11df11a30b641c65c22ab580ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49975/vela-cumpleanos-5-hacendado-paquete	t
740	45	1	Vela de cumpleaños 6 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/f40ce2da306aebdd41587bbbd5eb171e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49976/vela-cumpleanos-6-hacendado-paquete	t
741	45	1	Vela de cumpleaños 7 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/94b2050370965d1608f30aea2d20ccd9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49977/vela-cumpleanos-7-hacendado-paquete	t
742	45	1	Vela de cumpleaños 8 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/9c81069604399005388d18c65db37768.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49978/vela-cumpleanos-8-hacendado-paquete	t
743	45	1	Vela de cumpleaños 9 Hacendado	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/4f95f780a085b200533e58ea86884f6c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49979/vela-cumpleanos-9-hacendado-paquete	t
744	45	1	Velas de cumpleaños Hacendado	1.05	0.05	ud	https://prod-mercadona.imgix.net/images/e2969be250d3c51c6630a2839f65e1fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49157/velas-cumpleanos-hacendado-paquete	t
745	24	1	Almendra molida Hacendado	2.15	17.20	kg	https://prod-mercadona.imgix.net/images/a22c2023cef6d1080a3a8bea46ba39d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34921/almendra-molida-hacendado-paquete	t
746	24	1	Coco rallado Hacendado	1.30	10.40	kg	https://prod-mercadona.imgix.net/images/0da63556166bbaf4d1fc9df82ab654b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34035/coco-rallado-hacendado-paquete	t
747	24	1	Caramelo líquido Hacendado	1.75	5.83	kg	https://prod-mercadona.imgix.net/images/8794456873b6e321137e0ce2c6f59a94.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32316/caramelo-liquido-hacendado-bote	t
748	8	1	Fideos de chocolate Hacendado	1.75	17.50	kg	https://prod-mercadona.imgix.net/images/2edc66f0eb9284ea9039f1c605336b9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32227/fideos-chocolate-hacendado-especial-reposteria-postres-paquete	t
749	6	1	Azúcar vainillado Hacendado	1.30	10.83	kg	https://prod-mercadona.imgix.net/images/3d2edbcf8bec1cc5bcf89ec1d92bc5f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32525/azucar-vainillado-hacendado-especial-reposteria-paquete	t
750	24	1	Cacahuete +Proteínas en polvo desgrasado Hacendado 14 g proteínas 70% reducido en grasa	2.75	13.75	kg	https://prod-mercadona.imgix.net/images/d7d92dd4c1eaf7f4cacb42fcf24d0019.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13738/cacahuete-proteinas-polvo-desgrasado-hacendado-14-g-proteinas-70-reducido-grasa-paquete	t
751	8	1	Topping de chocolate avellana Hacendado	2.50	8.33	kg	https://prod-mercadona.imgix.net/images/565e9e698740d265f8c422a7b71bb9c1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11600/topping-chocolate-avellana-hacendado-bote	t
752	24	1	Almendra palitos Hacendado	1.85	18.50	kg	https://prod-mercadona.imgix.net/images/a2300bd02a8f7d62bef999bb8fa5b732.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52928/almendra-palitos-hacendado-paquete	t
753	25	1	Leche semidesnatada sin lactosa Hacendado	5.76	0.96	l	https://prod-mercadona.imgix.net/images/6b8cf0ba135f7e717632541922c5791d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10721/leche-semidesnatada-sin-lactosa-hacendado-pack-6	t
754	25	1	Leche semidesnatada sin lactosa Hacendado	0.96	0.96	l	https://prod-mercadona.imgix.net/images/15f28a7326cdf32ea0e7304b16a154b9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10722/leche-semidesnatada-sin-lactosa-hacendado-brick	t
755	25	1	Leche semidesnatada sin lactosa Hacendado	1.90	1.58	l	https://prod-mercadona.imgix.net/images/86beaab2a15ac2d9840049b9cdbd6535.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10732/leche-semidesnatada-sin-lactosa-hacendado-pack-6	t
756	25	1	Leche semidesnatada calcio Hacendado	6.30	1.05	l	https://prod-mercadona.imgix.net/images/144a523d1a59344ed3c79a7776cc7945.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10683/leche-semidesnatada-calcio-hacendado-pack-6	t
757	25	1	Leche semidesnatada calcio Hacendado	1.05	1.05	l	https://prod-mercadona.imgix.net/images/3fff766b5f5575fd0d00ed61135243ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10685/leche-semidesnatada-calcio-hacendado-brick	t
758	25	1	Leche semidesnatada Asturiana	11.10	1.23	l	https://prod-mercadona.imgix.net/images/596d38a62e4ab57340efa89f95c0a61e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10505/leche-semidesnatada-asturiana-pack-6	t
759	25	1	Leche semidesnatada Asturiana	1.85	1.23	l	https://prod-mercadona.imgix.net/images/599728432d51afa362440f7a580864c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10502/leche-semidesnatada-asturiana-botella	t
760	25	1	Leche semidesnatada calcio Puleva	9.54	1.59	l	https://prod-mercadona.imgix.net/images/8ed7509cf81ad4f954857f04fc64b83b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10144/leche-semidesnatada-calcio-puleva-pack-6	t
761	25	1	Leche semidesnatada calcio Puleva	1.59	1.59	l	https://prod-mercadona.imgix.net/images/748ae2b06fe300154c06c69cb9c16b09.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10713/leche-semidesnatada-calcio-puleva-brick	t
762	25	1	Bebida láctea semidesnatada con fibra Hacendado	7.80	1.30	l	https://prod-mercadona.imgix.net/images/5fc2964bdefd76c1087b1da70763f216.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10814/bebida-lactea-semidesnatada-con-fibra-hacendado-pack-6	t
763	25	1	Bebida láctea semidesnatada con fibra Hacendado	1.30	1.30	l	https://prod-mercadona.imgix.net/images/15b342d271dc3afcee9cbfc062525792.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10826/bebida-lactea-semidesnatada-con-fibra-hacendado-brick	t
764	25	1	Leche semidesnatada de cabra Hacendado	11.22	1.87	l	https://prod-mercadona.imgix.net/images/4395b561337441945693f84660814c2e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10806/leche-semidesnatada-cabra-hacendado-pack-6	t
765	25	1	Leche semidesnatada de cabra Hacendado	1.87	1.87	l	https://prod-mercadona.imgix.net/images/5ebf4f33cd25300147cca4db86f18e6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10812/leche-semidesnatada-cabra-hacendado-brick	t
766	25	1	Leche semidesnatada fresca Hacendado	1.09	1.09	l	https://prod-mercadona.imgix.net/images/7f509c7db41e5763626998702f5cb755.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10922/leche-semidesnatada-fresca-hacendado-botella	t
767	25	1	Leche semidesnatada sin lactosa Hacendado	9.72	1.08	l	https://prod-mercadona.imgix.net/images/3a60b2dbd50e5615f1aef0741ad34057.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10545/leche-semidesnatada-sin-lactosa-hacendado-pack-6	t
768	25	1	Leche semidesnatada sin lactosa Hacendado	1.62	1.08	l	https://prod-mercadona.imgix.net/images/cb6c51dc548abac574de376046426d67.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10546/leche-semidesnatada-sin-lactosa-hacendado-botella	t
769	25	1	Leche desnatada sin lactosa Hacendado	5.58	0.93	l	https://prod-mercadona.imgix.net/images/84271adfb6b8db545c2f7c32ce09e1ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10730/leche-desnatada-sin-lactosa-hacendado-pack-6	t
770	25	1	Leche desnatada sin lactosa Hacendado	0.93	0.93	l	https://prod-mercadona.imgix.net/images/6639d6fc816bf8874deb718a194a091c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10731/leche-desnatada-sin-lactosa-hacendado-brick	t
771	25	1	Leche desnatada calcio Hacendado	6.12	1.02	l	https://prod-mercadona.imgix.net/images/35a7ff0faacadbfc9b75fc3d511402a5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10686/leche-desnatada-calcio-hacendado-pack-6	t
772	25	1	Leche desnatada calcio Hacendado	1.02	1.02	l	https://prod-mercadona.imgix.net/images/09b67f0825adcfa6e69e0487feeba981.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10687/leche-desnatada-calcio-hacendado-brick	t
773	25	1	Bebida láctea Omega 3 Puleva con leche desnatada	10.50	1.75	l	https://prod-mercadona.imgix.net/images/7c9553aed202938385ddf8f174e0c805.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10146/bebida-lactea-omega-3-puleva-con-leche-desnatada-pack-6	t
774	25	1	Bebida láctea Omega 3 Puleva con leche desnatada	1.75	1.75	l	https://prod-mercadona.imgix.net/images/af6b32b8e306c397ff7748e5e33e2b48.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10884/bebida-lactea-omega-3-puleva-con-leche-desnatada-brick	t
775	25	1	Leche desnatada calcio Puleva	9.54	1.59	l	https://prod-mercadona.imgix.net/images/0af745a1c148f57b6f06c5d3f0c46de1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10145/leche-desnatada-calcio-puleva-pack-6	t
776	25	1	Leche desnatada calcio Puleva	1.59	1.59	l	https://prod-mercadona.imgix.net/images/050be8ce1385d4b42f62ffb3188ece3f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10813/leche-desnatada-calcio-puleva-brick	t
777	25	1	Bebida láctea desnatada omega 3 Hacendado	7.02	1.17	l	https://prod-mercadona.imgix.net/images/2bb4da22e4b6c861592b3781871ed333.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10845/bebida-lactea-desnatada-omega-3-hacendado-pack-6	t
778	25	1	Bebida láctea desnatada omega 3 Hacendado	1.17	1.17	l	https://prod-mercadona.imgix.net/images/48f5f784bcfe007af2c49526c4c41309.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10846/bebida-lactea-desnatada-omega-3-hacendado-brick	t
779	25	1	Bebida láctea Omega 3 Puleva con nueces y leche desnatada	10.50	1.75	l	https://prod-mercadona.imgix.net/images/c49e6a513e35fde93bd8557ec42463c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10281/bebida-lactea-omega-3-puleva-con-nueces-leche-desnatada-pack-6	t
780	25	1	Bebida láctea Omega 3 Puleva con nueces y leche desnatada	1.75	1.75	l	https://prod-mercadona.imgix.net/images/8ef8d5777a1b0af5a70a3c411025cd40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10282/bebida-lactea-omega-3-puleva-con-nueces-leche-desnatada-brick	t
781	25	1	Leche en polvo desnatada	5.40	7.71	kg	https://prod-mercadona.imgix.net/images/17bd49f9b24aa0e4291b0b29ea497d12.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10414/leche-polvo-desnatada-paquete	t
782	25	1	Leche +Proteínas desnatada Hacendado	8.10	1.35	l	https://prod-mercadona.imgix.net/images/d470211a0604c39ba3ff5f5d6ee734ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10676/leche-proteinas-desnatada-hacendado-pack-6	t
783	25	1	Leche +Proteínas desnatada Hacendado	1.35	1.35	l	https://prod-mercadona.imgix.net/images/c4558a06013b7b9c1afb6d188f1692f2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10678/leche-proteinas-desnatada-hacendado-brick	t
784	25	1	Leche entera Asturiana	11.94	1.33	l	https://prod-mercadona.imgix.net/images/1860241e5b37a3893b3ce6814865d900.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10504/leche-entera-asturiana-pack-6	t
785	25	1	Leche entera Asturiana	1.99	1.33	l	https://prod-mercadona.imgix.net/images/17cee12d40332450b4bc4dbba8bee63f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10506/leche-entera-asturiana-botella	t
786	25	1	Leche entera sin lactosa Hacendado	6.24	1.04	l	https://prod-mercadona.imgix.net/images/16227e6ffd9278e3d1ff55fa8c86734b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10698/leche-entera-sin-lactosa-hacendado-pack-6	t
787	25	1	Leche entera sin lactosa Hacendado	1.04	1.04	l	https://prod-mercadona.imgix.net/images/0806acbc42778d7d0f63b6df45beec43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10699/leche-entera-sin-lactosa-hacendado-brick	t
788	25	1	Leche entera fresca Hacendado	1.15	1.15	l	https://prod-mercadona.imgix.net/images/d985ec1b5f0e21f2fe5e32857e5200af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10933/leche-entera-fresca-hacendado-botella	t
789	26	1	Bebida de avena Alitey	5.70	0.95	l	https://prod-mercadona.imgix.net/images/32186ccca22c37aad2a1bab07664e7a5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23908/bebida-avena-alitey-pack-6	t
790	26	1	Bebida de avena Alitey	0.95	0.95	l	https://prod-mercadona.imgix.net/images/e252b6be7d9649959660907f85a91be8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23912/bebida-avena-alitey-brick	t
791	26	1	Bebida de avena Alitey	1.50	2.00	l	https://prod-mercadona.imgix.net/images/0d7db282be8083e76a5d579dec6c9ade.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23046/bebida-avena-alitey-pack-3	t
792	26	1	Bebida de avena con calcio sin azúcares añadidos Hacendado	7.20	1.20	l	https://prod-mercadona.imgix.net/images/83b530034c84f1327f738eee7a20e584.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86168/bebida-avena-sin-azucares-anadidos-hacendado-pack-6	t
793	26	1	Bebida de avena con calcio sin azúcares añadidos Hacendado	1.20	1.20	l	https://prod-mercadona.imgix.net/images/6418531f9054c82e7084945ad9febc23.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86167/bebida-avena-sin-azucares-anadidos-hacendado-brick	t
794	26	1	Bebida de soja 0% azúcar Hacendado	4.50	0.75	l	https://prod-mercadona.imgix.net/images/78bb6c24a5d530445f7f3fbac945c0f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29322/bebida-soja-0-azucares-hacendado-pack-6	t
795	26	1	Bebida de soja 0% azúcar Hacendado	0.75	0.75	l	https://prod-mercadona.imgix.net/images/e52b8512bb74cadf327af67e174d5c52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29314/bebida-soja-0-azucares-hacendado-brick	t
796	26	1	Bebida de almendras 0% azúcar Hacendado	6.90	1.15	l	https://prod-mercadona.imgix.net/images/7f5b830fb950ac1a16d1dfed7f4a85b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23925/bebida-almendras-zero-hacendado-sin-azucares-sin-edulcorantes-anadidos-pack-6	t
797	26	1	Bebida de almendras 0% azúcar Hacendado	1.15	1.15	l	https://prod-mercadona.imgix.net/images/27f6eb89ac6b029a365db75392df373a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23926/bebida-almendras-zero-hacendado-sin-azucares-sin-edulcorantes-anadidos-brick	t
798	26	1	Bebida de arroz sin azúcares añadidos Hacendado	6.60	1.10	l	https://prod-mercadona.imgix.net/images/dcfdebb7a1671e785c4b7b00108e2aee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23048/bebida-arroz-sin-azucares-anadidos-hacendado-pack-6	t
799	26	1	Bebida de arroz sin azúcares añadidos Hacendado	1.10	1.10	l	https://prod-mercadona.imgix.net/images/d131c2686702a304e7cc1b7b1814244a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23047/bebida-arroz-sin-azucares-anadidos-hacendado-brick	t
800	26	1	Bebida de almendras con calcio Hacendado	6.90	1.15	l	https://prod-mercadona.imgix.net/images/e4a083b607ffb5a2235cadc434a932d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15647/bebida-almendras-hacendado-pack-6	t
801	26	1	Bebida de almendras con calcio Hacendado	1.15	1.15	l	https://prod-mercadona.imgix.net/images/e6d5007275dab302b4705da8a5db1382.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15648/bebida-almendras-hacendado-brick	t
802	26	1	Leche de coco Hacendado	1.45	3.63	l	https://prod-mercadona.imgix.net/images/f0fe95bc35585423693e4f29869627fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17174/leche-coco-dee-thai-bote	t
803	26	1	Bebida de coco y arroz sin azúcares añadidos Hacendado	9.60	1.60	l	https://prod-mercadona.imgix.net/images/7c35ba5dd79dbf94fdeb432d1f80106f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13847/bebida-coco-arroz-sin-azucares-anadidos-hacendado-pack-6	t
804	26	1	Bebida de coco y arroz sin azúcares añadidos Hacendado	1.60	1.60	l	https://prod-mercadona.imgix.net/images/c9d5c928c1099db31752e2e688d808a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13846/bebida-coco-arroz-sin-azucares-anadidos-hacendado-brick	t
805	26	1	Horchata de chufa Hacendado	1.35	1.35	l	https://prod-mercadona.imgix.net/images/e5828585becf129f783eca669ea72496.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5673/horchata-chufa-hacendado-brick	t
806	26	1	Bebida de avena con café Hacendado	0.90	3.60	l	https://prod-mercadona.imgix.net/images/82760f38aabf221eb490fb18ac860555.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10688/bebida-avena-con-cafe-hacendado-vaso	t
807	26	1	Bebida de avellana y arroz sin azúcares añadidos Hacendado	7.50	1.25	l	https://prod-mercadona.imgix.net/images/a45c6c0894a2635aad570cc9b30add0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13849/bebida-avellana-arroz-sin-azucares-anadidos-hacendado-pack-6	t
808	26	1	Bebida de avellana y arroz sin azúcares añadidos Hacendado	1.25	1.25	l	https://prod-mercadona.imgix.net/images/48f3b41650de1c5aab91011aceddc8d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13848/bebida-avellana-arroz-sin-azucares-anadidos-hacendado-brick	t
809	26	1	Bebida de soja sabor vainilla Hacendado 0% azúcar	6.60	1.10	l	https://prod-mercadona.imgix.net/images/acd838891f7f3c4f4605672a1a8f4c42.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67950/bebida-soja-sabor-vainilla-hacendado-0-azucar-pack-6	t
810	26	1	Bebida de soja sabor vainilla Hacendado 0% azúcar	1.10	1.10	l	https://prod-mercadona.imgix.net/images/dc5370e663f260c4cab07f1e51c35de6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67949/bebida-soja-sabor-vainilla-hacendado-0-azucar-brick	t
811	26	1	Bebida de avena Hacendado 0% azúcar	4.50	0.75	l	https://prod-mercadona.imgix.net/images/d37ca9bd4e181ab7c222ab18a0d579d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52639/bebida-avena-hacendado-0-azucar-pack-6	t
812	26	1	Bebida de avena Hacendado 0% azúcar	0.75	0.75	l	https://prod-mercadona.imgix.net/images/00dfbf377ed1f04756356386173ebe37.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52640/bebida-avena-hacendado-0-azucar-brick	t
813	26	1	Bebida de avena con chocolate sin azúcares añadidos Hacendado	1.25	1.25	l	https://prod-mercadona.imgix.net/images/c8b3efb7f03ee0cab25c2e56d2cb77cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52634/bebida-avena-con-chocolate-sin-azucares-anadidos-hacendado-brick	t
814	26	1	Bebida de avena con chocolate sin azúcares añadidos Hacendado	1.60	2.13	l	https://prod-mercadona.imgix.net/images/6d7385ce34d7f0c6e893179fc414fdc6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60926/bebida-avena-con-chocolate-sin-azucares-anadidos-hacendado-pack-3	t
815	25	1	Batido de chocolate Hacendado	1.55	1.29	l	https://prod-mercadona.imgix.net/images/09a66f3e6619ba853eb9d5775ea1c380.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10050/batido-chocolate-hacendado-pack-6	t
816	25	1	Batido de chocolate Hacendado	1.30	1.30	l	https://prod-mercadona.imgix.net/images/eae2a160d018b1c6b49b65aee8a11c79.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23049/batido-chocolate-hacendado-botella	t
817	25	1	Batido de chocolate 90% leche Hacendado	1.45	1.45	l	https://prod-mercadona.imgix.net/images/6132210119248dd5457342819fd26392.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23050/batido-chocolate-90-leche-hacendado-botella	t
818	25	1	Batido de chocolate 90% leche Hacendado	1.75	1.46	l	https://prod-mercadona.imgix.net/images/a1f0f20dfd294022344acb43427d9a18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10055/batido-chocolate-90-leche-hacendado-pack-6	t
819	25	1	Batido de chocolate 90% leche Puleva	2.50	2.08	l	https://prod-mercadona.imgix.net/images/118b04b2870df73a19605a8987545455.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10043/batido-chocolate-90-leche-puleva-pack-6	t
820	25	1	Batido sabor vainilla Hacendado	1.30	1.30	l	https://prod-mercadona.imgix.net/images/fc6008c7edf9fe7a4600ecb22491812c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23052/batido-sabor-vainilla-hacendado-botella	t
821	25	1	Batido sabor fresa Hacendado	1.30	1.30	l	https://prod-mercadona.imgix.net/images/26afc175f1198a7e222963bbc727fd96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23051/batido-sabor-fresa-hacendado-botella	t
822	25	1	Batido sabor fresa Hacendado	1.55	1.29	l	https://prod-mercadona.imgix.net/images/76eee68e2813738c601b5a91d0f94cb1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10054/batido-sabor-fresa-hacendado-pack-6	t
823	25	1	Bebida láctea crecimiento y desarrollo Puleva Max	10.74	1.79	l	https://prod-mercadona.imgix.net/images/a5aa00f5a001d8d0b4426a8a7f74f6c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10726/bebida-lactea-crecimiento-desarrollo-puleva-max-3-anos-pack-6	t
824	25	1	Bebida láctea crecimiento y desarrollo Puleva Max	1.79	1.79	l	https://prod-mercadona.imgix.net/images/63a31f1eab7450bc05d98750db05312d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10723/bebida-lactea-crecimiento-desarrollo-puleva-max-3-anos-brick	t
825	25	1	Bebida láctea con cereales crecimiento y desarrollo Puleva Max	11.34	1.89	l	https://prod-mercadona.imgix.net/images/897fd3211d65935ab4f089a0f9600095.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10820/bebida-lactea-con-cereales-crecimiento-desarrollo-puleva-max-3-anos-pack-6	t
826	25	1	Bebida láctea con cereales crecimiento y desarrollo Puleva Max	1.89	1.89	l	https://prod-mercadona.imgix.net/images/b4ab42c216768511e272f5d5c6b696c1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10781/bebida-lactea-con-cereales-crecimiento-desarrollo-puleva-max-3-anos-brick	t
827	25	1	Preparado lácteo crecimiento Peques 3 Puleva	11.34	1.89	l	https://prod-mercadona.imgix.net/images/f3cc514aaf94b626490339c53a0f8426.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9049/preparado-lacteo-crecimiento-peques-3-puleva-12-36-meses-pack-6	t
828	25	1	Preparado lácteo crecimiento Peques 3 Puleva	1.89	1.89	l	https://prod-mercadona.imgix.net/images/d5a1c7fde0736e47b3e5be274f77d7e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9040/preparado-lacteo-crecimiento-peques-3-puleva-12-36-meses-brick	t
829	25	1	Preparado lácteo con cereales crecimiento Peques 3 Puleva	11.34	1.89	l	https://prod-mercadona.imgix.net/images/e5e1301ff5e69ab5414099fb56077e0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9057/preparado-lacteo-con-cereales-crecimiento-peques-3-puleva-12-36-meses-pack-6	t
830	25	1	Preparado lácteo con cereales crecimiento Peques 3 Puleva	1.89	1.89	l	https://prod-mercadona.imgix.net/images/baacf218d2c86d98e969527f0fc9317a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9034/preparado-lacteo-con-cereales-crecimiento-peques-3-puleva-12-36-meses-brick	t
831	25	1	Preparado lácteo crecimiento Hacendado +1 año	8.40	1.40	l	https://prod-mercadona.imgix.net/images/ed4e235859bc9c08970385babaa0fdb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9187/preparado-lacteo-crecimiento-1-ano-hacendado-pack-6	t
832	25	1	Preparado lácteo crecimiento Hacendado +1 año	1.40	1.40	l	https://prod-mercadona.imgix.net/images/01c077a7a1d4408f51d3b03a924e68fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9188/preparado-lacteo-crecimiento-1-ano-hacendado-brick	t
833	25	1	Preparado lácteo con cereales crecimiento Hacendado +1 año	9.60	1.60	l	https://prod-mercadona.imgix.net/images/e699a50cc6e2a0cf252768c44dc58ee3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9398/preparado-lacteo-con-cereales-crecimiento-hacendado-1-ano-pack-6	t
834	25	1	Preparado lácteo con cereales crecimiento Hacendado +1 año	1.60	1.60	l	https://prod-mercadona.imgix.net/images/d20912c3ad645e1e9590a692d4ddce51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9397/preparado-lacteo-con-cereales-crecimiento-hacendado-1-ano-brick	t
835	25	1	Leche condensada Hacendado	3.60	3.60	kg	https://prod-mercadona.imgix.net/images/b6c7821e45659190d4af302c40508d34.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60348/leche-condensada-hacendado-bote	t
836	25	1	Leche condensada Hacendado	2.20	5.95	kg	https://prod-mercadona.imgix.net/images/1032cdb6c1a2d2555a933680e4ed418a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60347/leche-condensada-hacendado-bote	t
837	25	1	Leche condensada Hacendado	2.60	5.78	kg	https://prod-mercadona.imgix.net/images/e946b63ac639e0e856989870b08807cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60345/leche-condensada-hacendado-bote	t
838	25	1	Leche condensada desnatada Hacendado	2.60	5.78	kg	https://prod-mercadona.imgix.net/images/461642fceb3d080f2cd3e6f67fea3b6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60346/leche-condensada-desnatada-hacendado-bote	t
839	25	1	Crema de leche para café Campina	1.40	7.00	kg	https://prod-mercadona.imgix.net/images/d60fe3bcdd22baf485111a85653587d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10449/crema-leche-cafe-campina-paquete	t
840	25	1	Mantequilla sin sal añadida Hacendado	2.45	9.80	kg	https://prod-mercadona.imgix.net/images/8c11c0b183629fa23a4860057686e794.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60622/mantequilla-sin-sal-anadida-hacendado-tarrina	t
841	25	1	Mantequilla sin sal añadida Hacendado	2.10	8.40	kg	https://prod-mercadona.imgix.net/images/48232d267bc61b1c1f2d4c7a192fa37f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20716/mantequilla-sin-sal-anadida-hacendado-pastilla	t
842	25	1	Mantequilla con sal Hacendado	2.10	8.40	kg	https://prod-mercadona.imgix.net/images/4c4ad20a9ebac8f92af9581840223d6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20722/mantequilla-con-sal-hacendado-pastilla	t
843	25	1	Mantequilla con sal Hacendado	2.45	9.80	kg	https://prod-mercadona.imgix.net/images/e801657969dbb461a528968070340ffa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20727/mantequilla-con-sal-hacendado-tarrina	t
844	25	1	Mantequilla light Hacendado	2.15	8.60	kg	https://prod-mercadona.imgix.net/images/9c2765d17957bd0f97211d6f272e00a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90933/mantequilla-light-hacendado-tarrina	t
845	25	1	Mantequilla sin lactosa Hacendado	2.65	10.60	kg	https://prod-mercadona.imgix.net/images/798d8bc0800bb32cfb0212e1dc9d804c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20991/mantequilla-sin-lactosa-hacendado-tarrina	t
846	25	1	Margarina Tulipán Original	2.95	7.38	kg	https://prod-mercadona.imgix.net/images/3cceb0f1e6afce6f8c9571c9f5097156.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86505/margarina-tulipan-original-tarrina	t
847	25	1	Margarina con sal Hacendado	1.50	3.00	kg	https://prod-mercadona.imgix.net/images/04d9842e282309e84cf1b5fbb241180f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60307/margarina-con-sal-hacendado-tarrina	t
848	25	1	Margarina ligera Hacendado	1.45	2.90	kg	https://prod-mercadona.imgix.net/images/8ab3558b3fa29363c210a64c1b3cab07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20876/margarina-ligera-hacendado-tarrina	t
849	25	1	Margarina Flora Proactiv	3.19	14.18	kg	https://prod-mercadona.imgix.net/images/ab4a5de85d9c4ec0deae8719d2bc2ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15909/margarina-flora-proactiv-tarrina	t
850	25	1	Margarina con sal Tulipán	2.95	7.38	kg	https://prod-mercadona.imgix.net/images/fe6edb6822c9ea191bc3093ae9dd4d27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86504/margarina-con-sal-tulipan-tarrina	t
851	25	1	Margarina 100% vegetal Hacendado	1.60	6.40	kg	https://prod-mercadona.imgix.net/images/f72994ef2d7126ccb4172d452978fa21.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20196/margarina-100-vegetal-hacendado-tarrina	t
852	25	1	Margarina Omega 3 Hacendado	1.85	3.70	kg	https://prod-mercadona.imgix.net/images/df87fc53edae461927015c04ca30b198.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9824/margarina-omega-3-hacendado-tarrina	t
853	25	1	Nata ligera para cocinar Hacendado	1.85	3.08	l	https://prod-mercadona.imgix.net/images/a889e74c8124bd110a748bc3ac8df440.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10199/nata-ligera-cocinar-hacendado-pack-3	t
854	25	1	Nata ligera para cocinar Hacendado	1.55	3.10	l	https://prod-mercadona.imgix.net/images/f451d3695c8b94b17cb61540de841da8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10161/nata-ligera-cocinar-hacendado-brick	t
855	25	1	Nata montada azucarada Hacendado	1.50	6.00	kg	https://prod-mercadona.imgix.net/images/892e7e611df692289b064ebcf2a8c806.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13598/nata-montada-azucarada-hacendado-spray	t
856	25	1	Nata fresca para cocinar Hacendado	1.30	6.60	kg	https://prod-mercadona.imgix.net/images/108f4b61a8ddeca7146ea3cf0622921d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10117/nata-fresca-cocinar-hacendado-tarrina	t
857	25	1	Crema de soja Hacendado	1.10	5.50	l	https://prod-mercadona.imgix.net/images/6c9d1454ee4e642fc922098307da399a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10376/crema-soja-hacendado-brick	t
858	26	1	Leche de coco Hacendado	1.45	3.63	l	https://prod-mercadona.imgix.net/images/f0fe95bc35585423693e4f29869627fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17174/leche-coco-dee-thai-bote	t
859	38	1	Huevos	5.60	0.23	ud	https://prod-mercadona.imgix.net/images/bdad77c847511bc5d6fa8e5fcc533823.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/30167/huevos-tamanos-diferentes-paquete	t
860	38	1	Huevos super grandes XL	4.30	0.36	ud	https://prod-mercadona.imgix.net/images/a13de75b46324245bd99979ec396cb7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31592/huevos-super-grandes-xl-paquete	t
861	38	1	Huevos grandes L	3.20	0.27	ud	https://prod-mercadona.imgix.net/images/8d265b91ecf1a87f29938a246302b93c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31504/huevos-grandes-l-paquete	t
862	38	1	Huevos grandes L	1.80	0.30	ud	https://prod-mercadona.imgix.net/images/46ee35a145ca8f1985b9819a3e3fffb7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31540/huevos-grandes-l-paquete	t
863	38	1	Huevos medianos M	3.00	0.25	ud	https://prod-mercadona.imgix.net/images/59b82df8da2f6b5c9ab7e0183a8894c6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31505/huevos-medianos-m-paquete	t
864	38	1	Huevos de gallinas camperas	3.50	0.29	ud	https://prod-mercadona.imgix.net/images/e3bd95068d04d84e1aac545314786126.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15768/huevos-gallinas-camperas-paquete	t
865	38	1	Huevos de gallinas camperas	2.10	0.35	ud	https://prod-mercadona.imgix.net/images/daf6a1cc96954346430dc055b82dff56.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31310/huevos-gallinas-camperas-paquete	t
866	38	1	Huevos cocidos	2.20	0.37	ud	https://prod-mercadona.imgix.net/images/415028c8977c97560369dcebb4c2357d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31010/huevos-cocidos-paquete	t
867	38	1	Huevos de codorniz	1.85	0.10	ud	https://prod-mercadona.imgix.net/images/f884227376ae28f6d79420714cad0f6a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31011/huevos-codorniz-paquete	t
868	38	1	Claras de huevo líquidas pasteurizadas	2.85	2.85	l	https://prod-mercadona.imgix.net/images/cde7e603fa71c589abe8e10279bd36ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31312/claras-huevo-liquidas-pasteurizadas-botella	t
869	38	1	Claras de huevo líquidas pasteurizadas	1.70	5.67	l	https://prod-mercadona.imgix.net/images/b40abf149eb42080eb449e0bdc83bda0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/31309/claras-huevo-liquidas-pasteurizadas-botella	t
870	15	1	Cereales rellenos de leche Hacendado	2.40	4.80	kg	https://prod-mercadona.imgix.net/images/f28fce2e1849905d03b85683e4407734.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9264/cereales-rellenos-leche-hacendado-caja	t
871	15	1	Mini cereales rellenos de leche Hacendado	1.95	11.14	kg	https://prod-mercadona.imgix.net/images/c3ee3973b93c5c7a2b7c136f145bc3d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9333/mini-cereales-rellenos-leche-hacendado-caja	t
872	15	1	Cereales rellenos de chocolate y avellana Hacendado	2.10	4.20	kg	https://prod-mercadona.imgix.net/images/bfd940e46de1fdc0c05b91750161f379.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9377/cereales-rellenos-chocolate-avellana-hacendado-paquete	t
873	15	1	Cereales estrellas de maíz Stars Hacendado con miel	2.10	5.25	kg	https://prod-mercadona.imgix.net/images/3cc53c61c022b13a42b12f9dfa87f355.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80515/cereales-estrellas-maiz-stars-hacendado-con-miel-caja	t
874	15	1	Cereales copos de maíz Corn Flakes Hacendado 0% azúcares añadidos	1.50	3.00	kg	https://prod-mercadona.imgix.net/images/413f941aa57b4903cc693d93171b87f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22966/cereales-copos-maiz-corn-flakes-hacendado-0-azucares-anadidos-caja	t
875	15	1	Cereales copos de maíz Corn Flakes Kellogg's	3.00	6.00	kg	https://prod-mercadona.imgix.net/images/2692711f88c9f20e6004998019e64504.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9210/cereales-copos-maiz-corn-flakes-kelloggs-caja	t
876	15	1	Cereales de arroz inflado Choco Krispies Kellogg's con chocolate	2.95	7.02	kg	https://prod-mercadona.imgix.net/images/3aa570213697c9cd80248d024110faf1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35987/cereales-arroz-inflado-choco-krispies-kelloggs-con-chocolate-caja	t
877	15	1	Cereales copos de trigo Chocodays Hacendado con chocolate	2.00	4.00	kg	https://prod-mercadona.imgix.net/images/b993cc6e84c05e720f2a69794c345ca2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9508/cereales-copos-trigo-chocodays-hacendado-con-chocolate-caja	t
878	15	1	Cereales rellenos de crema de cacao y avellana Hacendado sin gluten	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/59e8c16311be455d779e8aa3fb9ad9bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9547/cereales-rellenos-crema-cacao-avellana-hacendado-sin-gluten-paquete	t
879	15	1	Copos de avena sin gluten Hacendado	2.10	4.20	kg	https://prod-mercadona.imgix.net/images/d4337bb397a1e7f50b9a5f9e7bc175a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86368/copos-avena-hacendado-paquete	t
880	15	1	Copos de avena Brüggen	1.35	1.69	kg	https://prod-mercadona.imgix.net/images/98910a7833008eddea7deffc843ffac7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86341/copos-avena-bruggen-caja	t
881	15	1	Cereales copos de trigo integral y arroz Special K Classic	2.50	5.56	kg	https://prod-mercadona.imgix.net/images/7217d5cc7c1294828207ae7eab262d1e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35707/cereales-copos-trigo-integral-arroz-special-k-classic-kelloggs-caja	t
882	15	1	Muesli Crunchy Hacendado con chocolate	2.35	4.70	kg	https://prod-mercadona.imgix.net/images/3d93c78bdee2295299fbdca9332e7439.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9355/muesli-crunchy-hacendado-con-chocolate-15-chocolate-paquete	t
883	15	1	Cereales copos de trigo integral y arroz Hacendado 0% azúcares añadidos	2.00	4.00	kg	https://prod-mercadona.imgix.net/images/b911f6af2c54a9e27b676aef897ba8ff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9488/cereales-copos-trigo-integral-arroz-hacendado-0-azucares-anadidos-linnea-v-caja	t
884	15	1	Cereales copos de trigo espelta integral Hacendado 0% azúcares añadidos	1.70	4.25	kg	https://prod-mercadona.imgix.net/images/228d3a9046ad302f21ad6b4263fadb6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9571/cereales-copos-trigo-espelta-integral-hacendado-0-azucares-anadidos-paquete	t
885	15	1	Muesli Crunchy Hacendado con frutos secos	2.10	4.20	kg	https://prod-mercadona.imgix.net/images/18d5b970222faedca31cbdfb5e3848f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9357/muesli-crunchy-hacendado-con-frutos-secos-paquete	t
886	15	1	Muesli Crunchy Hacendado 0% azúcares añadidos y 0% edulcorantes	2.00	4.00	kg	https://prod-mercadona.imgix.net/images/d3627a1eebb71068382afc102707b4a5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35892/muesli-crunchy-hacendado-0-azucares-anadidos-0-edulcorantes-paquete	t
887	15	1	Cereales copos de trigo integral y arroz Hacendado bañados en chocolate con leche	2.65	7.07	kg	https://prod-mercadona.imgix.net/images/5ef3d3435e4f02a3589a3745a9891faa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9487/cereales-copos-trigo-integral-arroz-hacendado-banados-chocolate-con-leche-linnea-v-caja	t
888	15	1	Cereales copos tostados de trigo integral y arroz Hacendado con chocolate	2.30	5.41	kg	https://prod-mercadona.imgix.net/images/1bd07524e377881e474d3788346a17d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52772/cereales-copos-tostados-trigo-integral-arroz-hacendado-con-chocolate-caja	t
889	15	1	Muesli Crunchy Hacendado con fruta	2.10	4.20	kg	https://prod-mercadona.imgix.net/images/beb80ebf53bbc0cbafbd2343731775e2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9356/muesli-crunchy-hacendado-con-fruta-paquete	t
890	15	1	Avena molida Hacendado	1.15	2.30	kg	https://prod-mercadona.imgix.net/images/ac09f887690d869a4c7d0ac036a412c6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16807/avena-molida-hacendado-paquete	t
891	15	1	Cereales y semillas granola Hacendado con frutos secos	2.40	6.00	kg	https://prod-mercadona.imgix.net/images/3fa7d2aba174a6c5255fa0cb14751ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9474/cereales-semillas-granola-hacendado-con-frutos-secos-bajo-azucar-paquete	t
892	15	1	Cereales con salvado de trigo Fibra Sticks Hacendado	1.80	3.60	kg	https://prod-mercadona.imgix.net/images/b5518ded2106b798ac79f936a4512d73.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60236/cereales-con-salvado-trigo-fibra-sticks-hacendado-caja	t
893	15	1	Muesli Hacendado con frutas	2.40	2.40	kg	https://prod-mercadona.imgix.net/images/70a636d2cd573150d0eb69c60b12d6cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9491/muesli-hacendado-con-frutas-paquete	t
894	15	1	Muesli Hacendado 50% frutas y frutos secos	2.10	4.20	kg	https://prod-mercadona.imgix.net/images/6d11cb2a9f9b506f5294245d449ce962.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9492/muesli-hacendado-50-frutas-frutos-secos-paquete	t
895	15	1	Cereales Cereal Mix Hacendado 0% azúcares añadidos	2.40	6.40	kg	https://prod-mercadona.imgix.net/images/db82637b4d7ecad929dfe2008794371f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9532/cereales-cereal-mix-hacendado-0-azucares-anadidos-paquete	t
896	15	1	Cereales avena Crunchy Hacendado	1.90	4.75	kg	https://prod-mercadona.imgix.net/images/2efe810b6483e668c6638f403f9e41c8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15611/cereales-avena-crunchy-hacendado-85-avena-integral-bajo-contenido-azucar-caja	t
897	15	1	Cereales avena Crunchy Hacendado de cacao	2.15	5.38	kg	https://prod-mercadona.imgix.net/images/2fd7905a5c3825481029c3588a8be900.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52751/cereales-avena-crunchy-hacendado-cacao-caja	t
898	15	1	Barritas de cereales Hacendado chocolate con leche	1.55	12.92	kg	https://prod-mercadona.imgix.net/images/d873cc7c5f9b10efd6967eccf90e1511.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9350/barritas-cereales-hacendado-chocolate-con-leche-caja	t
899	15	1	Barritas de cereales Hacendado con chocolate blanco	1.55	12.20	kg	https://prod-mercadona.imgix.net/images/683a1de51d7829b9998c29261d364ccf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73249/barritas-cereales-hacendado-con-chocolate-blanco-caja	t
900	15	1	Barritas de cereales muesli Hacendado con chocolate	1.55	11.23	kg	https://prod-mercadona.imgix.net/images/1edf7bf3abadebff9103681195379584.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9349/barritas-cereales-muesli-hacendado-con-chocolate-caja	t
901	15	1	Barritas de cereales con frutos secos Hacendado	1.65	11.00	kg	https://prod-mercadona.imgix.net/images/55ba625ed8baee3f6cf50363a463fe9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52493/barritas-cereales-con-frutos-secos-hacendado-caja	t
902	15	1	Barritas con proteínas Enervit Sport sabor coco y chocolate	3.60	30.00	kg	https://prod-mercadona.imgix.net/images/1991058d642d7c44258039986faec5af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9445/barritas-con-proteinas-enervit-sport-sabor-coco-chocolate-caja	t
903	15	1	Barritas de espelta Hacendado sabor manzana	1.55	12.92	kg	https://prod-mercadona.imgix.net/images/131bd9ed5a4ec6f5de2ef4fac6f53420.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35917/barritas-espelta-hacendado-sabor-manzana-0-azucares-anadidos-caja	t
904	15	1	Barritas de galleta rellenas de arándanos Hacendado	1.55	12.40	kg	https://prod-mercadona.imgix.net/images/bc497eb0b952cf2bbd08e0e3d7f6e991.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52494/barritas-galleta-rellenas-arandanos-hacendado-caja	t
905	15	1	Barritas de cereales Hacendado sabor mango	1.65	13.75	kg	https://prod-mercadona.imgix.net/images/ad619b9e185f4acc9cc8cc6bbd846f84.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7975/barritas-cereales-hacendado-sabor-mango-0-azucares-anadidos-caja	t
906	15	1	Barritas de cereales con galleta animada Hacendado	1.55	12.92	kg	https://prod-mercadona.imgix.net/images/572eb122793b6357ead9d4d0155a1425.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13052/barritas-cereales-con-galleta-animada-hacendado-caja	t
907	15	1	Barritas de avena Crunchy Nature Valley con chocolate negro	1.95	9.29	kg	https://prod-mercadona.imgix.net/images/ab5be32491002de5c7fddad34d25fde4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14713/barritas-avena-crunchy-nature-valley-con-chocolate-negro-caja	t
908	15	1	Tortitas de maíz Hacendado	1.10	9.17	kg	https://prod-mercadona.imgix.net/images/0df71a709838dfb992e439f27e3828d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14158/tortitas-maiz-hacendado-paquete	t
909	15	1	Tortitas de maíz con chocolate Hacendado	1.90	14.62	kg	https://prod-mercadona.imgix.net/images/41e7c23025f97cdb4da0c7fad37fa79b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14015/tortitas-maiz-con-chocolate-hacendado-paquete	t
910	15	1	Tortitas de arroz con chocolate blanco sabor yogur Hacendado	1.90	15.83	kg	https://prod-mercadona.imgix.net/images/06d5eaf5e7e3c88e3ccfe35f77c42e5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14141/tortitas-arroz-con-chocolate-blanco-sabor-yogur-hacendado-paquete	t
911	15	1	Tortitas de arroz Hacendado	1.10	8.87	kg	https://prod-mercadona.imgix.net/images/a202828b49681aeceaa281bc820c1a18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14013/tortitas-arroz-hacendado-paquete	t
912	15	1	Tortitas de arroz con chocolate con leche Hacendado	1.90	14.62	kg	https://prod-mercadona.imgix.net/images/992741048a0d81f6679873fd3eae9bd5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14142/tortitas-arroz-con-chocolate-con-leche-hacendado-paquete	t
913	15	1	Tortitas de legumbres y arroz Hacendado	1.75	16.06	kg	https://prod-mercadona.imgix.net/images/83544f58c2cff5206720c5d58a5d0f3f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86483/tortitas-legumbres-arroz-hacendado-paquete	t
914	15	1	Tortitas de maíz con sabor a jamón Hacendado	1.75	12.50	kg	https://prod-mercadona.imgix.net/images/0973b89ef01a231223178e04aeb3ceec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35776/tortitas-maiz-con-sabor-jamon-hacendado-paquete	t
915	15	1	Tortitas de maíz campestre Hacendado	1.75	12.50	kg	https://prod-mercadona.imgix.net/images/d649c895d3ea7e28ca987ab86633f0da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14786/tortitas-maiz-campestre-hacendado-paquete	t
916	15	1	Galletas María dorada Hacendado	1.40	1.75	kg	https://prod-mercadona.imgix.net/images/55efb2a2e65c2bc310d6b72853663cc5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14132/galletas-maria-dorada-hacendado-paquete	t
917	15	1	Galletas Divertidas con cereales Hacendado	1.90	4.62	kg	https://prod-mercadona.imgix.net/images/325a07489ba4ebb282513a0c10e8e8c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22688/galletas-divertidas-con-cereales-hacendado-caja	t
918	15	1	Galletas tostadas Tosta Rica	2.95	5.18	kg	https://prod-mercadona.imgix.net/images/e3e73dbb54453a3fc7d187dec30f4c21.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14087/galletas-tostadas-tosta-rica-cuetara-caja	t
919	15	1	Galletas tostadas Animadas Hacendado	1.85	2.31	kg	https://prod-mercadona.imgix.net/images/a210646f930055d1abf0f503ec3b5da6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86913/galletas-tostadas-animadas-hacendado-paquete	t
920	15	1	Galletas tostadas Hacendado	1.40	1.75	kg	https://prod-mercadona.imgix.net/images/77ba5287d7a07ad9e21c39a6df0466b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14325/galletas-tostadas-hacendado-paquete	t
921	15	1	Galletas Relieve Hacendado	1.40	2.17	kg	https://prod-mercadona.imgix.net/images/b01e6fe794c95678d2e5605dbb929e1c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14197/galletas-relieve-hacendado-paquete	t
922	15	1	Galletas María dorada Hacendado 0% azúcares añadidos	1.50	3.75	kg	https://prod-mercadona.imgix.net/images/5927f1495c4552e57fd8a30827497e34.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13502/galletas-maria-dorada-hacendado-0-azucares-anadidos-caja	t
923	15	1	Galletas María sin gluten y sin lactosa Hacendado	1.60	7.80	kg	https://prod-mercadona.imgix.net/images/ef9269e1c7f037d478f1329b5b762c14.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14235/galletas-maria-sin-gluten-sin-lactosa-hacendado-paquete	t
924	15	1	Galletas tradicionales Hacendado	2.15	3.58	kg	https://prod-mercadona.imgix.net/images/7c70d7b0b6c3cf2795d0be29a6112004.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14423/galletas-tradicionales-hacendado-caja	t
925	15	1	Galletas canela Hacendado	1.50	3.00	kg	https://prod-mercadona.imgix.net/images/b9f1d1bbf52dcae359dcad5c8677f1db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14430/galletas-canela-hacendado-caja	t
926	15	1	Galletas caramelizadas Lotus Biscoff	1.60	8.60	kg	https://prod-mercadona.imgix.net/images/5563e0f563ab97a575c2842aec27303a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14140/galletas-caramelizadas-lotus-biscoff-paquete	t
927	15	1	Galletas de mantequilla Hacendado Belgas	1.65	9.17	kg	https://prod-mercadona.imgix.net/images/54465354f40024cfb25d5af62dbe7132.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14581/galletas-mantequilla-hacendado-belgas-caja	t
928	15	1	Pastas de aceite Hacendado	1.25	5.00	kg	https://prod-mercadona.imgix.net/images/387b56ecbbcd28b1c171be0ada5d0ff4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60586/pastas-aceite-hacendado-caja	t
929	15	1	Galletas Digestive Hacendado	1.60	2.00	kg	https://prod-mercadona.imgix.net/images/e5a4722396e968e9f87104e663a56c13.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14214/galletas-digestive-hacendado-paquete	t
930	15	1	Galletas Digestive avena Hacendado	1.00	2.35	kg	https://prod-mercadona.imgix.net/images/2c600264c524fe6816b355533474d814.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14213/galletas-digestive-avena-hacendado-paquete	t
931	15	1	Galletas Digestive 0% azúcares añadidos Hacendado	1.40	3.50	kg	https://prod-mercadona.imgix.net/images/29c34f080618e9f33361771d5683e210.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14200/galletas-digestive-0-azucares-anadidos-hacendado-paquete	t
932	15	1	Galletas de espelta Hacendado 0% azúcares añadidos	1.25	6.25	kg	https://prod-mercadona.imgix.net/images/f4728c6877bec8f45d07ee1ddbab02fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14242/galletas-espelta-hacendado-0-azucares-anadidos-paquete	t
933	15	1	Galletas María Integral Hacendado	1.40	1.75	kg	https://prod-mercadona.imgix.net/images/7a10f865153c5691732b55b31fb7c023.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14006/galletas-maria-integral-hacendado-paquete	t
934	15	1	Galletas Cookies Hacendado	1.45	6.44	kg	https://prod-mercadona.imgix.net/images/8ce98b32ae942aa485f68c03e674f858.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14212/galletas-cookies-hacendado-40-pepitas-chocolate-paquete	t
935	15	1	Galletas mini cookies Hacendado	1.40	8.75	kg	https://prod-mercadona.imgix.net/images/cd39afc44412e0786e9830d6d7e960a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14161/galletas-mini-cookies-hacendado-caja	t
936	15	1	Galletas rebuenas Hacendado rellenas de chocolate	1.30	2.60	kg	https://prod-mercadona.imgix.net/images/77aa3673bc39603fc56d5bfc3abf197a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14157/galletas-rebuenas-hacendado-rellenas-chocolate-paquete	t
937	15	1	Galletas Chocominis sabor chocolate Hacendado	1.85	3.70	kg	https://prod-mercadona.imgix.net/images/e81ffcff703d3756edd2d52e5c8a50dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14159/galletas-chocominis-sabor-chocolate-hacendado-caja	t
938	15	1	Galletas Digestive chocolate con leche Hacendado	1.40	4.67	kg	https://prod-mercadona.imgix.net/images/165052e5b4463757fa110324effa2dc0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14131/galletas-digestive-chocolate-con-leche-hacendado-paquete	t
939	15	1	Galletas Roditas bañadas con chocolate blanco Hacendado	2.20	7.33	kg	https://prod-mercadona.imgix.net/images/bf66850ad09b5446b92c013c7426270d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13811/galletas-roditas-banadas-con-chocolate-blanco-hacendado-caja	t
940	15	1	Galletas mini caritas Hacendado con crema de cacao	1.40	4.26	kg	https://prod-mercadona.imgix.net/images/0a600d4d3c2f924da76e5d332c73c42d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14085/galletas-mini-caritas-hacendado-con-crema-cacao-caja	t
941	15	1	Galletas Choco negro con chocolatina Hacendado	1.40	9.33	kg	https://prod-mercadona.imgix.net/images/d25d7f175088776a80ff69d2c4569b32.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14639/galletas-choco-negro-con-chocolatina-hacendado-caja	t
942	15	1	Barritas de galleta bañadas en chocolate con leche Chips Ahoy	1.50	10.71	kg	https://prod-mercadona.imgix.net/images/fc1f3da1290f5b6e78f240714ebe9094.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14133/barritas-galleta-banadas-chocolate-con-leche-chips-ahoy-caja	t
943	15	1	Galletas con chocolate y crema de leche Hacendado	2.65	9.89	kg	https://prod-mercadona.imgix.net/images/507271ff3760f7aafa67951e0fc6b219.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14038/galletas-con-chocolate-crema-leche-hacendado-caja	t
944	15	1	Galletas rellenas de chocolate Hacendado 0% azúcares añadidos	1.40	5.60	kg	https://prod-mercadona.imgix.net/images/cd9fccc304c39bfe038f69a1890ef243.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15844/galletas-rellenas-chocolate-hacendado-0-azucares-anadidos-paquete	t
945	15	1	Barquillos rellenos sabor nata Hacendado	1.00	4.76	kg	https://prod-mercadona.imgix.net/images/657237a00e02650cc2f8cbbf9d04ae47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14576/barquillos-rellenos-sabor-nata-hacendado-paquete	t
946	15	1	Barquillos rellenos con crema de cacao Hacendado	1.00	5.71	kg	https://prod-mercadona.imgix.net/images/f399b0865ad23b6df2245a647be537e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14239/barquillos-rellenos-con-crema-cacao-hacendado-paquete	t
947	15	1	Galletas con chocolate blanco Hacendado	1.40	5.93	kg	https://prod-mercadona.imgix.net/images/a6b5344fd22d79ca6ec8ad94d12feadb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14151/galletas-con-chocolate-blanco-hacendado-caja	t
948	15	1	Galletas Digestive avena chocolate con leche Hacendado	1.60	5.71	kg	https://prod-mercadona.imgix.net/images/bc86d55631b050ed5fddbd75adb3ef66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52594/galletas-digestive-avena-chocolate-con-leche-hacendado-paquete	t
949	15	1	Barquillos rellenos de nata Hacendado 0% azúcares añadidos	1.10	5.24	kg	https://prod-mercadona.imgix.net/images/52b9d6d6eb268af80e7597356a50ad4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14136/barquillos-rellenos-nata-hacendado-0-azucares-anadidos-paquete	t
950	15	1	Galletas cookies sin gluten y sin lactosa Hacendado	2.05	10.25	kg	https://prod-mercadona.imgix.net/images/5aa1b9df52517498adddb0ed8d4bebb0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14637/galletas-cookies-sin-gluten-sin-lactosa-hacendado-paquete	t
951	15	1	Galletas Choco leche con chocolatina Hacendado	1.40	9.33	kg	https://prod-mercadona.imgix.net/images/8391b82efd2c1caf4348ee2a05c8fd01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14641/galletas-choco-leche-con-chocolatina-hacendado-caja	t
952	15	1	Galletas María choco Hacendado	1.10	4.15	kg	https://prod-mercadona.imgix.net/images/e9cb96fbe07dd431f5868c91b8cdd03e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14203/galletas-maria-choco-hacendado-paquete	t
953	15	1	Tartaletas con relleno de fresa Hacendado	1.05	7.00	kg	https://prod-mercadona.imgix.net/images/ac82b496a41f9ae75007d5cb2d1153db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14173/tartaletes-con-relleno-fresa-hacendado-paquete	t
954	15	1	Barquillos con crema de avellanas Hacendado	1.60	6.40	kg	https://prod-mercadona.imgix.net/images/c51ba88a8aa175eeea842266506ef7bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14241/barquillos-con-crema-avellanas-hacendado-paquete	t
955	15	1	Galletas Diverkao Hacendado	1.70	5.45	kg	https://prod-mercadona.imgix.net/images/730ca67f982440e115d9156c3628c584.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13600/galletas-diverkao-hacendado-caja	t
956	15	1	Tubitos bañados chocolate negro Hacendado	2.75	18.33	kg	https://prod-mercadona.imgix.net/images/a7fbdeefa5a02ae6576d40a3bdb98b0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14555/tubitos-banados-chocolate-negro-hacendado-ideal-postres-helados-bote	t
957	15	1	Rosquillas de chocolate con leche y coco Hacendado	1.75	5.83	kg	https://prod-mercadona.imgix.net/images/b5cc245fcd571b06777d72c09c1493f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13656/rosquillas-chocolate-con-leche-coco-hacendado-caja	t
958	15	1	Galletas Crunchy Choc Hacendado	2.65	5.10	kg	https://prod-mercadona.imgix.net/images/c7ee4c98a6286f88e8a2a6c86e63a892.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23064/galletas-crunchy-choc-hacendado-con-arroz-inflado-chocolateado-chips-chocolate-caja	t
959	15	1	Galletas Divertidas chocolate con leche Hacendado	1.95	7.77	kg	https://prod-mercadona.imgix.net/images/51d47accde858f947c0e6c9cb093a70a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52592/galletas-divertidas-chocolate-con-leche-hacendado-caja	t
960	15	1	Galletas Choco con relleno de crema de cacao Hacendado recubiertas de chocolate con leche	1.70	11.72	kg	https://prod-mercadona.imgix.net/images/9cc2b86fdfda6624b109f7f059d478a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52876/galletas-choco-con-relleno-crema-cacao-hacendado-recubiertas-chocolate-con-leche-paquete	t
961	15	1	Galletas Cream Cookies Hacendado	1.45	9.06	kg	https://prod-mercadona.imgix.net/images/5d7dbc34be2276be60e7e45ce0574bf9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52877/galletas-cream-cookies-hacendado-12-chocolate-negro-24-relleno-chocolate-blanco-paquete	t
962	15	1	Surtido de galletas y barquillos Hacendado	2.20	4.40	kg	https://prod-mercadona.imgix.net/images/35255774d8971d460f7b63f9f56ce55b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14711/surtido-galletas-barquillos-hacendado-paquete	t
963	15	1	Surtido de pastas artesanas Hacendado	2.35	4.70	kg	https://prod-mercadona.imgix.net/images/37d855a8c044c7a1230bfbc23efc5ec0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14587/surtido-pastas-artesanas-hacendado-caja	t
964	15	1	Obleas redondas Hacendado	2.45	9.61	kg	https://prod-mercadona.imgix.net/images/6f543261b3fdd213762276efb438481f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14645/obleas-redondas-hacendado-paquete	t
965	15	1	Obleas para helado Hacendado	0.70	13.46	kg	https://prod-mercadona.imgix.net/images/7b42c3270718d22d03263dc39d1ce6b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15953/obleas-helado-hacendado-paquete	t
966	15	1	Tubitos Hacendado	2.05	11.71	kg	https://prod-mercadona.imgix.net/images/eacd55b30b797af904e330125f217027.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/36205/tubitos-hacendado-ideal-postres-helados-bote	t
967	11	1	Café en cápsula extra fuerte Hacendado	3.80	0.19	kg	https://prod-mercadona.imgix.net/images/8836704e3028b75f1b367a9984528e43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10350/cafe-capsula-extra-fuerte-hacendado-compatibles-maquinas-nespresso-caja	t
968	11	1	Café en cápsula descafeinado Hacendado	3.85	0.19	kg	https://prod-mercadona.imgix.net/images/dd84f71224c87ca3675092c9d8f31090.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10355/cafe-capsula-descafeinado-hacendado-compatibles-maquinas-nespresso-caja	t
969	11	1	Café en cápsula Colombia Hacendado	3.80	0.19	kg	https://prod-mercadona.imgix.net/images/2e10cf88be65aae55bb5dca24088e75f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9847/cafe-capsula-colombia-hacendado-compatibles-maquinas-nespresso-caja	t
970	11	1	Café en cápsula espresso Hacendado	3.80	0.19	kg	https://prod-mercadona.imgix.net/images/c23954afb6d5cbe7d72446155f5f7122.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10352/cafe-capsula-espresso-hacendado-compatibles-maquinas-nespresso-caja	t
971	11	1	Café en cápsula ristretto Hacendado	3.80	0.19	kg	https://prod-mercadona.imgix.net/images/89a2bd9abd1c25f1e322a2cb14846e38.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19940/cafe-capsula-ristretto-hacendado-compatibles-maquinas-nespresso-caja	t
972	11	1	Café en cápsulas doble espresso Hacendado	3.80	0.19	kg	https://prod-mercadona.imgix.net/images/eee9fb13727dfaf5ff08874ff26b3636.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52774/cafe-capsulas-doble-espresso-hacendado-compatibles-maquinas-nespresso-caja	t
973	11	1	Café en cápsula descafeinado espresso Hacendado	3.85	0.19	kg	https://prod-mercadona.imgix.net/images/8b2f0bfbdc524b99dd45cb041e9f0adc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13596/cafe-capsula-descafeinado-espresso-hacendado-compatibles-maquinas-nespresso-caja	t
974	11	1	Café en cápsula espresso intenso Dolce Gusto	4.95	0.31	kg	https://prod-mercadona.imgix.net/images/aa6a65a000f8e78b425d1dec784b0719.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11931/cafe-capsula-espresso-intenso-dolce-gusto-caja	t
975	11	1	Café en cápsula extra forte Hacendado	3.55	31.70	kg	https://prod-mercadona.imgix.net/images/17d4cd219a2cceab5a23c8a16365e147.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13636/cafe-capsula-extra-forte-hacendado-compatibles-maquinas-dolce-gusto-caja	t
976	11	1	Café en cápsula forte Hacendado	3.55	31.70	kg	https://prod-mercadona.imgix.net/images/74b8483ab4c065c8001e564b019419b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13635/cafe-capsula-forte-hacendado-compatibles-maquinas-dolce-gusto-caja	t
977	11	1	Café en cápsula classic Hacendado	3.55	31.70	kg	https://prod-mercadona.imgix.net/images/d17e50f729d012761e33c7b08af76dd2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13634/cafe-capsula-classic-hacendado-compatibles-maquinas-dolce-gusto-caja	t
978	11	1	Café en cápsula descafeinado espresso intenso Dolce Gusto	4.95	0.31	kg	https://prod-mercadona.imgix.net/images/0d9cba4243e4990b301d0f828ba59254.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11869/cafe-capsula-descafeinado-espresso-intenso-dolce-gusto-caja	t
979	11	1	Café con leche en cápsula Dolce Gusto	4.95	0.31	kg	https://prod-mercadona.imgix.net/images/83315ec5617bebe8e48783333afee21d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11801/cafe-con-leche-capsula-dolce-gusto-caja	t
980	11	1	Café con leche en cápsula Hacendado	3.55	0.22	kg	https://prod-mercadona.imgix.net/images/9a09682b89fb745ac5550a7055aab223.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86348/cafe-con-leche-capsula-hacendado-compatibles-maquinas-dolce-gusto-caja	t
981	11	1	Café en cápsula ristretto napoli Dolce Gusto	4.95	0.31	kg	https://prod-mercadona.imgix.net/images/745c8503f2bcf970332ddcf0264f99d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11918/cafe-capsula-ristretto-napoli-dolce-gusto-caja	t
982	11	1	Café en cápsula cortado Dolce Gusto	4.95	0.31	kg	https://prod-mercadona.imgix.net/images/1de2fa09b6e78175f67abc32db271c5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11785/cafe-capsula-cortado-dolce-gusto-espresso-macchiato-caja	t
983	11	1	Café en cápsula descafeinado Hacendado	3.55	31.70	kg	https://prod-mercadona.imgix.net/images/f7700bd8a1a4c582ec3e5851441e9993.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23293/cafe-capsula-descafeinado-hacendado-compatibles-maquinas-dolce-gusto-caja	t
984	11	1	Café cortado en cápsula Hacendado	3.55	0.22	kg	https://prod-mercadona.imgix.net/images/1ba3107b201ea762f89590aa3679152b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67659/cafe-cortado-capsula-hacendado-compatibles-maquinas-dolce-gusto-caja	t
985	11	1	Café con leche en cápsula descafeinado Hacendado	3.55	0.22	kg	https://prod-mercadona.imgix.net/images/4ee8dcf4c122ee081dfa59dde32060cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23405/cafe-con-leche-capsula-descafeinado-hacendado-compatibles-maquinas-dolce-gusto-caja	t
986	11	1	Cortado en cápsula descafeinado Hacendado	3.55	0.22	kg	https://prod-mercadona.imgix.net/images/91504c8c1f5abae12d037294e595b23e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23404/cortado-capsula-descafeinado-hacendado-compatibles-maquinas-dolce-gusto-caja	t
987	11	1	Café en cápsula doble espresso Hacendado	3.55	0.22	kg	https://prod-mercadona.imgix.net/images/22bbd040ba40ae6f790ca8791f1df0e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22801/cafe-capsula-doble-espresso-hacendado-compatibles-maquinas-dolce-gusto-caja	t
988	11	1	Café en cápsula cappuccino Hacendado	3.55	0.44	kg	https://prod-mercadona.imgix.net/images/d470f57235e74a6c42cd9acf96e0613e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52775/cafe-capsula-cappuccino-hacendado-compatibles-maquinas-dolce-gusto-caja	t
989	11	1	Café en cápsula espresso Tassimo	5.89	0.37	kg	https://prod-mercadona.imgix.net/images/fbdca31607b54ee2c519b95a60268942.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11873/cafe-capsula-espresso-tassimo-paquete	t
990	11	1	Café en cápsula largo Tassimo	5.89	0.37	kg	https://prod-mercadona.imgix.net/images/b483dc0f80480f3d05024a3aaf2e8f96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11872/cafe-capsula-largo-tassimo-paquete	t
991	11	1	Café en cápsula cortado Tassimo	5.89	0.37	kg	https://prod-mercadona.imgix.net/images/e904bb3227c3537365994a57801bfb87.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11875/cafe-capsula-cortado-tassimo-paquete	t
992	11	1	Café en cápsula descafeinado Tassimo	5.89	0.37	kg	https://prod-mercadona.imgix.net/images/4106831161c19a1de3773995b3cb3914.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11874/cafe-capsula-descafeinado-tassimo-paquete	t
993	11	1	Café con leche en cápsula Tassimo	5.89	0.37	kg	https://prod-mercadona.imgix.net/images/58ab2625f5a94ce3a1b056a0ef4bb0d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11871/cafe-con-leche-capsula-tassimo-paquete	t
994	11	1	Café monodosis natural Hacendado	3.00	0.09	kg	https://prod-mercadona.imgix.net/images/5b01548aae218ce91df7725f91897bc0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11770/cafe-monodosis-natural-hacendado-compatibles-sistema-senseo-paquete	t
995	11	1	Café monodosis mezcla Hacendado	3.40	0.11	kg	https://prod-mercadona.imgix.net/images/201218a67e75817b1906dc512629312b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11730/cafe-monodosis-mezcla-hacendado-50-natural-50-torrefacto-compatibles-sistema-senseo-paquete	t
996	11	1	Café monodosis descafeinado natural Hacendado	3.30	0.10	kg	https://prod-mercadona.imgix.net/images/61e35861e2a24c8dea4a5885ef7d823a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11777/cafe-monodosis-descafeinado-natural-hacendado-compatibles-sistema-senseo-paquete	t
997	11	1	Café molido natural Hacendado	4.90	9.80	kg	https://prod-mercadona.imgix.net/images/1bee5993195e32109b08b2742ca1452e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11178/cafe-molido-natural-hacendado-paquete	t
998	11	1	Café molido natural Hacendado	2.60	10.40	kg	https://prod-mercadona.imgix.net/images/0ba1b42865bf3024356d993498c041f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11172/cafe-molido-natural-hacendado-paquete	t
999	11	1	Café molido Colombia Hacendado	3.70	14.80	kg	https://prod-mercadona.imgix.net/images/d218be078fc9e16de47cfebaba8426e4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11715/cafe-molido-colombia-hacendado-paquete	t
1000	11	1	Café molido descafeinado Hacendado Espresso	3.80	15.20	kg	https://prod-mercadona.imgix.net/images/a0e24db78ab031ede34f7e11a6fdc5be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11744/cafe-molido-descafeinado-hacendado-espresso-paquete	t
1001	11	1	Café molido natural Saimaza	3.95	15.80	kg	https://prod-mercadona.imgix.net/images/d2eaa45356f4010235b06954c98a7693.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11853/cafe-molido-natural-saimaza-paquete	t
1002	11	1	Café molido mezcla Saimaza	3.95	15.80	kg	https://prod-mercadona.imgix.net/images/5c3237822ccf5ecda287fac44c2e63ac.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11854/cafe-molido-mezcla-saimaza-paquete	t
1003	11	1	Café molido descafeinado natural Saimaza	4.40	17.60	kg	https://prod-mercadona.imgix.net/images/fd2ae4d82d0a21aae5a0dcb3e70ca27a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11855/cafe-molido-descafeinado-natural-saimaza-paquete	t
1004	11	1	Café en grano natural Hacendado	10.50	10.50	kg	https://prod-mercadona.imgix.net/images/1e3fb2b6e82f4d20cd99377d9fa85eda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13594/cafe-grano-natural-hacendado-paquete	t
1005	11	1	Café soluble Classic Hacendado	4.40	22.00	kg	https://prod-mercadona.imgix.net/images/e344726a7521b54735e68a88f002ead4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22163/cafe-soluble-classic-hacendado-bote	t
1006	11	1	Café soluble Classic Hacendado	2.90	29.00	kg	https://prod-mercadona.imgix.net/images/167de6bbc7936d72b125710ba70b0be2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22718/cafe-soluble-classic-hacendado-bote	t
1007	11	1	Café soluble natural Nescafé classic	8.50	42.50	kg	https://prod-mercadona.imgix.net/images/cce5b5e4d08a19263135226099a9500b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11136/cafe-soluble-natural-nescafe-classic-tarro	t
1008	11	1	Café soluble natural Nescafé classic	5.40	54.00	kg	https://prod-mercadona.imgix.net/images/26c1b9a7e6cf38789d1657939230039b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11111/cafe-soluble-natural-nescafe-classic-tarro	t
1009	11	1	Café soluble descafeinado Hacendado	4.65	23.25	kg	https://prod-mercadona.imgix.net/images/2ed0ec1badebdab8ca1aafeba286b697.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22164/cafe-soluble-descafeinado-hacendado-bote	t
1010	11	1	Café soluble descafeinado Hacendado	3.10	31.00	kg	https://prod-mercadona.imgix.net/images/bd81f9beab36f96ad3895bd8dc03e578.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22719/cafe-soluble-descafeinado-hacendado-bote	t
1011	11	1	Café soluble descafeinado Nescafé classic	8.50	42.50	kg	https://prod-mercadona.imgix.net/images/51f5f9e49dac9da47c19755a5976dbb0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11101/cafe-soluble-descafeinado-nescafe-classic-tarro	t
1012	11	1	Café soluble descafeinado Nescafé classic	5.40	54.00	kg	https://prod-mercadona.imgix.net/images/8849824b5a366e7fd76c9ce78e5b5405.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11104/cafe-soluble-descafeinado-nescafe-classic-tarro	t
1013	11	1	Café soluble Espresso Creme Hacendado	2.90	36.25	kg	https://prod-mercadona.imgix.net/images/7c3c338cf99e554e00ce30e34567f28f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11123/cafe-soluble-espresso-creme-hacendado-bote	t
1014	11	1	Café soluble cappuccino Hacendado	2.75	11.00	kg	https://prod-mercadona.imgix.net/images/56a5cbc9d6095c6d7530b9e4d50bd906.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23406/cafe-soluble-cappuccino-hacendado-bote	t
1015	11	1	Café soluble cappuccino caramelo Hacendado	3.00	12.00	kg	https://prod-mercadona.imgix.net/images/db82323b63111aa2b0a60b8d7041a8ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67660/cafe-soluble-cappuccino-caramelo-hacendado-bote	t
1016	11	1	Café con leche cappuccino Hacendado	0.85	3.40	l	https://prod-mercadona.imgix.net/images/f71077f44842e60a701a74c15a390d44.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10666/cafe-con-leche-cappuccino-hacendado-vaso	t
1017	11	1	Café con leche light sin lactosa Hacendado	0.85	3.40	l	https://prod-mercadona.imgix.net/images/5fe468972fe8cc7a33506cba2b436946.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10642/cafe-con-leche-light-sin-lactosa-hacendado-vaso	t
1018	11	1	Café con leche espresso Hacendado	0.85	3.40	l	https://prod-mercadona.imgix.net/images/fbace2711111518e9ab7a3c54ad58656.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10644/cafe-con-leche-espresso-hacendado-vaso	t
1019	11	1	Café con leche descafeinado Hacendado	0.85	3.40	l	https://prod-mercadona.imgix.net/images/83a4f4b01c38d63142b2646afe4e1fa7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10672/cafe-con-leche-descafeinado-hacendado-vaso	t
1020	10	1	Cacao soluble instantáneo Nesquik	17.45	6.46	kg	https://prod-mercadona.imgix.net/images/52970231ca2855803ef838e3295b947a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67739/cacao-soluble-instantaneo-nesquik-caja	t
1021	10	1	Cacao soluble instantáneo Nesquik	7.50	7.50	kg	https://prod-mercadona.imgix.net/images/e307463f720c156bb83d0e03c7c575e4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13204/cacao-soluble-instantaneo-nesquik-paquete	t
1022	10	1	Cacao soluble instantáneo Nesquik	4.20	10.77	kg	https://prod-mercadona.imgix.net/images/06273f58632b6178bc30831c642dc92b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13216/cacao-soluble-instantaneo-nesquik-bote	t
1023	10	1	Cacao soluble ColaCao original	17.00	7.73	kg	https://prod-mercadona.imgix.net/images/5988145b822d6aa6902b9b0c2038ea60.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19846/cacao-soluble-colacao-original-caja	t
1024	10	1	Cacao soluble ColaCao original	7.00	9.21	kg	https://prod-mercadona.imgix.net/images/5b4b97d32121b70c073129d07dbaab24.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13021/cacao-soluble-colacao-original-bote	t
1025	10	1	Cacao soluble ColaCao original	5.00	13.05	kg	https://prod-mercadona.imgix.net/images/22cdf053d37e905dbd4b4a3ae6d59b58.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13019/cacao-soluble-colacao-original-bote	t
1026	10	1	Cacao soluble instantáneo Hacendado	3.75	4.69	kg	https://prod-mercadona.imgix.net/images/13c1f82c37487052ad910e3ab77d33f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20919/cacao-soluble-instantaneo-hacendado-caja	t
1027	10	1	Cacao soluble instantáneo Hacendado	2.80	5.60	kg	https://prod-mercadona.imgix.net/images/efed6c0c170f71ece9904f933fab0910.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8914/cacao-soluble-instantaneo-hacendado-bote	t
1028	10	1	Cacao soluble Hacendado	5.00	5.00	kg	https://prod-mercadona.imgix.net/images/de55b4100bc073acfcf65889b36d86e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13037/cacao-soluble-hacendado-bote	t
1029	10	1	Cacao soluble Hacendado	2.80	5.60	kg	https://prod-mercadona.imgix.net/images/2b33f5365ca349b7daf6329fe7e3f1bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13038/cacao-soluble-hacendado-bote	t
1030	10	1	Cacao puro en polvo La Chocolatera	4.95	18.68	kg	https://prod-mercadona.imgix.net/images/94188bdf66094f6583107e3bbbb1f22c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22580/cacao-puro-polvo-chocolatera-0-azucares-anadidos-bote	t
1031	8	1	Chocolate líquido a la taza Hacendado	2.45	2.45	l	https://prod-mercadona.imgix.net/images/ba0a4a3958ff462e8b171ef08f6dce66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10005/chocolate-liquido-taza-hacendado-brick	t
1032	10	1	Cacao en polvo a la taza Hacendado	1.85	4.63	kg	https://prod-mercadona.imgix.net/images/9ea94cd14bee28b1e71d5391c9c69013.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11609/cacao-polvo-taza-hacendado-paquete	t
1033	12	1	Té verde Hacendado	0.75	25.00	kg	https://prod-mercadona.imgix.net/images/d4d5d098f5dce80ae9b9fa2e72fade52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13651/te-verde-hacendado-caja	t
1034	12	1	Té Chai Hacendado	1.40	35.00	kg	https://prod-mercadona.imgix.net/images/01553faca744a8bd9317002b6591da2f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11433/te-chai-hacendado-caja	t
1035	12	1	Té negro PG tips	2.60	22.41	kg	https://prod-mercadona.imgix.net/images/edfe31e1fe3a7a281a0c124e52f619fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52967/te-negro-pg-tips-caja	t
1036	12	1	Té negro con canela Hacendado	1.40	46.67	kg	https://prod-mercadona.imgix.net/images/0f79bda7b73f67dfa7c085ba0119ae66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35727/te-negro-con-canela-hacendado-caja	t
1037	12	1	Té Matcha en polvo Hacendado	3.20	213.33	kg	https://prod-mercadona.imgix.net/images/b199eacac1ebb86d45fcf69adb8256cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11440/te-matcha-polvo-hacendado-caja	t
1038	12	1	Té negro Hacendado	0.85	24.29	kg	https://prod-mercadona.imgix.net/images/0cbcccb5290289a135ca33ace366a065.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8804/te-negro-hacendado-caja	t
1039	12	1	Té verde con hierbabuena Hacendado	1.35	33.75	kg	https://prod-mercadona.imgix.net/images/c8129414a45cf317929151c3d6bfa04e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11175/te-verde-con-hierbabuena-hacendado-caja	t
1040	28	1	Refresco té verde Hacendado	1.00	0.67	l	https://prod-mercadona.imgix.net/images/2e4409f80f89f9b7afa0b644b8c7a5c8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27832/refresco-te-verde-hacendado-botella	t
1041	28	1	Refresco té sabor limón Hacendado	1.00	0.67	l	https://prod-mercadona.imgix.net/images/e19e213669f0982f1d8c621f214660a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67938/refresco-te-sabor-limon-hacendado-botella	t
1042	28	1	Refresco té sabor limón Hacendado	3.00	1.52	l	https://prod-mercadona.imgix.net/images/2f6f99de1c12149b4deefbbf9fd542a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67939/refresco-te-sabor-limon-hacendado-pack-6	t
1043	28	1	Refresco té sabor limón Hacendado	0.50	1.52	l	https://prod-mercadona.imgix.net/images/6317015197e72316bd1e296b3ea6d943.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67940/refresco-te-sabor-limon-hacendado-lata	t
1044	28	1	Refresco té sabor limón Hacendado para diluir	1.50	41.67	kg	https://prod-mercadona.imgix.net/images/473f2617f6e8af822ed6272868ba9f8b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11307/refresco-te-sabor-limon-hacendado-diluir-caja	t
1045	28	1	Refresco té sabor melocotón Hacendado zero	1.00	0.67	l	https://prod-mercadona.imgix.net/images/f433a493224809d94f9cb0db373074d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86137/refresco-te-sabor-melocoton-hacendado-zero-botella	t
1046	28	1	Refresco té sabor melocotón Hacendado	1.00	0.67	l	https://prod-mercadona.imgix.net/images/613b53e43b98aa2ae4bf9854f6fda84b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80478/refresco-te-sabor-melocoton-hacendado-botella	t
1047	28	1	Refresco té sabor melocotón Hacendado para diluir	1.50	41.67	kg	https://prod-mercadona.imgix.net/images/f34dae85e4f62fef8f20c8fd644c4d51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11319/refresco-te-sabor-melocoton-hacendado-diluir-caja	t
1048	28	1	Refresco té sabor mango Hacendado zero	1.00	0.67	l	https://prod-mercadona.imgix.net/images/76c4e3c11316c0a0b66eeb89257ad38b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86138/refresco-te-sabor-mango-hacendado-zero-botella	t
1049	28	1	Refresco té sabor limón Hacendado zero	1.00	0.67	l	https://prod-mercadona.imgix.net/images/4d6868f2c4aec287ab23c0cfc373945b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5546/refresco-te-sabor-limon-hacendado-zero-botella	t
1050	28	1	Refresco té verde sabor maracuyá y mango Hacendado zero	1.00	0.67	l	https://prod-mercadona.imgix.net/images/9c3a163c8adf3f23ce205d57437282dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13945/refresco-te-verde-sabor-maracuya-mango-hacendado-zero-botella	t
1051	28	1	Refresco té sabor limón Fuze Tea	1.99	1.33	l	https://prod-mercadona.imgix.net/images/47b24130e2a5593bc2c41c9787a81970.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11688/refresco-te-sabor-limon-fuze-tea-bajo-calorias-botella	t
1052	28	1	Refresco té sabor limón Fuze Tea	6.80	2.58	l	https://prod-mercadona.imgix.net/images/0887e30425225a471641594955829004.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11690/refresco-te-sabor-limon-fuze-tea	t
1053	28	1	Refresco té sabor limón Fuze Tea	0.99	3.00	l	https://prod-mercadona.imgix.net/images/015e5d5b624f5c32fc5ddbaf95fa66b5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11691/refresco-te-sabor-limon-fuze-tea-lata	t
1054	12	1	Infusión Manzanilla Hacendado	0.65	24.07	kg	https://prod-mercadona.imgix.net/images/ba76df9c56636d070f1be9b797bc33cb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11168/infusion-manzanilla-hacendado-caja	t
1055	12	1	Infusión Menta Poleo Hacendado	0.75	25.00	kg	https://prod-mercadona.imgix.net/images/8bb8aa8339111faac81b70cadcd8ca7e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60671/infusion-menta-poleo-hacendado-caja	t
1056	12	1	Infusión Tila Hacendado	0.85	35.42	kg	https://prod-mercadona.imgix.net/images/4843ebb4d3eb34d681e7ec7d7f68f35c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11431/infusion-tila-hacendado-caja	t
1057	12	1	Infusión Cola de caballo Hacendado	1.20	40.00	kg	https://prod-mercadona.imgix.net/images/d8b93a8489a4bdd323bc36aec4505ced.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11447/infusion-cola-caballo-hacendado-caja	t
1058	12	1	Infusión Manzanilla con anís Hacendado	0.85	32.69	kg	https://prod-mercadona.imgix.net/images/208093ce5f165589d7019dfd2f8b9033.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11430/infusion-manzanilla-con-anis-hacendado-caja	t
1059	12	1	Infusión Relax Hacendado	1.05	35.00	kg	https://prod-mercadona.imgix.net/images/8c736fa698b37b4937f6ffae448ee653.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11408/infusion-relax-hacendado-con-tila-azahar-melisa-hierba-luisa-caja	t
1060	12	1	Infusión Laxsen sabor menta Hacendado	1.05	35.00	kg	https://prod-mercadona.imgix.net/images/f98929d515ff98881c54675f7bf6a42e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11470/infusion-laxsen-sabor-menta-hacendado-caja	t
1061	12	1	Infusión Tomillo Hacendado	1.05	43.75	kg	https://prod-mercadona.imgix.net/images/f68201af60762bebdab841889fb51fd1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11453/infusion-tomillo-hacendado-caja	t
1062	12	1	Infusión Dormir Hacendado	1.05	35.00	kg	https://prod-mercadona.imgix.net/images/7250f111d492a028debc378bed3d7687.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11427/infusion-dormir-hacendado-caja	t
1063	12	1	Infusión Rooibos cítricos Hacendado	1.15	28.75	kg	https://prod-mercadona.imgix.net/images/279c2150fbf57ab28f8cc7f595e87338.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13652/infusion-rooibos-citricos-hacendado-caja	t
1064	12	1	Infusión Digest Hacendado	1.05	26.25	kg	https://prod-mercadona.imgix.net/images/3563cdcc7269de0c86cb6fc2580f7e4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15726/infusion-digest-hacendado-caja	t
1065	12	1	Infusión frutos rojos Hacendado	1.40	35.00	kg	https://prod-mercadona.imgix.net/images/04fcd2099fb01736a93ad376ca983371.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8805/infusion-frutos-rojos-hacendado-caja	t
1066	12	1	Infusión Jengibre Hacendado	1.35	33.75	kg	https://prod-mercadona.imgix.net/images/acf276fa72cdf6199c1e79969796541c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11400/infusion-jengibre-hacendado-caja	t
1067	12	1	Infusión Manzanilla sabor a miel Hacendado	1.15	44.23	kg	https://prod-mercadona.imgix.net/images/7b7f93c9e2318336d4ccaa99fa901558.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11454/infusion-manzanilla-sabor-miel-hacendado-con-edulcorante-caja	t
1068	12	1	Infusión Cúrcuma Hacendado con manzana y canela	1.35	39.71	kg	https://prod-mercadona.imgix.net/images/16b727aaeaaf1e700148fae8e4ff86c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11438/infusion-curcuma-hacendado-caja	t
1069	12	1	Infusión quema grasas Hacendado	1.05	35.00	kg	https://prod-mercadona.imgix.net/images/2fb3bcf62eb57d0265eaecb72bb74f3e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60672/infusion-quema-grasas-hacendado-caja	t
1070	12	1	Infusión Hinojo Hacendado	1.05	26.25	kg	https://prod-mercadona.imgix.net/images/e65ea2c7ac20a0960c9d26b0225b581d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11468/infusion-hinojo-hacendado-caja	t
1071	12	1	Infusión manzana y canela Hacendado	1.40	35.00	kg	https://prod-mercadona.imgix.net/images/cab8f28fbe0f1f2e4a259a53b726fc46.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52607/infusion-manzana-canela-hacendado-caja	t
1072	12	1	Infusión Yerba Mate Amanda	2.85	5.70	kg	https://prod-mercadona.imgix.net/images/b322b15e6f22da53485ed058ca2bf64a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86632/infusion-yerba-mate-amanda-paquete	t
1073	6	1	Azúcar blanco en sobres Hacendado	1.55	4.43	kg	https://prod-mercadona.imgix.net/images/86a786bc3c1d1538701f5d2397255508.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19837/azucar-blanco-sobres-hacendado-caja	t
1074	6	1	Azúcar moreno de caña Hacendado	1.90	1.90	kg	https://prod-mercadona.imgix.net/images/feede3851164a6adf1969b62beaacb36.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22349/azucar-moreno-cana-hacendado-paquete	t
1075	6	1	Panela azúcar moreno de caña integral Hacendado	2.05	4.10	kg	https://prod-mercadona.imgix.net/images/37828e8e0b311ebb395a481f35246b6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19859/panela-azucar-moreno-cana-integral-hacendado-sin-refinar-paquete	t
1076	6	1	Azúcar glas Hacendado	2.60	5.20	kg	https://prod-mercadona.imgix.net/images/161728aa26be5e8e39fbd114c24b4f6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35649/azucar-glas-hacendado-bote	t
1077	6	1	Edulcorante líquido sacarina Hacendado	0.85	5.67	l	https://prod-mercadona.imgix.net/images/6bafe98675aec76afe33d1a6da1ab4fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70741/edulcorante-liquido-sacarina-hacendado-bote	t
1078	6	1	Edulcorante en pastillas sacarina Hacendado	1.15	22.12	kg	https://prod-mercadona.imgix.net/images/dc0e233a3502c53e0e79b58ec47949d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19802/edulcorante-pastillas-sacarina-hacendado-bote	t
1079	6	1	Sirope de agave Hacendado	2.60	7.43	kg	https://prod-mercadona.imgix.net/images/761f2c62683397da5f8ac7433ef2652e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19860/sirope-agave-hacendado-bote	t
1080	6	1	Edulcorante líquido stevia Hacendado	2.05	13.67	l	https://prod-mercadona.imgix.net/images/a3908a81e00b2393419c76c334e25d63.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19820/edulcorante-liquido-stevia-hacendado-bote	t
1081	6	1	Edulcorante granulado stevia Hacendado	3.05	15.25	kg	https://prod-mercadona.imgix.net/images/c8c404bea1deab41dcf058e6b8394d43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19817/edulcorante-granulado-stevia-hacendado-bote	t
1082	6	1	Edulcorante en pastillas stevia Hacendado	1.85	205.56	kg	https://prod-mercadona.imgix.net/images/daf1d996bb5dc50de4696d52da90400a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19812/edulcorante-pastillas-stevia-hacendado-bote	t
1083	6	1	Edulcorante Eritritol y Sucralosa Hacendado	3.05	15.25	kg	https://prod-mercadona.imgix.net/images/b0f936ba5a0ea25fd9de787982d8be43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67637/edulcorante-eritritol-sucralosa-hacendado-bote	t
1084	9	1	Mermelada de fresa Hacendado	1.55	3.88	kg	https://prod-mercadona.imgix.net/images/14a0bc5a0acebe6eda1df1e36d914c27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86755/mermelada-fresa-hacendado-tarro	t
1085	9	1	Mermelada de tomate Hacendado	1.95	4.43	kg	https://prod-mercadona.imgix.net/images/f61d58c4d7425cc934dc90a7c7bfb392.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15077/mermelada-tomate-hacendado-tarro	t
1086	9	1	Mermelada de arándanos Hacendado	2.10	6.36	kg	https://prod-mercadona.imgix.net/images/1cb0e04e2c01974816092f738b1e4f00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35932/mermelada-arandanos-hacendado-tarro	t
1087	9	1	Mermelada de melocotón Hacendado	1.45	3.30	kg	https://prod-mercadona.imgix.net/images/0a09f57773b2ec145bcd50fa9440d424.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86684/mermelada-melocoton-hacendado-tarro	t
1088	9	1	Mermelada de naranja amarga Hacendado	1.35	3.07	kg	https://prod-mercadona.imgix.net/images/3dba91f227b1c8eafe558f325036e7ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15076/mermelada-naranja-amarga-hacendado-tarro	t
1089	9	1	Mermelada de albaricoque Hacendado	1.65	3.75	kg	https://prod-mercadona.imgix.net/images/3dfb990a52e65a6a524ad2e720f18ca8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15068/mermelada-albaricoque-hacendado-tarro	t
1090	9	1	Mermelada de higo Hacendado	1.95	5.74	kg	https://prod-mercadona.imgix.net/images/e3fe841d12b9cdfedd9fb3cb09040778.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67753/mermelada-higo-hacendado-tarro	t
1091	9	1	Mermelada de ciruela y kiwi Hacendado	1.70	5.00	kg	https://prod-mercadona.imgix.net/images/709726b054a6427b34435b6e1c9a132b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22476/mermelada-ciruela-kiwi-hacendado-tarro	t
1092	9	1	Mermelada de frambuesa Hacendado	2.60	7.65	kg	https://prod-mercadona.imgix.net/images/6ce143e06ac60efcbb769eac77ff1583.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86033/mermelada-frambuesa-hacendado-tarro	t
1093	9	1	Miel de flores Hacendado	4.90	4.90	kg	https://prod-mercadona.imgix.net/images/10b4d78d2b3b04be05864bb1ba4f2937.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15436/miel-flores-hacendado-tarro	t
1094	9	1	Miel de flores Hacendado	3.20	6.40	kg	https://prod-mercadona.imgix.net/images/40708ec8ec0f6164f8adac2d8200562b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15430/miel-flores-hacendado-bote	t
1095	9	1	Miel de naranjo Hacendado	4.20	8.40	kg	https://prod-mercadona.imgix.net/images/582e20d61fc8c1886eb4fda7ee348fcd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15448/miel-naranjo-hacendado-bote	t
1096	9	1	Miel de caña de azúcar Nuestra Señora del Carmen	2.40	8.00	kg	https://prod-mercadona.imgix.net/images/6b7382c623d95a023bf2e2f39fbeaa0b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15428/miel-cana-azucar-senora-carmen-concentrado-jugo-cana-azucar-tarro	t
1097	37	1	Cebolla caramelizada Hacendado	1.70	8.95	kg	https://prod-mercadona.imgix.net/images/5d20cfb914960bda6a9a576c332c3da9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52749/cebolla-caramelizada-hacendado-con-aceite-oliva-tarro	t
1098	9	1	Confitura de fresa Hacendado 0% azúcares añadidos	1.60	4.21	kg	https://prod-mercadona.imgix.net/images/61d7e70d6c4f3ff537231caafc94d1aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15093/confitura-fresa-hacendado-0-azucares-anadidos-tarro	t
1099	9	1	Confitura de melocotón Hacendado 0% azúcares añadidos	1.60	4.21	kg	https://prod-mercadona.imgix.net/images/96e0a31447f579cbac22c297e5d7bc30.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15094/confitura-melocoton-hacendado-0-azucares-anadidos-tarro	t
1100	8	1	Chocolate negro 85% cacao Hacendado	1.95	19.50	kg	https://prod-mercadona.imgix.net/images/cb7d3bfd6ed5ad578883c843a9945b03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60722/chocolate-negro-85-cacao-hacendado-tableta	t
1101	8	1	Chocolate negro fundir Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/c402c82c0caf8ff549ec508651892379.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12531/chocolate-negro-fundir-hacendado-tableta	t
1102	8	1	Porciones de chocolate negro 72% cacao extrafino Hacendado	3.55	17.75	kg	https://prod-mercadona.imgix.net/images/1d4f148525fed54e7c49bbcf42b48f01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12495/porciones-chocolate-negro-72-cacao-extrafino-hacendado-paquete	t
1103	8	1	Chocolate negro 72% de cacao Hacendado	1.80	18.00	kg	https://prod-mercadona.imgix.net/images/3ed5b4ca49186c84761e868ea53bd450.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23773/chocolate-negro-72-cacao-hacendado-tableta	t
1104	8	1	Chocolate negro 55% cacao Hacendado con almendras	2.60	13.00	kg	https://prod-mercadona.imgix.net/images/31bc6355a5fbc09f48384a249991fab3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40358/chocolate-negro-55-cacao-hacendado-con-almendras-tableta	t
1105	8	1	Chocolate puro Valor	4.60	15.33	kg	https://prod-mercadona.imgix.net/images/aa913b2fa1c66a54865c286a31ccb51c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12126/chocolate-puro-valor-tableta	t
1106	8	1	Chocolate puro Valor con almendras enteras	5.25	21.00	kg	https://prod-mercadona.imgix.net/images/ead7ea5732f3e057832087a856597100.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12130/chocolate-puro-valor-con-almendras-enteras-tableta	t
1107	8	1	Chocolatinas de chocolate negro Royal Mints 49% rellenas de crema sabor a menta	2.40	12.00	kg	https://prod-mercadona.imgix.net/images/388d58b7f7976656eaf9ec945411b92e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12431/chocolatinas-chocolate-negro-royal-mints-49-rellenas-crema-sabor-menta-caja	t
1108	8	1	Gotas de chocolate negro para fundir Hacendado	2.60	10.40	kg	https://prod-mercadona.imgix.net/images/5a6ad3c58e5310b8079675594f796bab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12544/gotas-chocolate-negro-fundir-hacendado-paquete	t
1109	8	1	Chocolate negro 72% de cacao Hacendado con almendras enteras	2.85	14.25	kg	https://prod-mercadona.imgix.net/images/fd4ecfe9fd8242a4b509d1b639c4ab44.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29062/chocolate-negro-72-cacao-hacendado-con-almendras-enteras-tableta	t
1110	8	1	Porciones de Chocolate negro 85% cacao extrafino Hacendado	3.80	19.00	kg	https://prod-mercadona.imgix.net/images/f6d0060a3ab92c2785d71eb32b8667ef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12493/porciones-chocolate-negro-85-cacao-extrafino-hacendado-paquete	t
1111	8	1	Chocolate negro 72% cacao Hacendado con trozos de naranja	1.95	19.50	kg	https://prod-mercadona.imgix.net/images/40f518c1c563706d8f845bbca675552f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22703/chocolate-negro-72-cacao-hacendado-con-trozos-naranja-tableta	t
1112	8	1	Chocolate negro 85% cacao extrafino y edulcorante Hacendado 0% azúcares añadidos	2.30	23.00	kg	https://prod-mercadona.imgix.net/images/44e99daf51c5f8540bd75eb019e49888.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12524/chocolate-negro-85-cacao-extrafino-edulcorante-hacendado-0-azucares-anadidos-tableta	t
1113	8	1	Chocolate negro 70% cacao fundir Hacendado 0% azúcares añadidos	3.25	16.25	kg	https://prod-mercadona.imgix.net/images/e8e32a0506510cdb96d0eb3211d9ac8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12530/chocolate-negro-70-cacao-fundir-hacendado-0-azucares-anadidos-tableta	t
1114	8	1	99% cacao negro Hacendado	2.60	26.00	kg	https://prod-mercadona.imgix.net/images/b6b35842db5108b1b9f5d04ee331ceda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12586/99-cacao-negro-hacendado-tableta	t
1115	8	1	Chocolate negro 55% cacao Hacendado	1.75	11.67	kg	https://prod-mercadona.imgix.net/images/821eb40162ef5fa7ea8f7be8e414c205.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70652/chocolate-negro-55-cacao-hacendado-tableta	t
1116	8	1	Chocolate negro 72% de cacao Hacendado con almendras enteras	3.00	20.00	kg	https://prod-mercadona.imgix.net/images/98921435d40f33cfc1904decfea99944.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9820/chocolate-negro-72-cacao-hacendado-con-almendras-enteras-0-azucares-anadidos-tableta	t
1117	8	1	Chocolate con leche extrafino Nestlé	1.50	12.00	kg	https://prod-mercadona.imgix.net/images/9428764c15483648201a00f1560fd907.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12562/chocolate-con-leche-extrafino-nestle-tableta	t
1118	8	1	Chocolate con leche Milka	2.15	14.33	kg	https://prod-mercadona.imgix.net/images/e6cbab042ce93bc6756ef45ff91a19bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12151/chocolate-con-leche-milka-tableta	t
1119	8	1	Chocolate extrafino con leche Hacendado almendras enteras	2.00	10.00	kg	https://prod-mercadona.imgix.net/images/2108bcd0f61db865e8504f9f12371050.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12037/chocolate-extrafino-con-leche-hacendado-almendras-enteras-tableta	t
1120	8	1	Chocolate con leche Valor almendras enteras	5.25	21.00	kg	https://prod-mercadona.imgix.net/images/bcaa486e4d86b511a2b6e3b86a41187d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12107/chocolate-con-leche-valor-almendras-enteras-tableta	t
1121	8	1	Chocolate con leche Hacendado avellanas troceadas	1.65	11.00	kg	https://prod-mercadona.imgix.net/images/a29460ab8c6c5d36fe459be0d7c64f34.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15633/chocolate-con-leche-hacendado-avellanas-troceadas-tableta	t
1122	8	1	Chocolate extrafino con leche Hacendado 0% azúcares añadidos	1.35	13.50	kg	https://prod-mercadona.imgix.net/images/aa0345e26a0ef7154087d5b34b3618e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12946/chocolate-extrafino-con-leche-hacendado-0-azucares-anadidos-tableta	t
1123	8	1	Chocolate con leche Milka galleta	3.95	13.17	kg	https://prod-mercadona.imgix.net/images/9f1399d74f9a42a9ad82e0e9c27ed7a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12016/chocolate-con-leche-milka-galleta-tableta	t
1124	8	1	Chocolate con leche Fussion Hacendado relleno crema de fresa	1.35	12.27	kg	https://prod-mercadona.imgix.net/images/19aa713999445aa47eca1dd187919936.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86798/chocolate-con-leche-fussion-hacendado-relleno-crema-fresa-tableta	t
1125	8	1	Fideos de chocolate Hacendado	1.75	17.50	kg	https://prod-mercadona.imgix.net/images/2edc66f0eb9284ea9039f1c605336b9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/32227/fideos-chocolate-hacendado-especial-reposteria-postres-paquete	t
1126	8	1	Chocolate con leche fundir Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/5230162330fda1f7d9e46152ba7a087d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12533/chocolate-con-leche-fundir-hacendado-tableta	t
1127	8	1	Chocolate con leche Fussion Hacendado relleno de galleta caramelizada	1.35	12.27	kg	https://prod-mercadona.imgix.net/images/18e43782615705b082471a03baa3228e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70756/chocolate-con-leche-fussion-hacendado-relleno-galleta-caramelizada-tableta	t
1128	8	1	Chocolate blanco fundir Hacendado	2.15	10.75	kg	https://prod-mercadona.imgix.net/images/cef676972da3b5f5e3690314aead47ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12543/chocolate-blanco-fundir-hacendado-tableta	t
1129	8	1	Chocolate blanco Fussion Hacendado relleno de crema de galleta y cacao	1.35	12.27	kg	https://prod-mercadona.imgix.net/images/a3b584abbb04dd2dc580b48317794ecd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9891/chocolate-blanco-fussion-hacendado-relleno-crema-galleta-cacao-tableta	t
1130	15	1	Barritas de barquillo Huesitos bañadas de chocolate con leche	2.80	14.00	kg	https://prod-mercadona.imgix.net/images/87917c5b5a8092a2ed5a8deebe3b4f4b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12526/barritas-barquillo-huesitos-banadas-chocolate-con-leche-valor-paquete	t
1131	8	1	Barritas de chocolate con leche Hacendado rellenas de leche	2.20	11.00	kg	https://prod-mercadona.imgix.net/images/03ce26d79f3a66729dd3d07bf494e434.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12171/barritas-chocolate-con-leche-hacendado-rellenas-leche-paquete	t
1132	8	1	Disquitos Pintarolas de chocolate con leche coloreados	2.00	10.00	kg	https://prod-mercadona.imgix.net/images/9c21f0d353f64a2268b765f87dfdee7e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12094/disquitos-pintarolas-chocolate-con-leche-coloreados-paquete	t
1133	8	1	Cacahuetes Hacendado chocolate negro	2.25	9.00	kg	https://prod-mercadona.imgix.net/images/1deb0330fe4ba23cb89708f8c476e2a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12348/cacahuetes-hacendado-chocolate-negro-paquete	t
1134	8	1	Cacahuetes Hacendado chocolate con leche	2.25	9.00	kg	https://prod-mercadona.imgix.net/images/71915c5db3754a13e1f1ea5f25b6651b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12347/cacahuetes-hacendado-chocolate-con-leche-paquete	t
1135	8	1	Barritas de galleta y caramelo Hacendado bañadas de chocolate con leche	1.85	8.81	kg	https://prod-mercadona.imgix.net/images/86f47624af6e12dfc2d3c4fe82783e99.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16329/barritas-galleta-caramelo-hacendado-banadas-chocolate-con-leche-paquete	t
1136	8	1	Cacahuetes Chocoiris Hacendado bañados de chocolate con leche coloreados	1.90	10.56	kg	https://prod-mercadona.imgix.net/images/411ebbb18356a72c2e48392a9bce1ec5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12020/cacahuetes-chocoiris-hacendado-banados-chocolate-con-leche-coloreados-paquete	t
1137	8	1	Huevos sorpresa de chocolate Hacendado dibujo	1.90	31.67	kg	https://prod-mercadona.imgix.net/images/80c091e9127b7692eeeb756d9bfb4c26.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12364/huevos-chocolate-hacendado-dibujo-con-sorpresa-pack-3	t
1138	8	1	Huevos sorpresa de chocolate Hacendado dibujo	1.90	31.67	kg	https://prod-mercadona.imgix.net/images/1e0c9afe962402b93a61763b5b0f613a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12362/huevos-chocolate-hacendado-dibujo-con-sorpresa-pack-3	t
1139	8	1	Barritas de barquillo Hacendado con relleno de avellana cubiertas de chocolate con leche	1.80	14.63	kg	https://prod-mercadona.imgix.net/images/0d7e2d4053bd3877e53a81d1ae7bf46e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8978/barritas-barquillo-hacendado-con-relleno-avellana-cubiertas-chocolate-con-leche-paquete	t
1140	15	1	Barritas de barquillo Kit-Kat bañadas de chocolate con leche	2.30	18.47	kg	https://prod-mercadona.imgix.net/images/31057863f0b916d1a37c5d9cc4db848a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16285/barritas-barquillo-kit-kat-banadas-chocolate-con-leche-nestle-paquete	t
1141	8	1	Surtido bombones Caja Roja Nestlé	6.95	35.10	kg	https://prod-mercadona.imgix.net/images/be36f58e752b6920adb7e8ecc4a653e7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8920/surtido-bombones-caja-roja-nestle-caja	t
1142	8	1	Surtido bombones Senzza de chocolate negro 70%	2.90	16.11	kg	https://prod-mercadona.imgix.net/images/fee6fe2cd3216a454cd2ed3d453739a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14221/surtido-bombones-senzza-chocolate-negro-70-paquete	t
1143	8	1	Bombones delicias de avellana Delizze Hacendado	4.20	19.44	kg	https://prod-mercadona.imgix.net/images/afa20e43304edec69e365c837ab42375.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12471/bombones-delicias-avellana-delizze-hacendado-caja	t
1144	8	1	Bombones de chocolate con leche Mini Peanut Cups Hacendado relleno de crema y pedazos de cacahuete	1.90	15.08	kg	https://prod-mercadona.imgix.net/images/31b869bb2ad25a9d58f56f0d9331fe5e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14355/bombones-chocolate-con-leche-mini-peanut-cups-hacendado-relleno-crema-pedazos-cacahuete-paquete	t
1145	21	1	Helado sándwich de nata Hacendado	2.30	2.88	l	https://prod-mercadona.imgix.net/images/265ffdc3fa0121e56f210bec1069c79d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64146/helado-sandwich-nata-hacendado-caja	t
1146	21	1	Helado mini sándwich nata Hacendado	2.60	5.42	l	https://prod-mercadona.imgix.net/images/138ce9d72297ee8765b9e0944bdc4316.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64450/helado-mini-sandwich-nata-hacendado-caja	t
1147	21	1	Helado mini bombón almendrado Hacendado	3.00	6.25	l	https://prod-mercadona.imgix.net/images/55e35195c5e0a48dc2575f2e82267a6a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64066/helado-mini-bombon-almendrado-hacendado-caja	t
1148	21	1	Helado sándwich super nata Hacendado	3.30	3.79	l	https://prod-mercadona.imgix.net/images/53582086b592f4a4e1a76e53047d57fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64200/helado-sandwich-super-nata-hacendado-caja	t
1149	21	1	Helado mini sándwich vainilla y cookie Hacendado	3.00	5.88	l	https://prod-mercadona.imgix.net/images/a742659ac3bb0b15881456bdb2a0a3c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64520/helado-mini-sandwich-vainilla-cookie-hacendado-caja	t
1150	21	1	Helado Mochi coco Hacendado	2.90	13.43	l	https://prod-mercadona.imgix.net/images/482d86a2ece66b92528d6a52cd23e79d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64491/helado-mochi-coco-hacendado-caja	t
1151	21	1	Helado vegetal mini a base de anacardo con crema de pistacho Hacendado	3.30	10.31	l	https://prod-mercadona.imgix.net/images/9d23f0d07ba1b989e50bac5d84f59e7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23850/helado-vegetal-mini-base-anacardo-con-crema-pistacho-hacendado-caja	t
1152	21	1	Helado Mochi mango Hacendado	2.90	13.43	l	https://prod-mercadona.imgix.net/images/c79c7ea8e5337a4922d484a5c9128b36.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64492/helado-mochi-mango-hacendado-caja	t
1153	21	1	Medios cocos helados Hacendado	2.70	7.71	l	https://prod-mercadona.imgix.net/images/dd2cee008087791d00746b86c41bd696.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64166/medios-cocos-helados-hacendado-caja	t
1154	8	1	Crema al cacao con avellanas Hacendado	2.05	4.10	kg	https://prod-mercadona.imgix.net/images/95bdbcb83e6a0a4d83de80f084e71e96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67416/crema-cacao-con-avellanas-hacendado-bote	t
1155	8	1	Crema de avellanas y cacao Hacendado	2.35	5.88	kg	https://prod-mercadona.imgix.net/images/525cfde47a18dc5dea4799338a9ba8d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11630/crema-avellanas-cacao-hacendado-bote	t
1156	8	1	Crema al cacao con avellanas Nutella	4.00	11.43	kg	https://prod-mercadona.imgix.net/images/c2dddb8c129b6e17ebf2af26631d0df9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67409/crema-cacao-con-avellanas-nutella-tarro	t
1157	8	1	Crema al cacao con avellanas Nocilla original	2.95	8.19	kg	https://prod-mercadona.imgix.net/images/853eeead5986a678da9f49fc986f343c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16264/crema-cacao-con-avellanas-nocilla-original-bote	t
1158	25	1	Dulce de leche Chimbote	2.71	6.30	kg	https://prod-mercadona.imgix.net/images/2feec77376dba93bb847e0de3ffa1544.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/10286/dulce-leche-chimbote-tarro	t
1159	8	1	Crema al cacao con avellanas Hacendado de 2 sabores	2.05	4.10	kg	https://prod-mercadona.imgix.net/images/15c78677728ae2484f4dd630ca4e2595.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67417/crema-cacao-con-avellanas-hacendado-2-sabores-bote	t
1160	8	1	Crema al cacao y leche con avellanas Nocilla	2.95	8.19	kg	https://prod-mercadona.imgix.net/images/6b8a959f12e81dd552dd8efb221c37f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16265/crema-cacao-leche-con-avellanas-nocilla-bote	t
1161	8	1	Crema de cacahuete 100% Hacendado	2.75	5.50	kg	https://prod-mercadona.imgix.net/images/ecac26182b20af3cb009a9b33cac5693.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16883/crema-cacahuete-100-hacendado-tarro	t
1162	7	1	Chicles menta fuerte gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/a732ffc79d989157295923f3d743efbb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65235/chicles-menta-fuerte-gragea-hacendado-paquete	t
1163	7	1	Chicles menta fuerte gragea Hacendado	1.95	19.50	kg	https://prod-mercadona.imgix.net/images/8aecdf262ea039446da9154c42ce2d35.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65067/chicles-menta-fuerte-gragea-hacendado-bote	t
1164	7	1	Chicles hierbabuena gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/084ce2eef469f2a392a82687c627f2eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65161/chicles-hierbabuena-gragea-hacendado-paquete	t
1165	7	1	Chicles hierbabuena gragea Hacendado	1.95	19.50	kg	https://prod-mercadona.imgix.net/images/3eb555f496248307a116ab2751822c90.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65172/chicles-hierbabuena-gragea-hacendado-bote	t
1166	7	1	Chicles menta suave gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/004ec71c8f48cc0752a52a331b067222.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65147/chicles-menta-suave-gragea-hacendado-paquete	t
1167	7	1	Chicles fresa gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/a64913f13dc496ba3e0a24be2ac4ced2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65164/chicles-fresa-gragea-hacendado-paquete	t
1168	7	1	Chicles fresa gragea Hacendado	1.95	19.50	kg	https://prod-mercadona.imgix.net/images/0b8b1fd18173544070ec5422c5f5c7bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65165/chicles-fresa-gragea-hacendado-bote	t
1169	7	1	Chicles original sabor frutas gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/f814995ad8c172f7d6f5047574d246a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65135/chicles-original-sabor-frutas-gragea-hacendado-paquete	t
1170	7	1	Chicles XXL gragea Hacendado	1.80	18.00	kg	https://prod-mercadona.imgix.net/images/f6144ec5697bb40f24ec68b81d174eae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65213/chicles-xxl-gragea-hacendado-sabor-melon-fresa-melocoton-frambuesa-paquete	t
1171	7	1	Chicles jengibre gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/b58612dd228ef47f35d19a57f53d6cf4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65177/chicles-jengibre-gragea-hacendado-paquete	t
1172	7	1	Chicles eucalipto gragea Hacendado	1.00	22.22	kg	https://prod-mercadona.imgix.net/images/acded215d6f3fde944ca7f37525312cb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52614/chicles-eucalipto-gragea-hacendado-paquete	t
1173	7	1	Caramelos nata Hacendado 0% azúcares	1.15	12.78	kg	https://prod-mercadona.imgix.net/images/f254cebca9e75e726e259e6c333cdd71.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65302/caramelos-nata-hacendado-0-azucares-paquete	t
1174	7	1	Caramelos café Hacendado 0% azúcares	1.15	12.78	kg	https://prod-mercadona.imgix.net/images/54347a2d774d1ae92d25bc8e7496b036.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65123/caramelos-cafe-hacendado-0-azucares-paquete	t
1175	7	1	Caramelos sabor eucalipto y mentol Hacendado 0% azúcares	1.00	11.11	kg	https://prod-mercadona.imgix.net/images/ab8a95ae592421cc18e25b033da60f55.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65138/caramelos-sabor-eucalipto-mentol-hacendado-0-azucares-paquete	t
1176	7	1	Caramelos eucaliptus mentol Respiral Halls	1.95	13.00	kg	https://prod-mercadona.imgix.net/images/c8e54e1a4ca57a04c711ab8107fe6391.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65326/caramelos-eucaliptus-mentol-respiral-halls-paquete	t
1177	7	1	Caramelos limón mentol Respiral Halls	1.95	13.00	kg	https://prod-mercadona.imgix.net/images/62066c26147d22be240e0d93d0d6487d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65328/caramelos-limon-mentol-respiral-halls-paquete	t
1178	7	1	Caramelos blandos Fruits Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/493387191d1b52afd743e72c6ba0ce03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65311/caramelos-blandos-fruits-hacendado-sabor-limon-naranja-cereza-fresa-pina-paquete	t
1179	7	1	Caramelos miel sabor limón Pifarré	1.15	9.20	kg	https://prod-mercadona.imgix.net/images/9b5f069a8d5beed58c850b6aea12a33d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65324/caramelos-miel-sabor-limon-pifarre-paquete	t
1180	7	1	Caramelos regaliz mentol Respiral Halls	1.95	13.00	kg	https://prod-mercadona.imgix.net/images/c574db59bf527230b58d84817689ba94.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65327/caramelos-regaliz-mentol-respiral-halls-paquete	t
1181	7	1	Caramelos jengibre y própolis Hacendado 0% azúcares	1.35	15.00	kg	https://prod-mercadona.imgix.net/images/c91407532dcda9307b4d91f41930899c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65143/caramelos-jengibre-propolis-hacendado-0-azucares-paquete	t
1182	7	1	Caramelos con palo Mix Hacendado sabor cereza y fresa	1.20	15.11	kg	https://prod-mercadona.imgix.net/images/d5b03fa7883768178980ceb6685ce67e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13987/caramelos-con-palo-mix-hacendado-sabor-cereza-fresa-paquete	t
1183	7	1	Caramelos sabor eucalipto y mentol Hacendado 0% azúcares	1.60	17.20	kg	https://prod-mercadona.imgix.net/images/1b553d41bffefff0cdd9139469f9e513.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12771/caramelos-sabor-eucalipto-mentol-hacendado-0-azucares	t
1184	7	1	Caramelos sabor lima Hacendado 0% azúcares	1.60	17.20	kg	https://prod-mercadona.imgix.net/images/0efe3c1fed3c498b3dd92b18a260d29b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12766/caramelos-sabor-lima-hacendado-0-azucares	t
1185	7	1	Golosinas Xuxes Top Ten Hacendado	1.25	9.26	kg	https://prod-mercadona.imgix.net/images/5f61eafe5d27b27e46b2d8f63a8f517a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65008/golosinas-xuxes-top-ten-hacendado-paquete	t
1186	7	1	Golosinas Moras Hacendado	1.10	5.50	kg	https://prod-mercadona.imgix.net/images/4ad0745ed342d38512e75011499510a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65077/golosinas-moras-hacendado-paquete	t
1187	7	1	Golosinas Nubi Mallow Hacendado	1.00	6.67	kg	https://prod-mercadona.imgix.net/images/cdc1361ef5bfb363f933199ddba57a3f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65088/golosinas-nubi-mallow-hacendado-paquete	t
1188	7	1	Golosinas tubos Hacendado sabor fresa y nata	1.75	5.47	kg	https://prod-mercadona.imgix.net/images/d0545ed394abad774a6c3eebcaafb65e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65064/golosinas-tubos-fresa-hacendado-rellenos-caja	t
1189	7	1	Golosinas Boca Fruit Hacendado	1.20	6.00	kg	https://prod-mercadona.imgix.net/images/b1dcb6485dedff2dd9a089ffa93f4ff0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65070/golosinas-boca-fruit-hacendado-envueltas-individualmente-paquete	t
1190	3	1	Grageas de regaliz Hacendado	1.45	9.67	kg	https://prod-mercadona.imgix.net/images/640348194f51b41ab5d97bf048ee6222.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65158/grageas-regaliz-hacendado-paquete	t
1191	7	1	Surtido de caramelos Diver Xuxes Hacendado	2.95	7.87	kg	https://prod-mercadona.imgix.net/images/af8b61db448e12d39da077fe0c99124f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14934/surtido-caramelos-diver-xuxes-hacendado-envueltos-individualmente-paquete	t
1192	7	1	Golosinas Rega Relli Hacendado rellena con zumo de fruta	1.00	6.67	kg	https://prod-mercadona.imgix.net/images/a37b6faf18843776f449cedb50181b7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/65055/golosinas-rega-relli-hacendado-rellena-con-zumo-fruta-paquete	t
1193	7	1	Golosinas Mix Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/87a89a6c98db7249886541326f1fc0fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86288/golosinas-mix-hacendado-paquete	t
1194	7	1	Golosinas Fresi Pink Mix Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/affe1a6366d5c388283768bce6455309.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67736/golosinas-fresi-pink-mix-hacendado-paquete	t
1195	7	1	Golosinas Mix azúcar Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/c1e33a9c13fd43bfe25f5aa1efaf1eae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60384/golosinas-mix-azucar-hacendado-paquete	t
1196	7	1	Golosinas Mix con pica Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/4b4d83e653a71e617e5988f7c71d2ddf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35856/golosinas-mix-con-pica-hacendado-paquete	t
1197	7	1	Cono de golosinas celebración Hacendado	1.25	1.25	ud	https://prod-mercadona.imgix.net/images/b9fd6e0c270b9aeb4d3e17a9422671b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9792/cono-golosinas-celebracion-hacendado-contiene-snack-maiz-piruleta-comprimido-con-polvo-pica-sabor-fresa-palote-espuma-dulce-caramelos-goma-paquete	t
1198	7	1	Golosinas Mini Mix con pica Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/c1b886f462b4e86d33d05839ee471619.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8946/golosinas-mini-mix-con-pica-hacendado-paquete	t
1199	7	1	Golosinas tubos rellenos Hacendado sabor nata y fresa	1.75	6.25	kg	https://prod-mercadona.imgix.net/images/a581283813f0f13fc009402c7115f4fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12970/golosinas-tubos-rellenos-hacendado-sabor-nata-fresa-caja	t
1200	7	1	Golosinas tubos pica Hacendado sabor fresa y nata	1.75	6.25	kg	https://prod-mercadona.imgix.net/images/7ce32c7581e95e5adb5b715f67d66e13.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12969/golosinas-tubos-rellenos-hacendado-sabor-fresa-acida-caja	t
1201	7	1	Golosinas Tropical Jelly Hacendado	1.60	5.33	kg	https://prod-mercadona.imgix.net/images/e080ec1cec9da92abbf767d9e62ed9fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13042/golosinas-tropical-jelly-hacendado-paquete	t
1202	7	1	Golosinas Mega Dedo Hacendado	1.00	10.00	kg	https://prod-mercadona.imgix.net/images/74061ad79f638220e93456b3ef1c6b3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14338/golosinas-mega-dedo-hacendado-paquete	t
1203	34	1	Zumo de tomate Hacendado	1.05	1.05	l	https://prod-mercadona.imgix.net/images/41b7d0f0d220d1e6e7a30bae3399fbbb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39394/zumo-tomate-hacendado-brick	t
1204	34	1	Zumo de manzana Hacendado	0.80	0.80	l	https://prod-mercadona.imgix.net/images/df7a8a1d3eaa6e29f16174a9ca5faa45.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39403/zumo-manzana-hacendado-brick	t
1205	34	1	Zumo de manzana Hacendado	1.30	1.08	l	https://prod-mercadona.imgix.net/images/194104aa3195e2fcb04f1b467de0ac72.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39404/zumo-manzana-hacendado-pack-6	t
1206	34	1	Bebida de mango Hacendado sin azúcares añadidos	1.25	1.25	l	https://prod-mercadona.imgix.net/images/9e0316fca3787aeb711b8e529d778c0c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60588/bebida-mango-hacendado-sin-azucares-anadidos-brick	t
1207	34	1	Bebida de pomelo Hacendado sin azúcares añadidos	1.30	1.30	l	https://prod-mercadona.imgix.net/images/ee3870b02b17cec3a29a18a8a50ee13e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39604/bebida-pomelo-hacendado-sin-azucares-anadidos-brick	t
1208	34	1	Zumo de manzana selección Hacendado	1.70	1.70	l	https://prod-mercadona.imgix.net/images/09ceea8af96db74ef00fc5fa2029dbcb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39922/zumo-manzana-seleccion-hacendado-brick	t
1209	34	1	Néctar de guayaba Hacendado	1.30	1.30	l	https://prod-mercadona.imgix.net/images/0387601ec7043ab95b69e38a4429f276.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39280/nectar-guayaba-hacendado-brick	t
1210	34	1	Fruta + leche tropical Hacendado sin azúcares añadidos	0.95	0.95	l	https://prod-mercadona.imgix.net/images/3a8f540290f549c079923eda19f0d269.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86385/fruta-leche-tropical-hacendado-sin-azucares-anadidos-brick	t
1211	34	1	Fruta + leche tropical Hacendado sin azúcares añadidos	1.00	1.01	l	https://prod-mercadona.imgix.net/images/3e2066a10bbe070412dfa30acba7e2a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86386/fruta-leche-tropical-hacendado-sin-azucares-anadidos	t
1212	34	1	Fruta + leche tropical Hacendado sin azúcares añadidos	1.20	1.00	l	https://prod-mercadona.imgix.net/images/6d7dc4df24253ea7993dd7373e88d52c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86387/fruta-leche-tropical-hacendado-sin-azucares-anadidos	t
1213	34	1	Fruta + leche mediterráneo Hacendado sin azúcares añadidos	0.95	0.95	l	https://prod-mercadona.imgix.net/images/865b75448a2be64749ae797c4bce44f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86388/fruta-leche-mediterraneo-hacendado-sin-azucares-anadidos-brick	t
1214	34	1	Fruta + leche mediterráneo Hacendado sin azúcares añadidos	1.00	1.01	l	https://prod-mercadona.imgix.net/images/bd1eecec0f58252b804a2a445e96dae4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86390/fruta-leche-mediterraneo-hacendado-sin-azucares-anadidos	t
1215	34	1	Fruta + leche mediterráneo Hacendado sin azúcares añadidos	1.20	1.00	l	https://prod-mercadona.imgix.net/images/b12e59e1e0ca122779074d3b38bd07db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86392/fruta-leche-mediterraneo-hacendado-sin-azucares-anadidos	t
1216	34	1	Bebida Bahamas Hacendado	1.40	0.70	l	https://prod-mercadona.imgix.net/images/a2191ccc7c4c7f6db1a611d6fd746ca7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39109/bebida-bahamas-hacendado-brick	t
1217	34	1	Bebida tropical Hacendado sin azúcares añadidos	1.00	1.00	l	https://prod-mercadona.imgix.net/images/bf71396100c18cca59c72da31db9c63b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39606/bebida-tropical-hacendado-sin-azucares-anadidos-brick	t
1218	34	1	Bebida de arándanos y frutas rojas Hacendado sin azúcares añadidos	1.75	1.75	l	https://prod-mercadona.imgix.net/images/94e4c5ea515e482003816fb0c6d3f452.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39627/bebida-arandanos-frutas-rojas-hacendado-sin-azucares-anadidos-brick	t
1219	34	1	Bebida de frutas rojas antioxidante Hacendado sin azúcares añadidos	1.95	1.95	l	https://prod-mercadona.imgix.net/images/6c18bfdedcacf5f2fc82a289f3a8d3f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39640/bebida-frutas-rojas-antioxidante-hacendado-sin-azucares-anadidos-brick	t
1220	34	1	Bebida multivitaminas Hacendado sin azúcares añadidos	1.00	1.00	l	https://prod-mercadona.imgix.net/images/c0aec617c3d9db1cc8ec8f99554338e6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39651/bebida-multivitaminas-hacendado-sin-azucares-anadidos-brick	t
1221	34	1	Zumo maracuyá y chía Hacendado	1.65	6.60	l	https://prod-mercadona.imgix.net/images/a2a591a0b1f504dc9a7fd9cfacf5a147.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39987/zumo-fresh-maracuya-chia-hacendado-botella	t
1222	34	1	Smoothie fresa y plátano Hacendado	1.65	6.60	l	https://prod-mercadona.imgix.net/images/583cfa5d92ab55464bb96b08768f65bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39980/smoothie-fresa-platano-manzana-hacendado-botella	t
1223	34	1	Smoothie mango y naranja Hacendado	1.65	6.60	l	https://prod-mercadona.imgix.net/images/444d023cb259898f5ec9801d954fd1e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70636/smoothie-mango-naranja-hacendado-botella	t
1224	34	1	Smoothie mango y coco Hacendado	1.65	6.60	l	https://prod-mercadona.imgix.net/images/500800906ef3039094c3ff2bf3a41401.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12909/smoothie-mango-coco-hacendado-botella	t
1225	34	1	Zumo de melocotón y uva Hacendado	1.00	1.00	l	https://prod-mercadona.imgix.net/images/01533e20d284536adadb30678a1569bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86039/zumo-melocoton-uva-hacendado-brick	t
1226	34	1	Zumo de melocotón y uva Hacendado	1.50	1.25	l	https://prod-mercadona.imgix.net/images/6a41597c0d58338b27a6e8bfe9b4dad2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86040/zumo-melocoton-uva-hacendado-pack-6	t
1227	34	1	Bebida de melocotón Hacendado sin azúcares añadidos	1.00	1.00	l	https://prod-mercadona.imgix.net/images/f678485edb09150dee942e3f9e3ae07b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8247/bebida-melocoton-hacendado-sin-azucares-anadidos-brick	t
1228	34	1	Bebida de melocotón Hacendado sin azúcares añadidos	1.50	1.25	l	https://prod-mercadona.imgix.net/images/1630f8437f4370ac6557d9ee7f6ee859.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8248/bebida-melocoton-hacendado-sin-azucares-anadidos	t
1229	34	1	Zumo de piña y uva Hacendado	1.20	1.20	l	https://prod-mercadona.imgix.net/images/d8dd70c608c6bf3aaebdc10b5f6c53bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39129/zumo-pina-uva-hacendado-brick	t
1230	34	1	Zumo de piña y uva Hacendado	1.65	1.38	l	https://prod-mercadona.imgix.net/images/ed323a439124a96f84da691c64cc48af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39130/zumo-pina-uva-hacendado-pack-6	t
1231	34	1	Bebida de piña Hacendado sin azúcares añadidos	1.10	1.10	l	https://prod-mercadona.imgix.net/images/33ca00ae12574c8e7b9833ddade5c1f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39119/bebida-pina-hacendado-sin-azucares-anadidos-brick	t
1232	34	1	Bebida de piña Hacendado sin azúcares añadidos	1.60	1.33	l	https://prod-mercadona.imgix.net/images/f824c29e5b1ce63eec029d4c34caa3ef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39106/bebida-pina-hacendado-sin-azucares-anadidos-pack-6	t
1233	34	1	Zumo de piña selección Hacendado	2.60	2.60	l	https://prod-mercadona.imgix.net/images/c8d03bf8f2b13d861c83a8acf493b444.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39946/zumo-pina-seleccion-hacendado-brick	t
1234	34	1	Néctar de piña La Verja	1.80	1.20	l	https://prod-mercadona.imgix.net/images/94bec43b3562a298f317e140ac71f145.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39100/nectar-pina-verja-botella	t
1235	25	1	Kéfir natural sabor suave	1.20	2.40	kg	https://prod-mercadona.imgix.net/images/996e614f475b8cd286f9a4c15643edea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20029/kefir-natural-sabor-suave-bote	t
1236	25	1	Yogur cremoso Hacendado con frutos silvestres	1.25	2.50	kg	https://prod-mercadona.imgix.net/images/4b8059bb835b623d71bea1ea109a4056.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20376/yogur-cremoso-hacendado-con-frutos-silvestres-bote	t
1237	25	1	Yogur cremoso Hacendado con melocotón y maracuya	1.25	2.50	kg	https://prod-mercadona.imgix.net/images/8fcaa52649efa30b3683a7e41645986c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20379/yogur-cremoso-hacendado-con-melocoton-maracuya-bote	t
1238	19	1	Postre de soja sabor Natural con coco Alpro	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/1e4db0e29c351e0e73ac49577e5c107b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52513/postre-soja-sabor-natural-con-coco-alpro-bote	t
1239	19	1	Postre de soja sabor mango Alpro sin azúcares añadidos	2.55	6.38	kg	https://prod-mercadona.imgix.net/images/71cb7349f97d0948a84c183ea7187b21.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21369/postre-soja-sabor-mango-alpro-sin-azucares-anadidos-bote	t
1240	19	1	Postre de soja sabor arándanos Alpro	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/db74f47211ca6ae501bf8a976bb14f60.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8179/postre-soja-sabor-arandanos-alpro-bote	t
1241	19	1	Postre de soja sabor lima limón Alpro	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/6245a9213d5e296eb89c71c45dce1173.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13917/postre-soja-sabor-lima-limon-alpro-bote	t
1242	19	1	Petit de bolsillo de fresa Hacendado	1.70	4.72	kg	https://prod-mercadona.imgix.net/images/2706e4ae49634f4e868d954a901859fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/68089/petit-bolsillo-fresa-hacendado-caja	t
1243	25	1	Bebida láctea de fresa y plátano Hacendado	1.50	1.50	kg	https://prod-mercadona.imgix.net/images/f046b855d2fb60c7fc6c10e9bf21b65a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20613/bebida-lactea-fresa-platano-hacendado-botella	t
1244	25	1	Bebida láctea de fresa Hacendado	1.50	1.50	kg	https://prod-mercadona.imgix.net/images/7bcb8d7973ce2f6d56130351102a6b49.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20612/bebida-lactea-fresa-hacendado-botella	t
1245	25	1	Bebida láctea de piña y coco Hacendado	1.50	1.50	kg	https://prod-mercadona.imgix.net/images/2a1b583c8a2b23c41cf04004b57dc19c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20629/bebida-lactea-pina-coco-hacendado-botella	t
1246	25	1	Bebida láctea de frutas del bosque Hacendado	1.50	1.50	kg	https://prod-mercadona.imgix.net/images/2958a31bef0535fa62335fb1e1213471.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9982/bebida-lactea-frutas-bosque-hacendado-botella	t
1247	25	1	Bebida láctea natural azucarada Hacendado	1.50	1.50	kg	https://prod-mercadona.imgix.net/images/8761b9c14379e95faf67971a4d59eed4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9981/bebida-lactea-natural-azucarada-hacendado-botella	t
1248	25	1	Batido lácteo sabor chocolate +Proteínas Hacendado 30 g proteínas	1.30	3.94	l	https://prod-mercadona.imgix.net/images/fd52db5d2656b0f63b0ad7ba075cd614.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86418/batido-lacteo-sabor-chocolate-proteinas-hacendado-30-g-proteinas-brick	t
1249	25	1	Batido lácteo sabor vainilla +Proteínas Hacendado 30 g proteínas	1.30	3.94	l	https://prod-mercadona.imgix.net/images/442ae61addfecdf91e59ab0f0580105b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86419/batido-lacteo-sabor-vainilla-proteinas-hacendado-30-g-proteinas-brick	t
1250	25	1	Bebida láctea natural Actimel	5.99	4.99	kg	https://prod-mercadona.imgix.net/images/8bc0021acfb60909467769cc63cdd7a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20738/bebida-lactea-natural-actimel-danone-pack-12	t
1251	26	1	Bebida Kéfir de coco Hacendado	1.10	4.40	kg	https://prod-mercadona.imgix.net/images/9ce6b7cf5fec6c14b1c25c6f142a3d07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15664/bebida-kefir-coco-hacendado-botella	t
1252	26	1	Bebida Kéfir de fresa y plátano Hacendado	0.90	3.60	kg	https://prod-mercadona.imgix.net/images/dd289147f3d6ee7437c4a9b701adf6ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52750/bebida-kefir-fresa-platano-hacendado-botella	t
1253	25	1	Yogur griego natural Hacendado	1.55	2.07	kg	https://prod-mercadona.imgix.net/images/cfb87bb05a20c3f9a20da9e3c7375172.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20559/yogur-griego-natural-hacendado-pack-6	t
1254	25	1	Yogur griego natural Hacendado	2.30	2.30	kg	https://prod-mercadona.imgix.net/images/2b8874dc62c81aa7e8cade5cd915c85c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20512/yogur-griego-natural-hacendado-bote	t
1255	19	1	Natillas de vainilla Danet	1.94	4.04	kg	https://prod-mercadona.imgix.net/images/90773d5ffa47a10f02da796472ecc91a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86245/natillas-vainilla-danet-danone-pack-4	t
1256	19	1	Natillas de chocolate Danet	1.94	4.04	kg	https://prod-mercadona.imgix.net/images/492c04a070fe43c5c272cb4879e11fbe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/68243/natillas-chocolate-danet-danone-pack-4	t
1257	19	1	Tarta de queso Hacendado	1.90	10.56	kg	https://prod-mercadona.imgix.net/images/d43749fd94bc72de6e831813abac534a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21366/tarta-queso-hacendado-tarrina	t
1258	19	1	Coulant de chocolate Hacendado	2.20	12.22	kg	https://prod-mercadona.imgix.net/images/5613c211c64422781a7d7bbba6219a7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/82938/coulant-chocolate-hacendado-caja	t
1259	1	1	Aceite de oliva 0,4º Hacendado	19.75	3.95	l	https://prod-mercadona.imgix.net/images/3b8cde7b3cb069ee0316029012cf8562.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4241/aceite-oliva-04o-hacendado-garrafa	t
1260	1	1	Aceite de oliva 0,4º Hacendado	4.10	4.10	l	https://prod-mercadona.imgix.net/images/65c2349950feb1958362e06217003b10.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4240/aceite-oliva-04o-hacendado-botella	t
1261	1	1	Aceite de oliva virgen extra Hacendado Gran Selección	4.00	8.00	l	https://prod-mercadona.imgix.net/images/9ec1686cacffdad60832b03bfc5f3cea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14994/aceite-oliva-virgen-extra-hacendado-gran-seleccion-botella	t
1262	1	1	Aceite de oliva 1º Hacendado	19.75	3.95	l	https://prod-mercadona.imgix.net/images/340603f72b335443e93eeb027630e9ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4641/aceite-oliva-1o-hacendado-garrafa	t
1263	1	1	Aceite de oliva 1º Hacendado	4.35	4.35	l	https://prod-mercadona.imgix.net/images/fe860edbcbb7504d90ad34af0b93b6d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4640/aceite-oliva-1o-hacendado-botella	t
1264	1	1	Aceite de oliva virgen Hacendado	12.85	4.28	l	https://prod-mercadona.imgix.net/images/5b2daa7ddeb496942b974d178bf3a47d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4711/aceite-oliva-virgen-hacendado-garrafa	t
1265	1	1	Aceite de oliva virgen Hacendado	4.45	4.45	l	https://prod-mercadona.imgix.net/images/a6b5607809fdd257ffd5e778791bdc6a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4749/aceite-oliva-virgen-hacendado-botella	t
1266	1	1	Aceite de oliva virgen extra Picual Casa Juncal	4.85	9.70	l	https://prod-mercadona.imgix.net/images/218712ed55645f7f5a0eb8f40d96aea0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4850/aceite-oliva-virgen-extra-picual-casa-juncal-botella	t
1267	1	1	Vinagre de vino blanco Hacendado	0.65	0.65	l	https://prod-mercadona.imgix.net/images/44c1552cc9f3945d63d01565d313846c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4940/vinagre-vino-blanco-hacendado-botella	t
1268	1	1	Limón exprimido Hacendado	1.40	5.00	l	https://prod-mercadona.imgix.net/images/1910ee61299100e2bca29c2b39fab7a5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4903/limon-exprimido-hacendado-botella	t
1269	1	1	Crema de vinagre balsámico de Módena Hacendado	1.80	7.20	kg	https://prod-mercadona.imgix.net/images/883340a038ef8c74f085947925aabae5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4908/crema-vinagre-balsamico-modena-hacendado-botella	t
1270	1	1	Vinagre de Jerez reserva Hacendado	2.10	8.40	l	https://prod-mercadona.imgix.net/images/bfa0c4aabf80adf4cd9a390df6aa7184.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13609/vinagre-jerez-reserva-hacendado-botella	t
1271	33	1	Bebida aromatizada a base de vino para cocinar Abuela Carola	2.35	3.13	l	https://prod-mercadona.imgix.net/images/bbee83a931fd33117064e444144d1902.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66905/bebida-aromatizada-base-vino-cocinar-abuela-carola-botella	t
1272	1	1	Reducción bálsamica de vinagre Pedro Ximénez Hacendado	2.25	7.50	kg	https://prod-mercadona.imgix.net/images/fe6926c18e637de430384b64e1c2ac30.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4905/reduccion-vinagre-pedro-ximenez-hacendado-botella	t
1273	1	1	Vinagre balsámico de Módena Hacendado	2.25	4.50	l	https://prod-mercadona.imgix.net/images/f65c196d0aae6388f9e6852c381f8da4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26496/vinagre-balsamico-modena-hacendado-botella	t
1274	1	1	Aceite de girasol refinado 0,2º Hacendado	8.45	1.69	l	https://prod-mercadona.imgix.net/images/e6398afba1d032d2e1c0489fd727d2f6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4041/aceite-girasol-refinado-02o-hacendado-garrafa	t
1275	1	1	Aceite de girasol refinado 0,2º Hacendado	1.75	1.75	l	https://prod-mercadona.imgix.net/images/3de50b8eb0dd7aedd0c8a7da4bd2de31.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4040/aceite-girasol-refinado-02o-hacendado-botella	t
1276	1	1	Aceite de coco virgen Hacendado	5.25	11.67	l	https://prod-mercadona.imgix.net/images/2fe6ba84f4e3783e1e57c42903035bd3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4193/aceite-coco-virgen-hacendado-bote	t
1277	2	1	Sal fina de mesa Hacendado	0.75	2.50	kg	https://prod-mercadona.imgix.net/images/14d233ae4aee44619f27e63caaed1f2e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16864/sal-fina-mesa-hacendado-bote	t
1278	2	1	Sal yodada fina Hacendado	0.45	0.45	kg	https://prod-mercadona.imgix.net/images/409a53c0327dff2c4b91e6b4c58efa42.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19732/sal-yodada-fina-hacendado-paquete	t
1279	2	1	Sal gruesa Hacendado	0.40	0.40	kg	https://prod-mercadona.imgix.net/images/8b9798cc6f23201e8191711f58368727.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19733/sal-gruesa-hacendado-paquete	t
1280	2	1	Bicarbonato de sódio Hacendado	1.45	1.45	kg	https://prod-mercadona.imgix.net/images/5ae57e0348cf657e21ffa47ad36ea448.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29007/bicarbonato-sodico-hacendado-paquete	t
1281	2	1	Bicarbonato de sódio Hacendado	1.10	3.67	kg	https://prod-mercadona.imgix.net/images/0cdfaaf94335d5701e8f433bdf49c914.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29006/bicarbonato-sodico-hacendado-bote	t
1282	2	1	Escamas de sal marina natural Polasal	2.00	16.00	kg	https://prod-mercadona.imgix.net/images/36bc3658a807997961ec5fda23dd948e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19740/sal-marina-escamas-polasal-bote	t
1283	2	1	Sal gruesa para hornear Hacendado	1.40	0.70	kg	https://prod-mercadona.imgix.net/images/c46d67d22d1cf40d537ab349322b8da2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19734/sal-gruesa-hornear-hacendado-paquete	t
1284	3	1	Sal de ajo Hacendado	1.80	13.85	kg	https://prod-mercadona.imgix.net/images/bd81680a3655bf89428f333254f34979.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34130/sal-ajo-hacendado-bote	t
1285	37	1	Sal de frutas sabor limón Hacendado	2.10	8.40	kg	https://prod-mercadona.imgix.net/images/e01b7ced535cf57318ff7c7a1628d3ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29016/sal-frutas-sabor-limon-hacendado-bote	t
1286	2	1	Sal 60% menos de sodio Hacendado	2.30	9.20	kg	https://prod-mercadona.imgix.net/images/eeb93d74d5e3298a8f93b4b78dffdb7b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19713/sal-60-menos-sodio-hacendado-bote	t
1287	2	1	Preparado para ahumar Hacendado	3.30	4.40	kg	https://prod-mercadona.imgix.net/images/6666d298f039f78188651aa1fd47dc03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19726/preparado-salmon-ahumado-hacendado-bote	t
1288	2	1	Sal rosa del Himalaya Hacendado	2.65	2.65	kg	https://prod-mercadona.imgix.net/images/6dbe958696d20fec014fbbf536ea4593.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8930/sal-rosa-himalaya-hacendado-paquete	t
1289	3	1	Orégano Hacendado	1.00	40.00	kg	https://prod-mercadona.imgix.net/images/20a564cf97b2b9662bb7727d6008ed69.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5598/oregano-hacendado-bote	t
1290	3	1	Perejil Hacendado	0.95	52.78	kg	https://prod-mercadona.imgix.net/images/b2bc740ba01dd6f5b0c62f44a5557dee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5599/perejil-hacendado-bote	t
1291	3	1	Hoja de laurel Hacendado	0.85	70.83	kg	https://prod-mercadona.imgix.net/images/4bce6bcc4f7a9880f0ee238f3e27003d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47994/hoja-laurel-hacendado-paquete	t
1292	3	1	Hierbas provenzales Hacendado	1.20	48.00	kg	https://prod-mercadona.imgix.net/images/75ea233839587117b294f2d15027f57a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34131/hierbas-provenzales-hacendado-bote	t
1293	3	1	Albahaca Hacendado	1.25	62.50	kg	https://prod-mercadona.imgix.net/images/666740b544111126529a014431ba81f4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34128/albahaca-hacendado-bote	t
1294	3	1	Tomillo Hacendado	1.05	43.75	kg	https://prod-mercadona.imgix.net/images/23cda8ba2719d64662af5acde3485411.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5547/tomillo-hacendado-bote	t
1295	3	1	Eneldo Hacendado	1.85	102.78	kg	https://prod-mercadona.imgix.net/images/aa7bf59873bb1c4e11267001b37e8632.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52739/eneldo-hacendado-bote	t
1296	3	1	Cilantro Hacendado	1.85	154.17	kg	https://prod-mercadona.imgix.net/images/27379a6a13ab30cfb594a4b326f1f66c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34721/cilantro-hacendado-bote	t
1297	3	1	Ajo y Perejil Hacendado	1.35	18.24	kg	https://prod-mercadona.imgix.net/images/eb87b609baabad143d6cf74cebfc589e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60873/ajo-perejil-hacendado-bote	t
1298	3	1	Romero Hacendado	1.35	38.57	kg	https://prod-mercadona.imgix.net/images/8c7d240713cf6b4dc87f4ae05c734fdc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14981/romero-hacendado-bote	t
1299	3	1	Colorante alimentario Hacendado	0.95	11.18	kg	https://prod-mercadona.imgix.net/images/279afe277bed6a3c1af998dbda9b66e7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34182/colorante-alimentario-hacendado-bote	t
1300	3	1	Pimentón dulce de la Vera Hacendado	1.85	24.67	kg	https://prod-mercadona.imgix.net/images/fc6f52e3aa7435cc0e851a43697e8b06.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34102/pimenton-dulce-vera-hacendado-bote	t
1301	3	1	Azafrán molido Hacendado	1.90	4750.00	kg	https://prod-mercadona.imgix.net/images/9b1e3bf3f850bb972810225a35e2d27e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34116/azafran-molido-hacendado-paquete	t
1302	3	1	Azafrán hebra Hacendado	1.95	4875.00	kg	https://prod-mercadona.imgix.net/images/3434b4736a34f67f0e66575d8e2a2983.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8370/azafran-hebra-hacendado-paquete	t
1303	3	1	Pimentón picante Hacendado	1.35	22.50	kg	https://prod-mercadona.imgix.net/images/2f865dc2dc829da4a0e2962fb922cd9c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34183/pimenton-picante-hacendado-bote	t
1304	3	1	Pimentón dulce Hacendado	1.30	17.33	kg	https://prod-mercadona.imgix.net/images/fa8610da91855ce1394dcac73c68220e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60573/pimenton-dulce-hacendado-bote	t
1305	3	1	Pimienta negra molida Hacendado	1.30	18.57	kg	https://prod-mercadona.imgix.net/images/905e76fd8f59b3931ae5e2c586c4a9f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34171/pimienta-negra-molida-hacendado-bote	t
1306	3	1	Molinillo pimienta negra Hacendado	1.85	28.46	kg	https://prod-mercadona.imgix.net/images/ff80991c845784c85981a779586661c9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67693/molinillo-pimienta-negra-hacendado-bote	t
1307	3	1	Pimienta negra en grano Hacendado	1.70	24.29	kg	https://prod-mercadona.imgix.net/images/ade2f829444a465f07de05c97b526258.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34172/pimienta-negra-grano-hacendado-bote	t
1308	3	1	Molinillo mix pimientas Hacendado	1.95	39.00	kg	https://prod-mercadona.imgix.net/images/16d512e03ea3f4513a43a085403cba3f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67694/molinillo-mix-pimientas-hacendado-bote	t
1309	3	1	Pimienta blanca molida Hacendado	2.30	32.86	kg	https://prod-mercadona.imgix.net/images/a8cedadb6026482169a838838a6943d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34170/pimienta-blanca-molida-hacendado-bote	t
1310	3	1	Ajo granulado Hacendado	1.20	10.43	kg	https://prod-mercadona.imgix.net/images/10f7ce7fe35de8f5b595db38a95a9cc5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86656/ajo-granulado-hacendado-bote	t
1311	3	1	Cebolla frita crujiente Hacendado	1.15	7.67	kg	https://prod-mercadona.imgix.net/images/181ada199674ece135e225c9a06936c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34208/cebolla-frita-crujiente-hacendado-bote	t
1312	3	1	Canela molida Hacendado	1.00	19.23	kg	https://prod-mercadona.imgix.net/images/22948761cf10a9f149a06ec505fb8dcd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34177/canela-molida-hacendado-bote	t
1313	3	1	Canela molida Hacendado	2.80	15.56	kg	https://prod-mercadona.imgix.net/images/ceb9fa6f5e65ae71fb1bae37f6e0328d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34118/canela-molida-hacendado-bote	t
1314	3	1	Canela en rama Hacendado	1.50	78.95	kg	https://prod-mercadona.imgix.net/images/79a95af1248f3f9e5f0a5fab40e06adf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52880/canela-rama-hacendado-bote	t
1315	3	1	Canela en rama Hacendado	4.25	60.71	kg	https://prod-mercadona.imgix.net/images/1fc507378b1f10f34d7c8b788a96dd2a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34117/canela-rama-hacendado-bote	t
1316	3	1	Comino molido Hacendado	1.20	20.69	kg	https://prod-mercadona.imgix.net/images/003c9821946990d15215928c180ec0b7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34120/comino-molido-hacendado-bote	t
1317	3	1	Comino en grano Hacendado	1.95	34.82	kg	https://prod-mercadona.imgix.net/images/945a39457b8b947b612650a22e7a2c71.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34121/comino-grano-hacendado-bote	t
1318	3	1	Curry Hacendado	1.10	19.30	kg	https://prod-mercadona.imgix.net/images/d0e4385a7ea14148366d4c87bb3b0dc4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34125/curry-hacendado-bote	t
1319	3	1	Nuez moscada molida Hacendado	1.65	28.45	kg	https://prod-mercadona.imgix.net/images/26a3c69f637bdb1722940dbaa79f6cf9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34173/nuez-moscada-molida-hacendado-bote	t
1320	3	1	Cayena guindillas Hacendado	1.36	50.37	kg	https://prod-mercadona.imgix.net/images/ca1ef5080300ea3323d59f0911f471db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34178/cayena-guindillas-hacendado-bote	t
1321	3	1	Cayena molida Hacendado	1.65	30.00	kg	https://prod-mercadona.imgix.net/images/e0224e197ff6535f418d187efc499d56.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/37417/cayena-molida-hacendado-bote	t
1322	3	1	Cúrcuma Hacendado	1.30	21.67	kg	https://prod-mercadona.imgix.net/images/bbb23780061cfd84ea7c8b8890715380.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34163/curcuma-hacendado-bote	t
1323	3	1	Jengibre molido Hacendado	1.65	33.67	kg	https://prod-mercadona.imgix.net/images/660b9d830317ff63daa0a5a5cfe4cdb2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34149/jengibre-molido-hacendado-bote	t
1324	3	1	Sal de ajo Hacendado	1.80	13.85	kg	https://prod-mercadona.imgix.net/images/bd81680a3655bf89428f333254f34979.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34130/sal-ajo-hacendado-bote	t
1325	3	1	Ñoras Hacendado	1.56	62.40	kg	https://prod-mercadona.imgix.net/images/4b8bb2de7c473819516a8213b9594653.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34113/noras-hacendado-paquete	t
1326	3	1	Clavo en grano Hacendado	1.75	41.67	kg	https://prod-mercadona.imgix.net/images/4454375471a75b1e36fe451869e79460.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34122/clavo-grano-hacendado-bote	t
1327	37	1	Piñones Hacendado	3.25	46.43	kg	https://prod-mercadona.imgix.net/images/02e0f0831ef5993a494fae1eaee591cd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60869/pinones-hacendado-bote	t
1328	3	1	Pimientos secos Hacendado	1.90	38.00	kg	https://prod-mercadona.imgix.net/images/b5fb820b5c4dbb705b6811da74a7fd88.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86427/pimientos-secos-hacendado-caja	t
1329	3	1	Sazonador para fajitas Hacendado sabor tex-mex	0.85	50.00	kg	https://prod-mercadona.imgix.net/images/a2a73acd32117e7d34c0e98c253e354a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23353/sazonador-fajitas-hacendado-sabor-tex-mex	t
1330	3	1	Sazonador ajo y limón Hacendado para carne y pescado	1.05	35.00	kg	https://prod-mercadona.imgix.net/images/26b013a64d9b59231a8c4b8528ecf274.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11971/sazonador-ajo-limon-hacendado-carne-pescado-horno-microondas-con-bolsa	t
1331	3	1	Sazonador hierbas provenzales Hacendado para pollo y costillas	1.00	41.67	kg	https://prod-mercadona.imgix.net/images/5f70b8323c4c746222517fe9b1da3b9c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11972/sazonador-hierbas-provenzales-hacendado-pollo-costillas-horno-microondas-con-bolsa	t
1332	3	1	Sazonador barbacoa Hacendado para pollo y costillas	1.30	22.81	kg	https://prod-mercadona.imgix.net/images/e8d632c554c1be1a560387bf2f53a2ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86659/sazonador-sabor-barbacoa-hacendado-carne	t
1333	3	1	Sazonador para paella con azafrán Hacendado	1.55	77.50	kg	https://prod-mercadona.imgix.net/images/ee39fe8069bfe773fea6cc75249cdeb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34702/sazonador-paella-con-azafran-hacendado-caja	t
1334	3	1	Sazonador para burritos Hacendado	1.30	32.50	kg	https://prod-mercadona.imgix.net/images/30901faab224f1632f25fec8b71a5fa3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17147/sazonador-burritos-hacendado	t
1335	3	1	Sazonador pollo y carne Hacendado	1.40	18.42	kg	https://prod-mercadona.imgix.net/images/3ad2c1cd979434c98e651e6382660bf1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86808/sazonador-pollo-carne-hacendado-bote	t
1336	3	1	Sazonador pasta Hacendado	1.60	35.56	kg	https://prod-mercadona.imgix.net/images/45eeee3ab3e380f3e0892e61e724bec8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60640/sazonador-pasta-hacendado-bote	t
1337	3	1	Sazonador Topping Hacendado	1.85	41.11	kg	https://prod-mercadona.imgix.net/images/cd73bd7aaf2c11beb0c86692703761af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13936/sazonador-topping-hacendado-bote	t
1338	4	1	Mayonesa en sobres individuales Hacendado	1.40	5.83	l	https://prod-mercadona.imgix.net/images/6b9a1437ed7f3785c2319cb081540046.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23816/mayonesa-sobres-individuales-pack-12	t
1339	4	1	Mayonesa Hellmann's	2.65	5.89	l	https://prod-mercadona.imgix.net/images/4532a40515867d803fa054c5d18f5d12.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35840/mayonesa-hellmanns-tarro	t
1340	4	1	Salsa Original Ligeresa	2.50	5.88	l	https://prod-mercadona.imgix.net/images/97b123513a759039bd5c38a4e8ae2dad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35839/salsa-ligera-ligeresa-tarro	t
1341	4	1	Salsa Original Ligeresa	2.65	6.16	l	https://prod-mercadona.imgix.net/images/a45ff52260764c6ce4a7679e841a8060.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17039/salsa-ligera-ligeresa-bote	t
1342	4	1	Mayonesa Ybarra	2.45	4.90	l	https://prod-mercadona.imgix.net/images/28fb52ec1b742fc1db06e020c0a3aa0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17038/mayonesa-ybarra-bote	t
1343	4	1	Salsa Light Hacendado	1.30	2.60	l	https://prod-mercadona.imgix.net/images/54a5e9e2a8bd0173da353d48cfa16211.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15793/salsa-ligera-hacendado-60-menos-materia-grasa-tarro	t
1344	4	1	Salsa Light Hacendado	1.50	3.06	l	https://prod-mercadona.imgix.net/images/b5dc1f61915220fb90a23d411bede969.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11551/salsa-light-hacendado-bote	t
1345	4	1	Ketchup en sobres individuales Hacendado	1.40	5.83	kg	https://prod-mercadona.imgix.net/images/fdd6165134ec5a050d930e02a92191eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67586/ketchup-hacendado-sobres-individuales-paquete	t
1346	4	1	Salsa de tomate Zero sin azúcares añadidos Hacendado	1.60	2.67	kg	https://prod-mercadona.imgix.net/images/4ecccbaf38713c3f2966540720c5eec8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35343/ketchup-zero-azucares-anadidos-hacendado-bote	t
1347	4	1	Mostaza a la antigua Hacendado	1.70	8.50	kg	https://prod-mercadona.imgix.net/images/231d24a385657047968b51e4ee6b6db5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17229/mostaza-antigua-hacendado-tarro	t
1348	4	1	Mostaza de Dijon Hacendado	1.25	6.25	kg	https://prod-mercadona.imgix.net/images/732a547ddb13e1ac5d7242a79807c611.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17228/mostaza-dijon-hacendado-tarro	t
1349	4	1	Mostaza clásica Hacendado	1.35	3.48	kg	https://prod-mercadona.imgix.net/images/8a0749aa163298f9b2b036de495a1b05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23410/mostaza-clasica-hacendado-bote	t
1350	4	1	Allioli Chovi	1.55	8.61	l	https://prod-mercadona.imgix.net/images/8dd36370d7a4694f15c53ae896c21960.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17150/allioli-chovi-tarrina	t
1351	4	1	Allioli Hacendado	1.10	5.50	l	https://prod-mercadona.imgix.net/images/75743f79bdd54af55f258c3d80e48cbd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17172/allioli-hacendado-tarrina	t
1352	4	1	Allioli en sobres individuales Hacendado	1.60	10.00	l	https://prod-mercadona.imgix.net/images/a3af7184fb2d5417c88ac0cf9d4b9898.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17173/allioli-sobres-individuales-hacendado-paquete	t
1353	4	1	Alioli con perejil Hacendado	1.45	4.68	l	https://prod-mercadona.imgix.net/images/2e58797a3c0394cc4e05a231a967c587.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7973/alioli-canario-hacendado-bote	t
1354	4	1	Tomate frito estilo casero Hacendado	1.20	3.16	kg	https://prod-mercadona.imgix.net/images/b316f525c80033093912e2829796b5cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17153/tomate-frito-estilo-casero-hacendado-con-aceite-oliva-brick	t
1355	4	1	Tomate frito sin azúcares añadidos Hacendado	1.10	1.96	kg	https://prod-mercadona.imgix.net/images/0680dffe67fb4eac8c3423ddd35f15a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17330/tomate-frito-sin-azucares-anadidos-hacendado-tarro	t
1356	4	1	Salsa Barbacoa Hacendado	1.15	3.29	kg	https://prod-mercadona.imgix.net/images/d01e6c7c307f1c60a9e67aac3e22700e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17346/salsa-barbacoa-hacendado-bote	t
1357	4	1	Salsa pimienta verde Hacendado	1.25	25.00	kg	https://prod-mercadona.imgix.net/images/66986e35fb04401c696133d645f401d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17502/salsa-pimienta-verde-hacendado	t
1358	4	1	Salsa Burger Hacendado	1.40	5.60	l	https://prod-mercadona.imgix.net/images/c11a9b7e2f3a5b67d87cfb33583193e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17347/salsa-burger-hacendado-bote	t
1359	4	1	Salsa Piri Piri Hacendado	1.00	5.13	l	https://prod-mercadona.imgix.net/images/c17d2319747366d2987a22ad455aa37e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17396/salsa-piri-piri-hacendado-botella	t
1360	4	1	Salsa curry Tikka Masala Hacendado picante	2.00	11.11	kg	https://prod-mercadona.imgix.net/images/10d9d4c3a66655996a17513dca01d11b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35412/salsa-curry-tikka-masala-hacendado-picante-paquete	t
1361	4	1	Salsa Brasa & Sabor Hacendado	1.60	5.16	l	https://prod-mercadona.imgix.net/images/c98f3f4b8a0bfc1145928ae4aa660f40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12847/salsa-brasa-sabor-hacendado-bote	t
1362	4	1	Salsa Pesto con albahaca Hacendado	1.95	10.26	kg	https://prod-mercadona.imgix.net/images/0bb668dd6446fae242c2af59e4fa96a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35438/salsa-pesto-con-albahaca-hacendado-tarro	t
1363	4	1	Salsa de tomate Boloñesa Hacendado	1.90	4.75	kg	https://prod-mercadona.imgix.net/images/b43441a6206b27f5f6c6d2c5d9a5068b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52858/salsa-tomate-bolonesa-hacendado-tarro	t
1364	4	1	Salsa de tomate con Albahaca Hacendado	1.65	4.13	kg	https://prod-mercadona.imgix.net/images/0e502392ac037a1aefa8b4ed789485fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52859/salsa-tomate-con-albahaca-hacendado-tarro	t
1365	4	1	Salsa fresca Trufa Hacendado	1.55	11.07	kg	https://prod-mercadona.imgix.net/images/912baa300a06ed9f81d714338bda0d1d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17410/salsa-fresca-trufa-hacendado-paquete	t
1366	4	1	Salsa fresca Queso Hacendado	1.55	8.61	kg	https://prod-mercadona.imgix.net/images/1e524f23891de8f06943ee50efcca5eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17409/salsa-fresca-queso-hacendado-paquete	t
1367	4	1	Salsa fresca Pesto con albahaca Hacendado	2.00	13.33	kg	https://prod-mercadona.imgix.net/images/8fb9b98cc697b51cc7cd933970c9296a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35186/salsa-fresca-pesto-con-albahaca-hacendado-tarrina	t
1368	4	1	Salsa fresca Setas Hacendado	1.55	7.75	kg	https://prod-mercadona.imgix.net/images/eac4ecea33015d0a73fb2a177ca6531b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7972/salsa-fresca-setas-hacendado-bol	t
1369	4	1	Salsa de Soja Hacendado	1.20	4.80	l	https://prod-mercadona.imgix.net/images/ecdca4a8897163723c7826a359c12db8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17360/salsa-soja-hacendado-botella	t
1370	4	1	Salsa Teriyaki Hacendado	1.70	6.80	l	https://prod-mercadona.imgix.net/images/b361883f2b0e1831df892c20d8d3177f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17362/salsa-teriyaki-hacendado-botella	t
1371	4	1	Salsa Thai Chili dulce J-Lek	1.55	6.20	l	https://prod-mercadona.imgix.net/images/6624bbf085f2c5cbd7a1bc2d96cae4a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22613/salsa-thai-chili-dulce-j-lek-botella	t
1372	4	1	Salsa de Soja sin gluten Hacendado	2.50	10.00	l	https://prod-mercadona.imgix.net/images/72f1e3b9e1300b612fb69f4da0aef0a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17382/salsa-soja-sin-gluten-hacendado-botella	t
1373	4	1	Salsa Yogur Hacendado	1.20	3.87	l	https://prod-mercadona.imgix.net/images/f4f57aefa10e985720547fb5709d2239.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17327/salsa-yogur-hacendado-bote	t
1374	4	1	Salsa Mexicana Hacendado	1.25	4.17	kg	https://prod-mercadona.imgix.net/images/e2a7598c750f05d6a6635c5f5b2f7e93.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16827/salsa-mexicana-hacendado-tarro	t
1375	4	1	Salsa Ranch Hacendado	1.40	5.60	l	https://prod-mercadona.imgix.net/images/a2d702a98df2e597f718d77732ff9552.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17386/salsa-ranch-hacendado-bote	t
1376	4	1	Salsa César Hacendado	1.40	4.52	l	https://prod-mercadona.imgix.net/images/122802e38ed7cd81b07053e5a0728859.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17366/salsa-cesar-hacendado-bote	t
1377	4	1	Aliño de aceite con perejil y ajo Hacendado	1.80	12.00	l	https://prod-mercadona.imgix.net/images/7582550ed8c16126b739f1352fa53f6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17265/alino-aceite-ajo-perejil-hacendado-tarrina	t
1378	4	1	Salsa Miel y Mostaza Hacendado	1.45	4.26	kg	https://prod-mercadona.imgix.net/images/bf1910aae611cceecb9f3f477905425b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52467/salsa-miel-mostaza-hacendado-bote	t
1379	4	1	Salsa de Trufa	3.10	38.75	kg	https://prod-mercadona.imgix.net/images/5cc6e29dc5753bd3e518ffa264cfc631.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17259/salsa-trufas-bote	t
1380	4	1	Salsa Gajo Rústica Hacendado	1.35	5.40	l	https://prod-mercadona.imgix.net/images/b641a38df5c6478343e0e35e03703335.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17348/salsa-gajos-rustica-hacendado-bote	t
1381	4	1	Salsa de Queso Hacendado	1.65	5.89	l	https://prod-mercadona.imgix.net/images/60eedac26028c156a6fab3568640b4a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35344/salsa-queso-hacendado-tarro	t
1382	4	1	Chili con carne Hacendado	2.80	6.67	kg	https://prod-mercadona.imgix.net/images/23f1baf002c760cb149df11895be7370.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23137/chili-con-carne-hacendado-bote	t
1383	4	1	Salsa Cocktail Hacendado	1.50	3.06	l	https://prod-mercadona.imgix.net/images/61e5171a82fd8a3a4fd026482190bf2e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11552/salsa-cocktail-hacendado-bote	t
1384	4	1	Carne de pimiento choricero Hacendado	1.55	11.07	kg	https://prod-mercadona.imgix.net/images/9e50c105104706ffbc3a73c66453c47c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34157/carne-pimiento-choricero-hacendado-tarro	t
1385	3	1	Pasta de sésamo Tahini Hacendado	2.95	14.75	kg	https://prod-mercadona.imgix.net/images/cff0f56138bafc3ab2ed1bdf5487f2cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/17441/pasta-sesamo-tahini-hacendado-tarro	t
1386	5	1	Arroz redondo J Sendra Hacendado	1.60	1.60	kg	https://prod-mercadona.imgix.net/images/44a0df1169e9ebdceb061ebea08b4d42.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5042/arroz-redondo-j-sendra-hacendado-paquete	t
1387	5	1	Arroz basmati aromático Hacendado	2.10	2.10	kg	https://prod-mercadona.imgix.net/images/ff02e0b326c0d33682f76e66cc825dda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5002/arroz-basmati-aromatico-hacendado-paquete	t
1388	5	1	Arroz vaporizado Hacendado	1.55	1.55	kg	https://prod-mercadona.imgix.net/images/1c5a40f534247a5a8b8e16737c809be8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5020/arroz-vaporizado-hacendado-paquete	t
1389	5	1	Quinoa Hacendado	2.70	5.40	kg	https://prod-mercadona.imgix.net/images/5f96e6f16b3a5d30f2fd7135e3d1f74e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9430/quinoa-hacendado-paquete	t
1390	5	1	Arroz redondo SOS	1.88	1.88	kg	https://prod-mercadona.imgix.net/images/1690038adebedc10db9c9b93dd921f9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5024/arroz-redondo-sos-paquete	t
1391	5	1	Arroz vaporizado Brillante	1.98	1.98	kg	https://prod-mercadona.imgix.net/images/acbc70377b3c46d3334fd2a103fe2a15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5049/arroz-vaporizado-brillante-caja	t
1392	5	1	Arroz integral largo Hacendado	1.65	1.65	kg	https://prod-mercadona.imgix.net/images/4991480b2fe769d8673224a89d50636c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5184/arroz-integral-largo-hacendado-paquete	t
1393	5	1	Arroz redondo Sabor	2.45	2.45	kg	https://prod-mercadona.imgix.net/images/bc5fcc520250ffec2cada3273830046c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52637/arroz-redondo-sabor-cigala-paquete	t
1394	18	1	Arroz de secreto ibérico con setas Hacendado	3.00	10.71	kg	https://prod-mercadona.imgix.net/images/684837af387e0aed29107a23db57a590.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22767/arroz-secreto-iberico-con-setas-hacendado-bandeja	t
1395	18	1	Pollo al curry Hacendado con arroz basmati	2.85	10.18	kg	https://prod-mercadona.imgix.net/images/2eecb819ac61c1a941dd70d4b9f5959b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4498/pollo-curry-hacendado-con-arroz-basmati-bandeja	t
1396	18	1	Arroz de verduras Hacendado	3.50	12.50	kg	https://prod-mercadona.imgix.net/images/b523da0904fd1204cc76e6cc709ffab1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60621/arroz-verduras-hacendado-bandeja	t
1397	21	1	Arroz tres delicias Hacendado ultracongelado	2.85	2.85	kg	https://prod-mercadona.imgix.net/images/428728aa152dad6c0476a1c0ce694804.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86905/arroz-tres-delicias-hacendado-ultracongelado-con-2-sazonadores-paquete	t
1398	21	1	Arroz para microondas Hacendado ultracongelado	2.00	2.00	kg	https://prod-mercadona.imgix.net/images/6e9554aa659c51ead8bc8f8a4ff4cfda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61302/arroz-precocido-hacendado-ultracongelado-paquete	t
1399	21	1	Risotto de setas para microondas Hacendado ultracongelado	2.00	5.71	kg	https://prod-mercadona.imgix.net/images/4eb44aeae5386d37310949b8b6909baf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22720/risotto-setas-hacendado-ultracongelados-paquete	t
1400	21	1	Arroz negro Hacendado ultracongelado	3.00	5.00	kg	https://prod-mercadona.imgix.net/images/d2da7fb2337140feb1f91337e2d6ec41.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35541/arroz-negro-hacendado-ultracongelado-paquete	t
1401	21	1	Arroz con verduras para microondas Hacendado ultracongelado	2.00	2.50	kg	https://prod-mercadona.imgix.net/images/3ec70d5faabb7b56be94793ba994dc27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12756/arroz-con-verduras-hacendado-ultracongelado-paquete	t
1402	24	1	Fideo cabello de ángel Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/1363c496f3db978816e06031cca27497.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13577/fideo-cabello-angel-hacendado-paquete	t
1403	5	1	Fideuá Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/e5b402647751a7b60f87b4663bdc86e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6253/fideua-hacendado-paquete	t
1404	5	1	Fideo grueso Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/0778f8e6272f1c743d1da88f16c4d978.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6261/fideo-grueso-hacendado-paquete	t
1405	5	1	Pasta estrellas Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/6c418320c51659907a16ff4f9192a2cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6363/pasta-estrellas-hacendado-sopa-paquete	t
1406	5	1	Pasta maravilla Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/dbd6fee787fb1be15b95c11e1ba3787b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6258/pasta-maravilla-hacendado-sopa-paquete	t
1407	5	1	Fideo mediano Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/1af340d1ed092fc1cae6c712c683edfb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6256/fideo-mediano-hacendado-paquete	t
1408	5	1	Pasta estrellas sin gluten Felicia	2.05	4.10	kg	https://prod-mercadona.imgix.net/images/46c851a9313511a601d36b186e914943.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35618/pasta-estrellas-sin-gluten-felicia-sopa-paquete	t
1409	5	1	Pajaritas vegetales Hacendado	1.10	2.20	kg	https://prod-mercadona.imgix.net/images/efecccdb297479c7a16f0555a3375159.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6305/pajaritas-vegetales-hacendado-paquete	t
1410	5	1	Macarrón rayado integral Hacendado	1.15	2.30	kg	https://prod-mercadona.imgix.net/images/231ef027d5b28f7040b3075da848399f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35777/pasta-penne-integral-hacendado-paquete	t
1411	5	1	Pasta tortiglioni Armando	1.40	2.80	kg	https://prod-mercadona.imgix.net/images/a4d3db444d4e97cf724bd457aadcb05a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6358/pasta-tortiglioni-armando-paquete	t
1412	5	1	Hélices con vegetales Hacendado	1.60	1.60	kg	https://prod-mercadona.imgix.net/images/5bd047881961f8b0d75b872f9fca6c37.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6344/helices-con-vegetales-hacendado-paquete	t
1413	5	1	Macarrón fino Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/f846b6d8b9daffa2b61c4c115020d4dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6260/macarron-fino-hacendado-paquete	t
1414	5	1	Macarrón al huevo Hacendado	1.45	2.90	kg	https://prod-mercadona.imgix.net/images/a0fc33fa49ff80a6ddca3a72f81d0cc7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6300/macarron-huevo-hacendado-paquete	t
1415	5	1	Macarrón Hacendado	1.20	1.20	kg	https://prod-mercadona.imgix.net/images/cda379128cb90486efb0fed078a84d77.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6250/macarron-hacendado-paquete	t
1416	5	1	Pasta fusilli 100% lentejas rojas Felicia	1.65	6.60	kg	https://prod-mercadona.imgix.net/images/b82394e08ac387522c2286fb9c234b5f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6106/pasta-fusilli-100-lentejas-rojas-felicia-paquete	t
1417	5	1	Pasta trottole vegetales Hacendado	1.25	2.50	kg	https://prod-mercadona.imgix.net/images/24a13866672641e026b0b12f861c40a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6371/pasta-trottole-vegetales-hacendado-paquete	t
1418	5	1	Pasta tiburón Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/506ce30bd61077a0741cb2070591512b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6244/pasta-tiburon-hacendado-paquete	t
1419	5	1	Hélices Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/f094e05620d548b523d151aca9a9c1ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6238/helices-hacendado-paquete	t
1420	5	1	Macarrón Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/0bc560a6ddf6715145d432320b7c86a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6326/macarron-hacendado-paquete	t
1421	5	1	Pasta fusilli sin gluten Felicia	2.05	4.10	kg	https://prod-mercadona.imgix.net/images/3af5b4c2432b3edc314579b731b39d8a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35643/pasta-fusilli-sin-gluten-felicia-paquete	t
1422	5	1	Pasta penne rigate Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/9e481faa7f6bb103dfccdc80201f0777.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8138/pasta-penne-rigate-hacendado-paquete	t
1423	5	1	Tallarines Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/4481a4464aa80f64efda21a8e2636a85.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6246/tallarines-hacendado-paquete	t
1424	5	1	Spaghetti integral Hacendado	1.15	2.30	kg	https://prod-mercadona.imgix.net/images/3e10d3e036f04703c87e31a01d680ebc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35778/spaghetti-integral-hacendado-paquete	t
1425	5	1	Spaghetti fino Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/12cb042a1db2a965e3a7b1be7b01bd62.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6277/spaghetti-fino-hacendado-paquete	t
1426	5	1	Nidos al huevo Hacendado	1.45	2.90	kg	https://prod-mercadona.imgix.net/images/8064cce95f23cceacd05a6fbec87ecb3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6321/nidos-huevo-hacendado-paquete	t
1427	5	1	Spaghetti al huevo Hacendado	1.45	2.90	kg	https://prod-mercadona.imgix.net/images/b26f3111a8c49a4c6f8b105e46a65c6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6302/spaghetti-huevo-hacendado-paquete	t
1428	5	1	Spaghetti Hacendado	1.20	1.20	kg	https://prod-mercadona.imgix.net/images/5924d3af3dacce93b77d069bb63541c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6245/spaghetti-hacendado-paquete	t
1429	5	1	Spaghetti Hacendado	0.80	1.60	kg	https://prod-mercadona.imgix.net/images/95d6d2f06790e9a8f8056b533616eab2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6331/spaghetti-hacendado-paquete	t
1430	5	1	Spaghetti sin gluten Felicia	2.05	4.10	kg	https://prod-mercadona.imgix.net/images/bef71a8d7de884a14da051e0218f7bf1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35670/spaghetti-sin-gluten-felicia-paquete	t
1431	5	1	Pasta fresca tagliatelle al huevo Hacendado	1.20	4.80	kg	https://prod-mercadona.imgix.net/images/7becef7fb81d8c8a41da7b5e135ba73b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6153/pasta-fresca-tagliatelle-huevo-hacendado-paquete	t
1432	5	1	Spaghetti Armando	1.40	2.80	kg	https://prod-mercadona.imgix.net/images/0c8389e84982b3e16d6503775057494e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35904/spaghetti-armando-paquete	t
1433	5	1	Noodles de arroz Hacendado	1.45	7.25	kg	https://prod-mercadona.imgix.net/images/cac4a840718d94b3a0bf284b467b960d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35981/noodles-arroz-hacendado-paquete	t
1434	5	1	Tortellini carne Pagani	1.40	5.60	kg	https://prod-mercadona.imgix.net/images/44b8ffd1b3cbe2d21d219fffd79f9cef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6565/tortellini-carne-pagani-paquete	t
1435	5	1	Tortellini tres quesos Pagani	1.40	5.60	kg	https://prod-mercadona.imgix.net/images/a4efb6b5f38489bbe632b2ca70fcd63e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6566/tortellini-tres-quesos-pagani-paquete	t
1436	5	1	Pasta fresca gnocchi Hacendado	1.00	2.00	kg	https://prod-mercadona.imgix.net/images/cba9ea825acfc6789572d4088ac61392.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6175/pasta-fresca-gnocchi-hacendado-paquete	t
1437	5	1	Fideos orientales Yatekomo sabor pollo Gallina Blanca	3.95	21.94	kg	https://prod-mercadona.imgix.net/images/df191749ac4882b0d836646d997ec6dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8645/fideos-orientales-yatekomo-sabor-pollo-gallina-blanca-pack-3	t
1438	5	1	Fideos orientales Yatekomo sabor pollo Gallina Blanca	1.55	25.83	kg	https://prod-mercadona.imgix.net/images/9691ef261d766ff9551df0a88c1ea5d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8618/fideos-orientales-yatekomo-sabor-pollo-gallina-blanca-vaso	t
1439	5	1	Fideos orientales Yakisoba sabor soja Hacendado	1.10	13.75	kg	https://prod-mercadona.imgix.net/images/28f4ae33a3283adac91dfd56813e3094.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8727/fideos-orientales-yakisoba-sabor-soja-hacendado-vaso	t
1440	5	1	Fideos orientales Yakisoba sabor soja Hacendado	0.90	10.00	kg	https://prod-mercadona.imgix.net/images/c5b3f99d81895edde8f133661d480db0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8730/fideos-orientales-yakisoba-sabor-soja-hacendado-paquete	t
1441	5	1	Fideos orientales sabor pollo Hacendado	0.90	13.85	kg	https://prod-mercadona.imgix.net/images/15c837040a1190dbaa8aa8b91694d67c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22453/fideos-orientales-sabor-pollo-hacendado-vaso	t
1442	5	1	Fideos orientales sabor picante Hacendado	0.90	13.85	kg	https://prod-mercadona.imgix.net/images/8bec671f939d6c273b8889b95bf5eae2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22455/fideos-orientales-sabor-picante-hacendado-vaso	t
1443	5	1	Fideos orientales Yatekomo sabor pollo Gallina Blanca	3.95	21.94	kg	https://prod-mercadona.imgix.net/images/df191749ac4882b0d836646d997ec6dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8645/fideos-orientales-yatekomo-sabor-pollo-gallina-blanca-pack-3	t
1444	5	1	Fideos orientales Yatekomo sabor pollo Gallina Blanca	1.55	25.83	kg	https://prod-mercadona.imgix.net/images/9691ef261d766ff9551df0a88c1ea5d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8618/fideos-orientales-yatekomo-sabor-pollo-gallina-blanca-vaso	t
1445	5	1	Fideos orientales Yakisoba sabor soja Hacendado	1.10	13.75	kg	https://prod-mercadona.imgix.net/images/28f4ae33a3283adac91dfd56813e3094.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8727/fideos-orientales-yakisoba-sabor-soja-hacendado-vaso	t
1446	5	1	Fideos orientales Yakisoba sabor soja Hacendado	0.90	10.00	kg	https://prod-mercadona.imgix.net/images/c5b3f99d81895edde8f133661d480db0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8730/fideos-orientales-yakisoba-sabor-soja-hacendado-paquete	t
1447	5	1	Fideos orientales sabor pollo Hacendado	0.90	13.85	kg	https://prod-mercadona.imgix.net/images/15c837040a1190dbaa8aa8b91694d67c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22453/fideos-orientales-sabor-pollo-hacendado-vaso	t
1448	5	1	Fideos orientales sabor picante Hacendado	0.90	13.85	kg	https://prod-mercadona.imgix.net/images/8bec671f939d6c273b8889b95bf5eae2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22455/fideos-orientales-sabor-picante-hacendado-vaso	t
1449	5	1	Fideos orientales sabor pollo Hacendado	0.65	10.00	kg	https://prod-mercadona.imgix.net/images/21653251ead8dac554e053423442a41c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35681/fideos-orientales-sabor-pollo-hacendado-paquete	t
1450	5	1	Placas para lasaña precocidas El Pavo	1.65	8.25	kg	https://prod-mercadona.imgix.net/images/96cc14f684c1d79e23f394f2ce293c7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6856/placas-lasana-precocidas-pavo-caja	t
1451	5	1	Placas para canelones El Pavo	1.35	10.80	kg	https://prod-mercadona.imgix.net/images/facea9d66785b6079ac2d856e9e453a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52889/placas-canelones-pavo-caja	t
1452	5	1	Garbanzo cocido Hacendado	0.85	1.49	kg	https://prod-mercadona.imgix.net/images/b8b807948038c4b64791632f799e9bd8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26029/garbanzo-cocido-hacendado-tarro	t
1453	5	1	Garbanzo cocido Hacendado	0.75	2.54	kg	https://prod-mercadona.imgix.net/images/66cff189ab481a314894b2ca6c1a5ff3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26039/garbanzo-cocido-hacendado-tarro	t
1454	5	1	Garbanzo Hacendado	2.20	2.20	kg	https://prod-mercadona.imgix.net/images/b917e6a5deaec485bc558150c129b2a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5214/garbanzo-hacendado-categoria-extra-paquete	t
1455	5	1	Garbanzo lechoso Andaluz Hacendado	2.50	2.50	kg	https://prod-mercadona.imgix.net/images/2656519be58b65a23ab94cbd25329b3e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5220/garbanzo-lechoso-andaluz-hacendado-paquete	t
1456	5	1	Alubia cocida blanca Hacendado	0.80	1.40	kg	https://prod-mercadona.imgix.net/images/f3797bcd3c8ed58804490159df581279.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26019/alubia-cocida-blanca-hacendado-tarro	t
1457	5	1	Alubia cocida blanca Hacendado	0.70	2.37	kg	https://prod-mercadona.imgix.net/images/5f0806bcbd4a2de3c9f7dd39468359bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26028/alubia-cocida-blanca-hacendado-tarro	t
1458	5	1	Alubia cocida roja Hacendado	1.20	2.11	kg	https://prod-mercadona.imgix.net/images/231e70f1833a97babe9b0ecab3bfee2c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26000/alubia-cocida-roja-hacendado-tarro	t
1459	5	1	Alubia cocida pinta Hacendado	1.25	2.19	kg	https://prod-mercadona.imgix.net/images/cb1552d49aded16856fe625f266137fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26001/alubia-cocida-pinta-hacendado-tarro	t
1460	5	1	Alubia blanca Hacendado	2.45	2.45	kg	https://prod-mercadona.imgix.net/images/ad8260b04f013a17ce1323a0f3ac40c5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5124/alubia-blanca-hacendado-categoria-extra-paquete	t
1461	5	1	Alubia negra Hacendado	2.50	2.50	kg	https://prod-mercadona.imgix.net/images/e48c5377a420309858064f278a555535.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67608/alubia-negra-hacendado-categoria-extra-paquete	t
1462	5	1	Alubia cocida granja Hacendado	1.75	3.07	kg	https://prod-mercadona.imgix.net/images/c0f70dce6b61bb53a4502627a4bba317.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26002/alubia-cocida-granja-hacendado-tarro	t
1463	5	1	Alubia pinta Hacendado	2.30	2.30	kg	https://prod-mercadona.imgix.net/images/268efef705ead613568cf2968a7ee44e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5128/alubia-pinta-hacendado-categoria-extra-paquete	t
1464	5	1	Alubia granja Hacendado	3.45	6.90	kg	https://prod-mercadona.imgix.net/images/86fefa38465ff8d12bc6ff1e5aa5b5f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5119/alubia-granja-hacendado-categoria-extra-paquete	t
1465	5	1	Lenteja pardina Hacendado	2.05	2.05	kg	https://prod-mercadona.imgix.net/images/8cddd0d855015bb1fe3ce140077d3ea3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5330/lenteja-pardina-hacendado-categoria-extra-paquete	t
1466	5	1	Lenteja cocida Hacendado	0.90	1.58	kg	https://prod-mercadona.imgix.net/images/50b071c4bae7230b8de346b495a7981b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26030/lenteja-cocida-hacendado-tarro	t
1467	5	1	Lenteja cocida Hacendado	0.75	2.54	kg	https://prod-mercadona.imgix.net/images/ffbc3f23e35051fc1a326bda5a4f9063.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26011/lenteja-cocida-hacendado-tarro	t
1468	5	1	Soja texturizada Luengo	2.70	13.50	kg	https://prod-mercadona.imgix.net/images/2e49aeea5693521296dc231e58aab300.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13926/soja-texturizada-luengo-paquete	t
1469	20	1	Atún claro en aceite de oliva Hacendado	4.90	10.21	kg	https://prod-mercadona.imgix.net/images/f99f0a2b9e478cee5b0e02fac62d4686.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18002/atun-claro-aceite-oliva-hacendado-pack-6	t
1470	20	1	Atún claro en aceite de oliva Hacendado	1.55	13.96	kg	https://prod-mercadona.imgix.net/images/ff946d98e9578c45513cbf77bbf4127d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18071/atun-claro-aceite-oliva-hacendado-lata	t
1471	20	1	Atún claro en aceite de oliva Hacendado	3.70	18.97	kg	https://prod-mercadona.imgix.net/images/666079e35f5efa5f551aba0c2136ea8e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18054/atun-claro-aceite-oliva-hacendado-bote	t
1472	20	1	Ventresca de atún claro en aceite de oliva Hacendado	3.30	29.73	kg	https://prod-mercadona.imgix.net/images/5610e6403d50026b3d4ded454fc74dd7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18011/ventresca-atun-claro-aceite-oliva-hacendado-lata	t
1473	20	1	Filetes de bonito del norte en aceite de oliva Hacendado	8.10	20.25	kg	https://prod-mercadona.imgix.net/images/b565c6df3e0976c383af67fe0d43f86a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18102/filetes-bonito-norte-aceite-oliva-hacendado-tarro	t
1474	20	1	Filetes de melva en aceite de oliva Hacendado	1.85	15.42	kg	https://prod-mercadona.imgix.net/images/81891326085ae9267ea256fca9001d73.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18107/filetes-melva-aceite-oliva-hacendado-lata	t
1475	20	1	Filetes de melva canutera con pimientos del piquillo Hacendado en aceite de oliva	1.80	20.00	kg	https://prod-mercadona.imgix.net/images/445a01e2f758999022716b69d4adb597.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18114/filetes-melva-canutera-con-pimientos-piquillo-hacendado-aceite-oliva-lata	t
1476	20	1	Filetes de caballa del sur en aceite de girasol Marinara	8.30	8.74	kg	https://prod-mercadona.imgix.net/images/41a5925a0ff2e99c416816b6538b3707.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18318/filetes-caballa-sur-aceite-girasol-marinara-lata	t
1477	20	1	Calamares enteros rellenos en salsa americana Hacendado	2.25	19.57	kg	https://prod-mercadona.imgix.net/images/338f1f6d025ff61d432b85a4dfc4fe6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18739/calamares-enteros-rellenos-salsa-americana-hacendado-lata	t
1478	20	1	Berberecho al natural XS Hacendado	3.20	17.30	kg	https://prod-mercadona.imgix.net/images/7063cd5dc297be7ae3b97485a2f6ace3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18509/berberecho-natural-xs-hacendado-lata	t
1479	20	1	Berberechos al natural S Hacendado	3.05	27.48	kg	https://prod-mercadona.imgix.net/images/5965f86ba556b007f94a7091bc958335.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18553/berberechos-natural-s-hacendado-65-100-piezas-lata	t
1480	20	1	Berberechos al natural M Hacendado	4.25	38.29	kg	https://prod-mercadona.imgix.net/images/5ac7a5163fa070f58948cd8df4b012f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18564/berberechos-natural-m-hacendado-45-65-piezas-lata	t
1481	20	1	Almejones al natural Hacendado	1.35	12.16	kg	https://prod-mercadona.imgix.net/images/575aaedf1adc5a371b9df161927362c6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18552/almejones-natural-cono-sur-lata	t
1482	20	1	Zamburiñas en salsa de vieira Hacendado	1.95	17.57	kg	https://prod-mercadona.imgix.net/images/b499b9f38e5e9adf2fafea74191fb9f4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23531/zamburinas-salsa-vieira-hacendado-lata	t
1483	20	1	Mejillones en escabeche Hacendado medianos	2.80	25.23	kg	https://prod-mercadona.imgix.net/images/fae302fdbab0be6efd926988ec0bacaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18602/mejillones-escabeche-hacendado-medianos-8-12-piezas-lata	t
1484	20	1	Mejillones al natural Hacendado pequeños	2.00	18.02	kg	https://prod-mercadona.imgix.net/images/c8879720b1c9bae132effcfb1f11d3d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18620/mejillones-natural-hacendado-pequenos-15-20-piezas-lata	t
1485	20	1	Mejillones picantes en escabeche Hacendado pequeños	2.00	18.02	kg	https://prod-mercadona.imgix.net/images/41d9e562d47217d27abdd266cd17e1dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18621/mejillones-picantes-escabeche-hacendado-pequenos-15-20-piezas-lata	t
1486	20	1	Mejillones en salsa de vieira Hacendado pequeños	2.00	18.02	kg	https://prod-mercadona.imgix.net/images/091a1ad796b0be07ad15548343d12ea0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18622/mejillones-salsa-vieira-hacendado-pequenos-13-18-piezas-lata	t
1487	20	1	Espárragos blancos medianos Hacendado	1.50	7.50	kg	https://prod-mercadona.imgix.net/images/85c714b08167eb401ae7f1da9565da16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16519/esparragos-delgados-hacendado-tarro	t
1488	20	1	Espárragos blancos delgados Hacendado cortos	1.25	6.25	kg	https://prod-mercadona.imgix.net/images/e7f7ee1d72f1a1c39320568b2c05bcd4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70744/esparragos-delgados-hacendado-tarro	t
1489	20	1	Espárragos blancos medianos Hacendado	1.85	5.36	kg	https://prod-mercadona.imgix.net/images/faccfd09dec0be2de2f1be8ad8d3b148.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/18562/esparragos-medianos-hacendado-tarro	t
1490	20	1	Espárragos blancos muy gruesos Hacendado enteros	2.90	5.37	kg	https://prod-mercadona.imgix.net/images/5f261c673f9c28f51f16c97b0316070a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16561/esparragos-muy-gruesos-hacendado-enteros-tarro	t
1491	20	1	Champiñones laminados Hacendado	1.00	2.82	kg	https://prod-mercadona.imgix.net/images/4c97fc1fdefb7083f3ddfa0fd6169cb4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16618/champinones-laminados-hacendado-bote	t
1492	20	1	Champiñón entero Hacendado	1.45	4.08	kg	https://prod-mercadona.imgix.net/images/c9822b081c46280f7b4242d55e9ab6a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16625/champinon-entero-hacendado-bote	t
1493	20	1	Pimientos del piquillo enteros Hacendado extra	1.45	4.26	kg	https://prod-mercadona.imgix.net/images/4809a31c1a159e97cf927b4f4673d0e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16005/pimientos-piquillo-enteros-hacendado-extra-tarro	t
1494	20	1	Guisantes extra Hacendado	0.95	2.44	kg	https://prod-mercadona.imgix.net/images/910f80b121e0d631f4846989a432e560.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16416/guisantes-extra-hacendado-bote	t
1495	20	1	Guisantes extra Hacendado	1.75	3.15	kg	https://prod-mercadona.imgix.net/images/94c16b610ccee72d27455e6b5efa93dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16415/guisantes-extra-hacendado-pack-3	t
1496	20	1	Judías verdes redondas Hacendado	1.20	1.82	kg	https://prod-mercadona.imgix.net/images/5da9e6258cbd2e45b4b84ad093cfc80b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16315/judias-verdes-redondas-hacendado-tarro	t
1497	20	1	Pimientos asados en tiras Hacendado	2.40	8.28	kg	https://prod-mercadona.imgix.net/images/8ced0c6ed820f4df77b1366caa05b147.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16103/pimientos-asados-tiras-hacendado-bandeja	t
1498	20	1	Corazones de alcachofa Hacendado	1.90	6.55	kg	https://prod-mercadona.imgix.net/images/a7cad11179f4e7cb9d2cd4e9fcb23f0e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16040/corazones-alcachofa-hacendado-tarro	t
1499	20	1	Corazones de alcachofa Hacendado	3.00	11.54	kg	https://prod-mercadona.imgix.net/images/a9be5787d69a5be109eb6eb1d1327042.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52757/corazones-alcachofa-hacendado-con-aceite-bandeja	t
1500	20	1	Zanahoria en tiras Hacendado	1.30	3.10	kg	https://prod-mercadona.imgix.net/images/204895d0beb4d93745236c1da6dae27a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13328/zanahoria-tiras-hacendado-tarro	t
1501	20	1	Judías verdes planas Hacendado	1.20	1.82	kg	https://prod-mercadona.imgix.net/images/f21552ea33a87050a81fdf078c972763.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16313/judias-verdes-planas-hacendado-tarro	t
1502	20	1	Remolacha en tiras Hacendado	1.35	3.21	kg	https://prod-mercadona.imgix.net/images/1307aff34f1db68897cb656b3e7b7e71.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13327/remolacha-tiras-hacendado-tarro	t
1503	20	1	Macedonia de verduras Hacendado	0.90	1.68	kg	https://prod-mercadona.imgix.net/images/b02bc731543db2034220551bc2b095d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16737/macedonia-verduras-hacendado-tarro	t
1504	20	1	Palmito al natural entero Hacendado	2.65	6.46	kg	https://prod-mercadona.imgix.net/images/43374b576a56a911911e4d1614c8c78b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16711/palmito-natural-entero-hacendado-tarro	t
1505	20	1	Pimientos en tiras condimentados Hacendado	1.15	3.97	kg	https://prod-mercadona.imgix.net/images/1e3d86aa503cabe4741af6a824fef676.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16117/pimientos-tiras-condimentados-hacendado-tarro	t
1506	20	1	Ensalada china Hacendado con mazorquitas	1.60	3.81	kg	https://prod-mercadona.imgix.net/images/6a7e64a9f72fdeff486a9b2f0e919b3d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13326/ensalada-china-hacendado-con-mazorquitas-tarro	t
1507	37	1	Cebolla caramelizada Hacendado	1.70	8.95	kg	https://prod-mercadona.imgix.net/images/5d20cfb914960bda6a9a576c332c3da9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52749/cebolla-caramelizada-hacendado-con-aceite-oliva-tarro	t
1508	20	1	Mazorquitas de maíz agridulce Hacendado	2.60	7.43	kg	https://prod-mercadona.imgix.net/images/2ebede8e519bda91716db94815679de5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16757/mazorquitas-maiz-agridulce-hacendado-tarro	t
1509	20	1	Chucrut al estilo bávaro Hengstenberg	2.20	3.24	kg	https://prod-mercadona.imgix.net/images/7b66eb76b8b2ffc2ae75566236447ed3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16717/chucrut-estilo-bavaro-hengstenberg-tarro	t
1510	20	1	Espárragos blancos gruesos Hacendado cortos	3.00	8.70	kg	https://prod-mercadona.imgix.net/images/23a5c95ee522b031689fc8c4760523e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35404/esparragos-hacendado-blancos-gruesos-tarro	t
1511	20	1	Corazones de alcachofa Hacendado	2.25	5.23	kg	https://prod-mercadona.imgix.net/images/37621acdd7d4e41a1c5dee40f91efdff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11958/corazones-alcachofa-hacendado-8-10-unidades-tarro	t
1512	20	1	Piña en su jugo Hacendado rodajas	2.50	3.67	kg	https://prod-mercadona.imgix.net/images/4d8bf0206b1f578973cd80fdf7d85179.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15203/pina-jugo-hacendado-rodajas-pack-3	t
1513	20	1	Piña en su jugo Hacendado rodajas	2.10	2.55	kg	https://prod-mercadona.imgix.net/images/55cb700fb12611f5b19eb1139fcec61c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15220/pina-jugo-hacendado-rodajas-bote	t
1514	20	1	Melocotón en almíbar Hacendado	2.05	2.44	kg	https://prod-mercadona.imgix.net/images/5dd673ae914d64f6f0e0d860b63f94af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60918/melocoton-almibar-hacendado-bote	t
1515	20	1	Melocotón en almíbar Hacendado	2.45	4.08	kg	https://prod-mercadona.imgix.net/images/9d7e5f364360bf0b850a4f9d273c0d15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15206/melocoton-almibar-hacendado-pack-3	t
1516	20	1	Melocotón light Hacendado sin azúcares añadidos	1.45	3.63	kg	https://prod-mercadona.imgix.net/images/37415e2642afa1f3e831be235f60d388.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15260/melocoton-light-hacendado-sin-azucares-anadidos-bote	t
1517	9	1	Dulce de membrillo Hacendado 0% azúcares añadidos	2.40	6.00	kg	https://prod-mercadona.imgix.net/images/501a7aa8aa38d911c22b414a06423b8f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35846/dulce-membrillo-hacendado-0-azucares-anadidos-tarrina	t
1518	24	1	Cabello de Ángel Hida	2.60	5.00	kg	https://prod-mercadona.imgix.net/images/a7ece520a47fb66a7ae6d9e9ddf711d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15031/cabello-angel-hida-bote	t
1519	19	1	Postre de manzana Jamar	1.90	2.68	kg	https://prod-mercadona.imgix.net/images/1b8747ed3348a64c526f80b92eb11683.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15086/postre-manzana-jamar-tarro	t
1520	24	1	Dulce de membrillo taco Hacendado	2.10	8.40	kg	https://prod-mercadona.imgix.net/images/dff51969b57348732ae78b2764351c73.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86766/dulce-membrillo-taco-hacendado-paquete	t
1521	22	1	Sopa de pollo Gallina Blanca con fideos finos	0.85	11.97	kg	https://prod-mercadona.imgix.net/images/e8047938e241f4694a1a3ddab163c9a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8044/sopa-pollo-gallina-blanca-con-fideos-finos	t
1522	22	1	Sopa de pollo Hacendado con fideos finos	0.55	7.64	kg	https://prod-mercadona.imgix.net/images/b7376490fee7a26c553ee656f233aef0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11646/sopa-pollo-hacendado-con-fideos-finos	t
1523	22	1	Sopa maravilla Hacendado	0.65	7.65	kg	https://prod-mercadona.imgix.net/images/02e4829c0ea5f934de794478b17cef65.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60587/sopa-maravilla-hacendado	t
1524	22	1	Sopa de miso	2.25	0.75	ud	https://prod-mercadona.imgix.net/images/7f856494462f7a6a7bdb7deb143d7040.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80057/sopa-miso-paquete	t
1525	22	1	Sopa de verduras Hacendado	0.65	12.75	kg	https://prod-mercadona.imgix.net/images/c04c3619bcfca21184974972934d5175.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52746/sopa-verduras-hacendado	t
1526	22	1	Sopa de cebolla Hacendado	0.65	15.12	kg	https://prod-mercadona.imgix.net/images/f6be8613a425b516fbe77fd9df0a10b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60595/sopa-cebolla-hacendado	t
1527	22	1	Caldo de pollo casero Gallina Blanca	1.85	1.85	l	https://prod-mercadona.imgix.net/images/fe86551e6df09f72b72bcc5c0e68c5d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7024/caldo-pollo-casero-gallina-blanca-brick	t
1528	22	1	Caldo de cocido casero Gallina Blanca	1.85	1.85	l	https://prod-mercadona.imgix.net/images/87a7271a30826ff77101b6833cff6f42.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7026/caldo-cocido-casero-gallina-blanca-brick	t
1529	22	1	Caldo de marisco o fideuá para paella Hacendado con sofrito	2.00	2.00	l	https://prod-mercadona.imgix.net/images/45d9154fd67429ed1bd2d74ce1acef5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7021/caldo-marisco-fideua-paella-hacendado-con-sofrito-brick	t
1530	22	1	Caldo de pollo Hacendado bajo en sal	1.20	1.20	l	https://prod-mercadona.imgix.net/images/42add0a8d4db36dfc601f6150309664c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7031/caldo-pollo-hacendado-bajo-sal-brick	t
1531	22	1	Fumet caldo de pescado Hacendado	3.00	3.16	kg	https://prod-mercadona.imgix.net/images/83629f9f37126a2e5eb1a7063d225860.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22081/fumet-caldo-pescado-hacendado-botella	t
1532	22	1	Caldo de cocido Hacendado	0.90	0.90	l	https://prod-mercadona.imgix.net/images/fe02b6084454b04609e6c816623fe622.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52768/caldo-cocido-hacendado-brick	t
1533	22	1	Caldo de carne Hacendado en pastillas	0.90	7.50	kg	https://prod-mercadona.imgix.net/images/8f2f5b6b39b8cb837d68a6e4df67f80b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22860/caldo-carne-hacendado-pastillas-caja	t
1534	22	1	Caldo de pollo Avecrem en pastillas	2.95	12.29	kg	https://prod-mercadona.imgix.net/images/7ec740fb505add047043453134ff3d07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7014/caldo-pollo-avecrem-pastillas-gallina-blanca-caja	t
1535	22	1	Caldo de pescado Hacendado en pastillas	0.90	7.50	kg	https://prod-mercadona.imgix.net/images/81d35b86e5c061271c71818d74147e5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7305/caldo-pescado-hacendado-pastillas-caja	t
1536	22	1	Doble caldo sabor clásico carne Knorr en pastillas	1.75	10.94	kg	https://prod-mercadona.imgix.net/images/89059c77cb93998936ca9b87a6cdfaee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7331/doble-caldo-sabor-clasico-carne-knorr-pastillas-caja	t
1537	22	1	Caldo de pollo Hacendado en pastillas	1.45	6.04	kg	https://prod-mercadona.imgix.net/images/7655d0341839cc875249fc04810d7e4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7867/caldo-pollo-hacendado-pastillas-caja	t
1538	22	1	Caldo de verduras Hacendado en pastillas	0.90	7.50	kg	https://prod-mercadona.imgix.net/images/c2dad675fcad5572a3b39c12a2246eab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15592/caldo-verduras-hacendado-pastillas-caja	t
1539	18	1	Gazpacho tradicional Hacendado	2.20	2.22	l	https://prod-mercadona.imgix.net/images/421c8b1b4b3542724bea11278c099015.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39934/gazpacho-tradicional-hacendado-pack-3	t
1540	18	1	Gazpacho tradicional Hacendado	1.70	1.70	l	https://prod-mercadona.imgix.net/images/58afbb31db0d9537a8f94fb81f5da25d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15604/gazpacho-tradicional-hacendado-botella	t
1541	18	1	Salmorejo al estilo cordobés Hacendado	2.70	2.73	l	https://prod-mercadona.imgix.net/images/cc02d0a8e660e30e3c24b364adc80e01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39903/salmorejo-estilo-cordobes-hacendado-pack-3	t
1542	18	1	Salmorejo al estilo cordobés Hacendado	2.30	2.30	l	https://prod-mercadona.imgix.net/images/34f1705d13837ede06c4616f86bea15b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39902/salmorejo-estilo-cordobes-hacendado-brick	t
1543	18	1	Gazpacho fresco Hacendado	2.85	2.85	l	https://prod-mercadona.imgix.net/images/02c2fca38a795d0c30af62b64e676691.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39900/gazpacho-fresco-hacendado-botella	t
1544	18	1	Gazpacho fresco Hacendado	1.20	3.64	l	https://prod-mercadona.imgix.net/images/8a029da53a21438c1ae4dd62825512f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39965/gazpacho-fresco-hacendado-botella	t
1545	18	1	Salmorejo fresco Hacendado	3.15	3.15	l	https://prod-mercadona.imgix.net/images/34ea43a89f79cae31d45d635c16f79a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39901/salmorejo-fresco-hacendado-botella	t
1546	18	1	Salmorejo fresco Hacendado	1.30	3.94	l	https://prod-mercadona.imgix.net/images/d6299ca891fc2cb535072129350fc84d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39966/salmorejo-fresco-hacendado-botella	t
1547	18	1	Gazpacho fresco García Millán	3.75	3.75	l	https://prod-mercadona.imgix.net/images/bc96927f47bd1fe9f51acc5b618137c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39931/gazpacho-fresco-garcia-millan-botella	t
1548	18	1	Gazpacho fresco García Millán	1.55	4.70	l	https://prod-mercadona.imgix.net/images/04d763aff53433cd1e707836147b03f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39968/gazpacho-fresco-garcia-millan-botella	t
1549	18	1	Salmorejo fresco García Millán	3.85	3.85	l	https://prod-mercadona.imgix.net/images/0c2519a1eb4049c2b226e04de5e14333.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39905/salmorejo-fresco-garcia-millan-botella	t
1550	18	1	Salmorejo fresco García Millán	1.65	5.00	l	https://prod-mercadona.imgix.net/images/e36370b967d296971a16615e4bdd4202.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39969/salmorejo-fresco-garcia-millan-botella	t
1551	18	1	Gazpacho tradicional Hacendado	2.20	2.22	l	https://prod-mercadona.imgix.net/images/421c8b1b4b3542724bea11278c099015.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39934/gazpacho-tradicional-hacendado-pack-3	t
1552	18	1	Gazpacho tradicional Hacendado	1.70	1.70	l	https://prod-mercadona.imgix.net/images/58afbb31db0d9537a8f94fb81f5da25d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15604/gazpacho-tradicional-hacendado-botella	t
1553	18	1	Salmorejo al estilo cordobés Hacendado	2.70	2.73	l	https://prod-mercadona.imgix.net/images/cc02d0a8e660e30e3c24b364adc80e01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39903/salmorejo-estilo-cordobes-hacendado-pack-3	t
1554	18	1	Salmorejo al estilo cordobés Hacendado	2.30	2.30	l	https://prod-mercadona.imgix.net/images/34f1705d13837ede06c4616f86bea15b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39902/salmorejo-estilo-cordobes-hacendado-brick	t
1555	18	1	Gazpacho fresco Hacendado	2.85	2.85	l	https://prod-mercadona.imgix.net/images/02c2fca38a795d0c30af62b64e676691.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39900/gazpacho-fresco-hacendado-botella	t
1556	18	1	Gazpacho fresco Hacendado	1.20	3.64	l	https://prod-mercadona.imgix.net/images/8a029da53a21438c1ae4dd62825512f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39965/gazpacho-fresco-hacendado-botella	t
1557	18	1	Salmorejo fresco Hacendado	3.15	3.15	l	https://prod-mercadona.imgix.net/images/34ea43a89f79cae31d45d635c16f79a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39901/salmorejo-fresco-hacendado-botella	t
1558	18	1	Salmorejo fresco Hacendado	1.30	3.94	l	https://prod-mercadona.imgix.net/images/d6299ca891fc2cb535072129350fc84d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39966/salmorejo-fresco-hacendado-botella	t
1559	18	1	Gazpacho fresco García Millán	3.75	3.75	l	https://prod-mercadona.imgix.net/images/bc96927f47bd1fe9f51acc5b618137c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39931/gazpacho-fresco-garcia-millan-botella	t
1560	18	1	Gazpacho fresco García Millán	1.55	4.70	l	https://prod-mercadona.imgix.net/images/04d763aff53433cd1e707836147b03f9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39968/gazpacho-fresco-garcia-millan-botella	t
1561	18	1	Salmorejo fresco García Millán	3.85	3.85	l	https://prod-mercadona.imgix.net/images/0c2519a1eb4049c2b226e04de5e14333.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39905/salmorejo-fresco-garcia-millan-botella	t
1562	18	1	Salmorejo fresco García Millán	1.65	5.00	l	https://prod-mercadona.imgix.net/images/e36370b967d296971a16615e4bdd4202.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39969/salmorejo-fresco-garcia-millan-botella	t
1563	22	1	Crema de calabaza y zanahoria Hacendado	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/c4f8572501d428cdb9583b35db56e690.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23225/crema-calabaza-zanahoria-hacendado-bol	t
1564	22	1	Crema de espárragos Hacendado	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/2518e0e73630e79f2af039da7d3dc822.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86587/crema-esparragos-hacendado-bol	t
1565	22	1	Crema de verduras Hacendado	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/84004f26c61b916e664619ebaa88a44f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8722/crema-verduras-hacendado-bol	t
1566	22	1	Crema de pollo Hacendado con verduras	1.00	2.00	l	https://prod-mercadona.imgix.net/images/e7dd64a7791cb538c4d48e8a333cdbc8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8448/crema-pollo-hacendado-con-verduras-brick	t
1567	22	1	Crema de calabaza Hacendado	1.00	2.00	l	https://prod-mercadona.imgix.net/images/bac2668c48c9709038fd8723a17488c9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13499/crema-calabaza-hacendado-brick	t
1568	22	1	Crema de verduras Hacendado	1.00	2.00	l	https://prod-mercadona.imgix.net/images/2ae243e8f790af2975eacc75f302b24d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60308/crema-verduras-hacendado-brick	t
1569	22	1	Puré de patatas Hacendado en copos	2.00	4.00	kg	https://prod-mercadona.imgix.net/images/cda62d9b1f3870ff9cac3193caae188d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23264/pure-patatas-hacendado-copos-caja	t
1570	22	1	Crema de setas Starlux con champiñones	1.60	3.20	l	https://prod-mercadona.imgix.net/images/d61df99aaace37a242ffdef145f78d7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35662/crema-setas-starlux-con-champinones-knorr-brick	t
1571	22	1	Crema de calabacín Starlux con queso de cabra	1.50	3.00	l	https://prod-mercadona.imgix.net/images/18a75c1b66513488f1ec742db0409435.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35661/crema-calabacin-starlux-con-queso-cabra-knorr-brick	t
1572	22	1	Crema de calabacín Hacendado	1.00	2.00	l	https://prod-mercadona.imgix.net/images/21e1acdab6e7f290087759fa1f7eef1d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14930/crema-calabacin-hacendado-brick	t
1573	22	1	Crema de calabacín Hacendado	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/97b7de306a37508ef279a8369118736e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35870/crema-calabacin-hacendado-bol	t
1574	22	1	Crema de lentejas Hacendado	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/c75cd6195526f2bfecb9f1783f39297a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11628/crema-lentejas-hacendado-bol	t
1575	13	1	Patatas fritas extra crujientes Hacendado	1.35	9.00	kg	https://prod-mercadona.imgix.net/images/879832bc0b56bbec28d90be8baab7426.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86146/patatas-fritas-extra-crujientes-hacendado-paquete	t
1576	13	1	Patatas fritas clásicas Hacendado	1.90	6.33	kg	https://prod-mercadona.imgix.net/images/daa5379864f490d809e6272ea964a119.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22245/patatas-fritas-clasicas-hacendado-pack-2	t
1577	13	1	Patatas fritas onduladas sabor jamón serrano Hacendado	1.20	8.00	kg	https://prod-mercadona.imgix.net/images/ac63932b42f2edd53ae29aa21f9af6d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86145/patatas-fritas-onduladas-hacendado-sabor-jamon-serrano-paquete	t
1578	13	1	Patatas fritas corte ondulado Hacendado	1.10	7.33	kg	https://prod-mercadona.imgix.net/images/edc2fc7f9b7e7a1447cce4255b0b66f2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15589/patatas-fritas-corte-ondulado-hacendado-paquete	t
1579	13	1	Patatas light Hacendado	1.30	8.67	kg	https://prod-mercadona.imgix.net/images/ba03eace6ddd2d3be06fbee6ceae521a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15810/patatas-light-hacendado-paquete	t
1580	13	1	Aperitivo de patata sabor original Pringles	2.65	16.06	kg	https://prod-mercadona.imgix.net/images/f2c0ce59a9f58aba9aceea1b6322a801.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33555/aperitivo-patata-sabor-original-pringles-bote	t
1581	13	1	Aperitivo de patata sabor crema agria y cebolla Pringles	2.65	16.06	kg	https://prod-mercadona.imgix.net/images/f073e900385c00f0fe9a761086076724.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33556/aperitivo-patata-sabor-crema-agria-cebolla-pringles-bote	t
1582	13	1	Patatas fritas sabor sal y vinagre Hacendado	1.20	8.00	kg	https://prod-mercadona.imgix.net/images/d3f7142f4a8c9bd9db796a6387539ad5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8244/patatas-fritas-sabor-sal-vinagre-hacendado-paquete	t
1583	13	1	Patatas fritas sabor chili y lima Hacendado	1.20	8.00	kg	https://prod-mercadona.imgix.net/images/6fc55c45a8752c7ff0273caef3d4ee17.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8243/patatas-fritas-sabor-chili-lima-hacendado-paquete	t
1584	13	1	Patatas fritas 0% sal añadida Hacendado	1.50	11.54	kg	https://prod-mercadona.imgix.net/images/a4f1c7aca0dd8984610757202a87d508.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5398/patatas-fritas-0-sal-anadida-hacendado-paquete	t
1585	13	1	Tiras de maíz frito sabor barbacoa Hacendado	0.80	5.33	kg	https://prod-mercadona.imgix.net/images/105d83b7746598f1b543205253965349.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33639/tiras-maiz-frito-sabor-barbacoa-hacendado-paquete	t
1586	13	1	Nachos tex-mex sabor queso Hacendado	0.95	6.33	kg	https://prod-mercadona.imgix.net/images/b8c009cd61e6c9824fa9743f5515c872.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33641/nachos-tex-mex-hacendado-sabor-queso-paquete	t
1587	13	1	Garfitos de maíz sabor queso Hacendado	0.75	9.38	kg	https://prod-mercadona.imgix.net/images/0535918a9753c0d6b2de67b6d1e7d9f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13889/garfitos-maiz-sabor-queso-hacendado-paquete	t
1588	13	1	Cuquitos sabor queso Hacendado	0.85	8.50	kg	https://prod-mercadona.imgix.net/images/7d5bd85b7c34dbcda6a39c50a92308d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33642/cuquitos-sabor-queso-hacendado-paquete	t
1589	13	1	Conos sabor bacón y queso Hacendado	0.80	8.00	kg	https://prod-mercadona.imgix.net/images/7c5ca4989f36d2c4d83391ccb2de646b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15778/conos-sabor-bacon-queso-hacendado-paquete	t
1590	13	1	Galletitas saladas Hacendado	1.20	3.43	kg	https://prod-mercadona.imgix.net/images/f4f46d3c2e88b12661708ff3de972db1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14216/galletitas-saladas-hacendado-bote	t
1591	13	1	Cuquis Hacendado	0.75	9.38	kg	https://prod-mercadona.imgix.net/images/8ea3248c4e2b51815ee1cf960b24c7d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33581/cuquis-hacendado-paquete	t
1592	13	1	Combinado de aperitivos Hacendado	1.60	8.00	kg	https://prod-mercadona.imgix.net/images/15085483edf1219ada969fb9f7f0a73e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22177/combinado-aperitivos-hacendado-paquete	t
1593	13	1	Bombitas de maíz sabor mantequilla Hacendado	0.80	10.00	kg	https://prod-mercadona.imgix.net/images/5d00a7808fd82c4c16f4c4358278e3df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16860/bombitas-maiz-sabor-mantequilla-hacendado-paquete	t
1594	13	1	Torreznos sabor barbacoa Hacendado	1.40	14.00	kg	https://prod-mercadona.imgix.net/images/7bf26e72232f68e7f3ed46e30f04c3a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33436/torreznos-sabor-barbacoa-hacendado-paquete	t
1595	13	1	Trigo snack sabor ahumado Hacendado	0.85	10.63	kg	https://prod-mercadona.imgix.net/images/b1180ea71d4b39af79931ac36417ef0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33633/trigo-snack-sabor-ahumado-hacendado-paquete	t
1596	13	1	Patatas fritas paja Hacendado	1.50	7.50	kg	https://prod-mercadona.imgix.net/images/041e7b535d424e28406da126b2ef7656.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33624/patatas-fritas-paja-hacendado-paquete	t
1597	13	1	Chicharricos Hacendado cortezas de cerdo fritas	1.40	14.00	kg	https://prod-mercadona.imgix.net/images/0733993a31f51bc028e3544e6c905c8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9869/chicharricos-hacendado-cortezas-cerdo-fritas-paquete	t
1598	13	1	Piña deshidratada Hacendado	1.60	32.00	kg	https://prod-mercadona.imgix.net/images/06960f5d9fb710ca7d8c72e699b8836c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33440/pina-deshidratada-hacendado-100-natural-paquete	t
1599	13	1	Sticks de patata Hacendado	0.80	10.67	kg	https://prod-mercadona.imgix.net/images/97a6f2e256179e4ff087f86ee360e958.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22568/sticks-patata-hacendado-paquete	t
1600	13	1	Aros de maíz Hacendado	0.85	7.08	kg	https://prod-mercadona.imgix.net/images/e1c328248e9d621edc40ea9717d81fb7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15757/aros-maiz-hacendado-paquete	t
1601	13	1	Palomitas caramelo Hacendado	1.50	12.50	kg	https://prod-mercadona.imgix.net/images/54f08a75c350854e471b9f2b73b92a5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34811/palomitas-caramelo-hacendado-paquete	t
1602	13	1	Snack de maíz Stars sabor mantequilla Hacendado	0.80	10.00	kg	https://prod-mercadona.imgix.net/images/bb97dc754de94c742b136a705447f857.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9903/snack-maiz-sabor-mantequilla-stars-hacendado-paquete	t
1603	13	1	Snack de maíz Crunchy sabor agridulce picante Hacendado	0.90	9.00	kg	https://prod-mercadona.imgix.net/images/2d82ab9758c0966985cbac871712dce6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12960/snack-maiz-crunchy-sabor-agridulce-picante-hacendado-paquete	t
1604	13	1	Snack de maíz Redes sabor barbacoa Hacendado	0.85	8.50	kg	https://prod-mercadona.imgix.net/images/1e57addcf3026b5be99a7a7deec22ce8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60323/snack-maiz-redes-sabor-barbacoa-hacendado-paquete	t
1605	13	1	Sticks vegetales Hacendado	1.20	12.00	kg	https://prod-mercadona.imgix.net/images/c40a06b5a4e1a3b65c96d0ccca181c2a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52686/sticks-vegetales-hacendado-paquete	t
1606	13	1	Snack Balls sabor queso Hacendado	1.00	10.00	kg	https://prod-mercadona.imgix.net/images/2367d0c7130fb8cc036b1267a8110c52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11522/snack-balls-sabor-queso-hacendado-paquete	t
1608	13	1	Snack frito Binkies sabor queso Hacendado	1.00	12.50	kg	https://prod-mercadona.imgix.net/images/3d664c9fbf0f61f7c0c172b379ac99b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12996/snack-frito-binkies-sabor-queso-hacendado-paquete	t
1609	53	1	Snack palitos perro adulto con pollo y ternera Compy	1.10	5.50	kg	https://prod-mercadona.imgix.net/images/fc37029b6ca40eb9441a6cde919af817.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52135/snack-palitos-perro-adulto-con-pollo-ternera-compy-paquete	t
1610	53	1	Snack corazones perro adulto Compy	1.65	4.71	kg	https://prod-mercadona.imgix.net/images/6c6714750f676bdad042768d04955b07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52118/snack-corazones-perro-adulto-compy-paquete	t
1611	53	1	Snack barritas perro adulto de ternera y cordero Compy	1.05	11.93	kg	https://prod-mercadona.imgix.net/images/b91f4f4ceb4d8c3745b893750a572951.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52145/snack-barritas-perro-adulto-ternera-cordero-compy-pack-8	t
1612	53	1	Snack barritas perro adulto de pollo e hígado Compy	1.05	11.93	kg	https://prod-mercadona.imgix.net/images/17de9c32ee10ae75f0251d075d4993da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22009/snack-barritas-perro-adulto-pollo-higado-compy-pack-8	t
1613	53	1	Snack galletas perro adulto con pollo y ternera Compy razas medianas y grandes	1.95	2.79	kg	https://prod-mercadona.imgix.net/images/54988ca540b37197c2bee8b9d850c99e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70763/snack-galletas-perro-adulto-con-pollo-ternera-compy-razas-medianas-grandes-paquete	t
1614	53	1	Snacks gato rellenos con salmón y malta Compy	1.10	15.71	kg	https://prod-mercadona.imgix.net/images/531384abea8b0d4a7b35dc8e950c42e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16858/snacks-gato-rellenos-con-salmon-malta-compy-paquete	t
1615	53	1	Snack gato aperitivo líquido Compy	1.60	13.33	kg	https://prod-mercadona.imgix.net/images/ebbc6329728fedc5ca3c18bd2413db82.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52146/snack-gato-aperitivo-liquido-compy-contine-4-con-pollo-higado-4-con-salmon-caja	t
1616	53	1	Snacks gato rellenos con pollo y malta Compy	1.10	15.71	kg	https://prod-mercadona.imgix.net/images/57513fa5c8c08acf9d232890cb2b4473.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16859/snacks-gato-rellenos-con-pollo-malta-compy-paquete	t
1617	53	1	Snack gato barritas Compy de pollo e hígado	1.05	21.00	kg	https://prod-mercadona.imgix.net/images/bd7b4b2b0853dd7d764089d9f6cd38b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22008/snack-gato-barritas-compy-pollo-higado-pack-10	t
1618	53	1	Snack gato barritas Compy de salmón y trucha	1.05	21.00	kg	https://prod-mercadona.imgix.net/images/0af61ed93b57a2df63116c93f9dae4b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52149/snack-gato-barritas-compy-salmon-trucha-pack-10	t
1619	53	1	Snack gato crunchy con hierba gatera Compy cuidado de dientes	1.10	15.71	kg	https://prod-mercadona.imgix.net/images/c17299d93bee0b00dcbf1b46694dbcbe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86358/snack-gato-crunchy-con-hierba-gatera-compy-cuidado-dientes-paquete	t
1620	14	1	Nuez natural Hacendado pelada	2.60	13.00	kg	https://prod-mercadona.imgix.net/images/de768af5358346867a912d57ec96b69c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34024/nuez-natural-hacendado-pelada-paquete	t
1621	14	1	Almendra natural Hacendado	2.40	12.00	kg	https://prod-mercadona.imgix.net/images/b0be61b365cd2b6090deafd0a6ad9e41.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34865/almendra-natural-hacendado-paquete	t
1622	14	1	Pistacho tostado Hacendado con sal	3.65	14.60	kg	https://prod-mercadona.imgix.net/images/7fa63ca1c65fe558cc9636e274fecf0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86202/pistacho-tostado-hacendado-con-sal-paquete	t
1623	14	1	Pipas girasol tostadas Hacendado gigante con sal	1.20	6.00	kg	https://prod-mercadona.imgix.net/images/a83a6380c7eecb122dd7a712fe4675a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34079/pipas-girasol-tostadas-hacendado-gigante-con-sal-paquete	t
1624	14	1	Pistacho tostado Hacendado 0% sal añadida	3.65	14.60	kg	https://prod-mercadona.imgix.net/images/17700c85e2423c877653e72cab234426.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86190/pistacho-tostado-hacendado-0-sal-anadida-paquete	t
1625	14	1	Cacahuete frito con sal Hacendado pelado	1.00	4.00	kg	https://prod-mercadona.imgix.net/images/621404b6085cae9938997dd3f360b029.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34820/cacahuete-frito-con-sal-hacendado-pelado-paquete	t
1626	14	1	Pipas girasol tostadas Hacendado gigante aguasal	1.20	6.00	kg	https://prod-mercadona.imgix.net/images/65128d654c1a2f4d7dfc8859e95d4962.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34078/pipas-girasol-tostadas-hacendado-gigante-aguasal-paquete	t
1627	14	1	Anacardo natural Hacendado	2.70	13.50	kg	https://prod-mercadona.imgix.net/images/2ae6ffebda4166b4a4a860bf81c47378.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23365/anacardo-natural-hacendado-paquete	t
1628	13	1	Palomitas de maíz con sal Hacendado para microondas	1.10	4.07	kg	https://prod-mercadona.imgix.net/images/8c805bca1beb58b91fccd2eba51e18e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34822/palomitas-maiz-con-sal-hacendado-microondas-paquete	t
1629	14	1	Anacardo frito salado Hacendado	2.80	14.00	kg	https://prod-mercadona.imgix.net/images/11cbd433d79f5395396103c9c3f9210b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34027/anacardo-frito-salado-hacendado-paquete	t
1630	14	1	Avellana tostada Hacendado 0% sal añadida	4.30	21.50	kg	https://prod-mercadona.imgix.net/images/7db587b3feda51c3ddca45fd3d5bc4d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34025/avellana-tostada-hacendado-0-sal-anadida-paquete	t
1631	14	1	Almendra tostada y salada Hacendado con piel	2.40	12.00	kg	https://prod-mercadona.imgix.net/images/43d5b21b2cbc97b548532678e85163c1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11960/almendra-tostada-salada-hacendado-con-piel-paquete	t
1632	14	1	Cacahuete frito y salado Hacendado con piel	1.30	5.20	kg	https://prod-mercadona.imgix.net/images/9ba31472c3bc97cad3c8f6bce8181942.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34868/cacahuete-frito-salado-hacendado-con-piel-paquete	t
1633	14	1	Maíz frito crujiente y tierno Hacendado	1.00	5.88	kg	https://prod-mercadona.imgix.net/images/4486157c463721fce12a5de9a003f995.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34821/maiz-frito-crujiente-tierno-hacendado-paquete	t
1634	14	1	Almendra frita y salada Hacendado pelada	2.95	14.75	kg	https://prod-mercadona.imgix.net/images/90bb181b5294b5a7b99001da3764e7d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34009/almendra-frita-salada-hacendado-pelada-paquete	t
1635	14	1	Cacahuete tostado Hacendado 0% sal añadida	1.55	3.88	kg	https://prod-mercadona.imgix.net/images/09cec547e9ac6bbfa54ada3a03176248.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34031/cacahuete-tostado-hacendado-0-sal-anadida-paquete	t
1636	14	1	Almendra tostada Hacendado 0% sal añadida con piel	2.95	14.75	kg	https://prod-mercadona.imgix.net/images/b19ad0f34a30f8ee44e1ed4eafc7da3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34014/almendra-tostada-hacendado-0-sal-anadida-con-piel-paquete	t
1637	13	1	Maíz palomitas Hacendado	0.86	3.44	kg	https://prod-mercadona.imgix.net/images/cad2546eb5ab6a7ae93b84625898509a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34804/maiz-palomitas-hacendado-paquete	t
1638	13	1	Maíz frito gigante Hacendado	1.40	9.33	kg	https://prod-mercadona.imgix.net/images/3a1e0d99dc80af2596d253ca8edacc17.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13597/maiz-frito-gigante-hacendado-paquete	t
1639	14	1	Nuez macadamia Hacendado tostada con sal	2.90	29.00	kg	https://prod-mercadona.imgix.net/images/1b0e16425fccfe385de968d82604cee0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34838/nuez-macadamia-hacendado-tostada-con-sal-paquete	t
1640	14	1	Mezcla semillas Hacendado	1.46	7.30	kg	https://prod-mercadona.imgix.net/images/728570b5546ae595419acbd4213c9f57.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34963/mezcla-semillas-hacendado-paquete	t
1641	14	1	Pipas de calabaza natural Hacendado peladas	1.70	11.33	kg	https://prod-mercadona.imgix.net/images/29e68facc14597737f938b7ae808d844.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34188/pipas-calabaza-natural-hacendado-peladas-paquete	t
1642	14	1	Castañas cocidas y peladas Hacendado	1.40	14.00	kg	https://prod-mercadona.imgix.net/images/1b60c1e9a7a3ac451f83b8c54206061b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34194/castanas-cocidas-peladas-hacendado-paquete	t
1643	14	1	Cacahuete frito con miel Hacendado	1.65	8.25	kg	https://prod-mercadona.imgix.net/images/20cdbdad2299b5137ae62ab0be42c1d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34143/cacahuete-frito-con-miel-hacendado-paquete	t
1644	14	1	Cacahuete tostado con sal Hacendado	1.65	4.13	kg	https://prod-mercadona.imgix.net/images/b335759dffb927abd3ea0b2c13deafa9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34016/cacahuete-tostado-con-sal-hacendado-paquete	t
1645	14	1	Pipas de girasol fritas Hacendado peladas	1.10	5.50	kg	https://prod-mercadona.imgix.net/images/c99716a7920576fe0b8eb353eb885b22.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34145/pipas-girasol-fritas-hacendado-peladas-paquete	t
1646	13	1	Palomitas de maíz sabor mantequilla Hacendado para microondas	1.20	4.44	kg	https://prod-mercadona.imgix.net/images/f8ea8d436cfb80f7e563563cbe8b9316.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34212/palomitas-maiz-sabor-mantequilla-hacendado-microondas-paquete	t
1647	14	1	Almendra natural Hacendado sin piel	2.90	14.50	kg	https://prod-mercadona.imgix.net/images/004f0afb11c32dc0bbbfca6407db1557.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23575/almendra-natural-hacendado-sin-piel-paquete	t
1648	14	1	Semillas sésamo tostado Hacendado	1.50	10.00	kg	https://prod-mercadona.imgix.net/images/fb777e1d4a1c4070fec4002886f4d339.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34964/semillas-sesamo-tostado-hacendado-paquete	t
1649	14	1	Pipas girasol barbacoa Hacendado	1.35	6.75	kg	https://prod-mercadona.imgix.net/images/c43215e3740b7df52600a080a78ac01f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34043/pipas-girasol-barbacoa-hacendado-paquete	t
1650	14	1	Pipas girasol naturales Hacendado peladas	1.24	6.20	kg	https://prod-mercadona.imgix.net/images/0c0426c30e108fd772328302f23d5459.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34193/pipas-girasol-naturales-hacendado-peladas-paquete	t
1651	14	1	Semillas lino dorado Hacendado	1.19	7.93	kg	https://prod-mercadona.imgix.net/images/b2d40e1f73346582e77d712cd0daba3a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34962/semillas-lino-dorado-hacendado-paquete	t
1652	14	1	Nuez natural Hacendado	3.70	6.17	kg	https://prod-mercadona.imgix.net/images/d1899ae163ff39ebd4f7f1896a0478a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34606/nuez-natural-hacendado-paquete	t
1653	14	1	Pipas calabaza tostadas Hacendado aguasal	1.55	12.40	kg	https://prod-mercadona.imgix.net/images/640adb6de33762c72aa87643770bb4d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34095/pipas-calabaza-tostadas-hacendado-aguasal-paquete	t
1654	14	1	Pipas girasol tostadas Hacendado 0% sal añadida	1.30	6.50	kg	https://prod-mercadona.imgix.net/images/d461e17f42de4571398e7c126d26ddd6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23059/pipas-girasol-tostadas-hacendado-0-sal-anadida-paquete	t
1655	14	1	Nuez de Brasil natural Hacendado	4.95	24.75	kg	https://prod-mercadona.imgix.net/images/1f10a4ebe8ba6ccd1f3e2cfd4f8f1329.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34236/nuez-brasil-natural-hacendado-paquete	t
1656	14	1	Pistacho natural Hacendado pelado	2.95	29.50	kg	https://prod-mercadona.imgix.net/images/5740098664ca15815a61602e60578561.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34262/pistacho-natural-hacendado-pelado-paquete	t
1657	14	1	Nuez Pecana natural Hacendado pelada	4.05	20.25	kg	https://prod-mercadona.imgix.net/images/f9ce1795932570f847c46a1facd41b15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34997/nuez-pecana-natural-hacendado-pelada-paquete	t
1658	13	1	Palomitas de maíz dulces Hacendado para microondas	1.60	5.08	kg	https://prod-mercadona.imgix.net/images/126319b59770b85db688f4cd7df6e654.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34817/palomitas-maiz-dulces-hacendado-microondas-paquete	t
1659	14	1	Cacahuete tostado Hacendado pelado 0% sal añadida	1.15	5.75	kg	https://prod-mercadona.imgix.net/images/f5e73affd444299e58abcbc5e146cb93.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13451/cacahuete-tostado-hacendado-pelado-0-sal-anadida-paquete	t
1660	24	1	Cacahuete +Proteínas en polvo desgrasado Hacendado 14 g proteínas 70% reducido en grasa	2.75	13.75	kg	https://prod-mercadona.imgix.net/images/d7d92dd4c1eaf7f4cacb42fcf24d0019.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13738/cacahuete-proteinas-polvo-desgrasado-hacendado-14-g-proteinas-70-reducido-grasa-paquete	t
1661	14	1	Nuez troceada pelada Hacendado	1.80	12.00	kg	https://prod-mercadona.imgix.net/images/223353d93f6722ac2d0e2cc02cf63627.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52667/nuez-natural-troceada-hacendado-paquete	t
1662	14	1	Habas fritas con sal Hacendado	1.30	13.00	kg	https://prod-mercadona.imgix.net/images/3848c40f31592b8dbe75c2093f633d12.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15896/haba-frita-con-sal-hacendado-paquete	t
1663	14	1	Cocktail mezcla Hacendado	1.75	5.83	kg	https://prod-mercadona.imgix.net/images/8442a1a95c833c79f8df8b4485556b36.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34231/cocktail-mezcla-hacendado-compuesto-maiz-cacahuetes-garbanzos-bolita-snack-pasas-sultanas-paquete	t
1664	14	1	Cocktail crunchy sabores Hacendado	1.75	8.75	kg	https://prod-mercadona.imgix.net/images/270c4b2efd708975d5d3c0d625302af2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34047/cocktail-crunchy-sabores-hacendado-paquete	t
1665	14	1	Cocktail rodeo Hacendado	1.85	6.17	kg	https://prod-mercadona.imgix.net/images/6d6bfe2b1e2fb18e2782a5dd14911fff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11513/cocktail-rodeo-hacendado-paquete	t
1666	14	1	Cocktail natural Hacendado	2.70	13.50	kg	https://prod-mercadona.imgix.net/images/41dadffa039844fae74ffe0981c13c00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86809/cocktail-natural-hacendado-paquete	t
1667	14	1	Cocktail tostado 0% sal añadida Hacendado	2.80	14.00	kg	https://prod-mercadona.imgix.net/images/082315dbda40c5f9755dcdb7da06825e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60015/cocktail-tostado-0-sal-anadida-hacendado-paquete	t
1668	14	1	Cocktail tostado y ahumado Hacendado	2.80	14.00	kg	https://prod-mercadona.imgix.net/images/bf9011e286d435ffa3a17d423e6c917a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60009/cocktail-tostado-ahumado-hacendado-compuesto-cacahuete-anacardo-almendra-paquete	t
1669	14	1	Cocktail fruta deshidratada Hacendado	1.90	9.50	kg	https://prod-mercadona.imgix.net/images/2bce0f92fcb67ae2b3ab643df01cfe7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34924/cocktail-fruta-deshidratada-hacendado-paquete	t
1670	14	1	Cocktail rumba Hacendado	1.75	5.83	kg	https://prod-mercadona.imgix.net/images/447fdc383960977e7112a304b677a321.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80450/cocktail-rumba-hacendado-compuesto-cacahuetes-maiz-frito-pipas-girasol-pipas-calabaza-paquete	t
1671	14	1	Pasas sultanas sin semillas Hacendado	1.80	7.20	kg	https://prod-mercadona.imgix.net/images/95d65ccd270215a2364fb14f07fd87be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23010/pasas-sultanas-sin-semillas-hacendado-paquete	t
1672	14	1	Pasas moscatel sin semillas Hacendado	2.20	8.80	kg	https://prod-mercadona.imgix.net/images/43cb5b2b51525f9a1ca7ed04c2fd5d5e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23003/pasas-moscatel-sin-semillas-hacendado-paquete	t
1673	14	1	Mango deshidratado Hacendado	1.45	24.17	kg	https://prod-mercadona.imgix.net/images/18651d2eebb0719c6626ec1e146832fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34209/mango-deshidratado-hacendado-sin-azucar-anadido-paquete	t
1674	14	1	Ciruelas desecadas sin hueso Hacendado	2.14	8.56	kg	https://prod-mercadona.imgix.net/images/3b376050844f84d1800214627597bea5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20020/ciruelas-desecadas-sin-hueso-fundo-sofruco-paquete	t
1675	14	1	Arándanos deshidratados Hacendado	2.20	11.00	kg	https://prod-mercadona.imgix.net/images/79db1ae8823ee4ba42837863b9272f1f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/34605/arandanos-deshidratados-hacendado-paquete	t
1676	13	1	Piña deshidratada Hacendado	1.60	32.00	kg	https://prod-mercadona.imgix.net/images/06960f5d9fb710ca7d8c72e699b8836c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33440/pina-deshidratada-hacendado-100-natural-paquete	t
1677	14	1	Orejones albaricoque Hacendado	3.50	17.50	kg	https://prod-mercadona.imgix.net/images/1bd2a02ab94af3ea2d6abc653abcdbd3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13877/orejones-albaricoque-hacendado-paquete	t
1678	14	1	Dátiles en rama Hacendado	3.45	8.63	kg	https://prod-mercadona.imgix.net/images/faf25fce5e38d24ce81df1e4b5f7a64c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22606/datiles-rama-hacendado-caja	t
1679	14	1	Dátiles Medjoul con hueso Hacendado	4.10	19.07	kg	https://prod-mercadona.imgix.net/images/07c62f528382ff2147ddbab0d97cbdac.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22974/datiles-medjoul-con-hueso-hacendado-bandeja	t
1680	14	1	Dátiles desecados sin hueso Hacendado	1.80	7.20	kg	https://prod-mercadona.imgix.net/images/67bc06044c7a4b02ce0d84795144e0f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15301/datiles-desecados-sin-hueso-hacendado-paquete	t
1681	13	1	Aceitunas verdes rellenas de anchoa Hacendado	3.00	2.86	kg	https://prod-mercadona.imgix.net/images/a8be4414722e79192b356a7f3ababbc0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22910/aceitunas-manzanilla-rellenas-anchoa-hacendado-pack-3	t
1682	13	1	Aceitunas verdes rellenas de anchoa Hacendado	1.80	5.00	kg	https://prod-mercadona.imgix.net/images/6e52471bf17d428d03899310597fa47a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23217/aceitunas-manzanilla-rellenas-anchoa-hacendado-pack-3	t
1683	13	1	Aceitunas verdes rellenas de anchoa Hacendado	1.05	3.00	kg	https://prod-mercadona.imgix.net/images/cc1ca60ef2986c990f6f235afd216148.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22911/aceitunas-manzanilla-rellenas-anchoa-hacendado-bote	t
1684	13	1	Aceitunas verdes Chupadedos Huerta de Barros partidas aliñadas	3.40	3.47	kg	https://prod-mercadona.imgix.net/images/2bfaa39c2391c44c6da92a35abb6e1eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33168/aceitunas-chupadedos-huerta-barros-partidas-alinadas-con-hueso-tarro	t
1685	13	1	Aceitunas verdes Gazpacha Hacendado partidas	2.50	2.99	kg	https://prod-mercadona.imgix.net/images/2ca6159e86382b902ad76812992cf802.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80177/aceitunas-gazpacha-hacendado-con-hueso-tarro	t
1686	13	1	Aceitunas verdes rellenas de anchoa Hacendado	3.35	4.04	kg	https://prod-mercadona.imgix.net/images/5c5c1e3a579e445bb5d1d5df540b7799.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12764/aceitunas-verdes-rellenas-anchoa-hacendado-seleccion-bote	t
1687	13	1	Aceitunas verdes estilo casero Hacendado partidas aliñadas	2.85	2.91	kg	https://prod-mercadona.imgix.net/images/0b6b3e69cf64b9e6102907f8479405bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13422/aceitunas-estilo-caseras-hacendado-alinadas-tarro	t
1688	13	1	Aceitunas verdes sin hueso aliñadas Hacendado	1.90	4.52	kg	https://prod-mercadona.imgix.net/images/d8ee7929effbce5a6d638b2356f7bfee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33121/aceitunas-manzanilla-alinadas-hacendado-sin-hueso-tarro	t
1689	13	1	Aceitunas verdes rellenas con pepinillo Hacendado	2.25	5.36	kg	https://prod-mercadona.imgix.net/images/72b02c9476b6f62811c9255e1b15f413.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16254/aceitunas-verdes-rellenas-con-pepinillo-hacendado-tarro	t
1718	18	1	Pollo asado Hacendado	6.78	5.65	kg	https://prod-mercadona.imgix.net/images/bf5c527e50ce50bb951e705fad9dc27f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13706/pollo-asado-hacendado-paquete	t
1690	13	1	Aceitunas verdes rellenas de jalapeño Hacendado	1.75	5.00	kg	https://prod-mercadona.imgix.net/images/f4ec0b556e835d1137c7e3fa224d7453.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33178/aceitunas-rellenas-jalapeno-hacendado-bote	t
1691	13	1	Aceitunas verdes Picadedos sin hueso Hacendado aliñadas	3.80	5.35	kg	https://prod-mercadona.imgix.net/images/e9d310928ad02dee44fce5133dd68cf9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52622/aceitunas-picadedos-hacendado-alinadas-sin-hueso-tarro	t
1692	13	1	Aceitunas manzanilla sabor anchoa Hacendado con hueso	2.85	3.05	kg	https://prod-mercadona.imgix.net/images/2177642b601d8bb6a0d43fcc185771be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52783/aceitunas-manzanilla-sabor-anchoa-hacendado-con-hueso-calibre-grande-tarro	t
1693	13	1	Aceitunas verdes rellenas de pimiento asado Hacendado	1.75	5.00	kg	https://prod-mercadona.imgix.net/images/836fc86674c08e1f034fdc19a1228d00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13914/aceitunas-verdes-rellenas-pimiento-asado-hacendado-bote	t
1694	13	1	Banderillas dulces Hacendado	1.70	4.93	kg	https://prod-mercadona.imgix.net/images/1549f331c44f539a8cf0925c4cc50fc5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22154/banderillas-dulces-hacendado-vinagre-tarro	t
1695	13	1	Mix de encurtidos Hacendado	2.65	3.96	kg	https://prod-mercadona.imgix.net/images/652fcbb03c96574ce7fd64b4ca529a27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73331/mix-encurtidos-hacendado-tarro	t
1696	13	1	Pepinillos pequeños Hacendado	1.55	3.69	kg	https://prod-mercadona.imgix.net/images/4d0e46838aa3a6ee68e3f488aa38500c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29540/pepinillos-pequenos-hacendado-tarro	t
1697	13	1	Altramuces Hacendado	1.75	2.54	kg	https://prod-mercadona.imgix.net/images/3bd320aac32dbccb97c0ac590a74dbf2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33136/altramuces-hacendado-tarro	t
1698	13	1	Alcaparras Hacendado	1.35	10.00	kg	https://prod-mercadona.imgix.net/images/a01fa3585c32b713ea490fe9c4463f61.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33190/alcaparras-hacendado-vinagre-tarro	t
1699	20	1	Picadillo de variantes Hacendado	2.10	5.00	kg	https://prod-mercadona.imgix.net/images/40bbf18ad7d4a74e809376e71f7c8bf3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4868/picadillo-variantes-hacendado-tarro	t
1700	20	1	Cebollitas Hacendado	1.65	4.71	kg	https://prod-mercadona.imgix.net/images/f508ab1ea3e16b414d834eec5eb31eb6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33141/cebollitas-hacendado-tarro	t
1701	20	1	Ajos aliñados Hacendado	2.60	7.54	kg	https://prod-mercadona.imgix.net/images/30b5f57aec2f0e9206dcd1ba0fe9740d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33022/ajos-alinados-hacendado-tarro	t
1702	20	1	Jalapeños picantes en vinagre Hacendado	1.65	12.22	kg	https://prod-mercadona.imgix.net/images/d5f83482523f5b5860d59fdf2711c9b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33189/jalapenos-picantes-hacendado-vinagre-tarro	t
1703	20	1	Mix de pepinillos y cebollitas Hacendado	1.95	2.91	kg	https://prod-mercadona.imgix.net/images/514932d49e6bf9d404520b71bb8b5267.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33026/mix-pepinillos-cebollitas-hacendado-tarro	t
1704	20	1	Pepinillos en vinagre Hacendado	1.45	3.45	kg	https://prod-mercadona.imgix.net/images/d0f57c8e5ff716eea1edd230a0d214f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11565/pepinillos-vinagre-hacendado-tarro	t
1705	18	1	Mini pizzas jamón y queso Fiesta ultracongeladas	2.90	10.74	kg	https://prod-mercadona.imgix.net/images/1f6a8a0430b29daafd8e7e66063df2e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13984/mini-pizzas-jamon-queso-fiesta-ultracongeladas-paquete	t
1706	18	1	Lasaña boloñesa familiar Hacendado	4.90	7.00	kg	https://prod-mercadona.imgix.net/images/5ce44300c7eb0b957d6f621704622aab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4488/lasana-bolonesa-familiar-hacendado-bandeja	t
1707	18	1	Lasaña de espinacas y requesón Hacendado	2.85	8.14	kg	https://prod-mercadona.imgix.net/images/46eb1de56c250372c7ac5661a1c553ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4491/lasana-espinacas-requeson-hacendado-bandeja	t
1708	18	1	Spaghetti carbonara Hacendado	2.20	7.86	kg	https://prod-mercadona.imgix.net/images/fcccafc3d6846d9cb534a26247c93aaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4265/spaghetti-carbonara-hacendado-bandeja	t
1709	18	1	Lasaña de pollo Hacendado	2.85	8.14	kg	https://prod-mercadona.imgix.net/images/ba16a63c0a0e42553d851d3c9aa74340.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11994/lasana-pollo-hacendado-bandeja	t
1710	18	1	Pasta tiburón Mac & Cheese Hacendado con salsa de queso	1.30	6.84	kg	https://prod-mercadona.imgix.net/images/7e210823ef6009e43b87ee2592fff29b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11934/pasta-tiburon-mac-cheese-hacendado-con-salsa-queso-paquete	t
1711	21	1	Lasaña boloñesa familiar Hacendado ultracongelada	5.70	5.18	kg	https://prod-mercadona.imgix.net/images/d3aa6907a659d89fd40a5c7f195a56ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35767/lasana-bolonesa-familiar-hacendado-ultracongelada-bandeja	t
1712	21	1	Lasaña a la boloñesa Hacendado ultracongelada	3.15	5.25	kg	https://prod-mercadona.imgix.net/images/48e415b4c7b108dba53576be1917ace9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86597/lasana-bolonesa-hacendado-ultracongelada-caja	t
1713	21	1	Canelones de carne Hacendado ultracongelados	3.24	5.40	kg	https://prod-mercadona.imgix.net/images/321dd61c7086641b56602f6da3cb477b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86600/canelones-carne-hacendado-ultracongelados-caja	t
1714	21	1	Lasaña de atún Hacendado ultracongelada	3.66	6.10	kg	https://prod-mercadona.imgix.net/images/0d9f43e80c095ffae34b75a073ee5c05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86598/lasana-atun-hacendado-ultracongelada-caja	t
1715	21	1	Pasta con pollo al pesto Hacendado ultracongelada	2.40	8.00	kg	https://prod-mercadona.imgix.net/images/31eef31dca31ac4c3f3f39e849ecd934.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61362/pasta-con-pollo-pesto-hacendado-ultracongelada-paquete	t
1716	21	1	Gnocchi de pollo y verduras Hacendado ultracongelados	3.00	5.00	kg	https://prod-mercadona.imgix.net/images/6e25934ac65230dac50e5e895f5ef52d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61354/gnocchi-pollo-verduras-hacendado-ultracongelados-paquete	t
1717	21	1	Gyozas de pollo y verduras Hacendado congeladas	2.15	9.35	kg	https://prod-mercadona.imgix.net/images/701ac0f02ecae7317070866fcfb7e662.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23155/gyozas-pollo-verduras-hacendado-congeladas-paquete	t
1719	18	1	Roti de pollo relleno de jamón y queso Hacendado	3.00	8.00	kg	https://prod-mercadona.imgix.net/images/9ab6eb035146b4e95041c72834ebc235.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13713/roti-pollo-relleno-jamon-queso-hacendado-paquete	t
1720	18	1	Pollo asado troceado Hacendado	7.80	6.45	kg	https://prod-mercadona.imgix.net/images/dd2ff2f223e61cb2c3fb02b795f9929f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13707/pollo-asado-troceado-hacendado-paquete	t
1721	18	1	Codillo de cerdo asado Hacendado	4.61	6.40	kg	https://prod-mercadona.imgix.net/images/23127ba632f2eddfa70076083c3ca714.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13710/codillo-cerdo-asado-hacendado-paquete	t
1722	18	1	Alitas de pollo asadas Hacendado	4.40	8.80	kg	https://prod-mercadona.imgix.net/images/e76f498a284a1062f5054648815e4908.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13705/alitas-pollo-asadas-hacendado-bote	t
1723	18	1	Albóndigas guisadas Hacendado	2.75	10.00	kg	https://prod-mercadona.imgix.net/images/0530a6b96bdc5975928c8174e751bafa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4797/albondigas-guisadas-hacendado-bandeja	t
1724	18	1	Costillas de cerdo a la barbacoa cortadas Hacendado	6.25	12.50	kg	https://prod-mercadona.imgix.net/images/ed85ad94de88cbf54278b883d8fa7838.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13709/costillas-cerdo-barbacoa-cortadas-hacendado-bote	t
1725	18	1	Migas Hacendado	1.90	8.64	kg	https://prod-mercadona.imgix.net/images/dab5e22f6370afad62e045fc35bf57ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23289/migas-hacendado-bandeja	t
1726	18	1	Callos de cerdo Moreno Plaza	3.40	6.80	kg	https://prod-mercadona.imgix.net/images/501db5d57a39948022fa758e52dcdfe6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3390/callos-cerdo-moreno-plaza-paquete	t
1727	18	1	Carne de cerdo Pulled Pork Hacendado sabor barbacoa	2.50	12.50	kg	https://prod-mercadona.imgix.net/images/ed5c9c82cff4d6b2da0364ddd9638230.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11511/carne-cerdo-pulled-pork-hacendado-sabor-barbacoa-bandeja	t
1728	21	1	Jamoncitos de pollo congelados	3.30	3.30	kg	https://prod-mercadona.imgix.net/images/bebaada78c49c64b7dda4cf6b5726cf0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25183/jamoncitos-pollo-congelados-paquete	t
1729	21	1	Alas de pollo congeladas	3.50	3.50	kg	https://prod-mercadona.imgix.net/images/7a797d7ecd729457ebb2712aaf361062.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25184/alas-pollo-congeladas-paquete	t
1730	21	1	Medallones preparado de solomillo cerdo congelados marinados	3.11	10.36	kg	https://prod-mercadona.imgix.net/images/11bcd6090bd578b0427ad1cbb3f63474.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4176/medallones-preparado-solomillo-cerdo-congelados-marinados-paquete	t
1731	21	1	Solomillo de pavo marinado congelado	3.12	7.80	kg	https://prod-mercadona.imgix.net/images/5bb818d0e9762e82d926efb3ce16c8a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25353/solomillo-pavo-marinado-congelado-paquete	t
1732	21	1	Cuartos traseros de pollo congelados	5.70	2.85	kg	https://prod-mercadona.imgix.net/images/64a92b8526d3a6544a6dfcba18b78e82.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25182/cuartos-traseros-pollo-congelados-paquete	t
1733	21	1	Solomillo de cerdo marinado congelado	6.24	7.80	kg	https://prod-mercadona.imgix.net/images/ca9de27c3cc48047eb795200ae5f5a5f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2228/solomillo-cerdo-marinado-congelado-paquete	t
1734	21	1	Jamoncitos de pavo duplo congelados	3.74	4.35	kg	https://prod-mercadona.imgix.net/images/82b26d67c39b10ad7c6ed5b8bf758c60.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/25376/jamoncitos-pavo-duplo-congelados-paquete	t
1735	21	1	Rabo de vacuno añojo congelado	18.70	17.00	kg	https://prod-mercadona.imgix.net/images/d5ac4015bab4d6cbbbf82c8ad51cff07.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2266/rabo-vacuno-anojo-congelado-paquete	t
1736	21	1	Chuletas cordero de lechal congeladas	15.40	28.00	kg	https://prod-mercadona.imgix.net/images/326f3c03b33c5d1390a84db3c748b7ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4334/chuletas-cordero-lechal-congeladas-paquete	t
1737	21	1	Alas de pollo barbacoa congeladas	3.70	4.93	kg	https://prod-mercadona.imgix.net/images/778aff71ecab4df9feea58e5b571d1c4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52426/alas-pollo-barbacoa-congeladas-paquete	t
1738	21	1	Carrillada de cerdo congelada	5.75	12.50	kg	https://prod-mercadona.imgix.net/images/00bf9ecaba2c069b2182a91edba66196.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4425/carrillada-cerdo-congelada-paquete	t
1739	18	1	Tortilla de patata y cebolla Hacendado	2.80	4.67	kg	https://prod-mercadona.imgix.net/images/e4105297acdb4350ef0bf7eb789a29dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80895/tortilla-patata-cebolla-hacendado-con-aceite-oliva-bandeja	t
1740	18	1	Tortilla de patata Hacendado	2.80	4.67	kg	https://prod-mercadona.imgix.net/images/81ea12030b53ff6cbbb27a8b1f3ac1c6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80771/tortilla-patata-hacendado-bandeja	t
1741	20	1	Callos a la madrileña Hacendado	2.45	6.36	kg	https://prod-mercadona.imgix.net/images/51212c7d966e91e80bf142ed388ecbb0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67786/callos-madrilena-hacendado-lata	t
1742	20	1	Fabada Hacendado	1.50	3.57	kg	https://prod-mercadona.imgix.net/images/8cdfd085c49c506fa378ee48944ac5d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35590/fabada-hacendado-bote	t
1743	20	1	Fabada Hacendado	2.95	3.43	kg	https://prod-mercadona.imgix.net/images/3e9eeb30a69996709040eafb30c0fd38.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26108/fabada-hacendado-bote	t
1744	20	1	Lentejas a la riojana Hacendado	1.35	3.21	kg	https://prod-mercadona.imgix.net/images/bab0dcdfa9133d9e8e3d1e92453f1d86.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26101/lentejas-riojana-hacendado-bote	t
1745	20	1	Lentejas a la jardinera Hacendado	1.20	2.86	kg	https://prod-mercadona.imgix.net/images/af20ede45b4244b1b68886eacdecb2a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26116/lentejas-jardinera-hacendado-bote	t
1746	20	1	Fabada asturiana Litoral	2.60	6.19	kg	https://prod-mercadona.imgix.net/images/82883aceb76e28c2044b8f9be508518f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22726/fabada-asturiana-litoral-bote	t
1747	20	1	Albóndigas en salsa Hacendado	1.80	4.29	kg	https://prod-mercadona.imgix.net/images/e9ca00ba67d43515c56921941e152e79.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23138/albondigas-salsa-hacendado-bote	t
1748	20	1	Alubias a la jardinera Hacendado	1.20	2.86	kg	https://prod-mercadona.imgix.net/images/c2428056c157c33d448d6bcb119e2940.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26114/alubias-jardinera-hacendado-bote	t
1749	20	1	Garbanzos a la riojana Hacendado	1.35	3.21	kg	https://prod-mercadona.imgix.net/images/a457a8d635eb1c41f1ceb5df904b0441.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26174/garbanzos-riojana-hacendado-bote	t
1750	20	1	Garbanzos a la jardinera Hacendado	1.20	2.86	kg	https://prod-mercadona.imgix.net/images/cd675e0d262e373b15032c52c8ec25bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26110/garbanzos-jardinera-hacendado-bote	t
1751	20	1	Cocido Hacendado	1.90	4.52	kg	https://prod-mercadona.imgix.net/images/cf0281458ae5889ff03afa2d7e301259.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52990/cocido-hacendado-bote	t
1752	20	1	Albóndigas de pollo Hacendado	1.80	4.29	kg	https://prod-mercadona.imgix.net/images/04e99d3dc3f5809360e2822edf760470.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23139/albondigas-pollo-hacendado-bote	t
1753	20	1	Alubias con tomate Heinz	1.30	3.13	kg	https://prod-mercadona.imgix.net/images/b7271388f347be0f04c504571ed30cfd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26138/alubias-con-tomate-heinz-bote	t
1754	18	1	Lentejas Listo para Comer	4.00	4.00	kg	https://prod-mercadona.imgix.net/images/f3969d774c063e03c1da522f39c90a49.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/88407/lentejas-listo-comer-bol	t
1755	18	1	Ensaladilla Delicias del mar Hacendado	1.80	7.20	kg	https://prod-mercadona.imgix.net/images/43a1461d20211d7bf5106f1632474d73.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80782/ensaladilla-cangrejo-hacendado-tarrina	t
1756	18	1	Ensaladilla rusa Hacendado	3.00	6.00	kg	https://prod-mercadona.imgix.net/images/8a73d41f9830335429b49a5a88fb4944.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80795/ensaladilla-rusa-hacendado-tarrina	t
1757	18	1	Ensaladilla rusa Hacendado	1.80	7.20	kg	https://prod-mercadona.imgix.net/images/d1be7b52299fa0ce6308071004e6097f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80784/ensaladilla-rusa-hacendado-tarrina	t
1758	18	1	Ensaladilla americana Hacendado	1.70	6.80	kg	https://prod-mercadona.imgix.net/images/8e7447ad8e36b32641806bd962ef9c38.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80781/ensaladilla-americana-hacendado-tarrina	t
1759	18	1	Patatas con allioli Hacendado	1.55	6.20	kg	https://prod-mercadona.imgix.net/images/0fcb44221de105ac6132768b660dc7c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67798/patatas-con-allioli-hacendado-tarrina	t
1760	18	1	Ensaladilla rusa grande Listo para Comer	12.00	12.00	kg	https://prod-mercadona.imgix.net/images/b2764487d4eea824e14721d474584f77.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5561/ensaladilla-rusa-grande-listo-comer-bandeja	t
1761	18	1	Ensaladilla rusa mediana Listo para Comer	6.50	6.50	kg	https://prod-mercadona.imgix.net/images/0d70a92075e9653e8719d81545beeca5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60226/ensaladilla-rusa-mediana-listo-comer-bandeja	t
1762	18	1	Ensaladilla rusa pequeña Listo para Comer	3.50	3.50	kg	https://prod-mercadona.imgix.net/images/53d8c3afc37ab0104735652ca1cbe512.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60212/ensaladilla-rusa-pequena-listo-comer-bandeja	t
1763	36	1	Ensaladilla de marisco Listo para Comer	4.00	4.00	kg	https://prod-mercadona.imgix.net/images/81bb1807278bb4d6a825fe4d8c38e973.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13250/ensaladilla-marisco-listo-comer-compuesta-mayonesa-boca-mar-langostino-merluza-huevo-hilado-bol	t
1764	36	1	Untapán de cangrejo Hacendado	1.50	10.00	kg	https://prod-mercadona.imgix.net/images/cf92ddd92fe869b0fd547a3775030a59.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8251/untapan-cangrejo-hacendado-tarrina	t
1765	18	1	Hummus de garbanzos Hacendado receta clásica	1.15	4.79	kg	https://prod-mercadona.imgix.net/images/15667b13bbdba430cddb8e98106b583e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80858/hummus-garbanzos-hacendado-receta-clasica-tarrina	t
1766	18	1	Hummus de garbanzos Hacendado con pimiento del piquillo asado	1.45	6.04	kg	https://prod-mercadona.imgix.net/images/259abf92c1d31d0183f5a53c4ef87029.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80862/hummus-garbanzos-hacendado-con-pimiento-piquillo-asado-tarrina	t
1767	18	1	Tabulé oriental Hacendado	1.70	6.80	kg	https://prod-mercadona.imgix.net/images/a14283e9b87cc4e71fc95816d44c97a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80794/tabule-oriental-hacendado-tarrina	t
1768	18	1	Pastel de atún Hacendado	2.90	11.15	kg	https://prod-mercadona.imgix.net/images/10d20ec3aab5d9a777891ff5de26d3c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4798/pastel-atun-hacendado-bandeja	t
1769	18	1	Tsatsiki Hacendado	1.90	8.64	kg	https://prod-mercadona.imgix.net/images/f600e10c5e58e895a91959e254d67109.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80980/tsatsiki-hacendado-tarrina	t
1770	18	1	Sándwich pollo y queso Hacendado	1.85	10.00	kg	https://prod-mercadona.imgix.net/images/1c593da1f45a228feaec75d3970a6172.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86588/sandwich-pollo-queso-hacendado-paquete	t
1771	18	1	Sándwich atún y huevo Hacendado	1.80	9.73	kg	https://prod-mercadona.imgix.net/images/e2ac23455fdd4a64d98288512bb8d717.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4106/sandwich-atun-huevo-hacendado-paquete	t
1772	34	1	Zumo de naranja recién exprimido Hacendado	1.95	7.80	l	https://prod-mercadona.imgix.net/images/7a5da08a9ed080770adffcced9e025f2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5250/zumo-naranja-recien-exprimido-hacendado-botella	t
1773	34	1	Zumo de naranja recién exprimido Hacendado	2.95	5.90	l	https://prod-mercadona.imgix.net/images/97fb8dc0e14a68511eebe04b68b3a172.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3363/zumo-naranja-recien-exprimido-hacendado-botella	t
1774	34	1	Zumo de naranja recién exprimido Hacendado	4.95	4.95	l	https://prod-mercadona.imgix.net/images/70bfb1fb2f725e0ba98259fa063e4f9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/3362/zumo-naranja-recien-exprimido-hacendado-botella	t
1775	34	1	Zumo pura naranja Hacendado	1.85	1.85	l	https://prod-mercadona.imgix.net/images/b6d2cecc3bad138c6020b6d7eb67ef83.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39010/zumo-pura-naranja-hacendado-brick	t
1776	34	1	Zumo pura naranja Hacendado	2.80	2.33	l	https://prod-mercadona.imgix.net/images/0ba46f93dcbcaed6ff525f877cae8a29.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39033/zumo-pura-naranja-hacendado-pack-6	t
1777	34	1	Zumo pura naranja con pulpa Hacendado	1.90	1.90	l	https://prod-mercadona.imgix.net/images/49c07dc6cecfe687ec6d06e6061ac967.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39032/zumo-pura-naranja-con-pulpa-hacendado-brick	t
1778	34	1	Bebida Florida Hacendado	1.40	0.70	l	https://prod-mercadona.imgix.net/images/13e06b5d2a298309aaaff233753c1bc1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39127/bebida-florida-hacendado-brick	t
1779	34	1	Bebida de naranja Hacendado sin azúcares añadidos	1.05	1.05	l	https://prod-mercadona.imgix.net/images/2a1d63e837b4582f4faeddd8507054a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8790/bebida-naranja-hacendado-sin-azucares-anadidos-brick	t
1780	34	1	Bebida de naranja Hacendado sin azúcares añadidos	1.85	1.54	l	https://prod-mercadona.imgix.net/images/c8f6dbb9c354634993c77ed89cac7df4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8791/bebida-naranja-hacendado-sin-azucares-anadidos-pack-6	t
1781	34	1	Zumo de clementina Hacendado	1.80	1.80	l	https://prod-mercadona.imgix.net/images/cd85e354252f29613f03a2f21d828ccc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86933/zumo-clementina-hacendado-botella	t
1782	28	1	Refresco Fanta naranja	3.15	0.79	l	https://prod-mercadona.imgix.net/images/6fa8f5467f2204c2f01a32f3c18a44c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27526/refresco-fanta-naranja-pack-2	t
1783	28	1	Refresco Fanta naranja	1.85	0.93	l	https://prod-mercadona.imgix.net/images/1e85c99b02fd2070d625f3899793ebc2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27508/refresco-fanta-naranja-botella	t
1784	28	1	Refresco Fanta naranja	6.93	2.33	l	https://prod-mercadona.imgix.net/images/43a2ed3e13a659f801c0185ec8a5e177.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27571/refresco-fanta-naranja-pack-9	t
1785	28	1	Refresco Fanta naranja	0.80	2.42	l	https://prod-mercadona.imgix.net/images/aa8560b5a2668261ad121f58c4942941.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27502/refresco-fanta-naranja-lata	t
1786	28	1	Refresco Fanta naranja zero azúcares añadidos	1.59	0.80	l	https://prod-mercadona.imgix.net/images/3874694a9b1f69073ddee2a9c0c79fad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27545/refresco-fanta-naranja-zero-azucares-anadidos-botella	t
1787	28	1	Refresco Fanta naranja zero azúcares añadidos	6.16	2.33	l	https://prod-mercadona.imgix.net/images/4f417d3a0b711609a1daea581d8995c5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8778/refresco-fanta-naranja-zero-azucares-anadidos-pack-8	t
1788	28	1	Refresco Fanta naranja zero azúcares añadidos	0.80	2.42	l	https://prod-mercadona.imgix.net/images/6161ca06c5c9a4862bee618f403af5ae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27510/refresco-fanta-naranja-zero-azucares-anadidos-lata	t
1789	28	1	Refresco de naranja Hacendado fresh gas	0.95	0.48	l	https://prod-mercadona.imgix.net/images/967c2e712f56e9dfce0f8e7649594fd5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29075/refresco-naranja-hacendado-fresh-gas-botella	t
1790	28	1	Refresco de naranja Hacendado fresh gas	2.22	1.12	l	https://prod-mercadona.imgix.net/images/025303a70699ee4fd705a7f19ff72c5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29039/refresco-naranja-hacendado-fresh-gas-pack-6	t
1791	28	1	Refresco de naranja Hacendado fresh gas	0.37	1.12	l	https://prod-mercadona.imgix.net/images/ec3e94308c014b341c1812f74be57f5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29040/refresco-naranja-hacendado-fresh-gas-lata	t
1792	28	1	Refresco de naranja Hacendado zero fresh gas	0.90	0.45	l	https://prod-mercadona.imgix.net/images/4e889ab6cb03550a75326a177931b794.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29076/refresco-naranja-hacendado-zero-fresh-gas-botella	t
1793	28	1	Refresco de naranja Hacendado zero fresh gas	2.22	1.12	l	https://prod-mercadona.imgix.net/images/d57c6edad27033bd2e62c3c8916161d6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29041/refresco-naranja-hacendado-zero-fresh-gas-pack-6	t
1794	28	1	Refresco de naranja Hacendado zero fresh gas	0.37	1.12	l	https://prod-mercadona.imgix.net/images/75e5e105d37f9303ffcb8808441670f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29042/refresco-naranja-hacendado-zero-fresh-gas-lata	t
1795	21	1	Mix frutos rojos Hacendado ultracongeladas	1.90	6.33	kg	https://prod-mercadona.imgix.net/images/9226d0c69488fd575c374293d5538ad6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61089/mix-frutos-rojos-hacendado-ultracongeladas-paquete	t
1796	21	1	Fresas enteras Hacendado ultracongeladas	1.90	6.33	kg	https://prod-mercadona.imgix.net/images/82271348f4c89b9ee829c7a42f81412f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61092/fresas-enteras-hacendado-ultracongeladas-paquete	t
1797	21	1	Arándanos enteros Hacendado ultracongelados	2.15	7.17	kg	https://prod-mercadona.imgix.net/images/816d6a2275f1cada7d00c665d6a371bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61093/arandanos-enteros-hacendado-ultracongelados-paquete	t
1798	21	1	Mix frutas tropical Hacendado ultracongeladas	2.75	6.11	kg	https://prod-mercadona.imgix.net/images/aef553f69297509609d69e0c2541cf5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86403/mix-frutas-tropical-hacendado-ultracongeladas-mango-melocoton-papaya-paquete	t
1799	21	1	Ensaladilla Hacendado ultracongelada	1.36	1.36	kg	https://prod-mercadona.imgix.net/images/2207791ea61f6613e34ad96bb909d9ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61101/ensaladilla-hacendado-ultracongelada-paquete	t
1800	21	1	Garrofón Hacendado ultracongelado	1.55	3.44	kg	https://prod-mercadona.imgix.net/images/39b7229d22631670ed2d2be1a0785d54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61270/garrofon-hacendado-ultracongelado-paquete	t
1801	21	1	Garbanzo Hacendado ultracongelado	1.36	3.02	kg	https://prod-mercadona.imgix.net/images/efbadaccd79807948c4b62ee8e4c1757.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61272/garbanzo-hacendado-ultracongelado-paquete	t
1802	21	1	Guisante muy tierno Hacendado ultracongelado	1.05	3.50	kg	https://prod-mercadona.imgix.net/images/110a733a4288e3cee3fa98822491ea5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61200/guisante-muy-tierno-hacendado-ultracongelado-paquete	t
1803	21	1	Guisante fino Hacendado ultracongelado	1.65	1.65	kg	https://prod-mercadona.imgix.net/images/1cfc769270faf8a5f58a20cdc8b0ef5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61215/guisante-fino-hacendado-ultracongelado-paquete	t
1804	21	1	Judía verde plana Hacendado ultracongelada	1.45	1.45	kg	https://prod-mercadona.imgix.net/images/b4c7ca3ec466371e2d5f09589e9c663e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61283/judia-verde-plana-hacendado-ultracongelada-paquete	t
1805	21	1	Cebolla troceada Hacendado ultracongelada	0.95	2.11	kg	https://prod-mercadona.imgix.net/images/01e62dd81eb0ed0c43d341f5dc84d170.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13568/cebolla-troceada-hacendado-ultracongelada-paquete	t
1806	21	1	Judía verde redonda Hacendado ultracongelada	1.45	1.45	kg	https://prod-mercadona.imgix.net/images/6f64b307b3a4062e866cd985ce389994.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61282/judia-verde-redonda-hacendado-ultracongelada-paquete	t
1807	21	1	Ajo tierno Hacendado ultracongelado	2.05	6.83	kg	https://prod-mercadona.imgix.net/images/81100f26d8d5b846fbe8d8a963c6a86d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61288/ajo-tierno-hacendado-ultracongelado-paquete	t
1808	21	1	Alcachofa troceada Hacendado ultracongelada	2.65	6.63	kg	https://prod-mercadona.imgix.net/images/f803b1f1ffed78eff58997dc332d32bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13865/alcachofa-troceada-hacendado-ultracongelada-paquete	t
1809	21	1	Espinaca en porciones Hacendado ultracongelada	1.00	2.22	kg	https://prod-mercadona.imgix.net/images/708f8d553aec26d56e2e09daf447df4b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61279/espinaca-porciones-hacendado-ultracongelada-paquete	t
1810	21	1	Espinaca picada en porciones Hacendado ultracongelada	1.30	2.60	kg	https://prod-mercadona.imgix.net/images/b738648efadba41e6fcf45597269f920.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35781/espinaca-picada-porciones-hacendado-ultracongelada-paquete	t
1811	21	1	Menestra de verduras Hacendado ultracongelada	1.83	1.83	kg	https://prod-mercadona.imgix.net/images/cda982b20663598e095ee29141b906fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52534/menestra-verduras-hacendado-ultracongelada-paquete	t
1812	21	1	Habitas muy tiernas Hacendado ultracongeladas	2.92	9.73	kg	https://prod-mercadona.imgix.net/images/ac99f78733e867d09770f1fc0715ce7d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61285/habitas-muy-tiernas-hacendado-ultracongeladas-paquete	t
1813	21	1	Habas fina Hacendado ultracongelada	1.19	2.64	kg	https://prod-mercadona.imgix.net/images/2e9317b9199245c9aafd808942d14b39.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61233/haba-fina-hacendado-ultracongelada-paquete	t
1814	21	1	Habas baby Hacendado ultracongelada	1.74	3.87	kg	https://prod-mercadona.imgix.net/images/7d47fd31a09bcb8fe60413929635c21d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61252/haba-baby-hacendado-ultracongelada-paquete	t
1815	21	1	Salteado de setas Hacendado ultracongeladas	1.61	3.58	kg	https://prod-mercadona.imgix.net/images/a62440f5e0d22babc59dd602b87cfee2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61025/salteado-setas-hacendado-ultracongeladas-paquete	t
1816	21	1	Pimiento rojo y verde Hacendado ultracongelado	1.20	2.67	kg	https://prod-mercadona.imgix.net/images/edc3300ee19dd682083042d5b90d4ca1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35221/pimiento-rojo-verde-hacendado-ultracongelado-paquete	t
1817	21	1	Salteado de verduras asadas Hacendado ultracongeladas	1.70	4.25	kg	https://prod-mercadona.imgix.net/images/8d33c9b6f3659c40428ab8d274d3dab7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61027/salteado-verduras-asadas-hacendado-ultracongeladas-paquete	t
1818	21	1	Parrillada de verduras Hacendado ultracongeladas	1.55	3.88	kg	https://prod-mercadona.imgix.net/images/6daebba705fb04e407520888d448e5ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61034/parrillada-verduras-hacendado-ultracongeladas-paquete	t
1819	21	1	Maíz dulce Hacendado ultracongelado	1.24	3.10	kg	https://prod-mercadona.imgix.net/images/be6852af02a87787b9dad6356b8069aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61289/maiz-dulce-hacendado-ultracongelado-paquete	t
1820	21	1	Espárrago verde troceado Hacendado ultracongelado	2.55	8.50	kg	https://prod-mercadona.imgix.net/images/c2686b829eeca97a18ea1f44a36fa022.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61238/esparrago-verde-troceado-hacendado-ultracongelado-paquete	t
1821	21	1	Brócoli Hacendado ultracongelado	2.00	2.00	kg	https://prod-mercadona.imgix.net/images/4137c2c4c17cd4cc22e3161b5d9b50d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61261/brocoli-hacendado-ultracongelado-paquete	t
1822	21	1	Salteado de pollo Hacendado ultracongelado	2.20	4.89	kg	https://prod-mercadona.imgix.net/images/aba3b227b4b83629ea3afc03479dbe43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13404/salteado-pollo-hacendado-ultracongelado-paquete	t
1823	21	1	Ajo troceado Hacendado ultracongelado	0.95	6.33	kg	https://prod-mercadona.imgix.net/images/1c5db356adc87b3adf62cdfb01512dfc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61251/ajo-troceado-hacendado-ultracongelado-paquete	t
1824	21	1	Alcachofa baby Hacendado ultracongelada	3.05	10.17	kg	https://prod-mercadona.imgix.net/images/38fdce19d2eb5917b5916c9a9c3236dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61229/alcachofa-baby-hacendado-ultracongelada-paquete	t
1825	21	1	Pimientos del piquillo rellenos de bacalao Hacendado ultracongelados	2.10	11.35	kg	https://prod-mercadona.imgix.net/images/da60a75841e5ba265e40fadbf71e6546.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61371/pimientos-piquillo-rellenos-bacalao-hacendado-ultracongelados-paquete	t
1826	21	1	Tempura de verduras Hacendado ultracongelada	2.70	6.75	kg	https://prod-mercadona.imgix.net/images/11b4393731138bd6bc73f65a7690d312.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61300/tempura-verduras-hacendado-ultracongelada-paquete	t
1827	21	1	Pisto de verduras Hacendado ultracongelado	2.10	4.67	kg	https://prod-mercadona.imgix.net/images/e417f79b0e10e4ac6bbdf8dcf7f0fb92.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35653/pisto-verduras-hacendado-ultracongelado-paquete	t
1828	21	1	Rollitos primavera Hacendado ultracongelados	1.55	5.17	kg	https://prod-mercadona.imgix.net/images/712a13dbe0cb2df36fc480c97bef9316.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63478/rollitos-primavera-hacendado-ultracongelados-caja	t
1829	21	1	Coles de Bruselas Hacendado ultracongeladas	1.70	3.78	kg	https://prod-mercadona.imgix.net/images/ca74cb9fbbd7c35a86051e056d5dffdd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61248/coles-bruselas-hacendado-ultracongeladas-paquete	t
1830	21	1	Coliflor Hacendado ultracongelada	2.00	2.00	kg	https://prod-mercadona.imgix.net/images/1d9a6b48331e74e0ad78d3daa112e748.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61231/coliflor-hacendado-ultracongelada-paquete	t
1831	21	1	Edamame soja verde Hacendado ultracongelada	1.75	3.50	kg	https://prod-mercadona.imgix.net/images/27f612682e80ebb45cef1f645911e827.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70740/edamame-soja-verde-hacendado-ultracongelada-paquete	t
1832	21	1	Wok de verduras Hacendado ultracongelado	1.90	4.22	kg	https://prod-mercadona.imgix.net/images/692bb6c733e3fbef831537eed3d2630a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11617/wok-verduras-hacendado-ultracongelado-paquete	t
1833	21	1	Wakame ensalada de alga marina Hacendado congelada	1.70	13.60	kg	https://prod-mercadona.imgix.net/images/7091f6ca5f7d9800b0cb305e3675e7de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69383/wakame-ensalada-alga-marina-hacendado-congelada-con-sesamo-paquete	t
1834	21	1	Espinacas a la crema Hacendado ultracongeladas	2.20	4.89	kg	https://prod-mercadona.imgix.net/images/cc57d6c733e0bd79dc8f77dd222dd546.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61368/espinacas-crema-hacendado-ultracongeladas-paquete	t
1835	21	1	Salteado de verduras Hacendado ultracongelado	1.55	2.58	kg	https://prod-mercadona.imgix.net/images/fefbdd4a6323c54a3421311053edd8a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61065/salteado-verduras-hacendado-ultracongelado-paquete	t
1836	21	1	Migas de coliflor Hacendado ultracongeladas	1.55	3.44	kg	https://prod-mercadona.imgix.net/images/dd48edffea66ff30354eada4961f0e17.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35773/migas-coliflor-hacendado-ultracongeladas-paquete	t
1837	21	1	Gyozas de pollo y verduras Hacendado congeladas	2.15	9.35	kg	https://prod-mercadona.imgix.net/images/701ac0f02ecae7317070866fcfb7e662.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23155/gyozas-pollo-verduras-hacendado-congeladas-paquete	t
1838	21	1	Espinacas en porciones Hacendado ultracongeladas	1.25	2.50	kg	https://prod-mercadona.imgix.net/images/6c439ebeaafb46795209ccdfc29777da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13986/espinacas-porciones-hacendado-ultracongeladas-paquete	t
1839	21	1	Patatas prefritas corte fino Hacendado ultracongeladas	1.93	1.93	kg	https://prod-mercadona.imgix.net/images/44520b07bbfc555c61ef33a8310ed1fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61421/patatas-prefritas-corte-fino-hacendado-ultracongeladas-paquete	t
1840	21	1	Patatas prefritas corte grueso Hacendado ultracongeladas	3.10	1.55	kg	https://prod-mercadona.imgix.net/images/17505e86e95e53c0feef6e25fbe294c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61405/patatas-prefritas-corte-grueso-hacendado-ultracongeladas-paquete	t
1841	21	1	Patatas prefritas gajo Hacendado ultracongeladas	1.70	2.27	kg	https://prod-mercadona.imgix.net/images/03cc22cb0e1921e0e5463c6252ca3dde.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61416/patatas-prefritas-gajo-hacendado-ultracongeladas-paquete	t
1842	21	1	Patatas fritas horno y air fryer Hacendado ultracongeladas	2.10	2.80	kg	https://prod-mercadona.imgix.net/images/e5cc47ec53ae7ed1f090d8069bf9ab6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7879/patatas-fritas-horno-air-fryer-hacendado-ultracongeladas-paquete	t
1843	21	1	Filetes de merluza Argentina sin piel Hacendado ultracongelados	5.00	8.33	kg	https://prod-mercadona.imgix.net/images/26de3ac3c550e20905396965af457da7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62162/filetes-merluza-argentina-sin-piel-hacendado-ultracongelados-paquete	t
1844	21	1	Rodaja de emperador Hacendado ultracongelado	4.47	14.90	kg	https://prod-mercadona.imgix.net/images/9b313b8406d0805cab22b0e1ff0c4d61.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24345/rodaja-emperador-hacendado-ultracongelado-pieza	t
1845	21	1	Filetes de bacalao MareDeus ultracongelado	6.60	17.60	kg	https://prod-mercadona.imgix.net/images/92f2af11cb0b8c2b0cbe9c4ff2ba0b5c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24016/filetes-bacalao-maredeus-ultracongelado-punto-sal-paquete	t
1846	21	1	Tubo de pota Argentina limpio Hacendado congelado	1.50	15.00	kg	https://prod-mercadona.imgix.net/images/5ff143c1862acfe64f7e80f72e0b3742.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24203/tubo-pota-argentina-limpia-congelado-pieza	t
1847	21	1	Sepia faraónica limpia Hacendado congelada	6.40	16.00	kg	https://prod-mercadona.imgix.net/images/8c6b3609d7edb066186b5a2fc74eebe8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24200/sepia-limpia-congelada-pieza	t
1848	21	1	Filete de salmón rosado salvaje con piel Hacendado ultracongelado	4.05	13.50	kg	https://prod-mercadona.imgix.net/images/9433ea335072ed81924f318ac4cdb24e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24350/filete-salmon-rosado-salvaje-con-piel-hacendado-ultracongelado-pieza	t
1849	21	1	Sepia faraónica troceada limpia Hacendado congelada	6.00	16.67	kg	https://prod-mercadona.imgix.net/images/6030d5a8702a32ce6d75e12d5e233c7d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24274/sepia-limpia-troceada-hacendado-congelada-paquete	t
1850	21	1	Calamar troceado limpio Hacendado congelado	6.00	12.63	kg	https://prod-mercadona.imgix.net/images/2c316c4572b58be6a109d7f3375ffa40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24242/calamar-limpio-troceado-hacendado-congelado-paquete	t
1851	21	1	Filetes de panga Hacendado ultracongelados	4.90	5.44	kg	https://prod-mercadona.imgix.net/images/e5cb902b5acb5cd8f005ba60630c6973.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62191/filetes-panga-hacendado-ultracongelados-paquete	t
1852	21	1	Lomos de merluza del Cabo Hacendado ultracongelados	4.90	12.25	kg	https://prod-mercadona.imgix.net/images/715dbe2c32c48f777052fa4c80c3e5d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62112/lomos-centros-merluza-cabo-hacendado-ultracongelados-caja	t
1853	21	1	Fritura de pescado Hacendado ultracongelada	5.45	9.08	kg	https://prod-mercadona.imgix.net/images/18312a8e575e7902e507aad71287ae9d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62012/fritura-pescado-hacendado-ultracongelada-paquete	t
1854	21	1	Porciones de bacalao sin piel MareDeus ultracongeladas	6.40	16.00	kg	https://prod-mercadona.imgix.net/images/6c5cff018c59d7f8938badf11d0f896b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62049/porciones-bacalao-punto-sal-maredeus-ultracongelado-paquete	t
1855	21	1	Rodaja de potón del Pacífico cocido Hacendado congelado	6.50	13.68	kg	https://prod-mercadona.imgix.net/images/587b220da60ea73445aca0a0b65ae6c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24234/rodaja-poton-pacifico-cocido-hacendado-congelado-paquete	t
1856	21	1	Rodaja de tintorera sin piel Hacendado ultracongelada	3.13	6.95	kg	https://prod-mercadona.imgix.net/images/b658b0cecb2dc44fb6e74074a0151c46.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24383/rodaja-tintorera-sin-piel-hacendado-ultracongelada-pieza	t
1857	21	1	Porciones de merluza del Cabo sin piel Hacendado ultracongeladas	4.90	9.80	kg	https://prod-mercadona.imgix.net/images/793cbce6a84e3f0fb9a3af1fb4ab7d0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62103/porciones-merluza-cabo-sin-piel-hacendado-ultracongeladas-paquete	t
1858	21	1	Pescadilla de merluza sin cabeza Hacendado ultracongelada	5.25	5.25	kg	https://prod-mercadona.imgix.net/images/83fae83249fcbd7cca958cf607bf7ebc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62176/pescadilla-merluza-sin-cabeza-hacendado-ultracongelada-paquete	t
1859	21	1	Cola de rape del Cabo sin piel Hacendado ultracongelada	8.98	17.95	kg	https://prod-mercadona.imgix.net/images/b2acb68233a4b02ac3191c9bf2a7e584.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24340/cola-rape-cabo-hacendado-ultracongelada-pieza	t
1860	21	1	Tiras de potón del Pacífico Hacendado congeladas	4.95	12.38	kg	https://prod-mercadona.imgix.net/images/4fdab476ef08c8dc8e5af196af075723.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24341/tiras-poton-hacendado-congeladas-paquete	t
1861	21	1	Tinta de sepia Nortindal congelada	2.75	85.94	kg	https://prod-mercadona.imgix.net/images/f79ea5c38c9b67475afbea2b10e718a4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24256/tinta-sepia-nortindal-congelada-paquete	t
1862	21	1	Merluza del Cabo sin cabeza Hacendado ultracongelada	5.77	8.25	kg	https://prod-mercadona.imgix.net/images/69a206b4ff70bba92ec3f4949835b98b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24324/merluza-cabo-sin-cabeza-hacendado-ultracongelada-pieza	t
1863	21	1	Anillas de pota Argentina Hacendado congeladas	5.75	15.97	kg	https://prod-mercadona.imgix.net/images/74bb5e68f4415013d30547d41fcdc7c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24249/anillas-pota-hacendado-congeladas-paquete	t
1864	21	1	Puntilla de la Índia Hacendado congelada	4.70	10.44	kg	https://prod-mercadona.imgix.net/images/1ebaa43d9a97fe2bcb1eb704d7190662.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24291/chipiron-puntilla-hacendado-congelado-paquete	t
1865	21	1	Migas de bacalao sin piel MareDeus ultracongeladas	4.90	16.33	kg	https://prod-mercadona.imgix.net/images/4df996fce1de2f2fd46cb8ef14a1a2a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24023/migas-bacalao-sin-espinas-sin-piel-maredeus-ultra-congeladas-punto-sal-paquete	t
1866	21	1	Migas de bacalao dorado con cebolla y patatas paja Hacendado congelado	2.60	10.83	kg	https://prod-mercadona.imgix.net/images/d6e7c22f60ce4e3ace5ebb38f2f64c69.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63023/migas-bacalao-dorado-con-cebolla-patatas-paja-hacendado-congelado-caja	t
1867	21	1	Calamar patagónico pequeño Hacendado ultracongelado	5.50	11.00	kg	https://prod-mercadona.imgix.net/images/6644c2c1c3e1d966a84745b6a9c88e03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63432/calamar-patagonico-pequeno-hacendado-ultracongelado-paquete	t
1868	21	1	Rodajas de atún de aleta amarilla Hacendado congelado	4.38	17.50	kg	https://prod-mercadona.imgix.net/images/2044dea67f3208de4b6c1cc55a693b7e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24357/rodajas-atun-aleta-amarilla-hacendado-congelado-bandeja	t
1869	21	1	Tacos de atún Hacendado congelado	3.85	13.75	kg	https://prod-mercadona.imgix.net/images/1222abc8e5d72f2ccbc49f640cce296c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24458/tacos-atun-hacendado-congelado-aleta-amarilla-bandeja	t
1870	21	1	Rodajas de merluza Argentina Hacendado ultracongeladas	4.50	7.50	kg	https://prod-mercadona.imgix.net/images/b02df74e62131f045906d715da702676.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26764/rodajas-merluza-argentina-hacendado-ultracongeladas-paquete	t
1871	21	1	Huevas de sepia Hacendado congeladas	6.95	19.86	kg	https://prod-mercadona.imgix.net/images/f23b1b11d0b8eae3e25ea91fb2ead1bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24412/huevas-sepia-hacendado-congeladas-bandeja	t
1872	21	1	Calamar grande Hacendado congelado	3.50	17.50	kg	https://prod-mercadona.imgix.net/images/f932659cddf67f574bb41f1d4c775830.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24417/calamar-grande-hacendado-congelado-pieza	t
1873	21	1	Rodaja de marrajo Hacendado ultracongelado	2.87	11.95	kg	https://prod-mercadona.imgix.net/images/8eea8d5c8d4c10d961fdaa0b891862ff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/24384/rodaja-marrajo-hacendado-ultracongelado-pieza	t
1874	21	1	Acedía entera Hacendado ultracongelada	7.00	11.67	kg	https://prod-mercadona.imgix.net/images/563433cc2282ce404cf8a482bcf3f79a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62033/acedia-entera-hacendado-ultracongelada-paquete	t
1875	21	1	Lomo de bacalao MareDeus ultracongelado	7.68	20.00	kg	https://prod-mercadona.imgix.net/images/aa68741e624d6f99903465294f3de2aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62050/lomo-bacalao-maredeus-ultracongelado-punto-sal-paquete	t
1876	21	1	Colas de merluza Argentina Hacendado ultracongeladas	5.25	5.25	kg	https://prod-mercadona.imgix.net/images/81b4027016c9656609b818c841519f13.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62165/colas-merluza-argentina-hacendado-ultracongeladas-paquete	t
1877	21	1	Palitos de surimi Hacendado ultracongelados	2.50	4.17	kg	https://prod-mercadona.imgix.net/images/50b16e7d62acb06ea3b3983c4bd5e7fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62403/palitos-surimi-hacendado-ultracongelados-paquete	t
1878	21	1	Carne de mejillón de Chile cocido Hacendado ultracongelado	2.50	9.09	kg	https://prod-mercadona.imgix.net/images/14a10d8ef846475b0a78866b254ef2ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62396/carne-mejillon-chile-cocido-hacendado-ultracongelado-paquete	t
1879	21	1	Mejillón de Chile entero cocido Hacendado ultracongelado	3.25	7.22	kg	https://prod-mercadona.imgix.net/images/b4e4b2663ea1d17228e8500f39b911d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/62401/mejillon-chile-entero-cocido-hacendado-ultracongelado-caja	t
1880	21	1	Almeja Hacendado congelada	1.80	4.00	kg	https://prod-mercadona.imgix.net/images/5077ee2d933dcad572b8a81e0ade8a2f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60874/almeja-hacendado-congelada-paquete	t
1881	18	1	Mini pizzas jamón y queso Fiesta ultracongeladas	2.90	10.74	kg	https://prod-mercadona.imgix.net/images/1f6a8a0430b29daafd8e7e66063df2e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13984/mini-pizzas-jamon-queso-fiesta-ultracongeladas-paquete	t
1882	21	1	Churros Hacendado ultracongelados	1.50	3.00	kg	https://prod-mercadona.imgix.net/images/4509b39692e5a9a82df03a3730444e88.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15545/churros-hacendado-ultracongelados-paquete	t
1883	21	1	Porras Hacendado congeladas	2.00	8.33	kg	https://prod-mercadona.imgix.net/images/73b27fe176f9e5aedd9a2c6f9219aed0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15137/porras-hacendado-congeladas-paquete	t
1884	21	1	Crepes Hacendado ultracongelados	2.45	6.13	kg	https://prod-mercadona.imgix.net/images/8a51ae979a0f74737d2dba7ac8e88e95.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63528/crepes-hacendado-ultracongelados-caja	t
1885	21	1	Helado mini cucurucho nata Hacendado	3.30	7.43	l	https://prod-mercadona.imgix.net/images/0621402b576d4c39d76a802a9bc99ec3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64246/helado-mini-cucurucho-nata-hacendado-caja	t
1886	21	1	Helado cucurucho de vainilla Hacendado	2.45	3.40	l	https://prod-mercadona.imgix.net/images/8db5a7eda9ce33b2992ac5b04aa0e684.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86236/helado-cucurucho-vainilla-hacendado-caja	t
1887	21	1	Helado cucurucho Hacendado de nata	2.45	3.40	l	https://prod-mercadona.imgix.net/images/b4acb828f12297e808998840ef118437.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64196/helado-cucurucho-nata-caja	t
1888	21	1	Helado cucurucho choco nata Hacendado	2.45	3.40	l	https://prod-mercadona.imgix.net/images/0b30e123cef5bc76487e5fb8642a1657.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64251/helado-cucurucho-choco-nata-hacendado-caja	t
1889	21	1	Flash popitos Hacendado	1.50	1.50	l	https://prod-mercadona.imgix.net/images/46be1e6613b52ef5021db696adb53827.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64514/flash-popitos-hacendado-paquete	t
1890	21	1	Helado turrón Hacendado	3.25	6.50	l	https://prod-mercadona.imgix.net/images/df9398f6c7464e17bd02b3d5d757e069.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64445/helado-turron-hacendado-bote	t
1891	21	1	Helado chocolate y cookies Hacendado	3.15	6.30	l	https://prod-mercadona.imgix.net/images/e3f8ad80785e480e1a95438cd68bab5e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64424/helado-chocolate-cookies-hacendado-bote	t
1892	21	1	Helado vainilla praliné con nueces pecán Hacendado	3.65	3.84	l	https://prod-mercadona.imgix.net/images/e48f12db162af45e012102226977c579.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52560/helado-vainilla-praline-con-nueces-pecan-hacendado-tarrina	t
1893	21	1	Helado caramelo con salsa de caramelo salado y trozos de caramelo Hacendado	3.25	6.50	l	https://prod-mercadona.imgix.net/images/d97bd6a7e1dc54098ded160c8c683708.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22996/helado-caramelo-con-salsa-caramelo-salado-trozos-caramelo-hacendado-bote	t
1894	21	1	Sorbete con limón Hacendado	2.35	2.35	l	https://prod-mercadona.imgix.net/images/63e1d780e3c7a051acb25f3e70b2d0a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64509/sorbete-con-limon-hacendado-tarrina	t
1895	21	1	Helado capuccino Hacendado	3.40	3.58	l	https://prod-mercadona.imgix.net/images/4d276db05fbc5a0149130e7e846be31d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52563/helado-capuccino-hacendado-tarrina	t
1896	21	1	Helado tarta de queso Hacendado con fresas	3.15	6.30	l	https://prod-mercadona.imgix.net/images/fab0747a97a445dfb3dbfef385b40edb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64436/helado-tarta-queso-hacendado-con-fresas-bote	t
1897	21	1	Helado sabor huevo de chocolate Hacendado	3.65	3.84	l	https://prod-mercadona.imgix.net/images/108f33e7169c01fbab53d574f93580f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52561/helado-sabor-huevo-chocolate-hacendado-tarrina	t
1898	21	1	Helado Peanut Butter Cups Hacendado de crema de cacahuete	3.35	6.70	l	https://prod-mercadona.imgix.net/images/6ed1b3a9b3d64134c9d27629cdf1f089.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60683/helado-peanut-butter-cups-hacendado-crema-cacahuete-con-tartaletas-cubiertas-chocolate-rellenas-manteca-cacahuete-bote	t
1899	21	1	Helado Cookie Dough Hacendado de crema de vainilla con trozos de galletas	3.35	6.70	l	https://prod-mercadona.imgix.net/images/0b89324f51d3e6db4539311d0a4f37a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60684/helado-cookie-dough-hacendado-crema-vainilla-con-trozos-galletas-con-pepitas-chocolate-salsa-caramelo-bote	t
1900	21	1	Helado Duo Brownie Hacendado de crema sabor vainilla y cacao	3.35	6.70	l	https://prod-mercadona.imgix.net/images/54787370e1d65c65fae869057aaa8b5f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12821/helado-duo-brownie-hacendado-crema-sabor-vainilla-cacao-con-trozos-bizcocho-cacao-bote	t
1901	21	1	Tarta helada nata y chocolate Hacendado	2.10	2.10	l	https://prod-mercadona.imgix.net/images/abf468ed311c33b400a723c9b4d7813f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70711/tarta-helada-nata-chocolate-hacendado-caja	t
1902	15	1	Obleas para helado Hacendado	0.70	13.46	kg	https://prod-mercadona.imgix.net/images/7b42c3270718d22d03263dc39d1ce6b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15953/obleas-helado-hacendado-paquete	t
1903	15	1	Tubitos bañados chocolate negro Hacendado	2.75	18.33	kg	https://prod-mercadona.imgix.net/images/a7fbdeefa5a02ae6576d40a3bdb98b0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14555/tubitos-banados-chocolate-negro-hacendado-ideal-postres-helados-bote	t
1904	15	1	Tubitos Hacendado	2.05	11.71	kg	https://prod-mercadona.imgix.net/images/eacd55b30b797af904e330125f217027.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/36205/tubitos-hacendado-ideal-postres-helados-bote	t
1905	21	1	Cubos de hielo	5.75	0.58	kg	https://prod-mercadona.imgix.net/images/8d8bd69c78c244ecd0956e7b66ea70fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64133/cubos-hielo-pack-5	t
1906	21	1	Cubos de hielo	1.15	0.58	kg	https://prod-mercadona.imgix.net/images/9c095f213e8e5a34c61c0a87e9dbaf8c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64126/cubos-hielo-paquete	t
1907	21	1	Hielo cocktail	1.50	0.75	kg	https://prod-mercadona.imgix.net/images/58a58d2dac231f62b518bdb84368e9fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/64139/hielo-cocktail-paquete	t
1908	27	1	Agua mineral grande Font Natura	0.95	0.12	l	https://prod-mercadona.imgix.net/images/eac424e5ce95dc651fe19e46b0a22d16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27268/agua-mineral-grande-font-natura-mineralizacion-debil-garrafa	t
1909	27	1	Agua mineral grande Font Natura	0.82	0.14	l	https://prod-mercadona.imgix.net/images/df625bfe34c6caa8e106a73a26eacf2a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15631/agua-mineral-grande-font-natura-mineralizacion-debil-garrafa	t
1910	27	1	Agua mineral grande Font Natura	1.62	0.18	l	https://prod-mercadona.imgix.net/images/d689bf21a5c65e65df9f48431a9da298.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28089/agua-mineral-grande-font-natura-mineralizacion-debil-pack-6	t
1911	27	1	Agua mineral grande Font Natura	0.27	0.18	l	https://prod-mercadona.imgix.net/images/d8066da980fddb37905e903d51cd8192.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28090/agua-mineral-grande-font-natura-mineralizacion-debil-botella	t
1912	27	1	Agua mineral grande Fuente Dehesa	1.30	0.22	l	https://prod-mercadona.imgix.net/images/b5aaab15625f9b00ff4efd92d9517dae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52630/agua-mineral-grande-fuente-dehesa-mineralizacion-muy-debil-garrafa	t
1913	27	1	Agua mineral grande Fuente Dehesa	2.34	0.26	l	https://prod-mercadona.imgix.net/images/135e6024b69509ac5c6ac18d5f4a44d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15758/agua-mineral-grande-fuente-dehesa-mineralizacion-muy-debil-pack-6	t
1914	27	1	Agua mineral grande Fuente Dehesa	0.39	0.26	l	https://prod-mercadona.imgix.net/images/1b2dc49fbd0b37b3501b50f48153fcde.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15759/agua-mineral-grande-fuente-dehesa-mineralizacion-muy-debil-botella	t
1915	27	1	Agua mineral mediana Fuente Dehesa	3.00	0.50	l	https://prod-mercadona.imgix.net/images/0190875678d7b33415230e4b99ad5ed0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15760/agua-mineral-mediana-fuente-dehesa-mineralizacion-muy-debil-pack-6	t
1916	27	1	Agua mineral mediana Fuente Dehesa	0.50	0.50	l	https://prod-mercadona.imgix.net/images/eb090b4a4d112cddc09d3b9156c70a1a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15761/agua-mineral-mediana-fuente-dehesa-mineralizacion-muy-debil-botella	t
1917	27	1	Agua mineral pequeña Fuente Dehesa	1.74	0.58	l	https://prod-mercadona.imgix.net/images/593708f1afc7d240ebda6070b0e01381.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15762/agua-mineral-pequena-fuente-dehesa-mineralizacion-muy-debil-pack-6	t
1918	27	1	Agua mineral pequeña Fuente Dehesa	0.29	0.58	l	https://prod-mercadona.imgix.net/images/5e3ece6d0340ca4112ab887db30f4034.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15763/agua-mineral-pequena-fuente-dehesa-mineralizacion-muy-debil-botella	t
1919	27	1	Agua mineral pequeña Fuente Dehesa tapón infantil	2.40	1.21	l	https://prod-mercadona.imgix.net/images/c739ac48b32492eca1ffeffb0ca8750a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22391/agua-mineral-pequena-fuente-dehesa-tapon-infantil-mineralizacion-muy-debil-pack-6	t
1920	27	1	Agua mineral pequeña Fuente Dehesa tapón infantil	0.40	1.21	l	https://prod-mercadona.imgix.net/images/c0d3a51f685c6d93a8c11d3f6fc3e59e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22392/agua-mineral-pequena-fuente-dehesa-tapon-infantil-mineralizacion-muy-debil-botella	t
1921	27	1	Agua mineral grande Nestlé Aquarel	3.84	0.43	l	https://prod-mercadona.imgix.net/images/d02509f9e8333a2b1d8e4c7374cad7cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27099/agua-mineral-grande-nestle-aquarel-mineralizacion-muy-debil-pack-6	t
1922	27	1	Agua mineral grande Nestlé Aquarel	0.64	0.43	l	https://prod-mercadona.imgix.net/images/271842cd61ddc0fc2672b2f27411ae55.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27232/agua-mineral-grande-nestle-aquarel-mineralizacion-muy-debil-botella	t
1923	27	1	Agua mineral grande Font Vella	4.32	0.48	l	https://prod-mercadona.imgix.net/images/ea42298110c6953182756caa154348b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27350/agua-mineral-grande-font-vella-mineralizacion-debil-pack-6	t
1924	27	1	Agua mineral grande Font Vella	0.75	0.50	l	https://prod-mercadona.imgix.net/images/9c28621712d73b984302a64676d7c06f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27204/agua-mineral-grande-font-vella-mineralizacion-debil-botella	t
1925	27	1	Agua mineral grande Solán de Cabras	5.34	0.59	l	https://prod-mercadona.imgix.net/images/f4fec39a0a59025b5b6713eeb2f248a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27327/agua-mineral-grande-solan-cabras-mineralizacion-debil-pack-6	t
1926	27	1	Agua mineral grande Solán de Cabras	0.89	0.59	l	https://prod-mercadona.imgix.net/images/f5a0f1d91e8b4be9323cd0fcbba32198.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27356/agua-mineral-grande-solan-cabras-mineralizacion-debil-botella	t
1927	27	1	Agua mineral grande Lanjarón	1.99	0.32	l	https://prod-mercadona.imgix.net/images/cdf6fa37d9f269a5702224e1e0680a25.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27479/agua-mineral-grande-lanjaron-mineralizacion-debil-garrafa	t
1928	27	1	Agua mineral grande Lanjarón	3.60	0.40	l	https://prod-mercadona.imgix.net/images/10ac733c7d795773d9c3371e84b85e7f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27291/agua-mineral-grande-lanjaron-mineralizacion-debil-pack-6	t
1929	27	1	Agua mineral grande Lanjarón	0.63	0.42	l	https://prod-mercadona.imgix.net/images/d78cbd348d580e41e5f944591acd1f3b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27216/agua-mineral-grande-lanjaron-botella	t
1930	27	1	Agua mineral pequeña Aguadoy tapón infantil	1.68	0.85	l	https://prod-mercadona.imgix.net/images/dd25834a0c06270295cabf20af0ca260.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28285/agua-mineral-pequena-aguadoy-tapon-infantil-mineralizacion-debil-pack-6	t
1931	27	1	Agua mineral pequeña Aguadoy tapón infantil	0.28	0.85	l	https://prod-mercadona.imgix.net/images/cf510f2aa698793b6e99cdfffdd23cb2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28287/agua-mineral-pequena-aguadoy-tapon-infantil-mineralizacion-debil-botella	t
1932	27	1	Agua de coco Hacendado 100% natural	2.60	2.60	l	https://prod-mercadona.imgix.net/images/c36335b1c5009321b8c4c017d7b0ee47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28198/agua-coco-chaokoh-100-natural-brick	t
1933	27	1	Agua mineral pequeña Font Natura	1.56	0.52	l	https://prod-mercadona.imgix.net/images/d4b0380b65b3425d9976e157d9e3b188.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27691/agua-mineral-pequena-font-natura-mineralizacion-debil-pack-6	t
1934	27	1	Agua mineral pequeña Font Natura	0.26	0.52	l	https://prod-mercadona.imgix.net/images/23f4498eb63c6ee601daf4d2c3d42e68.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27692/agua-mineral-pequena-font-natura-mineralizacion-debil-botella	t
1935	27	1	Agua mineral con gas grande Vichy Catalan	1.55	1.55	l	https://prod-mercadona.imgix.net/images/7bd8166f83035d60e61a997fe40ee7be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27213/agua-mineral-con-gas-grande-vichy-catalan-botella	t
1936	27	1	Agua mineral con gas grande Aguadoy	2.70	0.30	l	https://prod-mercadona.imgix.net/images/ccbc218c705da98e960938f11a10280c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28467/agua-mineral-con-gas-grande-aguadoy-pack-6	t
1937	27	1	Agua mineral con gas grande Aguadoy	0.45	0.30	l	https://prod-mercadona.imgix.net/images/e5efc9e5a10dea2b66198bfad9dcf7da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28468/agua-mineral-con-gas-grande-aguadoy-botella	t
1938	27	1	Agua mineral con gas pequeña Aguadoy	1.74	0.58	l	https://prod-mercadona.imgix.net/images/5b056c30b1cad5461690517723b9a461.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28469/agua-mineral-con-gas-pequena-aguadoy-pack-6	t
1939	27	1	Agua mineral con gas pequeña Aguadoy	0.29	0.58	l	https://prod-mercadona.imgix.net/images/0fb6d546e75e19feb0ace18a46c62bc0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28470/agua-mineral-con-gas-pequena-aguadoy-botella	t
1940	28	1	Gaseosa Hacendado grande	0.55	0.37	l	https://prod-mercadona.imgix.net/images/af053b1c60e1e737c797d2e5bd096a58.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27973/gaseosa-hacendado-grande-botella	t
1941	28	1	Gaseosa Hacendado pequeña	2.04	0.68	l	https://prod-mercadona.imgix.net/images/bddfe97a611cc3ed02ee9be4dbd801db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27972/gaseosa-hacendado-pequena-pack-6	t
1942	28	1	Gaseosa Hacendado pequeña	0.34	0.68	l	https://prod-mercadona.imgix.net/images/46a15a46fde60b26d8c637e38b6abb5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27971/gaseosa-hacendado-pequena-botella	t
1943	28	1	Gaseosa La Casera grande	2.55	0.85	l	https://prod-mercadona.imgix.net/images/afadc927c358da882f80347e3a0ab126.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27733/gaseosa-casera-grande-pack-2	t
1944	28	1	Gaseosa La Casera grande	1.29	0.86	l	https://prod-mercadona.imgix.net/images/6bb8bb37bdf8b41d19a11c0bc52ead8f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27735/gaseosa-casera-grande-botella	t
1945	28	1	Refresco Coca-Cola	4.10	1.03	l	https://prod-mercadona.imgix.net/images/1c6c9390743b38ad5042c4428763a88c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27348/refresco-coca-cola-pack-2	t
1946	28	1	Refresco Coca-Cola	2.15	1.08	l	https://prod-mercadona.imgix.net/images/8e4664bbdc20e75e8c2510a8456d987e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27342/refresco-coca-cola-botella	t
1947	28	1	Refresco Coca-Cola	2.40	0.96	l	https://prod-mercadona.imgix.net/images/b335b3c1d7e0a1ffcff5d977a07a3dc2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9886/refresco-coca-cola	t
1948	28	1	Refresco Coca-Cola	1.39	1.11	l	https://prod-mercadona.imgix.net/images/8c40e7d49e1d8cacb3fe57f84f87138a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28181/refresco-coca-cola-botella	t
1949	28	1	Refresco Coca-Cola	5.60	2.80	l	https://prod-mercadona.imgix.net/images/ba57cb105f39ace6df0d845d7f32f230.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28113/refresco-coca-cola-pack-4	t
1950	28	1	Refresco Coca-Cola	1.50	3.00	l	https://prod-mercadona.imgix.net/images/ace4ca633877449fae67a3f3badf865b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29360/refresco-coca-cola-botella	t
1951	28	1	Refresco Coca-Cola	11.16	2.82	l	https://prod-mercadona.imgix.net/images/9fbd0bec28094d9825eb01cc8aa60806.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27321/refresco-coca-cola-pack-12	t
1952	28	1	Refresco Coca-Cola	0.95	2.88	l	https://prod-mercadona.imgix.net/images/3a17c8a53d263585815994a70ce36e62.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27326/refresco-coca-cola-lata	t
1953	28	1	Refresco cola Hacendado	0.80	0.40	l	https://prod-mercadona.imgix.net/images/d94535e22416fe4321a4eaa3f76312fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29072/refresco-cola-hacendado-botella	t
1954	28	1	Refresco cola Hacendado	2.10	1.06	l	https://prod-mercadona.imgix.net/images/f4fbdafca2bc515fd38566bca437e0b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29031/refresco-cola-hacendado-pack-6	t
1955	28	1	Refresco cola Hacendado	0.35	1.06	l	https://prod-mercadona.imgix.net/images/92e3d15bba5076195b64d69619d97f0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29032/refresco-cola-hacendado-lata	t
1956	28	1	Refresco cola Pepsi	6.84	1.73	l	https://prod-mercadona.imgix.net/images/51c964424fe6e08bcaf1fb208e506139.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27660/refresco-cola-pepsi-pack-12	t
1957	28	1	Refresco cola Pepsi	0.59	1.79	l	https://prod-mercadona.imgix.net/images/ccca9bda2444499291bb3a5e64036d80.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27493/refresco-cola-pepsi-lata	t
1958	28	1	Refresco Coca-Cola Zero azúcar	11.16	2.82	l	https://prod-mercadona.imgix.net/images/0557fbb5328fa0b9a406c1e7e53942a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27426/refresco-coca-cola-zero-azucar-pack-12	t
1959	28	1	Refresco Coca-Cola Zero azúcar	0.95	2.88	l	https://prod-mercadona.imgix.net/images/d65d3f547ec939a26624e82102b53b98.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27414/refresco-coca-cola-zero-azucar-lata	t
1960	28	1	Refresco Coca-Cola Zero azúcar	3.80	0.95	l	https://prod-mercadona.imgix.net/images/7f24b9729659357a8df95b46db4747e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27449/refresco-coca-cola-zero-azucar-pack-2	t
1961	28	1	Refresco Coca-Cola Zero azúcar	2.15	1.08	l	https://prod-mercadona.imgix.net/images/15610299cdea0ab39334eea88ce97933.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27445/refresco-coca-cola-zero-azucar-botella	t
1962	28	1	Refresco Coca-Cola Zero azúcar	2.40	0.96	l	https://prod-mercadona.imgix.net/images/30494fa364b01c2917da33acbbdcb401.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9887/refresco-coca-cola-zero-azucar	t
1963	28	1	Refresco Coca-Cola Zero azúcar	1.39	1.11	l	https://prod-mercadona.imgix.net/images/3620ae7bf3c2e0fb54b560caefb0d30c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13816/refresco-coca-cola-zero-azucar-botella	t
1964	28	1	Refresco Coca-Cola Zero azúcar	5.60	2.80	l	https://prod-mercadona.imgix.net/images/2459de710ed6155e4b9fcffb32dc7e65.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28115/refresco-coca-cola-zero-azucar-pack-4	t
1965	28	1	Refresco Coca-Cola Zero azúcar	1.50	3.00	l	https://prod-mercadona.imgix.net/images/bc60c0f400694ad2ec33514a5bca632a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29361/refresco-coca-cola-zero-azucar-botella	t
1966	28	1	Refresco Coca-Cola light	8.37	2.82	l	https://prod-mercadona.imgix.net/images/f37edec2bd7ee6fabced1deb392160b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27184/refresco-coca-cola-light-pack-9	t
1967	28	1	Refresco Coca-Cola light	0.95	2.88	l	https://prod-mercadona.imgix.net/images/ddf7f29ffb3cd184d6288f246d6852e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27406/refresco-coca-cola-light-lata	t
1968	28	1	Refresco Coca-Cola Zero Zero	11.16	2.82	l	https://prod-mercadona.imgix.net/images/a4e6714082ed18a4fd8448f282045efc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26997/refresco-coca-cola-zero-zero-pack-12	t
1969	28	1	Refresco Coca-Cola Zero Zero	0.95	2.88	l	https://prod-mercadona.imgix.net/images/82275be98562ea0c11c2e3b903655c63.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27559/refresco-coca-cola-zero-zero-lata	t
1970	28	1	Refresco Coca-Cola Zero Zero	3.80	0.95	l	https://prod-mercadona.imgix.net/images/1c9ab31d22ec94753a0aedc6753211ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28180/refresco-coca-cola-zero-zero-pack-2	t
2088	29	1	Cerveza 0,0% sin alcohol Falke	4.32	1.09	l	https://prod-mercadona.imgix.net/images/6345bf53a29844d0467685e0c2788ab7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20338/cerveza-sin-alcohol-falke	t
1971	28	1	Refresco Coca-Cola Zero Zero	2.15	1.08	l	https://prod-mercadona.imgix.net/images/86edea71e17ba57570a432abccad8a11.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27462/refresco-coca-cola-zero-zero-botella	t
1972	28	1	Refresco cola Hacendado Zero azúcar	0.80	0.40	l	https://prod-mercadona.imgix.net/images/46b552c83e369e2dec426cae91af0255.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29073/refresco-cola-hacendado-zero-azucar-botella	t
1973	28	1	Refresco cola Hacendado Zero azúcar	2.10	1.06	l	https://prod-mercadona.imgix.net/images/2da9cac2b4bbb027312337442e1b5603.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29033/refresco-cola-hacendado-zero-azucar-pack-6	t
1974	28	1	Refresco cola Hacendado Zero azúcar	0.35	1.06	l	https://prod-mercadona.imgix.net/images/45300fa0b7b4840039f56ee03cd0876c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29034/refresco-cola-hacendado-zero-azucar-lata	t
1975	28	1	Refresco cola Hacendado Zero azúcar Zero cafeína	0.80	0.40	l	https://prod-mercadona.imgix.net/images/9936a8d1168cee94472277deb7a33267.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29074/refresco-cola-hacendado-zero-azucar-zero-cafeina-botella	t
1976	28	1	Refresco cola Hacendado Zero azúcar Zero cafeína	2.10	1.06	l	https://prod-mercadona.imgix.net/images/00d28b1d4514e4abc75b635a105161e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29035/refresco-cola-hacendado-zero-azucar-zero-cafeina-pack-6	t
1977	28	1	Refresco cola Hacendado Zero azúcar Zero cafeína	0.35	1.06	l	https://prod-mercadona.imgix.net/images/f1cfcf378f222147d5581ac4fec9ba00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29036/refresco-cola-hacendado-zero-azucar-zero-cafeina-lata	t
1978	28	1	Refresco cola Pepsi Zero azúcar	6.84	1.73	l	https://prod-mercadona.imgix.net/images/ec08b69b3bf31514d7e824c94b720b6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22783/refresco-cola-pepsi-zero-azucar-pack-12	t
1979	28	1	Refresco cola Pepsi Zero azúcar	0.59	1.79	l	https://prod-mercadona.imgix.net/images/f12442923c85a05427313ead369bb676.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28268/refresco-cola-pepsi-zero-azucar-lata	t
1980	28	1	Refresco Coca-Cola Zero Zero	11.16	2.82	l	https://prod-mercadona.imgix.net/images/a4e6714082ed18a4fd8448f282045efc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/26997/refresco-coca-cola-zero-zero-pack-12	t
1981	28	1	Refresco Coca-Cola Zero Zero	0.95	2.88	l	https://prod-mercadona.imgix.net/images/82275be98562ea0c11c2e3b903655c63.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27559/refresco-coca-cola-zero-zero-lata	t
1982	28	1	Refresco Coca-Cola Zero Zero	3.80	0.95	l	https://prod-mercadona.imgix.net/images/1c9ab31d22ec94753a0aedc6753211ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28180/refresco-coca-cola-zero-zero-pack-2	t
1983	28	1	Refresco Coca-Cola Zero Zero	2.15	1.08	l	https://prod-mercadona.imgix.net/images/86edea71e17ba57570a432abccad8a11.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27462/refresco-coca-cola-zero-zero-botella	t
1984	28	1	Refresco cola Hacendado Zero azúcar Zero cafeína	0.80	0.40	l	https://prod-mercadona.imgix.net/images/9936a8d1168cee94472277deb7a33267.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29074/refresco-cola-hacendado-zero-azucar-zero-cafeina-botella	t
1985	28	1	Refresco cola Hacendado Zero azúcar Zero cafeína	2.10	1.06	l	https://prod-mercadona.imgix.net/images/00d28b1d4514e4abc75b635a105161e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29035/refresco-cola-hacendado-zero-azucar-zero-cafeina-pack-6	t
1986	28	1	Refresco cola Hacendado Zero azúcar Zero cafeína	0.35	1.06	l	https://prod-mercadona.imgix.net/images/f1cfcf378f222147d5581ac4fec9ba00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29036/refresco-cola-hacendado-zero-azucar-zero-cafeina-lata	t
1987	28	1	Refresco Fanta limón	1.85	0.93	l	https://prod-mercadona.imgix.net/images/3e717c6c436ccabf0ec7310ae36550d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27610/refresco-fanta-limon-botella	t
1988	28	1	Refresco Fanta limón	6.93	2.33	l	https://prod-mercadona.imgix.net/images/0795670035ade48c36e5a3082cc5ff71.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13817/refresco-fanta-limon-pack-9	t
1989	28	1	Refresco Fanta limón	0.80	2.42	l	https://prod-mercadona.imgix.net/images/8a6751eb37f4293f7976556c1a06a415.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27602/refresco-fanta-limon-lata	t
1990	28	1	Refresco Fanta limón zero azúcares añadidos	6.16	2.33	l	https://prod-mercadona.imgix.net/images/942e06710ec416864080c7124e718011.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8779/refresco-fanta-limon-zero-azucares-anadidos-pack-8	t
1991	28	1	Refresco Fanta limón zero azúcares añadidos	0.80	2.42	l	https://prod-mercadona.imgix.net/images/e3925e7300e779ecd39648e309a3860e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27608/refresco-fanta-limon-zero-azucares-anadidos-lata	t
1992	28	1	Refresco de limón Hacendado fresh gas	0.95	0.48	l	https://prod-mercadona.imgix.net/images/5980897555c596c0be6e8deb03b59448.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29077/refresco-limon-hacendado-fresh-gas-botella	t
1993	28	1	Refresco de limón Hacendado fresh gas	2.22	1.12	l	https://prod-mercadona.imgix.net/images/71071fe2e5c6371231f220b3cf60abf7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29043/refresco-limon-hacendado-fresh-gas-pack-6	t
1994	28	1	Refresco de limón Hacendado fresh gas	0.37	1.12	l	https://prod-mercadona.imgix.net/images/84c37745779b7b4e9a3b7eea1efcd613.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29044/refresco-limon-hacendado-fresh-gas-lata	t
1995	28	1	Refresco de limón Hacendado zero azúcar fresh gas	0.95	0.48	l	https://prod-mercadona.imgix.net/images/2fc81aa7e37e64f63645de05330d3530.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29078/refresco-limon-hacendado-zero-azucar-fresh-gas-botella	t
1996	28	1	Refresco de limón Hacendado zero azúcar fresh gas	2.22	1.12	l	https://prod-mercadona.imgix.net/images/89127452a2d67c5499cb76e532db6a29.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29045/refresco-limon-hacendado-zero-azucar-fresh-gas-pack-6	t
1997	28	1	Refresco de limón Hacendado zero azúcar fresh gas	0.37	1.12	l	https://prod-mercadona.imgix.net/images/23f39916dc4c566b2118b78b125f2ab1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29046/refresco-limon-hacendado-zero-azucar-fresh-gas-lata	t
1998	28	1	Refresco limón Schweppes original	4.00	1.52	l	https://prod-mercadona.imgix.net/images/bfbaff8a377e302eae2f392fccda9b55.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27761/refresco-limon-schweppes-original-pack-8	t
2089	29	1	Cerveza 0,0% sin alcohol Falke	0.36	1.09	l	https://prod-mercadona.imgix.net/images/5c601dccbd01aeb5ad4d4d072d170421.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20339/cerveza-sin-alcohol-falke-lata	t
1999	28	1	Refresco limón Schweppes original	0.97	2.94	l	https://prod-mercadona.imgix.net/images/3e82f539ae4fc3c0da5b9c1c679c6234.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27762/refresco-limon-schweppes-original-lata	t
2000	28	1	Refresco lima limón 7 Up	1.29	0.65	l	https://prod-mercadona.imgix.net/images/df6411b1d28aeb9f2e0e6b0517323272.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27763/refresco-lima-limon-7-up-botella	t
2001	28	1	Refresco lima limón 7 Up	4.23	1.42	l	https://prod-mercadona.imgix.net/images/79803f1f4dbdf920d08b201f46b74178.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22112/refresco-lima-limon-7-up-zero-azucar-pack-9	t
2002	28	1	Refresco lima limón 7 Up	0.50	1.52	l	https://prod-mercadona.imgix.net/images/696949837593f3640a69e59fd0960ebd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27770/refresco-lima-limon-7-up-lata	t
2003	28	1	Refresco lima limón Hacendado fresh gas	0.95	0.48	l	https://prod-mercadona.imgix.net/images/b528102af010228ed86dec80643c8577.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29079/refresco-lima-limon-hacendado-fresh-gas-botella	t
2004	28	1	Refresco lima limón Hacendado fresh gas	2.22	1.12	l	https://prod-mercadona.imgix.net/images/8913d563d0f3465f54106243ded70e79.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29047/refresco-lima-limon-hacendado-fresh-gas-pack-6	t
2005	28	1	Refresco lima limón Hacendado fresh gas	0.37	1.12	l	https://prod-mercadona.imgix.net/images/491365a2dd558855e303de93d3e539e2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29048/refresco-lima-limon-hacendado-fresh-gas-lata	t
2006	28	1	Refresco lima limón Hacendado zero azúcar fresh gas	0.95	0.48	l	https://prod-mercadona.imgix.net/images/09a9c2373386cc9dac5db2351cd3e2b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29064/refresco-lima-limon-hacendado-zero-azucar-fresh-gas-botella	t
2007	28	1	Tónica original Schweppes	7.84	2.97	l	https://prod-mercadona.imgix.net/images/e68c0e4414964f8326e7f8b4bb1acf6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27666/tonica-original-schweppes-pack-8	t
2008	28	1	Tónica original Schweppes	0.99	3.00	l	https://prod-mercadona.imgix.net/images/cc60a2ddaa85bb949b8cb27a1f3777f6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27667/tonica-original-schweppes-lata	t
2009	28	1	Tónica original Schweppes	1.80	1.80	l	https://prod-mercadona.imgix.net/images/3bb962280c661a27ca887faa3bba6261.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29247/tonica-original-schweppes-botella	t
2010	28	1	Tónica original Schweppes	6.30	5.25	l	https://prod-mercadona.imgix.net/images/3079167447f224bf57333327d817f1a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86117/tonica-original-schweppes-pack-6	t
2011	28	1	Tónica original Schweppes	1.10	5.50	l	https://prod-mercadona.imgix.net/images/da4f351cb73e6cbadfe4dd8113db73e6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86118/tonica-original-schweppes-botellin	t
2012	28	1	Tónica Hacendado	2.22	1.12	l	https://prod-mercadona.imgix.net/images/e3e22b1117c6fb5ac760ba53bc8b6735.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28034/tonica-hacendado-pack-6	t
2013	28	1	Tónica Hacendado	0.37	1.12	l	https://prod-mercadona.imgix.net/images/7df240ba177a630ecbe40dc5213fbc2e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27980/tonica-hacendado-lata	t
2014	28	1	Tónica zero calorías Schweppes	7.84	2.97	l	https://prod-mercadona.imgix.net/images/bb5e9ae7f7d0fa725189fa1d0577bb54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27487/tonica-zero-calorias-schweppes-pack-8	t
2015	28	1	Tónica zero calorías Schweppes	0.99	3.00	l	https://prod-mercadona.imgix.net/images/5f4c9b979c0c8ebef560cd0ce9c68445.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27488/tonica-zero-calorias-schweppes-lata	t
2016	28	1	Bitter Kas sin alcohol	7.84	2.97	l	https://prod-mercadona.imgix.net/images/2f050e9cf0f9f131f7441a47e9a5d4e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19876/bitter-kas-sin-alcohol	t
2017	28	1	Bitter Kas sin alcohol	0.99	3.00	l	https://prod-mercadona.imgix.net/images/5f883d252de97b6e219ba6b8c9a5b3e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28435/bitter-kas-sin-alcohol-lata	t
2018	28	1	Limonada natural Don Simón light sin gas	1.40	0.93	l	https://prod-mercadona.imgix.net/images/51de1809221a60b2e29ce39c59dadd52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27965/limonada-natural-don-simon-light-sin-gas-botella	t
2019	28	1	Refresco de naranja Simon Life sin gas	1.85	1.23	l	https://prod-mercadona.imgix.net/images/98c87f86bdb32e92561950913701caa6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27951/refresco-naranja-simon-life-sin-gas-botella	t
2020	28	1	Refresco de naranja Hacendado sin gas	1.15	0.77	l	https://prod-mercadona.imgix.net/images/4e0e2d7c2b0bf10ff15d0347156bc792.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13944/refresco-naranja-hacendado-sin-gas-botella	t
2021	28	1	Refresco de naranja Hacendado sin gas	0.40	1.21	l	https://prod-mercadona.imgix.net/images/7476880a2845582f9656b00a60aca2a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14313/refresco-naranja-hacendado-sin-gas-botella	t
2022	28	1	Refresco fusión de frutas Hacendado cero sin gas	1.15	0.77	l	https://prod-mercadona.imgix.net/images/daea61f7791036b4afe70b08fe475d46.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13947/refresco-fusion-frutas-hacendado-cero-sin-gas-botella	t
2023	28	1	Bebida Florida Sunny Delight	1.99	1.59	l	https://prod-mercadona.imgix.net/images/0896911652dd1bb2304625965769257a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27759/bebida-florida-sunny-delight-botella	t
2024	28	1	Refresco piña-coco Hacendado cero sin gas	1.15	0.77	l	https://prod-mercadona.imgix.net/images/899e33786dd873c8725db279bc3b639d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13946/refresco-pina-coco-hacendado-cero-sin-gas-botella	t
2025	27	1	Agua de coco Hacendado 100% natural	2.60	2.60	l	https://prod-mercadona.imgix.net/images/c36335b1c5009321b8c4c017d7b0ee47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28198/agua-coco-chaokoh-100-natural-brick	t
2026	28	1	Refresco Tropical Hacendado sin gas	1.20	0.80	l	https://prod-mercadona.imgix.net/images/93134211072e7e3ceafb60f8c33b3667.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/6020/refresco-tropical-gold-spring-sin-gas-botella	t
2027	28	1	Limonada Hacendado light sin gas	1.60	1.21	l	https://prod-mercadona.imgix.net/images/457f452ec4ce0f906666c5e5fbea19e6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15988/limonada-hacendado-light-sin-gas-pack-4	t
2028	28	1	Limonada Hacendado light sin gas	0.40	1.21	l	https://prod-mercadona.imgix.net/images/eb5855ff857bc33b8a8305d30fbc8609.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14333/limonada-hacendado-light-sin-gas-botella	t
2029	28	1	Refresco Berry Lime Hacendado sin gas	1.15	0.77	l	https://prod-mercadona.imgix.net/images/1fb220960a36e3556316c5a96bb63fa1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13930/refresco-berry-lime-hacendado-sin-gas-botella	t
2030	28	1	Bebida isotónica limón Aquarius	2.10	1.40	l	https://prod-mercadona.imgix.net/images/b3a60e4a380e52ad26448271dfbf9777.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29608/bebida-isotonica-limon-aquarius-botella	t
2031	28	1	Bebida isotónica limón Aquarius	7.44	2.82	l	https://prod-mercadona.imgix.net/images/f3796fdd86cf359655d10394413c5f74.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29605/bebida-isotonica-limon-aquarius-pack-8	t
2032	28	1	Bebida isotónica limón Aquarius	0.99	3.00	l	https://prod-mercadona.imgix.net/images/78e433b9e5388fff41ee702227fb1a96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29625/bebida-isotonica-limon-aquarius-lata	t
2033	28	1	Bebida isotónica sabor cítrico Iso drink	1.00	0.67	l	https://prod-mercadona.imgix.net/images/8399efe2a9f94c7de3f8e814c2e8f898.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28576/bebida-isotonica-sabor-citrico-iso-drink-hacendado-botella	t
2034	28	1	Bebida isotónica sabor cítrico Iso drink	2.70	1.36	l	https://prod-mercadona.imgix.net/images/3cbb79836c8cd4c2b067dccb71984f54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28575/bebida-isotonica-sabor-citrico-iso-drink-hacendado-pack-6	t
2035	28	1	Bebida isotónica sabor cítrico Iso drink	0.45	1.36	l	https://prod-mercadona.imgix.net/images/52a7c2dc1b7454f0c887365c20f4594c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28574/bebida-isotonica-sabor-citrico-iso-drink-hacendado-lata	t
2036	28	1	Bebida isotónica naranja Aquarius	2.10	1.40	l	https://prod-mercadona.imgix.net/images/cc204ea54dc8e89fd000597331c634d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29609/bebida-isotonica-naranja-aquarius-botella	t
2037	28	1	Bebida isotónica naranja Aquarius	7.44	2.82	l	https://prod-mercadona.imgix.net/images/615df61d57de54f2a43306cb41413899.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29604/bebida-isotonica-naranja-aquarius-pack-8	t
2038	28	1	Bebida isotónica naranja Aquarius	0.99	3.00	l	https://prod-mercadona.imgix.net/images/280306d320a7e84f1d81027dae56e68c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29624/bebida-isotonica-naranja-aquarius-lata	t
2039	28	1	Bebida isotónica limón Aquarius zero azúcar	2.10	1.40	l	https://prod-mercadona.imgix.net/images/72450daac660bb2e1050dc0f91c685b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29612/bebida-isotonica-limon-aquarius-zero-azucar-botella	t
2040	28	1	Bebida isotónica de naranja Iso drink	1.00	0.67	l	https://prod-mercadona.imgix.net/images/5566553cfb975b83d4516719a9530f16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28688/bebida-isotonica-naranja-iso-drink-hacendado-botella	t
2041	28	1	Bebida isotónica de naranja Iso drink	2.70	1.36	l	https://prod-mercadona.imgix.net/images/9136054bf0502d4b80f2c950f77a850f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28690/bebida-isotonica-naranja-iso-drink-hacendado-pack-6	t
2042	28	1	Bebida isotónica de naranja Iso drink	0.45	1.36	l	https://prod-mercadona.imgix.net/images/ad99fabc3e2332435c5bcea78b320bac.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28689/bebida-isotonica-naranja-iso-drink-hacendado-lata	t
2043	28	1	Bebida isotónica Iso On blue Hacendado	1.55	1.03	l	https://prod-mercadona.imgix.net/images/044f65fd5acca63de371c05a2747db19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29410/bebida-isotonica-iso-on-blue-hacendado-botella	t
2044	28	1	Bebida isotónica Iso On blue Hacendado	0.70	1.40	l	https://prod-mercadona.imgix.net/images/30fac6e5f21db6cbc1b6de6202207bf7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29080/bebida-isotonica-iso-on-blue-hacendado-botella	t
2045	28	1	Bebida isotónica sabor cítrico Iso drink zero	1.00	0.67	l	https://prod-mercadona.imgix.net/images/71675487e3eb4dc008c42995a03fdb87.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11509/bebida-isotonica-sabor-citrico-iso-drink-zero-hacendado-botella	t
2046	28	1	Bebida energética Zero Hacendado	0.40	1.60	l	https://prod-mercadona.imgix.net/images/152b74f7aead5bd2ad6f857c44ae00a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27944/bebida-energetica-zero-hacendado-lata	t
2047	28	1	Bebida energética Energy Ultra zero Monster	5.36	2.68	l	https://prod-mercadona.imgix.net/images/f572216d9a9430d98e660c35e902d3cb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28670/bebida-energetica-energy-ultra-zero-monster-pack-4	t
2048	28	1	Bebida energética Energy Ultra zero Monster	1.45	2.90	l	https://prod-mercadona.imgix.net/images/0cc9a7db109be01b00e3b46210437c2c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28119/bebida-energetica-energy-ultra-zero-monster-lata	t
2049	28	1	Bebida energética energy Monster	5.36	2.68	l	https://prod-mercadona.imgix.net/images/59d88873f1925a0205fc700813d5bc50.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28664/bebida-energetica-energy-monster-pack-4	t
2050	28	1	Bebida energética Energy Monster	1.45	2.90	l	https://prod-mercadona.imgix.net/images/9e44baa9baacab0d254bb454ae198686.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28016/bebida-energetica-energy-monster-lata	t
2051	28	1	Bebida energética Energy Drink Hacendado	1.60	1.07	l	https://prod-mercadona.imgix.net/images/58723828f3c6df55d6e42b3360b6f0c9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28266/bebida-energetica-energy-drink-hacendado-botella	t
2052	28	1	Bebida energética Energy Drink Hacendado	2.40	1.60	l	https://prod-mercadona.imgix.net/images/f942d736bc3a194940b1d0cf86adac65.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28263/bebida-energetica-energy-drink-hacendado-pack-6	t
2053	28	1	Bebida energética Energy Drink Hacendado	0.40	1.60	l	https://prod-mercadona.imgix.net/images/547d01d4528b51f7881ae5e61f52117e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28264/bebida-energetica-energy-drink-hacendado-lata	t
2054	28	1	Bebida energética Red Bull	6.30	4.20	l	https://prod-mercadona.imgix.net/images/7eea8d24f988e9fb44d3af3f05636ee9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8870/bebida-energetica-red-bull-pack-6	t
2055	28	1	Bebida energética Red Bull	1.59	6.36	l	https://prod-mercadona.imgix.net/images/60e815dbd52c2fa73cbd543b5440f19b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27905/bebida-energetica-red-bull-lata	t
2056	28	1	Gel energético con cafeína Enervit Sport sabor cítricos	3.75	40.76	kg	https://prod-mercadona.imgix.net/images/05c6179d3b18ec06e77d176a5889c825.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28116/gel-energetico-con-cafeina-enervit-sport-sabor-citricos-pack-3	t
2057	28	1	Bebida energética Mango Loco Monster	5.36	2.68	l	https://prod-mercadona.imgix.net/images/2f7b6795a8c6303facf00d6f1e97a8d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13815/bebida-energetica-mango-loco-monster-pack-4	t
2058	28	1	Bebida energética Mango Loco Monster	1.45	2.90	l	https://prod-mercadona.imgix.net/images/04db1b75b4235cd3573656efb45d94c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13814/bebida-energetica-mango-loco-monster-lata	t
2059	28	1	Malta Maltín Polar	1.15	4.60	l	https://prod-mercadona.imgix.net/images/4547b8dd91ba195099a7a75ed4fd7916.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52921/malta-maltin-polar-botellin	t
2060	29	1	Cerveza Clásica Steinburg	3.84	0.97	l	https://prod-mercadona.imgix.net/images/edea0600aa5ac68f9de33f1b26988212.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66462/cerveza-clasica-steinburg-pack-12	t
2061	29	1	Cerveza Clásica Steinburg	0.32	0.97	l	https://prod-mercadona.imgix.net/images/61ba97a0f85e358acd3df6c8c904327f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66463/cerveza-clasica-steinburg-lata	t
2062	29	1	Cerveza Heineken	5.60	2.12	l	https://prod-mercadona.imgix.net/images/ac9beb775783dc374e1eb6c07c5d2887.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27679/cerveza-heineken-pack-8	t
2063	29	1	Cerveza Heineken	0.79	2.39	l	https://prod-mercadona.imgix.net/images/69b6b1bec312928c4eedcd901e3ed25f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27100/cerveza-heineken-lata	t
2064	29	1	Cerveza especial Mahou	7.00	2.12	l	https://prod-mercadona.imgix.net/images/035050cc22ca385bbf8c86fdbd216666.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9826/cerveza-especial-mahou	t
2065	29	1	Cerveza especial Mahou	0.89	2.70	l	https://prod-mercadona.imgix.net/images/33b39648ccbb45b6acecfe1b2fb0a25b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27136/cerveza-especial-mahou-lata	t
2066	29	1	Cerveza Suave Steinburg	3.72	0.94	l	https://prod-mercadona.imgix.net/images/e566367824b8fe4185055aedb4d83593.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66485/cerveza-suave-steinburg-pack-12	t
2067	29	1	Cerveza Suave Steinburg	0.31	0.94	l	https://prod-mercadona.imgix.net/images/fcfd89d5896bc4b8f7cfa825964b2d96.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66486/cerveza-suave-steinburg-lata	t
2068	29	1	Cerveza especial San Miguel	5.40	1.36	l	https://prod-mercadona.imgix.net/images/44ad8d2b76189bdb9d1a9a690edda165.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66026/cerveza-especial-san-miguel-pack-12	t
2069	29	1	Cerveza especial San Miguel	0.55	1.67	l	https://prod-mercadona.imgix.net/images/3c9680ff59b96420641d465527b5d061.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27103/cerveza-especial-san-miguel-lata	t
2070	29	1	Cerveza especial Steinburg	4.20	1.06	l	https://prod-mercadona.imgix.net/images/69ce79c6820a8d441d46eab8d1d72e45.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12033/cerveza-especial-steinburg	t
2071	29	1	Cerveza especial Steinburg	0.35	1.06	l	https://prod-mercadona.imgix.net/images/83078040c400bc27ea3183d803ca9da3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12036/cerveza-especial-steinburg-lata	t
2072	29	1	Cerveza doble malta 1897	3.18	1.61	l	https://prod-mercadona.imgix.net/images/995a866fc8e7ce3c97ccc3a82008c10c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66432/cerveza-doble-malta-pack-6	t
2073	29	1	Cerveza doble malta 1897	0.53	1.61	l	https://prod-mercadona.imgix.net/images/5dc0028c5702c17302e340bb741a6920.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66433/cerveza-doble-malta-lata	t
2074	29	1	Cerveza Victoria Málaga	6.96	1.76	l	https://prod-mercadona.imgix.net/images/e839cf876bc0dd4a5fafadc948c5b973.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66358/cerveza-victoria-malaga	t
2075	29	1	Cerveza Victoria Málaga	0.77	2.33	l	https://prod-mercadona.imgix.net/images/22f281253c296f65dc41b7777858a8e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27074/cerveza-victoria-malaga-lata	t
2076	29	1	Cerveza Pilsen Cruzcampo	6.24	1.58	l	https://prod-mercadona.imgix.net/images/08b7f041cbc45ea306d5f8aa2ed97167.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66025/cerveza-pilsen-cruzcampo-pack-12	t
2077	29	1	Cerveza Pilsen Cruzcampo	0.55	1.67	l	https://prod-mercadona.imgix.net/images/5888267bb8ba4737a74f6bf95869b5e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27119/cerveza-pilsen-cruzcampo-lata	t
2078	29	1	Cerveza especial Estrella Galicia	8.80	2.67	l	https://prod-mercadona.imgix.net/images/a123fee0cdb7eb60bb5223e793647a19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66586/cerveza-especial-estrella-galicia-pack-10	t
2079	29	1	Cerveza especial Estrella Galicia	0.93	2.82	l	https://prod-mercadona.imgix.net/images/5f7e88e26eee7c3865c9d77d5272d99c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27357/cerveza-especial-estrella-galicia-lata	t
2080	29	1	Cerveza especial sin gluten Falke	3.84	1.45	l	https://prod-mercadona.imgix.net/images/431562b478874eedd28aa1c47831bf8d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86311/cerveza-especial-sin-gluten-falke-pack-8	t
2081	29	1	Cerveza especial sin gluten Falke	0.48	1.45	l	https://prod-mercadona.imgix.net/images/f48002d5bc922709502ac4d0f99d6590.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86312/cerveza-especial-sin-gluten-falke-lata	t
2082	29	1	Cerveza 0,0% sin alcohol Falke	4.32	1.09	l	https://prod-mercadona.imgix.net/images/9175643153e94e82b306fb74f891fa92.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66392/cerveza-00-sin-alcohol-falke-pack-12	t
2083	29	1	Cerveza 0,0% sin alcohol Falke	0.36	1.09	l	https://prod-mercadona.imgix.net/images/eced4e54f509b89d7350143fc0e84e5f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66393/cerveza-00-sin-alcohol-falke-lata	t
2084	29	1	Cerveza 0,0% sin alcohol tostada Falke	3.68	1.39	l	https://prod-mercadona.imgix.net/images/52903fd023f4ad9b76c2f8849830b5c4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12913/cerveza-00-sin-alcohol-tostada-falke	t
2085	29	1	Cerveza 0,0% sin alcohol tostada Falke	0.46	1.39	l	https://prod-mercadona.imgix.net/images/2a699dc3d8c437c150e48c15d87b44c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13418/cerveza-00-sin-alcohol-tostada-falke-lata	t
2086	29	1	Cerveza sin gluten 0,0% sin alcohol tostada Mahou	6.88	2.61	l	https://prod-mercadona.imgix.net/images/a764b36d59655e59bb43e9dee5286708.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11620/cerveza-sin-gluten-mahou-00-sin-alcohol-tostada	t
2087	29	1	Cerveza sin gluten 0,0% sin alcohol tostada Mahou	0.91	2.76	l	https://prod-mercadona.imgix.net/images/e7d96e76fc4ffe6ab24ed2a72ae6c4b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11621/cerveza-sin-gluten-mahou-00-sin-alcohol-tostada-lata	t
2090	29	1	Cerveza Clásica Steinburg	6.30	1.05	l	https://prod-mercadona.imgix.net/images/b02b84074350e9cbdbe2d78306c8eb19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66994/cerveza-clasica-steinburg-pack-6	t
2091	29	1	Cerveza Clásica Steinburg	1.05	1.05	l	https://prod-mercadona.imgix.net/images/80467d4cdead7b514830158eae90523f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66482/cerveza-clasica-steinburg-botella	t
2092	29	1	Cerveza Clásica Steinburg	5.70	0.95	l	https://prod-mercadona.imgix.net/images/110ced5cd1424f20a7ad3991d6b0803a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66465/cerveza-clasica-steinburg-pack-6	t
2093	29	1	Cerveza Clásica Steinburg	0.95	0.95	l	https://prod-mercadona.imgix.net/images/fbb059c412b189e77c2fe4edcfdaef1c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66466/cerveza-clasica-steinburg-botella	t
2094	29	1	Cerveza Clásica Steinburg	3.96	1.32	l	https://prod-mercadona.imgix.net/images/4517f2cbe84a013a5ae3f51f8644b20f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22467/cerveza-clasica-steinburg-pack-12	t
2095	29	1	Cerveza Clásica Steinburg	0.33	1.32	l	https://prod-mercadona.imgix.net/images/c31243cf15542d25d456611a8983727f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22489/cerveza-clasica-steinburg-botellin	t
2096	29	1	Cerveza reserva 1925 Alhambra	7.98	4.03	l	https://prod-mercadona.imgix.net/images/2fe6db8b23509465c0c3cace36af85d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27150/cerveza-reserva-1925-alhambra-pack-6	t
2097	29	1	Cerveza reserva 1925 Alhambra	1.49	4.52	l	https://prod-mercadona.imgix.net/images/d1eab3480db39bfa65cd69a1230d73ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66518/cerveza-reserva-1925-alhambra-botellin	t
2098	29	1	Cerveza Heineken	3.72	2.48	l	https://prod-mercadona.imgix.net/images/6f57cb0ab501f22fd62125849d86e4e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27114/cerveza-heineken-pack-6	t
2099	29	1	Cerveza Heineken	0.70	2.80	l	https://prod-mercadona.imgix.net/images/91be989e7a4b74a4850ed89082be7de3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70745/cerveza-heineken-botellin	t
2100	29	1	Cerveza El Águila sin filtrar	5.10	2.58	l	https://prod-mercadona.imgix.net/images/aeaff096e500f4b44e353d683b33db75.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13895/cerveza-aguila-sin-filtrar-pack-6	t
2101	29	1	Cerveza El Águila sin filtrar	0.89	2.70	l	https://prod-mercadona.imgix.net/images/fdc23dcd11d2f06b9e72013cc438afba.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27456/cerveza-aguila-sin-filtrar-botellin	t
2102	29	1	Cerveza Pilsen Cruzcampo	11.28	1.88	l	https://prod-mercadona.imgix.net/images/2cc92cd9ebfeb6459c1d83868f0fd211.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27197/cerveza-pilsen-cruzcampo-pack-24	t
2103	29	1	Cerveza Pilsen Cruzcampo	4.92	1.64	l	https://prod-mercadona.imgix.net/images/c6c386c002fe90c50235ef9f2399acd9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29368/cerveza-pilsen-cruzcampo-pack-12	t
2104	29	1	Cerveza Pilsen Cruzcampo	0.55	2.20	l	https://prod-mercadona.imgix.net/images/f7c5f02224dab5ff9e284c83837317a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29411/cerveza-pilsen-cruzcampo-botellin	t
2105	29	1	Cerveza especial Estrella Galicia	7.32	2.44	l	https://prod-mercadona.imgix.net/images/2a3512aeb431fadc29951592d2e3e212.jpeg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66587/cerveza-especial-estrella-galicia-pack-12	t
2106	29	1	Cerveza especial Estrella Galicia	0.71	2.84	l	https://prod-mercadona.imgix.net/images/1067599acabb20ad52597e948914e3c1.jpeg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15936/cerveza-especial-estrella-galicia-botellin	t
2107	29	1	Cerveza Pilsen Cruzcampo	7.74	1.29	l	https://prod-mercadona.imgix.net/images/0bf2d1bc9d316c42a9b6450922da5aa5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67041/cerveza-pilsen-cruzcampo-pack-6	t
2108	29	1	Cerveza Pilsen Cruzcampo	1.29	1.29	l	https://prod-mercadona.imgix.net/images/c88ab150aa20d9d41fd9b5914c287d27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67042/cerveza-pilsen-cruzcampo-botella	t
2109	29	1	Cerveza de trigo Paulaner	7.74	3.91	l	https://prod-mercadona.imgix.net/images/36c0fa10877f4c8d1fe23e73f5aed510.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52853/cerveza-trigo-paulaner-pack-6	t
2110	29	1	Cerveza de trigo Paulaner	1.29	3.91	l	https://prod-mercadona.imgix.net/images/9d9aa4e2ac0c62d3f68486bd94d61330.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52854/cerveza-trigo-paulaner-botellin	t
2111	29	1	Cerveza especial Steinburg	4.68	1.56	l	https://prod-mercadona.imgix.net/images/ad4dda19aa47e3244e45beac185629c8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52652/cerveza-especial-steinburg-pack-12	t
2112	29	1	Cerveza especial Steinburg	0.39	1.56	l	https://prod-mercadona.imgix.net/images/3fb35ef3a56074b4a99cfd4a64259f3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52653/cerveza-especial-steinburg-botellin	t
2113	29	1	Cerveza Corona	7.32	3.70	l	https://prod-mercadona.imgix.net/images/b49f2eee1975a21dac16f32334d76ebc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52723/cerveza-corona-pack-6	t
2114	29	1	Cerveza Corona	1.39	4.21	l	https://prod-mercadona.imgix.net/images/01c1fd6e194538e79ca03872e5bd921e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52724/cerveza-corona-botellin	t
2115	29	1	Cerveza 0,0% sin alcohol Falke	0.39	1.56	l	https://prod-mercadona.imgix.net/images/7d22eed6d31e18160f67227f39d6184d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15990/cerveza-00-sin-alcohol-falke-botellin	t
2116	29	1	Cerveza 0,0% sin alcohol tostada Mahou	3.90	3.25	l	https://prod-mercadona.imgix.net/images/2df87d6af17dcfdbe8cdeec51f9aa918.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52993/cerveza-00-sin-alcohol-tostada-mahou-pack-6	t
2117	29	1	Cerveza 0,0% sin alcohol tostada Mahou	0.64	3.20	l	https://prod-mercadona.imgix.net/images/9bd256967b15da2945802e03722296ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52994/cerveza-00-sin-alcohol-tostada-mahou-botellin	t
2118	29	1	Cerveza 0,0% sin alcohol Cruzcampo	2.82	1.88	l	https://prod-mercadona.imgix.net/images/e2b3f10f1073b66f7cd78bf26b3f1b4d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27360/cerveza-00-sin-alcohol-cruzcampo-con-abre-facil-pack-6	t
2119	29	1	Cerveza 0,0% sin alcohol Cruzcampo	0.47	1.88	l	https://prod-mercadona.imgix.net/images/adcd054267f84810c4e3b82aeb505ade.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13931/cerveza-00-sin-alcohol-cruzcampo-botellin	t
2120	29	1	Cerveza 0,0% sin alcohol Falke	2.34	1.56	l	https://prod-mercadona.imgix.net/images/ee642aace6054597c81c96960be694b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21509/cerveza-sin-alcohol-falke	t
2121	29	1	Cerveza 0,0% sin alcohol Falke	0.39	1.56	l	https://prod-mercadona.imgix.net/images/d42d4eb2192a5c0d39d8244f69ac5e15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21510/cerveza-sin-alcohol-falke-botellin	t
2122	28	1	Malta Maltín Polar	6.50	4.33	l	https://prod-mercadona.imgix.net/images/9fc270fe795dba46d6f576b3fea22993.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52920/malta-maltin-polar-pack-6	t
2123	28	1	Malta Maltín Polar	1.15	4.60	l	https://prod-mercadona.imgix.net/images/4547b8dd91ba195099a7a75ed4fd7916.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52921/malta-maltin-polar-botellin	t
2124	29	1	Cerveza Radler Steinburg con zumo natural de limón	4.92	1.24	l	https://prod-mercadona.imgix.net/images/8d2de40a6c7770e50827fa5994b67969.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66783/cerveza-radler-con-zumo-natural-limon-steinburg-pack-12	t
2125	29	1	Cerveza Radler Steinburg con zumo natural de limón	0.41	1.24	l	https://prod-mercadona.imgix.net/images/e758198a282ff5190c65b8706c23da6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66554/cerveza-radler-con-zumo-natural-limon-steinburg-lata	t
2126	29	1	Cerveza Shandy Steinburg sabor limón	4.32	1.09	l	https://prod-mercadona.imgix.net/images/4a7e98cfb9de7424b7c74bd549577096.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66770/cerveza-shandy-sabor-limon-steinburg-pack-12	t
2127	29	1	Cerveza Shandy Steinburg sabor limón	0.36	1.09	l	https://prod-mercadona.imgix.net/images/954081e9cdd17fa7eaf4a200881a9757.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66771/cerveza-shandy-sabor-limon-steinburg-lata	t
2128	29	1	Cerveza con aguardiente de agave Desperados	5.94	3.96	l	https://prod-mercadona.imgix.net/images/100780f798a2dc5c335bd97d22b1ce6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5396/cerveza-con-sabor-tequila-desperados-pack-6	t
2129	29	1	Cerveza con aguardiente de agave Desperados	1.03	4.12	l	https://prod-mercadona.imgix.net/images/53b048229ca5111237a33f5069098306.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5397/cerveza-con-sabor-tequila-desperados-botellin	t
2130	29	1	Cerveza Radler Falke 0,0% sin alcohol	3.60	1.36	l	https://prod-mercadona.imgix.net/images/71e738607766d12cfd48c4f57c03efb6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86313/cerveza-radler-falke-00-sin-alcohol-pack-8	t
2131	29	1	Cerveza Radler Falke 0,0% sin alcohol	0.45	1.36	l	https://prod-mercadona.imgix.net/images/582e09eb235be64e2d3409450adc839a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86314/cerveza-radler-falke-00-sin-alcohol-lata	t
2132	31	1	Bebida cider con gas Spieler sabor a manzana	4.74	3.16	l	https://prod-mercadona.imgix.net/images/1d13d9bc8164221075766435a023b553.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13955/bebida-cider-con-gas-spieler-sabor-manzana	t
2133	31	1	Bebida cider con gas Spieler sabor a manzana	0.79	3.16	l	https://prod-mercadona.imgix.net/images/8e2395ba5bba387effaea76211709000.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13956/bebida-cider-con-gas-spieler-sabor-manzana-botellin	t
2134	33	1	Sangría Casón Histórico	1.75	1.17	l	https://prod-mercadona.imgix.net/images/8d8213455286916924e653dfd0e40665.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66922/sangria-cason-historico-botella	t
2135	33	1	Tinto de verano zero limón Casón Histórico	1.15	0.77	l	https://prod-mercadona.imgix.net/images/a571de6e80d31ec10a8d56a6873064d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60748/tinto-verano-zero-limon-cason-historico-0-alcohol-0-azucar-botella	t
2136	33	1	Sangría Don Simón	2.10	1.40	l	https://prod-mercadona.imgix.net/images/6c152c275cf08f5013fb0c403f0fab0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66944/sangria-don-simon-botella	t
2137	33	1	Tinto de verano 0,0% sin alcohol limón Don Simón	1.40	0.93	l	https://prod-mercadona.imgix.net/images/3a87cbc85e13a3bd2126ea70ba6c80b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66746/tinto-verano-00-sin-alcohol-limon-don-simon-botella	t
2138	33	1	Tinto de verano limón Don Simón	1.50	1.00	l	https://prod-mercadona.imgix.net/images/4ac33613cdc70288f652c95b132941ac.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66747/tinto-verano-limon-don-simon-botella	t
2139	33	1	Tinto de verano limón Casón Histórico	1.30	0.87	l	https://prod-mercadona.imgix.net/images/22ae664014b85ab3abce742da6e75d44.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67818/tinto-verano-limon-cason-historico-botella	t
2140	33	1	Tinto de verano sabor limón La Casera	3.26	1.09	l	https://prod-mercadona.imgix.net/images/b00d01a8b404daf92c5625f6e384c16d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28059/tinto-verano-sabor-limon-casera-pack-2	t
2141	33	1	Tinto de verano sabor limón La Casera	2.45	1.63	l	https://prod-mercadona.imgix.net/images/bcb030e6dcbc510c7b971e7d11347125.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/27843/tinto-verano-sabor-limon-casera-botella	t
2142	33	1	Vino tinto Casón Histórico	1.20	1.20	l	https://prod-mercadona.imgix.net/images/56eed41e72e962baa1281e437e9b6ea8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66211/vino-tinto-cason-historico-brick	t
2143	33	1	Vino tinto Don Simón	1.75	1.75	l	https://prod-mercadona.imgix.net/images/24909556ddfbd13df0eaf7b80cbada90.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66107/vino-tinto-don-simon-brick	t
2144	33	1	Vino tinto tempranillo Elegido	2.20	2.20	l	https://prod-mercadona.imgix.net/images/12ebf73a2b753894b780b9eb329505eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66710/vino-tinto-tempranillo-elegido-botella	t
2145	33	1	Vino tinto Dominio de Borgia	3.15	1.58	l	https://prod-mercadona.imgix.net/images/ba26a20b34811a8702d1d91134e4614f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/37808/vino-tinto-dominio-borgia-botella	t
2146	33	1	Vino tinto Dominio de Borgia	6.60	1.32	l	https://prod-mercadona.imgix.net/images/eaa8e2c2f26f86f9e75d76a0dca395ff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/37805/vino-tinto-dominio-borgia-garrafa	t
2147	33	1	Vino tinto tempranillo El Mandamás The Guv'Nor	3.00	4.00	l	https://prod-mercadona.imgix.net/images/fdf579eec1e02c987517572294da3604.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/37156/vino-tinto-tempranillo-mandamas-the-guvnor-botella	t
2148	33	1	Vino tinto Merlot Mar de Uvas	2.35	3.13	l	https://prod-mercadona.imgix.net/images/b70f6bc2d285b341fbe12f7a5707abdb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23677/vino-tinto-merlot-mar-uvas-botella	t
2149	33	1	Vino tinto Syrah Mar de Uvas	2.15	2.87	l	https://prod-mercadona.imgix.net/images/ebc93109ca67b12f120660b4ca58866b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23676/vino-tinto-syrah-mar-uvas-botella	t
2150	33	1	Vino blanco Casón Histórico	1.00	1.00	l	https://prod-mercadona.imgix.net/images/cba9111659578a10cba501895fc1280a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66127/vino-blanco-cason-historico-brick	t
2151	33	1	Bebida aromatizada a base de vino para cocinar Abuela Carola	2.35	3.13	l	https://prod-mercadona.imgix.net/images/bbee83a931fd33117064e444144d1902.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66905/bebida-aromatizada-base-vino-cocinar-abuela-carola-botella	t
2152	33	1	Vino blanco Don Simón	1.75	1.75	l	https://prod-mercadona.imgix.net/images/b8af2033139edf4fa58547b2a9fadee4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66105/vino-blanco-don-simon-brick	t
2153	33	1	Vino blanco airén verdejo Elegido	2.20	2.20	l	https://prod-mercadona.imgix.net/images/dc0e71ac4631cbc0f69c88aaea1c2506.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66711/vino-blanco-airen-verdejo-elegido-botella	t
2154	33	1	Vino blanco Croft Twist	6.95	9.27	l	https://prod-mercadona.imgix.net/images/005b8b95b7c014d10d331b9ff4325edb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12055/vino-blanco-croft-twist-botella	t
2155	33	1	Vino blanco Chardonnay Mar de Uvas	2.50	3.33	l	https://prod-mercadona.imgix.net/images/f7aa5d1654c36df00cf08eb10e40863d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11968/vino-blanco-chardonnay-mar-uvas-botella	t
2156	33	1	Vino blanco suave y afrutado El Pescaito	2.15	2.87	l	https://prod-mercadona.imgix.net/images/65da3349f5f9dff75eb3d35567f1efa0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/66495/vino-blanco-suave-afrutado-pescaito-botella	t
2157	33	1	Vino blanco semidulce Tierra Blanca	4.65	6.20	l	https://prod-mercadona.imgix.net/images/0eecda5462956973d4d0d57f9bd9fafb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28031/vino-blanco-semidulce-tierra-blanca-botella	t
2158	33	1	Mosto tinto Casón Histórico	2.10	1.40	l	https://prod-mercadona.imgix.net/images/97ec1377c633e9d065945a69bb4186c7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39896/mosto-tinto-cason-historico-botella	t
2159	33	1	Bebida refrescante aromatizada tinto sin alcohol light Castillo de Salobreña	1.70	1.70	l	https://prod-mercadona.imgix.net/images/217f0e1aa7268ffc0574e146f9120e89.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/39488/bebida-refrescante-aromatizada-tinto-sin-alcohol-light-castillo-salobrena-botella	t
2160	31	1	Sidra asturiana El Mayu	1.60	2.13	l	https://prod-mercadona.imgix.net/images/4cad7cdfdf3defbd7090a256bd0953fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28515/sidra-asturiana-mayu-botella	t
2161	31	1	Sidra asturiana El Mayu	10.80	3.60	l	https://prod-mercadona.imgix.net/images/95a9b59aacee76b1f1ed623a361c6abe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23863/sidra-asturiana-mayu-pack-12	t
2162	31	1	Sidra asturiana El Mayu	0.90	3.60	l	https://prod-mercadona.imgix.net/images/5d5ecffad2e603a8824568b74458d9b5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23862/sidra-asturiana-mayu-botellin	t
2163	31	1	Sidra natural Polían	2.10	3.00	l	https://prod-mercadona.imgix.net/images/263f3a85cc64cef9fb4c7c040e73d022.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28898/sidra-natural-polian-botella	t
2164	31	1	Bebida zumo de manzana El Lagar sin alcohol	2.40	3.20	l	https://prod-mercadona.imgix.net/images/acfe7efe7f20ed703392a281c6849882.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28999/sidra-sin-alcohol-lagar-botella	t
2165	32	1	Cava brut Cabré & Sabaté	3.30	4.40	l	https://prod-mercadona.imgix.net/images/a4e1be2460cdf0d3086f4f3ed88877fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28921/cava-brut-cabre-sabate-botella	t
2166	32	1	Cava brut Cabré & Sabaté	1.75	8.75	l	https://prod-mercadona.imgix.net/images/ccceddeeae10a1b0f4f5f33bc247221b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22977/cava-brut-cabre-sabate-benjamin	t
2167	32	1	Cava brut Anna Codorníu	8.00	10.67	l	https://prod-mercadona.imgix.net/images/b9947dae8062b3c697ea307f9d1acbca.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28969/cava-brut-anna-codorniu-botella	t
2168	32	1	Cava brut nature reserva vintage Cabré & Sabaté	4.70	6.27	l	https://prod-mercadona.imgix.net/images/3cc9b1d45a8e04565ce9cc278f56dc1a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28938/cava-brut-nature-reserva-vintage-cabre-sabate-botella	t
2169	32	1	Cava semi seco Cabré & Sabaté	3.00	4.00	l	https://prod-mercadona.imgix.net/images/d6cb0896d9017a83aa22dc4b5d892b50.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28939/cava-semi-seco-cabre-sabate-botella	t
2170	33	1	Vermouth rojo Maronti reserva	2.90	2.90	l	https://prod-mercadona.imgix.net/images/21618455d84f87f1690b314c206ae23f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86408/vermouth-rojo-maronti-reserva-botella	t
2171	30	1	Vermouth rojo Martini	11.00	11.00	l	https://prod-mercadona.imgix.net/images/886fc2bcc4b5d8c7068ec4196c0a8a2d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28401/vermouth-rosso-martini-botella	t
2172	30	1	Ginebra London Dry Gin Larios	10.95	10.95	l	https://prod-mercadona.imgix.net/images/460389c8e7333cae4398f5169bf375ee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28715/ginebra-london-dry-gin-larios-botella	t
2173	30	1	Ginebra London Dry Gin Beefeater	13.45	19.21	l	https://prod-mercadona.imgix.net/images/c8daf2871ce636e5135bb6f0772b363a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28712/ginebra-london-dry-gin-beefeater-botella	t
2174	30	1	Ginebra Dry Gin Seagram's	16.50	23.57	l	https://prod-mercadona.imgix.net/images/c3d3673b519f4a2817413bb48c555117.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28032/ginebra-dry-gin-seagrams-botella	t
2175	30	1	Ginebra London Dry Gin Tanqueray	13.95	19.93	l	https://prod-mercadona.imgix.net/images/d2a03d53cd07c26383f5e36d59e6dd99.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28775/ginebra-london-dry-gin-tanqueray-botella	t
2176	30	1	Ginebra strawberry Gin Glivery	7.15	10.21	l	https://prod-mercadona.imgix.net/images/3e5ef1be172a38286a740b6c71157cb3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28848/ginebra-strawberry-gin-glivery-botella	t
2177	30	1	Ginebra sweet Gin Exotic Glivery	7.15	10.21	l	https://prod-mercadona.imgix.net/images/2637d95c111824e5f9bb79c50bcf450f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22316/ginebra-sweet-gin-exotic-glivery-botella	t
2178	30	1	Ginebra dry gin Rives	12.00	12.00	l	https://prod-mercadona.imgix.net/images/17a1e4b141f51e53440cfb00c808b003.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28701/ginebra-dry-gin-rives-botella	t
2285	48	1	Spray bucal refrescante Deliplus	2.00	200.00	l	https://prod-mercadona.imgix.net/images/cbff71ea1ee8a2800b89a61e47bf4bd7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52464/spray-bucal-refrescante-deliplus-paquete	t
2179	30	1	Brandy de Jerez solera reserva Convidado de Baco	6.00	8.57	l	https://prod-mercadona.imgix.net/images/d2d640eae5ddb20710cbd569d4af3560.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28525/brandy-jerez-solera-reserva-convidado-baco-botella	t
2180	30	1	Bebida espirituosa Convidado de Baco	4.30	6.14	l	https://prod-mercadona.imgix.net/images/505d0c0dc74815a9f5b1055d150cb783.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60697/bebida-espirituosa-convidado-baco-botella	t
2181	30	1	Whisky escocés Ballantine's	13.25	18.93	l	https://prod-mercadona.imgix.net/images/35e8d7fe259d796beafe0e1f113f7067.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28604/whisky-escoces-ballantines-botella	t
2182	30	1	Whisky escocés Red Label Johnnie Walker	14.45	20.64	l	https://prod-mercadona.imgix.net/images/93dbfdf3552a9c1e36aa16eecb70004c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28610/whisky-escoces-red-label-johnnie-walker-botella	t
2183	30	1	Whisky escocés J&B	11.95	17.07	l	https://prod-mercadona.imgix.net/images/86df26f26922c19df7681c795ef20895.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28613/whisky-escoces-jb-botella	t
2184	30	1	Whisky escocés James Webb	6.15	8.79	l	https://prod-mercadona.imgix.net/images/c04beecbaf2f6ede4309be8e50326b1f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28662/whisky-escoces-james-webb-botella	t
2185	30	1	Whisky DYC	8.95	12.79	l	https://prod-mercadona.imgix.net/images/5816b68677a2c9fb10e32d496a919d05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28600/whisky-dyc-botella	t
2186	30	1	Whisky escocés Black Label Johnnie Walker	28.90	41.29	l	https://prod-mercadona.imgix.net/images/297b33e59ccf53f1ba050a499eb21db8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28630/whisky-escoces-black-label-johnnie-walker-botella	t
2187	30	1	Ron añejo Negrita	8.95	12.79	l	https://prod-mercadona.imgix.net/images/dd07995843d32e9e7b3e37509f868c8f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28731/ron-anejo-negrita-botella	t
2188	30	1	Ron blanco superior La Recompensa	5.50	7.86	l	https://prod-mercadona.imgix.net/images/7352533095f287fbbed8a63f7b7e5237.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35919/ron-blanco-superior-recompensa-botella	t
2189	30	1	Ron dominicano añejo Ron Barceló	15.45	22.07	l	https://prod-mercadona.imgix.net/images/173328360545e9dd7886a059eace4cd3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28757/ron-dominicano-anejo-ron-barcelo-botella	t
2190	30	1	Elixir a base de ron La Recompensa	7.50	10.71	l	https://prod-mercadona.imgix.net/images/efba2f9d4f0ece8dbfe4ae572a221657.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15522/elixir-base-ron-recompensa-botella	t
2191	30	1	Ron añejo La Recompensa	6.15	8.79	l	https://prod-mercadona.imgix.net/images/ff79f90febe927c0b761052927bb47ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86232/ron-anejo-recompensa-botella	t
2192	30	1	Ron viejo La Recompensa	8.50	12.14	l	https://prod-mercadona.imgix.net/images/6031d8fe26c2368beef573ca0acfb90e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86707/ron-viejo-recompensa-botella	t
2193	30	1	Bebida preparada de ron sabor mojito La Recompensa Ice	1.30	4.73	l	https://prod-mercadona.imgix.net/images/c67e75c6e816f05029cdc1c11390418f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8802/bebida-preparada-vodka-sabor-mojito-recompensa-ice-botellin	t
2194	30	1	Licor crema Royal Swan	5.85	8.36	l	https://prod-mercadona.imgix.net/images/8ee898a0c1656907cc8d79a314b180ac.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28571/licor-crema-irlandesa-royal-swan-botella	t
2195	30	1	Licor crema de fresa Royal Swan	6.35	9.07	l	https://prod-mercadona.imgix.net/images/607984889d7b0eec6eaea2009f4a6645.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22614/licor-crema-fresa-royal-swan-botella	t
2196	30	1	Licor crema Puente Pazos	6.25	8.93	l	https://prod-mercadona.imgix.net/images/d79121ec433da0e299b91086029f873c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28506/licor-crema-puente-pazos-botella	t
2197	30	1	Vodka Knebep	6.70	6.70	l	https://prod-mercadona.imgix.net/images/72b7a2d0d05a532e58d025118556ebbd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28822/vodka-knebep-botella	t
2198	30	1	Licor de anís dulce Dama Mayor	5.50	7.86	l	https://prod-mercadona.imgix.net/images/e2a46a775651275711495a51cc896c70.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35969/licor-anis-dulce-dama-mayor-botella	t
2199	30	1	Licor de anís dulce La Castellana	8.25	11.79	l	https://prod-mercadona.imgix.net/images/e9a19a6e0253c2b12044399d1de198a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28381/licor-anis-dulce-castellana-botella	t
2200	30	1	Licor de hierbas Puente Pazos	6.10	8.71	l	https://prod-mercadona.imgix.net/images/b6dfaa4244611a02f532ea4ffd3b347c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28508/licor-hierbas-puente-pazos-botella	t
2201	30	1	Licor de limoncello Franzini	6.85	9.79	l	https://prod-mercadona.imgix.net/images/d72525f09d22ea9e60aa6bc52a279ae1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28335/licor-limoncello-franzini-botella	t
2202	30	1	Licor de hierbas Jägermeister	14.25	20.36	l	https://prod-mercadona.imgix.net/images/3489f24b647bc6715f2fb10cf8ab4dd7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28724/licor-hierbas-jagermeister-botella	t
2203	30	1	Licor dulce Amaretto Del Patriarca	4.90	7.00	l	https://prod-mercadona.imgix.net/images/602fe0f1a968337ea962402311be5f11.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28432/licor-dulce-amaretto-patriarca-botella	t
2204	30	1	Pacharán Oibar	7.55	7.55	l	https://prod-mercadona.imgix.net/images/a6e9ef75d572e5b6ae965dc915fa6153.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52471/pacharan-oibar-botella	t
2205	30	1	Tequila reposado Olmeca	12.50	17.86	l	https://prod-mercadona.imgix.net/images/e386fa2622621aad16724aa02edaa818.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12856/tequila-reposado-omelca-botella	t
2206	30	1	Licor mora sin alcohol Pi.omka	3.00	4.29	l	https://prod-mercadona.imgix.net/images/ef37db310a8aeafbbf3f057ab15f3d3b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13610/licor-mora-sin-alcohol-piomka-botella	t
2207	48	1	Discos desmaquillantes Deliplus redondos algodón 100%	1.00	0.01	ud	https://prod-mercadona.imgix.net/images/c689ec4c122804754dcfa35b153b1362.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79407/discos-desmaquillantes-deliplus-redondos-algodon-100-paquete	t
2208	48	1	Toallitas desmaquillantes cara y ojos Deliplus piel normal-mixta	1.15	0.05	ud	https://prod-mercadona.imgix.net/images/f244bb347e970634ca3a56bf5fec2c16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79069/toallitas-desmaquillantes-cara-ojos-deliplus-piel-normal-mixta-con-camomila-paquete	t
2209	48	1	Toallitas desmaquillantes cara y ojos Deliplus piel seca y sensible	1.15	0.05	ud	https://prod-mercadona.imgix.net/images/11b016721051284f873d6fca30016f18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76487/toallitas-desmaquillantes-cara-ojos-deliplus-piel-seca-sensible-con-aloe-vera-paquete	t
2210	48	1	Discos desmaquillantes Deliplus ovalados algodón 100%	1.40	0.01	ud	https://prod-mercadona.imgix.net/images/ef92c447ee21db7bc68d22c7417c2fdc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79408/discos-desmaquillantes-deliplus-ovalados-algodon-100-paquete	t
2211	48	1	Agua micelar cara y ojos Facial Clean	3.00	7.50	l	https://prod-mercadona.imgix.net/images/29cdaced180cce4b9b29cbe016fd705d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46954/agua-micelar-cara-ojos-facial-clean-deliplus-tipo-piel-bote	t
2212	49	1	Desmaquillador de ojos y labios bifásico Waterproof Facial Clean	2.00	13.33	l	https://prod-mercadona.imgix.net/images/691854c155997f64fe501383d9f70744.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46949/desmaquillador-ojos-labios-bifasico-waterproof-facial-clean-deliplus-tipo-piel-bote	t
2213	48	1	Leche facial limpiadora Facial Clean	1.50	6.00	l	https://prod-mercadona.imgix.net/images/bb612ace571d2e9abe5f4c148e3713d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46877/leche-facial-limpiadora-facial-clean-deliplus-tipo-piel-bote	t
2214	48	1	Esponja facial desmaquillante Deliplus vegetal	1.00	0.50	ud	https://prod-mercadona.imgix.net/images/5db47e78999df7bc6bb1af16a23020a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70195/esponja-facial-desmaquillante-deliplus-vegetal-paquete	t
2215	48	1	Gel facial limpiador Facial Clean	2.50	10.00	l	https://prod-mercadona.imgix.net/images/3ddd6bc146d9b13800b9ad1650ede145.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46892/gel-facial-limpiador-facial-clean-deliplus-tipo-piel-bote	t
2216	48	1	Tiras faciales limpia poros Deliplus	3.00	0.50	ud	https://prod-mercadona.imgix.net/images/45f1ef91738b35512d629b0fbb135fc8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8883/tiras-faciales-limpia-poros-deliplus-caja	t
2217	48	1	Mousse facial limpiadora purificante Deliplus Oil Free	4.00	20.00	l	https://prod-mercadona.imgix.net/images/61df592d7018b47af494eba44754956d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16382/mousse-facial-limpiadora-purificante-deliplus-oil-free-piel-grasa-acneica-bote	t
2218	48	1	Agua facial de avena Deliplus	2.90	9.67	l	https://prod-mercadona.imgix.net/images/a21d1b9ceb7c2d8a2e0a8eaa15ce7d7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76465/agua-facial-avena-deliplus-piel-sensible-spray	t
2219	48	1	Toallitas desmaquillantes Micelar & Oil Deliplus para todo tipo de pieles	1.35	0.05	ud	https://prod-mercadona.imgix.net/images/65609d87c717f3f7b1103601e4f39ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79525/toallitas-desmaquillantes-micelar-oil-deliplus-tipo-pieles-paquete	t
2220	48	1	Mascarilla facial Hidra Boom Mask Deliplus con Camelias de Jeju y ácido hialurónico	1.75	1.75	ud	https://prod-mercadona.imgix.net/images/c51941f740f6debc2d7c6c6db1a4d27e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35655/mascarilla-facial-hidra-boom-mask-deliplus-con-camelias-jeju-acido-hialuronico-paquete	t
2221	48	1	Tónico facial árbol de té y prebióticos Facial Clean	3.20	12.55	l	https://prod-mercadona.imgix.net/images/e1bac4eff5140b4fcbef1b2bc322b063.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35935/tonico-facial-arbol-te-prebioticos-deliplus-facial-clean-piel-normal-bote	t
2222	48	1	Tónico facial vitamina C y niacinamida Facial Clean iluminador y antioxidante	3.20	12.55	l	https://prod-mercadona.imgix.net/images/b6d70bd4ca9cade12cc1043d8d7c4635.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35934/tonico-facial-vitamina-c-niacinamida-deliplus-facial-clean-iluminador-antioxidante-tipo-piel-bote	t
2223	48	1	Discos impregnados ácido salicílico Deliplus Oil Free purificantes y seborreguladores	4.00	0.08	ud	https://prod-mercadona.imgix.net/images/862b1c853184593c934e8e39ae174577.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52531/discos-impregnados-acido-salicilico-deliplus-oil-free-purificantes-seborreguladores-piel-grasa-acneica-caja	t
2224	48	1	Tónico facial vitaminas y minerales Facial Clean hidratante y regenerador	3.20	12.55	l	https://prod-mercadona.imgix.net/images/2bf350d2aa9485505ebbf60d2e3c0570.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14940/tonico-facial-vitaminas-minerales-facial-clean-deliplus-hidratante-regenerador-tipo-piel-bote	t
2225	48	1	Hidratante facial BB cream Deliplus 01 claro FPS 20	4.50	90.00	l	https://prod-mercadona.imgix.net/images/27b00303449342000b870a2a82d7cdc0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50757/hidratante-facial-bb-cream-deliplus-01-claro-fps-20-bote	t
2226	48	1	Hidratante facial BB cream Deliplus 02 medio FPS 20	4.50	90.00	l	https://prod-mercadona.imgix.net/images/f0aa500134f2bad21e34d2ac33d22209.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50764/hidratante-facial-bb-cream-deliplus-02-medio-fps-20-bote	t
2227	48	1	Crema facial día Antiarrugas Regen Skin Deliplus	5.50	110.00	l	https://prod-mercadona.imgix.net/images/f5c1df3a802118d1e176880028bb9f95.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46869/crema-facial-dia-textura-rica-regen-skin-deliplus-spf-20-piel-normal-seca-muy-seca-tarro	t
2228	48	1	Crema facial noche Textura Rica Regen Skin Deliplus	5.50	110.00	l	https://prod-mercadona.imgix.net/images/a2d9590494fa38ee3cc225faca81ab90.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46870/crema-facial-noche-textura-rica-regen-skin-deliplus-piel-normal-seca-muy-seca-tarro	t
2229	48	1	Crema facial fluida hidratante Deliplus Oil Free	4.00	80.00	l	https://prod-mercadona.imgix.net/images/56a1f93ca15d3ab057c3c14d6d00e2e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50375/crema-facial-fluida-hidratante-deliplus-oil-free-piel-grasa-seborreica-acneica-tubo	t
2230	48	1	Crema facial Vitamina C Viseger Pharma FPS 50+	6.00	120.00	l	https://prod-mercadona.imgix.net/images/ab02a54bd8a4055e8b31456c7e3f02f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50099/crema-facial-vitamina-c-viseger-pharma-fps-50-tipo-piel-tarro	t
2231	48	1	Gel facial Hidrata Deliplus ácido hialurónico	5.00	100.00	l	https://prod-mercadona.imgix.net/images/80fb117803bb967e1c63825c38c6c350.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22503/gel-facial-hidrata-deliplus-acido-hialuronico-piel-normal-grasa-tarro	t
2232	48	1	Crema facial Hidrata Deliplus ácido hialurónico y aloe vera	5.00	100.00	l	https://prod-mercadona.imgix.net/images/f742763721e41b1e409c3cde1fb13d8e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50256/crema-facial-hidrata-deliplus-acido-hialuronico-aloe-vera-tipo-piel-tarro	t
2420	48	1	Compresa con alas normal Deliplus Cotton	3.40	0.11	ud	https://prod-mercadona.imgix.net/images/bf469090cc70d7aaca4b41eaafb26ad0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86449/compresa-con-alas-normal-deliplus-cotton-paquete	t
2233	48	1	Gel facial sebo-regulador Deliplus Matifica	6.00	120.00	l	https://prod-mercadona.imgix.net/images/916bea95719998d986318a326dadfb6a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52532/gel-facial-matifica-deliplus-sebo-regulador-piel-grasa-mixta-bote	t
2234	48	1	Crema facial Antiarrugas y Reafirmante Men care Deliplus ácido hialurónico y matrixyl	5.00	100.00	l	https://prod-mercadona.imgix.net/images/26c6306f83e397d77642140402af865c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11941/crema-facial-antiarrugas-reafirmante-men-care-deliplus-acido-hialuronico-matrixyl-6-1-bote	t
2235	48	1	Crema facial Retinal primeras arrugas Prevent Age Skin Deliplus	5.50	110.00	l	https://prod-mercadona.imgix.net/images/17ffdd6805c9420d3c9f10304c35eeda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12826/crema-facial-retinal-primeras-arrugas-prevent-age-skin-deliplus-piel-normal-mixta-tarro	t
2236	48	1	Crema facial Nutritiva redensificadora Green Caviar y Colágeno Prevent Age Ski Deliplus	5.50	110.00	l	https://prod-mercadona.imgix.net/images/d6c93417e2b106c307ad8fc41d8de885.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12848/crema-facial-nutritiva-redensificadora-green-caviar-colageno-prevent-age-ski-deliplus-piel-normal-seca-tarro	t
2237	48	1	Contorno de ojos Antiarrugas e Iluminador con silicio Sisbela Reafirm Deliplus	4.50	300.00	l	https://prod-mercadona.imgix.net/images/dcfe5021c9b7dddec6440f160895f695.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9784/contorno-ojos-antiarrugas-iluminador-con-silicio-sisbela-reafirm-deliplus-tipo-piel-tarro	t
2238	48	1	Sérum reductor instantáneo de bolsas y ojeras Deliplus Sisbela Reafirm	5.00	500.00	l	https://prod-mercadona.imgix.net/images/b0846a229d1c15e25dc3974975f84f86.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50199/serum-reductor-instantaneo-bolsas-ojeras-deliplus-sisbela-reafirm-evitar-piel-sensible-caja	t
2239	48	1	Contorno de ojos arrugas y bolsas Deliplus Prevent Age Skin	4.50	300.00	l	https://prod-mercadona.imgix.net/images/fc201ccaf60f6487d5a47adba4e7747e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46872/contorno-ojos-arrugas-bolsas-deliplus-prevent-age-skin-tipo-piel-tubo	t
2240	50	1	Cápsulas para ojos Regen Skin Deliplus	5.00	0.17	l	https://prod-mercadona.imgix.net/images/eb254ee96ab89ff21992f2896631d78c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7914/capsulas-ojos-regen-skin-deliplus-tipo-piel-caja	t
2241	50	1	Perlas faciales Q10 Khanya concentrado reafirmante antiarrugas	1.50	0.21	ud	https://prod-mercadona.imgix.net/images/fee6ce4416c9884ff331bc0dd321b2e7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15895/perlas-faciales-q10-khanya-concentrado-reafirmante-antiarrugas-paquete	t
2242	50	1	Ampollas faciales Ácido Hialurónico Hidrata Deliplus concentrado	3.50	250.00	l	https://prod-mercadona.imgix.net/images/939f048768668fbb9df858ac275891fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50321/ampollas-faciales-acido-hialuronico-hidrata-deliplus-concentrado-caja	t
2243	48	1	Sérum facial potenciador 12% silicio Deliplus Sisbela Reafirm	5.50	183.33	l	https://prod-mercadona.imgix.net/images/e278a92f6e64eab7a8b420e75b49ca48.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50198/serum-facial-potenciador-12-silicio-deliplus-sisbela-reafirm-tipo-piel-frasco	t
2244	48	1	Sérum facial Retinol Regen Skin Deliplus	5.50	183.33	l	https://prod-mercadona.imgix.net/images/3ffc53974e9d4667bb51f2192fd076ee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46873/serum-facial-retinol-deliplus-regen-skin-evitar-piel-sensible-frasco	t
2245	48	1	Sérum facial Ácido Hialurónico y Ceramidas Deliplus Hidrata	5.50	183.33	l	https://prod-mercadona.imgix.net/images/417a335e2cf9e49c883ec654f7eedb29.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67596/serum-facial-acido-hialuronico-ceramidas-deliplus-hidrata-tipo-piel-frasco	t
2246	48	1	Sérum facial reparador Micro Cápsulas Deliplus	9.00	300.00	l	https://prod-mercadona.imgix.net/images/2154630683f5b1b996a05feceaac5284.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52820/serum-facial-reparador-micro-capsulas-deliplus-tipo-pieles-frasco	t
2247	50	1	Aceite de Ricino Deliplus	3.45	115.00	l	https://prod-mercadona.imgix.net/images/fc6ee2aef0e5948f98ed863f05d48ea9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52590/aceite-ricino-deliplus-nutre-fortalece-contiene-aplicador-bote	t
2248	48	1	Dentífrico Triple Acción Colgate menta intensa	1.95	19.50	l	https://prod-mercadona.imgix.net/images/97535c0930b03860b5b9cbaebd7fb546.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73978/dentifrico-triple-accion-colgate-menta-intensa-tubo	t
2249	48	1	Dentífrico Pro-Expert Oral-B sabor menta especiada	2.85	38.00	l	https://prod-mercadona.imgix.net/images/4694ce4c429d9c43caf15531b4be598a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13913/dentifrico-pro-expert-oral-b-sabor-menta-especiada-tubo	t
2250	48	1	Dentífrico Total original Colgate	2.90	38.67	l	https://prod-mercadona.imgix.net/images/489b912d6453b5c8275e120164543fb9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79593/dentifrico-total-original-colgate-tubo	t
2251	48	1	Dentífrico Blanqueador Bicarbonato Signal	1.85	18.50	l	https://prod-mercadona.imgix.net/images/842bf3af328e4747f5cd5a30c1c69244.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74044/dentifrico-blanqueador-bicarbonato-signal-tubo	t
2252	48	1	Dentífrico Protección Caries Colgate	1.95	19.50	l	https://prod-mercadona.imgix.net/images/4aa28b3ef5157389e17ad4c37b3be907.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73979/dentifrico-proteccion-caries-colgate-tubo	t
2253	48	1	Dentífrico Bicarbonato blanqueador Deliplus	1.10	11.00	l	https://prod-mercadona.imgix.net/images/fc3b1177452b8114a06f0d96fd215419.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46724/dentifrico-bicarbonato-blanqueador-deliplus-tubo	t
2254	48	1	Dentífrico Repair & Protect Sensodyne	4.95	66.00	l	https://prod-mercadona.imgix.net/images/8f04e03bac2634cfc6dddad6a912a1ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13869/dentifrico-repair-protect-sensodyne-sabor-menta-tubo	t
2255	48	1	Dentífrico Blanqueante Sensodyne	3.95	52.67	l	https://prod-mercadona.imgix.net/images/c390a806272a727a8e31663e95efe859.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13868/dentifrico-blanqueante-sensodyne-tubo	t
2256	48	1	Dentífrico Max White One Colgate	2.65	35.33	l	https://prod-mercadona.imgix.net/images/d1ed5586527ea4a1d73dd29a19cf1a82.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73431/dentifrico-max-white-one-colgate-tubo	t
2257	48	1	Dentífrico Max Fresh Colgate sabor menta fresca	2.85	28.50	l	https://prod-mercadona.imgix.net/images/afce05565a630c57f20e772e96c72a6a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73999/dentifrico-max-fresh-colgate-sabor-menta-fresca-tubo	t
2258	48	1	Dentífrico Fresh Gel Deliplus menta extra refrescante	1.10	11.00	l	https://prod-mercadona.imgix.net/images/4c07255316fa1e278e0de5f8bc0c01bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46730/dentifrico-fresh-gel-deliplus-menta-extra-refrescante-tubo	t
2259	48	1	Dentífrico Herbal Deliplus	1.10	11.00	l	https://prod-mercadona.imgix.net/images/37271c09e44e5fe1727206eef2c455df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8996/dentifrico-herbal-deliplus-jengibre-arbol-te-eucalipto-menta-camomila-tubo	t
2260	48	1	Dentífrico Encías Protect Deliplus	1.70	17.00	l	https://prod-mercadona.imgix.net/images/6e85458efe6abed969c3b02173a8abd1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12901/dentifrico-encias-protect-deliplus-tubo	t
2261	48	1	Dentífrico Dental Pearl Deliplus blanqueador	1.95	19.50	l	https://prod-mercadona.imgix.net/images/692299488b05bb35f53ea2263ccf015a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46727/dentifrico-dental-pearl-deliplus-blanqueador-tubo	t
2262	48	1	Dentífrico 3 action Deliplus	1.10	11.00	l	https://prod-mercadona.imgix.net/images/158b05912f6ef52b51237f50b523d481.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35982/dentifrico-3-action-deliplus-tubo	t
2263	48	1	Dentífrico Anticaries Deliplus	1.05	10.50	l	https://prod-mercadona.imgix.net/images/64e73ed2b0f37f382ef1a90b3e36f9d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35983/dentifrico-anticaries-deliplus-tubo	t
2264	40	1	Dentífrico infantil + 2 años Deliplus	1.00	13.33	l	https://prod-mercadona.imgix.net/images/ee27e0fae38697e9dbb41e4232e5436f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46997/dentifrico-infantil-2-anos-deliplus-sabor-fresa-tubo	t
2265	48	1	Dentífrico Sensitive Deliplus con hidroxiapatita	1.50	15.00	l	https://prod-mercadona.imgix.net/images/96af37c45f81b425b2ed299683af3a34.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46739/dentifrico-sensitive-deliplus-con-hidroxiapatita-tubo	t
2266	40	1	Dentífrico infantil +6 años Deliplus menta suave	1.00	13.33	l	https://prod-mercadona.imgix.net/images/c32e0b923572f198da1801e9be19b4ef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23674/dentifrico-infantil-6-anos-deliplus-menta-suave-tubo	t
2267	40	1	Dentífrico infantil +6 años Deliplus sabor gominola	1.00	13.33	l	https://prod-mercadona.imgix.net/images/483ff220a00d9458f22ba10c7882d73e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23675/dentifrico-infantil-6-anos-deliplus-sabor-gominola-tubo	t
2268	48	1	Dentífrico reparación activa de encías Parodontax menta fresca	4.95	66.00	l	https://prod-mercadona.imgix.net/images/52595b2bd376099baa8af328c6c8daab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35654/dentifrico-reparacion-activa-encias-parodontax-menta-fresca-tubo	t
2269	48	1	Cepillo dental Medio Deliplus	1.10	0.37	ud	https://prod-mercadona.imgix.net/images/a72a5bbf24dd497d3c8d54db21b4f94d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9822/cepillo-dental-medio-deliplus-paquete	t
2270	48	1	Cepillo dental Suave Deliplus	1.10	0.37	ud	https://prod-mercadona.imgix.net/images/1c561f650f15680be528db6e836fbc02.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9821/cepillo-dental-suave-deliplus-paquete	t
2271	48	1	Cepillo dental Duro Deliplus	1.10	0.37	ud	https://prod-mercadona.imgix.net/images/3185829afda4834a77a785fc903b44aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9823/cepillo-dental-duro-deliplus-paquete	t
2272	48	1	Cepillo dental Sensitive Deliplus encías y dientes sensibles	1.30	1.30	ud	https://prod-mercadona.imgix.net/images/d750af8fc16e8fc9e2dc713d2e12913a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52472/cepillo-dental-sensitive-deliplus-encias-dientes-sensibles-paquete	t
2273	40	1	Cepillo dental Infantil Deliplus	0.90	0.90	ud	https://prod-mercadona.imgix.net/images/d355b94dcd58337c9c99263188f66af6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35406/cepillo-dental-infantil-mickey-deliplus-paquete	t
2274	48	1	Recambios cepillo dental Eléctrico Deliplus tamaño medio	3.75	1.88	ud	https://prod-mercadona.imgix.net/images/6e6ea15c74286bd5e274ccbbdad0054c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/1908/recambios-cepillo-dental-electrico-paquete	t
2275	48	1	Recambios cepillo dental eléctrico Oral-B Pro Precision Clean	14.50	3.63	ud	https://prod-mercadona.imgix.net/images/494912ed89970f25d183a96cd44b18a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8980/recambios-cepillo-dental-electrico-oral-b-pro-precision-clean-paquete	t
2276	48	1	Recambios cepillo dental eléctrico Sensitive Deliplus tamaño medio	3.75	1.88	ud	https://prod-mercadona.imgix.net/images/b73b01e34222a064dbf7b39e2d193462.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8916/recambios-cepillo-dental-electrico-sensitive-deliplus-cabezal-pequeno-paquete	t
2277	48	1	Cepillo dental Medio Deliplus + Action	1.50	1.50	ud	https://prod-mercadona.imgix.net/images/a25793abdf7a4290fcc0c11501bf1ccf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11631/cepillo-dental-medio-deliplus-action-paquete	t
2278	48	1	Cepillo dental Eléctrico Oral-B Vitality Pro Precision Clean	24.00	24.00	ud	https://prod-mercadona.imgix.net/images/9a0dcab645d7d37dd33bd1d7911e34ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12838/cepillo-dental-electrico-oral-b-vitality-pro-precision-clean-caja	t
2279	48	1	Enjuague bucal Total Action Deliplus	1.30	2.60	l	https://prod-mercadona.imgix.net/images/75e399a5b01823fb7ef6ef242f167034.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46965/enjuague-bucal-total-action-deliplus-medio-botella	t
2280	48	1	Enjuague bucal Fresh 0% alcohol Deliplus	1.35	2.70	l	https://prod-mercadona.imgix.net/images/17802c5e3591feca927a39d40f70771d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46966/enjuague-bucal-fresh-0-alcohol-deliplus-suave-botella	t
2281	48	1	Cepillos interdentales Extrafinos cónicos Deliplus	1.50	0.25	ud	https://prod-mercadona.imgix.net/images/3c12ccb5ee4a0535ea1aecae6a354050.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35714/cepillos-interdentales-extrafinos-conicos-deliplus-paquete	t
2282	48	1	Enjuague bucal Explosion Action Deliplus	1.35	2.70	l	https://prod-mercadona.imgix.net/images/d94991a8826b3d7ffcd0f1ca55dc4939.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46967/enjuague-bucal-explosion-action-deliplus-intenso-botella	t
2283	48	1	Enjuague bucal Blanqueador Bicarbonato Deliplus zero alcohol	1.50	3.00	l	https://prod-mercadona.imgix.net/images/24b6d3d744919e538a173424ae28fb4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52524/enjuague-bucal-blanqueador-bicarbonato-deliplus-zero-alcohol-botella	t
2284	48	1	Crema adhesiva para prótesis dentales Benfix sin sabor	3.50	70.00	kg	https://prod-mercadona.imgix.net/images/5d0e9d12b4a9017517053796887df957.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78861/crema-adhesiva-protesis-dentales-benfix-sin-sabor-tubo	t
2286	48	1	Cepillos interdentales Finos cónicos Deliplus	1.50	0.25	ud	https://prod-mercadona.imgix.net/images/e93e7b5620d72d0653498adab046f6a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35733/cepillos-interdentales-finos-conicos-deliplus-paquete	t
2287	48	1	Hilo dental con cera y sabor menta	1.80	0.90	ud	https://prod-mercadona.imgix.net/images/c38415a768a418ddb8b72f89627ba5ef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73127/hilo-dental-con-cera-sabor-menta-paquete	t
2288	48	1	Enjuague bucal cuidado total Listerine menta	5.40	10.80	l	https://prod-mercadona.imgix.net/images/cea0b8bcde1443afd722c267c058fe7f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23066/enjuague-bucal-cuidado-total-listerine-menta-botella	t
2289	48	1	Enjuague bucal Clorhexidina gingival Deliplus zero alcohol	2.00	4.00	l	https://prod-mercadona.imgix.net/images/86317e416f2e6264485940fb78e17cb1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47030/enjuague-bucal-clorhexidina-gingival-deliplus-zero-alcohol-botella	t
2290	48	1	Enjuague bucal Kids Deliplus zero alcohol	1.40	2.80	l	https://prod-mercadona.imgix.net/images/0c8f4600df90f7d2d0b21cdf5069a801.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52821/enjuague-bucal-kids-deliplus-zero-alcohol-con-fluor-sabor-fresa-botella	t
2291	48	1	Cinta dental con cera y sabor menta	2.50	1.25	ud	https://prod-mercadona.imgix.net/images/340b061eb17d8cadf21d6328b89f4f06.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73128/cinta-dental-con-cera-sabor-menta-paquete	t
2292	48	1	Tabletas limpiadoras prótesis dentales Benfix y ortodoncias	2.45	0.08	ud	https://prod-mercadona.imgix.net/images/cb904937c8d04de21eea6face2845b78.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79113/tabletas-limpiadoras-protesis-dentales-benfix-ortodoncias-caja	t
2293	48	1	Arcos dentales para higiene interdental Deliplus	1.80	0.03	ud	https://prod-mercadona.imgix.net/images/d23e6e0366dfd84e32166e2505fc5a16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40583/arcos-dentales-higiene-interdental-deliplus-caja	t
2294	48	1	Cepillos interdentales Micro Deliplus	1.50	0.25	ud	https://prod-mercadona.imgix.net/images/05eb43f904a2c89f276e95e50e5eddee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35703/cepillos-interdentales-micro-deliplus-paquete	t
2295	48	1	Enjuague bucal Sensitive & Encías Deliplus zero alcohol	1.90	3.80	l	https://prod-mercadona.imgix.net/images/bfdd4991ed93250b37b5806f533e68a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7912/enjuague-bucal-sensitive-encias-deliplus-zero-alcohol-botella	t
2296	48	1	Gel de baño oliva Deliplus piel seca	1.60	2.13	l	https://prod-mercadona.imgix.net/images/d86de3e884b6354b2c607635572a00b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46578/gel-bano-oliva-deliplus-piel-seca-botella	t
2297	48	1	Gel de baño frescor azul Deliplus piel normal	1.10	1.47	l	https://prod-mercadona.imgix.net/images/3bf6e644dd7fcc49bf2150ad403f0c0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46567/gel-bano-frescor-azul-deliplus-piel-normal-botella	t
2298	48	1	Gel de baño hidratante Natural Honey	2.85	3.17	l	https://prod-mercadona.imgix.net/images/2b3cfa6cca0c59d3ab275207960ee838.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35306/gel-bano-hidratante-natural-honey-botella	t
2299	48	1	Gel-Champú de baño 2 en 1 dermoprotector Deliplus para cuerpo y cabello	1.00	4.00	l	https://prod-mercadona.imgix.net/images/2fcd80aa4cef88c104447756eb38f310.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45204/gel-champu-bano-dermoprotector-deliplus-cuerpo-cabello-botella	t
2300	48	1	Gel de baño avena Deliplus piel sensible	1.60	2.13	l	https://prod-mercadona.imgix.net/images/00b9f30b82709e8538480d5842d7a92c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23184/gel-bano-avena-deliplus-piel-sensible-botella	t
2301	48	1	Gel de baño Dove 0% sulfato	3.95	5.49	l	https://prod-mercadona.imgix.net/images/20b3c817badfce23bae3cffc5c8d260b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8357/gel-bano-dove-0-sulfato-botella	t
2302	43	1	Envase rellenable Deliplus tamaño viaje	0.90	0.90	l	https://prod-mercadona.imgix.net/images/ae1756350478307cb7e68ae3c5f7ec7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45297/envase-rellenable-deliplus-tamano-viaje-botella	t
2303	48	1	Gel de baño con sales minerales La Toja	2.95	4.92	l	https://prod-mercadona.imgix.net/images/bfbe6d33d609d96dcb844edaaa03f6cd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8835/gel-bano-con-sales-minerales-toja-botella	t
2304	48	1	Gel de baño Classic original Magno	3.70	6.17	l	https://prod-mercadona.imgix.net/images/b67357712d5ec355d9a99d350685dff0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8834/gel-bano-classic-original-magno-botella	t
2305	48	1	Gel de baño argán Deliplus piel muy seca	1.50	3.00	l	https://prod-mercadona.imgix.net/images/909a5941b9d49ad003d1a339bd964665.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44907/gel-bano-argan-deliplus-piel-muy-seca-botella	t
2306	48	1	Gel de baño nutritivo Lactovit piel normal y seca	2.95	3.93	l	https://prod-mercadona.imgix.net/images/d4fe638457318c2ba022a9b2c5c610cd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35668/gel-bano-nutritivo-lactovit-piel-normal-seca-botella	t
2307	48	1	Gel de baño Hidratante y protector Sanex para todo tipo de piel	3.80	4.47	l	https://prod-mercadona.imgix.net/images/74a2658349e5f49b2cb0b096aeb7e5a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67906/gel-bano-hidratante-protector-sanex-tipo-piel-botella	t
2308	48	1	Gel de baño 10% urea Deliplus piel áspera y deshidratada	2.00	4.00	l	https://prod-mercadona.imgix.net/images/bdc8ee0c6149237238d8e2251c3ce097.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44915/gel-bano-10-urea-deliplus-piel-aspera-deshidratada-botella	t
2309	48	1	Gel aceite de baño Deliplus piel atópica	3.50	7.00	l	https://prod-mercadona.imgix.net/images/50a332713b228ef79445853dd97bb35b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44914/gel-aceite-bano-deliplus-piel-atopica-botella	t
2310	48	1	Gel de baño exfoliante Té Chai Deliplus piel normal	2.50	5.00	l	https://prod-mercadona.imgix.net/images/148a662fb4dd8e30c0de410d30d77ab3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35304/gel-bano-exfoliante-te-chai-deliplus-piel-normal-botella	t
2311	48	1	Gel de baño marino y cedro Deliplus piel normal	1.60	2.13	l	https://prod-mercadona.imgix.net/images/0090347e7bad55a76db15c94d0ea5e68.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60557/gel-bano-marino-cedro-deliplus-piel-normal-botella	t
2312	48	1	Gel de baño vainilla y miel Deliplus piel normal	1.60	2.13	l	https://prod-mercadona.imgix.net/images/185739728b425c82da714fc56124a75c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60555/gel-bano-vainilla-miel-deliplus-piel-normal-botella	t
2313	48	1	Gel de baño coco y lichi Deliplus piel normal	1.60	2.13	l	https://prod-mercadona.imgix.net/images/b27e6fd391f3d97a3b5c0f2ade5f8a81.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60554/gel-bano-coco-lichi-deliplus-piel-normal-botella	t
2314	48	1	Gel de baño ambar y vetiver Deliplus piel normal	1.60	2.13	l	https://prod-mercadona.imgix.net/images/36d826b51c24a564d5bb051bac760d27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60558/gel-bano-ambar-vetiver-deliplus-piel-normal-botella	t
2315	48	1	Gel de baño granada y frutos silvestres Deliplus piel normal	1.60	2.13	l	https://prod-mercadona.imgix.net/images/c22f62f10f0c14e94d0753b05c240654.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13294/gel-bano-granada-frutos-silvestres-deliplus-piel-normal-botella	t
2316	48	1	Gel de baño tiernos recuerdos Deliplus piel normal	1.60	2.13	l	https://prod-mercadona.imgix.net/images/c69f30ce9c962be2fb63882931733d3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12866/gel-bano-tiernos-recuerdos-deliplus-piel-normal-botella	t
2317	48	1	Gel de baño Frutal Deliplus piel normal	1.30	1.30	l	https://prod-mercadona.imgix.net/images/a71160e716e46eba1541cf62939a808d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20930/gel-bano-frutal-deliplus-piel-normal-botella	t
2318	48	1	Jabón de manos en pastilla Beauty Cream Bar Dove	3.50	9.72	kg	https://prod-mercadona.imgix.net/images/f652b30788c15a70fe83c10f68464f7a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67908/jabon-manos-pastilla-beauty-cream-bar-dove-paquete	t
2319	48	1	Jabón de manos en pastilla natural original Heno de Pravia	2.50	10.87	kg	https://prod-mercadona.imgix.net/images/cf29277cd6a83957b88664b578f51ba1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60644/jabon-manos-pastilla-natural-original-heno-pravia-paquete	t
2320	48	1	Jabón de manos en pastilla glicerina 100% natural Deliplus	1.10	8.80	kg	https://prod-mercadona.imgix.net/images/83901b66ca71b5e2a98e984db0e376ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46882/jabon-manos-pastilla-glicerina-100-natural-deliplus-pastilla	t
2321	48	1	Jabón de manos dermoprotector Deliplus	0.90	1.80	l	https://prod-mercadona.imgix.net/images/241e96387a289b582f4e38f4385fb944.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46699/jabon-manos-dermoprotector-deliplus-bote	t
2322	48	1	Jabón de manos avena Deliplus líquido	1.40	2.80	l	https://prod-mercadona.imgix.net/images/6f75ef7e9054dfcd7fd7a9cbcd7c9665.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52897/jabon-manos-avena-deliplus-liquido-bote	t
2323	40	1	Jabón de manos kids Deliplus líquido	1.40	2.80	l	https://prod-mercadona.imgix.net/images/b1aabfbac20ee259fc34c26b83135a21.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52966/jabon-manos-kids-deliplus-liquido-bote	t
2324	48	1	Jabón de manos tiernos recuerdos Deliplus	1.40	2.80	l	https://prod-mercadona.imgix.net/images/3812d8069c614fdd1a127485e24709d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46696/jabon-manos-tiernos-recuerdos-deliplus-bote	t
2325	48	1	Gel de manos hidroalcohólico 80% alcohol Deliplus antiséptico sin aclarado	1.20	16.00	l	https://prod-mercadona.imgix.net/images/2019af8d16395f465eb94c6c75dd75c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77007/gel-manos-hidroalcoholico-80-alcohol-deliplus-antiseptico-sin-aclarado-bote	t
2326	48	1	Recarga jabón de manos dermoprotector Deliplus	1.40	1.40	l	https://prod-mercadona.imgix.net/images/e3bad8747a8252d290579833cc6e62ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22905/recarga-jabon-manos-dermoprotector-deliplus-paquete	t
2327	48	1	Jabón de manos neutraliza olores Deliplus	1.80	3.60	l	https://prod-mercadona.imgix.net/images/cccbf566c22098ca5266ef7971b34754.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52898/jabon-manos-neutralizante-olores-deliplus-bote	t
2328	48	1	Esponjas de baño con jabón Deliplus	1.20	0.12	ud	https://prod-mercadona.imgix.net/images/4bf2d3a78ea8ab703dca0be9473d686b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45717/esponjas-bano-con-jabon-deliplus-usar-tirar-paquete	t
2329	48	1	Esponja de baño flor Deliplus exfoliación suave	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/afba59fb74dec5a21b76373a29e980d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13654/esponja-bano-flor-deliplus-exfoliacion-suave-paquete	t
2330	48	1	Esponja de baño doble acción suave masaje Deliplus	1.30	0.65	ud	https://prod-mercadona.imgix.net/images/7e3f2db6fec7e8e7aefb2e243489c301.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45711/esponja-bano-doble-accion-suave-masaje-deliplus-paquete	t
2331	48	1	Esponja de baño suave Deliplus	1.30	0.65	ud	https://prod-mercadona.imgix.net/images/1c1f744ba5cfd70617f2c0cef0e6af83.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45710/esponja-bano-suave-deliplus-paquete	t
2332	48	1	Esponja de baño vegetal fibras naturales Deliplus	1.40	1.40	ud	https://prod-mercadona.imgix.net/images/692fd98068c1948946dd3b805d1f47ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79707/esponja-bano-vegetal-fibras-naturales-deliplus-paquete	t
2333	48	1	Esponja de baño rizo suave Deliplus	1.30	0.65	ud	https://prod-mercadona.imgix.net/images/126f895ce9fe243d6baceaac7d8ddf29.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23662/esponja-bano-rizo-suave-deliplus-paquete	t
2334	48	1	Esponja de baño dermo agua Deliplus	1.50	1.50	ud	https://prod-mercadona.imgix.net/images/cba72a117cfa5e38f96b0d80a3097d45.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45716/esponja-bano-dermo-agua-deliplus-intensifica-espuma-paquete	t
2335	48	1	Guante de Crin exfoliante Deliplus	2.15	2.15	ud	https://prod-mercadona.imgix.net/images/10394052f68ea53faecb81ffe5f4594c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13655/guante-crin-exfoliante-deliplus-paquete	t
2336	40	1	Esponja de baño infantil Disney	1.90	1.90	ud	https://prod-mercadona.imgix.net/images/319eeda4e6d434bb431b18ce2a9981b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44973/esponja-bano-infantil-disney-paquete	t
2337	48	1	Desodorante aloe Deliplus antitranspirante	1.65	8.25	l	https://prod-mercadona.imgix.net/images/97e333e12d272d404c1da27203e59a4f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35362/desodorante-aloe-deliplus-antitranspirante-0-alcohol-spray	t
2338	48	1	Desodorante aqua Deliplus antimanchas	1.65	8.25	l	https://prod-mercadona.imgix.net/images/17c5cab114c5c9daa669b2cb0490340b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23515/desodorante-aqua-deliplus-antimanchas-spray	t
2339	48	1	Desodorante power Deliplus antimanchas	1.65	8.25	l	https://prod-mercadona.imgix.net/images/1fbc5323ea72dcbe1e88fcbc47c76057.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23513/desodorante-power-deliplus-antimanchas-spray	t
2340	48	1	Desodorante invisible black + white Rexona antimanchas	2.90	14.50	l	https://prod-mercadona.imgix.net/images/daa8fd5c4c56de38a04845af295e09dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44398/desodorante-invisible-black-white-rexona-antimanchas-spray	t
2341	48	1	Desodorante invisible ice fresh Rexona Men antitranspirante y antimanchas	2.90	14.50	l	https://prod-mercadona.imgix.net/images/83ab97619532ad5e638264929e63e304.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44400/desodorante-invisible-ice-fresh-rexona-men-antitranspirante-antimanchas-0-alcohol-spray	t
2342	48	1	Desodorante original Dove antitranspirante	2.95	14.75	l	https://prod-mercadona.imgix.net/images/cc455ab32d50a0bc3702d72ab20ef0f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35964/desodorante-original-dove-antitranspirante-0-alcohol-spray	t
2343	48	1	Desodorante invisible Black & White Nivea	2.95	14.75	l	https://prod-mercadona.imgix.net/images/43712c1acf1911dabe661acb3baa90fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22125/desodorante-invisible-black-white-nivea-spray	t
2344	48	1	Desodorante invisible Deliplus antitranspirante	1.65	8.25	l	https://prod-mercadona.imgix.net/images/5358680ee85249296bb9d93c81ae249d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46420/desodorante-invisible-antimanchas-deliplus-antitranspirante-0-alcohol-spray	t
2345	48	1	Desodorante seda Deliplus antitranspirante	1.65	8.25	l	https://prod-mercadona.imgix.net/images/2be81877bf7d0c8c992fc4954fef8c62.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46417/desodorante-seda-suave-deliplus-antitranspirante-0-alcohol-spray	t
2346	48	1	Desodorante invisible Black & White Nivea Men antitranspirante	2.95	14.75	l	https://prod-mercadona.imgix.net/images/eadc8d7e2702776e6fcb39ee0b3ceaaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22124/desodorante-invisible-black-white-nivea-men-antitranspirante-spray	t
2347	48	1	Desodorante invisible men Deliplus antitranspirante y antimanchas	1.65	8.25	l	https://prod-mercadona.imgix.net/images/709c21744732f8dd4ee22fface75de92.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46415/desodorante-invisible-men-deliplus-antitranspirante-antimanchas-0-alcohol-spray	t
2348	48	1	Desodorante perfume Fashion Deliplus antitranspirante	1.65	8.25	l	https://prod-mercadona.imgix.net/images/80dc804f101955ababa650b24459f4bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46434/desodorante-perfume-afrutado-deliplus-antitranspirante-0-alcohol-spray	t
2349	48	1	Desodorante Dark Temptation Axe Essentiel	3.35	16.75	l	https://prod-mercadona.imgix.net/images/0e002228b54b6a9cf0f323e9ad6b6e3d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12968/desodorante-dark-temptation-axe-essentiel-spray	t
2350	48	1	Desodorante cobalt dry Rexona Men antitranspirante	2.90	14.50	l	https://prod-mercadona.imgix.net/images/3a23aed3990bcd475f4dd10bd3555666.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44399/desodorante-cobalt-dry-rexona-men-antitranspirante-0-alcohol-spray	t
2351	48	1	Desodorante dermo extra control Sanex antitranspirante	2.90	14.50	l	https://prod-mercadona.imgix.net/images/54fc28199db003fa2fcecd4cd5894060.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46107/desodorante-dermo-extra-control-sanex-antitranspirante-spray	t
2352	48	1	Desodorante avena Deliplus antitranspirante	1.65	8.25	l	https://prod-mercadona.imgix.net/images/b14b62be78c30ca6fde7003b3c6ab481.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46443/desodorante-avena-delicado-deliplus-antitranspirante-0-alcohol-spray	t
2353	48	1	Desodorante Lactovit anti irritaciones	2.35	11.75	l	https://prod-mercadona.imgix.net/images/ed9861252098ca07463f6d3b135d5de7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46001/desodorante-lactovit-anti-irritaciones-0-alcohol-spray	t
2354	48	1	Desodorante aloe Deliplus antitranspirante	1.45	19.33	l	https://prod-mercadona.imgix.net/images/ef64fa05126e4180bbe71c84462f6245.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35363/desodorante-aloe-deliplus-antitranspirante-0-alcohol-spray	t
2355	48	1	Desodorante Zero Sanex	2.90	14.50	l	https://prod-mercadona.imgix.net/images/d972a838226e6910b08528c0727d30fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47256/desodorante-zero-sanex-0-aluminio-alcohol-spray	t
2356	48	1	Desodorante para pies en polvo Deliplus antitranspirante	2.00	26.67	kg	https://prod-mercadona.imgix.net/images/59fff443ab3cbe752034625e08b57986.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46019/desodorante-pies-polvo-deliplus-antitranspirante-bote	t
2357	48	1	Desodorante para pies fresh & dry Deliplus antitranspirante	2.00	13.33	l	https://prod-mercadona.imgix.net/images/2a5f7fef5e92d0f8fb170be721438ee8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46999/desodorante-pies-fresh-dry-deliplus-antitranspirante-spray	t
2358	48	1	Aceite corporal aloe vera Deliplus	1.65	4.13	l	https://prod-mercadona.imgix.net/images/76a23c276b7c9273382d278ac4fab212.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79217/aceite-corporal-aloe-vera-deliplus-bote	t
2359	48	1	Aceite en crema corporal oriental Deliplus	3.00	12.00	l	https://prod-mercadona.imgix.net/images/f46095d808583dc7443ef3bc3739fda1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46844/aceite-crema-corporal-oriental-deliplus-bote	t
2360	48	1	Aceite corporal de almendras Deliplus 100% natural	3.40	17.00	l	https://prod-mercadona.imgix.net/images/540b2c7636d8a7b332bfa47583ed71b9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46815/aceite-corporal-almendras-deliplus-100-natural-bote	t
2361	48	1	Aceite corporal de romero Deliplus 100% natural	3.20	16.00	l	https://prod-mercadona.imgix.net/images/6d2e4f4e6218a9d008b19aece550c27e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46816/aceite-corporal-romero-deliplus-100-natural-bote	t
2362	48	1	Aceite corporal rosa mosqueta Deliplus	4.80	160.00	l	https://prod-mercadona.imgix.net/images/cd7948cffa7ee9e056e11906b3321897.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46831/aceite-corporal-rosa-mosqueta-deliplus-100-puro-natural-bote	t
2363	48	1	Loción corporal Hidrata Deliplus aloe vera y ácido hialurónico	1.90	3.17	kg	https://prod-mercadona.imgix.net/images/075dfce6c0be2f32dd315789a65a7ce3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52795/locion-corporal-hidrata-deliplus-aloe-vera-acido-hialuronico-piel-normal-bote	t
2364	48	1	Crema corporal Nivea	4.00	16.00	l	https://prod-mercadona.imgix.net/images/7f19b058d8726a6ed038dc6d5cdf83d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76542/crema-corporal-nivea-lata	t
2365	48	1	Gel corporal aloe vera Deliplus	4.10	10.25	l	https://prod-mercadona.imgix.net/images/7367f7a88ad30e56d19d864ad07c54ed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14330/gel-corporal-aloe-vera-deliplus-bote	t
2366	48	1	Loción corporal Repara Deliplus urea 10% y dexpantenol	2.20	5.50	l	https://prod-mercadona.imgix.net/images/f2aa4ba592fed8cceb6154848651d6e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52797/locion-corporal-repara-deliplus-urea-10-dexpantenol-piel-muy-seca-bote	t
2367	48	1	Loción corporal reafirmante Q10 Nivea y vitamina C	5.95	14.88	l	https://prod-mercadona.imgix.net/images/5b06a5234f258bd32088317de7334435.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76596/locion-corporal-reafirmante-q10-nivea-vitamina-c-piel-normal-bote	t
2368	48	1	Exfoliante corporal marino Deliplus Sal Mar Muerto	4.55	11.38	kg	https://prod-mercadona.imgix.net/images/40fb75a66fb1301f747f944ef777a628.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14260/exfoliante-corporal-marino-deliplus-sal-mar-muerto-tarro	t
2369	48	1	Gel corporal aloe vera puro Atlantia	5.50	27.50	l	https://prod-mercadona.imgix.net/images/7044b8ac53de0f2c9e197ad911d0f7be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76178/gel-corporal-aloe-vera-puro-atlantia-bote	t
2370	48	1	Tratamiento crema reductor intensivo noche Deliplus	4.90	24.50	l	https://prod-mercadona.imgix.net/images/e7890b29e4b7e40857df354a99186114.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79531/tratamiento-crema-reductor-intensivo-noche-deliplus-bote	t
2371	48	1	Gel refrescante mentol Deliplus para pies y piernas	2.50	8.33	l	https://prod-mercadona.imgix.net/images/cc7024a17bd46d564c4fdef73fcdd2a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46835/gel-refrescante-mentol-deliplus-pies-piernas-bote	t
2372	48	1	Loción corporal Nutre Deliplus almendras y cica	2.40	4.00	l	https://prod-mercadona.imgix.net/images/bc03bfc4233b8016657fc8979e74f59b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52796/locion-corporal-nutre-deliplus-almendras-cica-piel-seca-bote	t
2373	48	1	Exfoliante corporal de coco Deliplus	4.00	16.00	l	https://prod-mercadona.imgix.net/images/7ca50c894aa41740b2273380af7f524d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46853/exfoliante-corporal-con-particulas-coco-deliplus-tarro	t
2374	48	1	Crema corporal Esferas Vit. E&A Deliplus	3.10	10.33	l	https://prod-mercadona.imgix.net/images/894993dd1c002f6da87b97e4547e209c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13972/crema-corporal-esferas-vit-ea-deliplus-tarro	t
2375	48	1	Sorbete corporal Posidonia Deliplus	3.00	10.00	l	https://prod-mercadona.imgix.net/images/c9369be315084cd619aa6861ee49fff2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13969/sorbete-corporal-posidonia-deliplus-tarro	t
2376	48	1	Manteca corporal Murumuru Deliplus	4.50	15.00	l	https://prod-mercadona.imgix.net/images/ad394ca12901bd688d73e114b90c7153.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13971/manteca-corporal-murumuru-deliplus-tarro	t
2377	48	1	Crema de manos flor de Japón Deliplus Hidrata & Perfuma	1.00	33.33	l	https://prod-mercadona.imgix.net/images/3f578158936f4b1672f4912c11531e89.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46812/crema-manos-flor-japon-deliplus-tubo	t
2378	48	1	Crema de manos hidratante con aloe vera Deliplus	1.00	13.33	l	https://prod-mercadona.imgix.net/images/9296a78f482372ab9465a77a9c5bb18c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35101/crema-manos-hidratante-con-aloe-vera-deliplus-bote	t
2379	48	1	Crema de manos reparadora Deliplus	1.30	17.33	l	https://prod-mercadona.imgix.net/images/f042115d017338f63e2a3f7ff22dc197.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35100/crema-manos-reparadora-deliplus-bote	t
2380	48	1	Crema de manos anti-manchas Deliplus FPS 20	1.30	17.33	l	https://prod-mercadona.imgix.net/images/831a05e0e7849bbb57bd43e837a7e838.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35121/crema-manos-anti-manchas-deliplus-fps-20-despigmentante-bote	t
2381	48	1	Crema de manos intensiva Dove	2.00	26.67	l	https://prod-mercadona.imgix.net/images/ea7959fc460b50fc702eb4da9e823aa3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46615/crema-manos-nutritiva-dove-intensiva-bote	t
2382	48	1	Crema de manos nutritiva Karité Deliplus	1.30	17.33	l	https://prod-mercadona.imgix.net/images/8f73f00a3f08f6409f570fd38b1f6c17.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35799/crema-manos-nutritiva-deliplus-bote	t
2383	48	1	Crema de manos Oriental Woods Deliplus	3.00	10.34	l	https://prod-mercadona.imgix.net/images/ca031227f43c2022e402901138e694b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19868/crema-manos-oriental-woods-deliplus-tarro	t
2384	48	1	Crema para pies 10% urea pura Deliplus	1.20	9.60	l	https://prod-mercadona.imgix.net/images/9a82c1c1c295073c5877f300a3fda9f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46771/crema-pies-10-urea-pura-deliplus-bote	t
2385	48	1	Crema hidratante para pies Deliplus anti-sequedad	1.50	12.00	l	https://prod-mercadona.imgix.net/images/8590e74eefa25a07f55786645d7e1a7d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46833/crema-hidratante-pies-deliplus-anti-sequedad-bote	t
2386	48	1	Stick para pies anti-rozaduras Deliplus	2.50	625.00	l	https://prod-mercadona.imgix.net/images/66629535fd29376f4606619f79ab9391.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46842/stick-pies-anti-rozaduras-deliplus-caja	t
2387	44	1	Papel higiénico húmedo WC Bosque Verde	1.55	0.02	ud	https://prod-mercadona.imgix.net/images/d6ab8e94cf1adb75cb470a93d2def3df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47291/papel-higienico-humedo-wc-bosque-verde-con-aloe-vera-camomila-paquete	t
2388	44	1	Papel higiénico húmedo WC Bosque Verde	0.80	0.05	ud	https://prod-mercadona.imgix.net/images/286f24c12adab78274a9cb5cca4f1278.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47293/papel-higienico-humedo-wc-bosque-verde-con-aloe-vera-camomila-paquete	t
2389	48	1	Toallitas desmaquillantes cara y ojos Deliplus piel normal-mixta	1.15	0.05	ud	https://prod-mercadona.imgix.net/images/f244bb347e970634ca3a56bf5fec2c16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79069/toallitas-desmaquillantes-cara-ojos-deliplus-piel-normal-mixta-con-camomila-paquete	t
2390	48	1	Toallitas desmaquillantes cara y ojos Deliplus piel seca y sensible	1.15	0.05	ud	https://prod-mercadona.imgix.net/images/11b016721051284f873d6fca30016f18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76487/toallitas-desmaquillantes-cara-ojos-deliplus-piel-seca-sensible-con-aloe-vera-paquete	t
2391	48	1	Toallitas Dermo higiene corporal Deliplus tamaño gigantes	4.00	0.07	ud	https://prod-mercadona.imgix.net/images/fc04ecfb53badda995548b003b341c69.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47828/toallitas-dermo-higiene-corporal-deliplus-tamano-gigantes-paquete	t
2392	48	1	Toallitas de manos hidroalcohólicas Deliplus 75% Alcohol	1.00	0.07	ud	https://prod-mercadona.imgix.net/images/548bffd0cffb76066bacee754df40f4c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79712/toallitas-manos-hidroalcoholicas-deliplus-75-alcohol-paquete	t
2393	48	1	Toallitas desmaquillantes Micelar & Oil Deliplus para todo tipo de pieles	1.35	0.05	ud	https://prod-mercadona.imgix.net/images/65609d87c717f3f7b1103601e4f39ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79525/toallitas-desmaquillantes-micelar-oil-deliplus-tipo-pieles-paquete	t
2394	48	1	Toallitas refrescantes Deliplus	0.90	0.06	ud	https://prod-mercadona.imgix.net/images/6a41b4a39861787c46212837d5068648.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60560/toallitas-refrescantes-deliplus-paquete	t
2395	48	1	Toallitas refrescantes Deliplus monodosis	1.00	0.10	ud	https://prod-mercadona.imgix.net/images/f48b7b31c5afd53bd5cac9a02eaa06be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60561/toallitas-refrescantes-deliplus-monodosis-caja	t
2396	40	1	Toallitas bebé frescas & perfumadas Deliplus	3.00	0.01	ud	https://prod-mercadona.imgix.net/images/196ddfde5df1bf2a1be89aa827b96067.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79603/toallitas-bebe-frescas-perfumadas-deliplus-pack-3	t
2397	40	1	Toallitas bebé frescas & perfumadas Deliplus	1.05	0.01	ud	https://prod-mercadona.imgix.net/images/1c9c7196bee06cad0b16f1db764526f4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79427/toallitas-bebe-frescas-perfumadas-deliplus-paquete	t
2398	40	1	Toallitas bebé frescas & perfumadas Deliplus	0.75	0.03	ud	https://prod-mercadona.imgix.net/images/9166489977350fa348c500259a885606.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79428/toallitas-bebe-frescas-perfumadas-deliplus-paquete	t
2399	40	1	Toallitas infantiles cara y manos Deliplus	0.75	0.04	ud	https://prod-mercadona.imgix.net/images/9de2336dc11894fcc203758a8086e653.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22931/toallitas-infantiles-cara-manos-deliplus-paquete	t
2400	40	1	Toallitas bebé pieles con tendencia atópica Deliplus	1.80	0.03	ud	https://prod-mercadona.imgix.net/images/071d1ab6e1365ea833fb2b85057a0395.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79433/toallitas-bebe-pieles-con-tendencia-atopica-deliplus-paquete	t
2401	40	1	Toallitas bebé Aqua Deliplus	1.70	0.03	ud	https://prod-mercadona.imgix.net/images/d25fb681357f0515bf9258c89616fe3c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35356/toallitas-bebe-aqua-deliplus-fibras-origen-natural-99-agua-paquete	t
2402	48	1	Toallitas Dermo higiene corporal Deliplus tamaño gigantes	4.00	0.07	ud	https://prod-mercadona.imgix.net/images/fc04ecfb53badda995548b003b341c69.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47828/toallitas-dermo-higiene-corporal-deliplus-tamano-gigantes-paquete	t
2403	48	1	Toallitas refrescantes Deliplus	0.90	0.06	ud	https://prod-mercadona.imgix.net/images/6a41b4a39861787c46212837d5068648.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60560/toallitas-refrescantes-deliplus-paquete	t
2404	48	1	Toallitas refrescantes Deliplus monodosis	1.00	0.10	ud	https://prod-mercadona.imgix.net/images/f48b7b31c5afd53bd5cac9a02eaa06be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60561/toallitas-refrescantes-deliplus-monodosis-caja	t
2405	48	1	Compresa sin alas normal Deliplus Classic	1.10	0.04	ud	https://prod-mercadona.imgix.net/images/09d7aa00128d26a22ac84dd7de1c531d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47380/compresa-sin-alas-normal-deliplus-classic-paquete	t
2406	48	1	Compresa con alas noche plegada Deliplus Classic	1.40	0.14	ud	https://prod-mercadona.imgix.net/images/9e4de7943732b3f07b86f8f2ef23b71d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47383/compresa-con-alas-noche-plegada-deliplus-classic-paquete	t
2407	48	1	Compresa sin alas de incontinencia Deliplus Maxi	3.15	0.26	ud	https://prod-mercadona.imgix.net/images/4755aa3c9a3623d4785aeb7296cafb04.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35679/compresa-sin-alas-incontinencia-deliplus-maxi-paquete	t
2408	48	1	Compresa con alas noche Deliplus Suave	1.15	0.12	ud	https://prod-mercadona.imgix.net/images/3979522ce9b246cc0b7743985c4bd1e6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47348/compresa-con-alas-noche-deliplus-suave-paquete	t
2409	48	1	Compresa sin alas de incontinencia Deliplus Extra	3.35	0.17	ud	https://prod-mercadona.imgix.net/images/bd07caf75095ed8925d0073a1c0a023c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35678/compresa-sin-alas-incontinencia-deliplus-extra-paquete	t
2410	48	1	Compresa sin alas normal plegada Deliplus Classic	1.20	0.06	ud	https://prod-mercadona.imgix.net/images/b9e0a87f819a470af9521e759d952511.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47381/compresa-sin-alas-normal-plegada-deliplus-classic-paquete	t
2411	48	1	Compresa sin alas super plegada Deliplus Classic	1.40	0.09	ud	https://prod-mercadona.imgix.net/images/b491f025af2c56455830f0b5b86d6e0b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47382/compresa-sin-alas-super-plegada-deliplus-classic-paquete	t
2412	48	1	Compresa con alas normal Deliplus Dry	2.15	0.07	ud	https://prod-mercadona.imgix.net/images/cee2051ec893a0f7eaf80ea5f9064961.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47340/compresa-con-alas-normal-deliplus-dry-paquete	t
2413	48	1	Compresa sin alas de incontinencia Deliplus Normal	3.35	0.14	ud	https://prod-mercadona.imgix.net/images/62e4fe36b890dab1217a54e548632b54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35677/compresa-sin-alas-incontinencia-deliplus-normal-paquete	t
2414	48	1	Compresa con alas super Evax cotton like fresh	4.35	0.18	ud	https://prod-mercadona.imgix.net/images/69d147447028a7b8d84f115033981427.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86353/compresa-con-alas-super-evax-cotton-like-fresh-paquete	t
2415	48	1	Compresa sin alas normal Deliplus Suave	2.15	0.07	ud	https://prod-mercadona.imgix.net/images/8ffef1c5ae1902f1ff4c4b8e6e38d56b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47344/compresa-sin-alas-normal-deliplus-suave-paquete	t
2416	48	1	Compresa con alas super Ausonia	2.95	0.15	ud	https://prod-mercadona.imgix.net/images/d1fafbc1143171c2f0a676f1f28106dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47311/compresa-con-alas-super-ausonia-paquete	t
2417	48	1	Compresa sin alas super Deliplus Suave	2.15	0.08	ud	https://prod-mercadona.imgix.net/images/d0615a2753b4987cf66bea27190b7879.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47347/compresa-sin-alas-super-deliplus-suave-paquete	t
2418	48	1	Compresa sin alas de incontinencia Deliplus Mini	3.35	0.11	ud	https://prod-mercadona.imgix.net/images/4dc769e16da14687bea4b573dc99f765.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23132/compresa-sin-alas-incontinencia-deliplus-mini-paquete	t
2419	48	1	Compresa con alas normal Deliplus Suave	1.00	0.10	ud	https://prod-mercadona.imgix.net/images/5e2c3d2256e257faf1158f10dd62b13f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47368/compresa-con-alas-normal-deliplus-suave-paquete	t
2421	48	1	Compresa con alas super Deliplus Cotton	3.40	0.12	ud	https://prod-mercadona.imgix.net/images/d831578a8febd2bbe0211cb1501eca19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86450/compresa-con-alas-super-deliplus-cotton-paquete	t
2422	48	1	Compresa sin alas de incontinencia Deliplus Maxi Night	3.15	0.32	ud	https://prod-mercadona.imgix.net/images/9f19474e09c753d40aa5981c5ef827d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22926/compresa-sin-alas-incontinencia-deliplus-maxi-night-paquete	t
2423	48	1	Compresa sin alas normal Evax cotton like	2.85	0.14	ud	https://prod-mercadona.imgix.net/images/645246b85d8f223302ffbf4a8d33b495.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7880/compresa-sin-alas-normal-evax-cotton-like-paquete	t
2424	48	1	Protegeslip normal Deliplus Suave	1.85	0.03	ud	https://prod-mercadona.imgix.net/images/131c7c14c85911af65b1412722ba8808.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47385/protegeslip-normal-deliplus-suave-caja	t
2425	48	1	Protegeslip y compresa 2 en 1 Deliplus Suave	1.65	0.07	ud	https://prod-mercadona.imgix.net/images/8e1d58845d011213c24cdabc52a9a4cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47389/protegeslip-compresa-2-1-deliplus-suave-caja	t
2426	48	1	Protegeslip maxi Deliplus Suave	2.25	0.04	ud	https://prod-mercadona.imgix.net/images/0beb2a5f97758976e65b5013827daf06.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47387/protegeslip-maxi-deliplus-suave-caja	t
2427	48	1	Protegeslip normal Evax	3.50	0.04	ud	https://prod-mercadona.imgix.net/images/0a90da8dd9fb9e54159062519a343079.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13954/protegeslip-normal-evax-caja	t
2428	48	1	Protegeslip normal plegado Deliplus Suave	1.10	0.04	ud	https://prod-mercadona.imgix.net/images/b107194762be0c33b2dbd5f182f08d90.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47386/protegeslip-normal-plegado-deliplus-suave-caja	t
2429	48	1	Protegeslip Cotton flexiform Carefree regular + tanga	1.70	0.06	ud	https://prod-mercadona.imgix.net/images/8bd300cafc49803045800a527d5d742d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47554/protegeslip-cotton-flexiform-carefree-regular-tanga-caja	t
2430	48	1	Protegeslip ultrafino Deliplus Fresh	1.25	0.04	ud	https://prod-mercadona.imgix.net/images/511e2957b363a122d6a78e77cf05fd52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47391/protegeslip-ultrafino-deliplus-fresh-bolsitas-caja	t
2431	48	1	Protegeslip tanga Deliplus Fresh	1.25	0.04	ud	https://prod-mercadona.imgix.net/images/ab4f3a6c108f0860a3e4b09e86ec3ec8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47392/protegeslip-tanga-deliplus-fresh-caja	t
2432	48	1	Protegeslip micro Deliplus Fresh	2.00	0.05	ud	https://prod-mercadona.imgix.net/images/a8c0eea0bb66bebd196a0c6c04234340.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47390/protegeslip-micro-deliplus-fresh-caja	t
2433	48	1	Protegeslip de incontinencia Deliplus pequeño	3.10	0.09	ud	https://prod-mercadona.imgix.net/images/183538161f6878dffacd07bcfb9a6706.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47480/protegeslip-incontinencia-deliplus-pequeno-caja	t
2434	48	1	Protegeslip normal Deliplus Dry	2.10	0.03	ud	https://prod-mercadona.imgix.net/images/66c506d46dec3a6d6619473cb25a5bd6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47351/protegeslip-normal-deliplus-dry-caja	t
2435	48	1	Protegeslip maxi Deliplus Dry	2.50	0.04	ud	https://prod-mercadona.imgix.net/images/288c1253352510ce00e8119be9b2f487.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47352/protegeslip-maxi-deliplus-dry-caja	t
2436	48	1	Protegeslip normal Deliplus Cotton	1.70	0.06	ud	https://prod-mercadona.imgix.net/images/3952d90ca6c26275f8b3bc17da87b208.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47349/protegeslip-normal-deliplus-cotton-caja	t
2437	48	1	Protegeslip maxi Deliplus Cotton	1.80	0.06	ud	https://prod-mercadona.imgix.net/images/c742abefcf3eb20b4624e04c3211fc5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47350/protegeslip-maxi-deliplus-cotton-caja	t
2438	48	1	Tampones super Tampax Compak con aplicador	5.75	0.18	ud	https://prod-mercadona.imgix.net/images/5477b82d67accc53a4b35482e95b36aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23800/tampones-super-tampax-compak-con-aplicador-caja	t
2439	48	1	Tampones super plus Tampax Compak con aplicador	5.75	0.22	ud	https://prod-mercadona.imgix.net/images/80c351d1ad0a03ec1cc842a3fb57e4f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23799/tampones-super-plus-tampax-compak-con-aplicador-caja	t
2440	48	1	Tampones regular Tampax Compak con aplicador	5.75	0.17	ud	https://prod-mercadona.imgix.net/images/0c3e655b7cebe554f788dfc9f880f064.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23798/tampones-regular-tampax-compak-con-aplicador-caja	t
2441	48	1	Tampones super Deliplus con aplicador suave	2.75	0.14	ud	https://prod-mercadona.imgix.net/images/4703b30f2c3985cad01f8fe2c993344c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47321/tampones-super-deliplus-con-aplicador-suave-caja	t
2442	48	1	Tampones regular Deliplus con aplicador suave	2.75	0.14	ud	https://prod-mercadona.imgix.net/images/ad906489e838e8df1af1f00396cde262.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47320/tampones-regular-deliplus-con-aplicador-suave-caja	t
2443	48	1	Tampones super plus Deliplus con aplicador suave	2.75	0.14	ud	https://prod-mercadona.imgix.net/images/0d86e660a8f33f413d2ff28b44c9bc1c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47322/tampones-super-plus-deliplus-con-aplicador-suave-caja	t
2444	48	1	Tampones mini Deliplus con aplicador suave	2.75	0.14	ud	https://prod-mercadona.imgix.net/images/f635a6cc44c3a34202f0aff9352a2281.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47319/tampones-mini-deliplus-con-aplicador-suave-caja	t
2445	48	1	Tampones regular Deliplus 100% algodón	3.40	0.19	ud	https://prod-mercadona.imgix.net/images/1b419b4c8ef22e431299fb59804aba43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23768/tampones-regular-deliplus-100-algodon-caja	t
2446	48	1	Tampones super Deliplus 100% algodón	3.40	0.19	ud	https://prod-mercadona.imgix.net/images/fd0329e1547087a9cc01d3184b3a31ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23769/tampones-super-deliplus-100-algodon-caja	t
2447	48	1	Tampones super plus Deliplus 100% algodón	3.40	0.23	ud	https://prod-mercadona.imgix.net/images/c6f365ea11c25cda67e9e7ea639e3c61.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23770/tampones-super-plus-deliplus-100-algodon-caja	t
2448	48	1	Tampones regular Tampax Pearl con aplicador	4.90	0.20	ud	https://prod-mercadona.imgix.net/images/5e80425e6be0d8f53d45f7e9103693de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20281/tampones-regular-tampax-pearl-con-aplicador-caja	t
2449	48	1	Tampones super Tampax Pearl con aplicador	4.90	0.20	ud	https://prod-mercadona.imgix.net/images/51a37aa3c250c878a6e340b84221500e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20288/tampones-super-tampax-pearl-con-aplicador-caja	t
2450	48	1	Tampones super plus Tampax Pearl con aplicador	4.90	0.20	ud	https://prod-mercadona.imgix.net/images/d30e3463e230f8cd813e4da77647ee92.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20290/tampones-super-plus-tampax-pearl-con-aplicador-caja	t
2451	48	1	Protector cama tamaño 60 x 90 cm Deliplus	8.50	0.43	ud	https://prod-mercadona.imgix.net/images/cabf9352b8f396c3f70cd47073f3fcd4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47377/protector-cama-tamano-60-x-90-cm-deliplus-paquete	t
2452	48	1	Pañal adulto braguita talla M Deliplus Pants plus	10.80	0.77	ud	https://prod-mercadona.imgix.net/images/7c88749cc4019b2269506bc16e1fc5a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47608/panal-adulto-braguita-talla-m-deliplus-pants-plus-paquete	t
2453	48	1	Pañal adulto braguita talla L Deliplus Pants Plus	11.95	0.85	ud	https://prod-mercadona.imgix.net/images/e532039dd3b67d533352cf22ad0f7ffd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47496/panal-adulto-braguita-talla-l-deliplus-pants-plus-paquete	t
2454	48	1	Compresa de incontinencia Tena masculina	5.00	0.50	ud	https://prod-mercadona.imgix.net/images/f594a5c1b1919f475231fd249cc029e2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47010/compresa-incontinencia-tena-masculina-caja	t
2455	48	1	Pañal adulto talla M de 70-130 cm Deliplus	13.55	0.68	ud	https://prod-mercadona.imgix.net/images/5a1b88d1fa3b4de06b531fba9a1438b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35243/panal-adulto-talla-m-70-130-cm-deliplus-paquete	t
2456	48	1	Pañal adulto talla L Deliplus	14.80	0.74	ud	https://prod-mercadona.imgix.net/images/fb6fb4ab46cead3ad95576cdcc5017e6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35245/panal-adulto-talla-l-deliplus-paquete	t
2457	48	1	Toallitas íntimas cuidado diario Deliplus	1.30	0.05	ud	https://prod-mercadona.imgix.net/images/116507b89748e549a313bae1b40579b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73988/toallitas-intimas-cuidado-diario-deliplus-paquete	t
2458	48	1	Toallitas íntimas cuidado diario Deliplus	1.00	0.08	ud	https://prod-mercadona.imgix.net/images/29e6dcb5f0b340eb0152bfe60508d1d6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78975/toallitas-intimas-cuidado-diario-deliplus-paquete	t
2459	48	1	Toallitas íntimas Deliplus monodosis	1.00	0.10	ud	https://prod-mercadona.imgix.net/images/cfe75b698259f06c01b444dae11c1d78.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11653/toallitas-intimas-deliplus-monodosis-caja	t
2460	48	1	Gel de higiene íntima Deliplus	1.25	2.50	l	https://prod-mercadona.imgix.net/images/b97579f3329bac86c9b7caa4caf31deb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44912/gel-higiene-intima-deliplus-bote	t
2461	48	1	Gel de higiene íntima hidratante Deliplus	2.25	4.50	l	https://prod-mercadona.imgix.net/images/6d22a6ac0f4be7b2b5650a8dd74fe281.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44913/gel-higiene-intima-hidratante-deliplus-bote	t
2462	48	1	Bandas de cera facial Deliplus piel sensible	1.00	0.06	ud	https://prod-mercadona.imgix.net/images/0cd0260cdf76b831d0bcbd3bbdf0440e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74079/bandas-cera-facial-deliplus-piel-sensible-paquete	t
2463	48	1	Bandas de cera especial piernas Deliplus piel sensible	1.30	0.07	ud	https://prod-mercadona.imgix.net/images/0c4a23c9991f33b216ba9fc4b2a3efa8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74081/bandas-cera-especial-piernas-deliplus-piel-sensible-paquete	t
2464	48	1	Crema depilatoria hombre Deliplus piel normal	2.65	13.25	l	https://prod-mercadona.imgix.net/images/93d66bf7b4421d5b73c43700c18a6007.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86088/crema-depilatoria-hombre-deliplus-piel-normal-bajo-ducha-incluye-manopla-caja	t
2465	48	1	Crema depilatoria mujer para el cuerpo Deliplus piel sensible	2.65	13.25	l	https://prod-mercadona.imgix.net/images/b789620828929dbd207aea77d30ce7d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86089/crema-depilatoria-mujer-cuerpo-deliplus-piel-sensible-bajo-ducha-incluye-manopla-bote	t
2466	48	1	Crema decolorante rostro y cuerpo Deliplus piel sensible	3.50	23.33	l	https://prod-mercadona.imgix.net/images/e2405a03433b9cf317c029fc623bde03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60046/crema-decolorante-rostro-cuerpo-deliplus-piel-sensible-caja	t
2467	48	1	Cera caliente en tarro Deliplus piel sensible	4.10	16.40	kg	https://prod-mercadona.imgix.net/images/7434d1063b0126e0a0354ad551145c66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67534/cera-caliente-tarro-deliplus-piel-sensible-apto-microondas-caja	t
2468	48	1	Gel para depilar con cuchilla Deliplus piel sensible	2.60	13.00	l	https://prod-mercadona.imgix.net/images/6135076eebf9cd6721ef2d9cf47a5d04.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35405/gel-depilar-con-cuchilla-deliplus-piel-sensible-bote	t
2469	48	1	Crema depilatoria facial Deliplus piel sensible	2.30	115.00	l	https://prod-mercadona.imgix.net/images/09c712a6b1ebbcf8f020922dda9771be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9879/crema-depilatoria-facial-deliplus-piel-sensible-contiene-tubo-crema-depil-espatula-folleto-con-precauciones-tubo-gel-post-depil-caja	t
2470	49	1	Pinza de cejas Deliplus recta	2.00	2.00	ud	https://prod-mercadona.imgix.net/images/49c528b59a360b10e0b440beb0a1954c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78073/pinza-cejas-deliplus-recta-paquete	t
2471	48	1	Maquinillas depilación desechables Deliplus Body 2 hojas	0.70	0.14	ud	https://prod-mercadona.imgix.net/images/cd0c5ac7d65dc943e4c867e6fb680b4c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13573/maquinillas-depilacion-desechables-deliplus-body-2-hojas-paquete	t
2472	48	1	Maquinillas depilación Deliplus Body 3 hojas	2.15	0.54	ud	https://prod-mercadona.imgix.net/images/13108549b6903a62d9f7343d8935051c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13574/maquinillas-depilacion-mujer-deliplus-body-3-3-hojas-paquete	t
2473	48	1	Maquinillas depilación desechables Gillette Venus Colors 3 hojas	3.45	0.86	ud	https://prod-mercadona.imgix.net/images/b1745fd88a7042667550daae1bdf04b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67616/maquinillas-depilacion-desechables-gillette-venus-colors-3-hojas-paquete	t
2474	48	1	Maquinilla depilación recargable Gillette Venus Comfortglide Breeze 3 hojas	7.95	7.95	ud	https://prod-mercadona.imgix.net/images/b76b085d65b1a09466ed1be506be915c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15565/maquinilla-depilacion-recargable-gillette-venus-comfortglide-breeze-3-hojas-caja	t
2475	48	1	Recambios maquinilla depilación Gillette Venus Comfortglide Breeze 3 hojas	10.80	2.70	ud	https://prod-mercadona.imgix.net/images/593fb01712f7c0a3bf7340ae3d01a58f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35785/recambios-maquinilla-depilacion-gillette-venus-comfortglide-breeze-3-hojas-caja	t
2476	48	1	Recambios maquinilla depilación Wilkinson Hydro Silk 5 hojas	7.95	2.65	ud	https://prod-mercadona.imgix.net/images/98d7ccf2659e6d8ef573f992cce53a0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79199/recambios-maquinilla-depilacion-wilkinson-hydro-silk-5-hojas-caja	t
2477	48	1	Maquinilla depilación recargable Deliplus Body System 6 hojas	5.00	5.00	ud	https://prod-mercadona.imgix.net/images/7a2619aeac3001bad412706ec1f5946e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13575/maquinilla-depilacion-recargable-deliplus-body-system-6-hojas-caja	t
2478	48	1	Recambios maquinilla depilación Deliplus Body System 6 hojas	4.60	1.53	ud	https://prod-mercadona.imgix.net/images/f2ffd379c0c54a6e49690fd1a0c70921.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13576/recambios-maquinilla-depilacion-deliplus-body-system-6-hojas-caja	t
2479	48	1	Cuchillas para perfilar cejas y vello facial Deliplus	2.80	2.80	ud	https://prod-mercadona.imgix.net/images/68975ea0a6ea32060e92eaa7442e1455.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12754/cuchillas-perfilar-cejas-vello-facial-deliplus-paquete	t
2480	48	1	Gel de afeitar Sensitive Deliplus	1.75	8.75	l	https://prod-mercadona.imgix.net/images/326730d66f8015d222caed1997d65456.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23013/gel-afeitar-sensitive-deliplus-bote	t
2481	48	1	Gel de afeitar Sensitive Deliplus	1.35	18.00	l	https://prod-mercadona.imgix.net/images/65cd2c96b03686666ee47ee91329f54e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23277/gel-afeitar-sensitive-deliplus-bote	t
2482	48	1	Espuma de afeitar Sensitive Deliplus manteca de cacao	1.35	4.50	l	https://prod-mercadona.imgix.net/images/75ec8ba19f4b81fd470dfb084ddbed17.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52770/espuma-afeitar-sensitive-deliplus-manteca-cacao-bote	t
2483	48	1	Gel de afeitar piel sensible Gillette con aloe vera	2.60	13.00	l	https://prod-mercadona.imgix.net/images/ec7a844ee1a522628d1a687e2e4ee7b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35611/gel-afeitar-piel-sensible-gillette-con-aloe-vera-bote	t
2484	48	1	Espuma de afeitar piel sensible Gillette con aloe vera	2.15	8.60	l	https://prod-mercadona.imgix.net/images/df13fc3b422e8defa82659c383b77199.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35610/espuma-afeitar-piel-sensible-gillette-con-aloe-vera-bote	t
2485	48	1	Bálsamo after shave Sensitive Nivea Men 0% alcohol	5.25	52.50	l	https://prod-mercadona.imgix.net/images/418d80f2e683e924b54338c26b505ddd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73850/balsamo-after-shave-sensitive-nivea-men-0-alcohol-frasco	t
2486	48	1	Bálsamo after shave Sensitive Deliplus con aloe vera y 0% alcohol	1.60	16.00	l	https://prod-mercadona.imgix.net/images/d07a49f232fe5a132cd0f1f1ee4888db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35798/balsamo-after-shave-sensitive-deliplus-0-alcohol-antiedad-bote	t
2487	48	1	Loción after shave Fresh Deliplus con alcohol	1.70	11.33	l	https://prod-mercadona.imgix.net/images/e95b8b62cbc5dbcd2bdcf578c472c183.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60658/locion-after-shave-fresh-deliplus-con-alcohol-bote	t
2488	48	1	Maquinillas de afeitar desechables Deliplus Fix 2 hojas	1.10	0.11	ud	https://prod-mercadona.imgix.net/images/d6242f7fd0c5e58c7dd1b257bceedc05.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73443/maquinillas-afeitar-desechables-deliplus-fix-2-hojas-paquete	t
2489	48	1	Maquinillas de afeitar desechables Gillette Blue Plus 2 hojas	3.00	0.50	ud	https://prod-mercadona.imgix.net/images/6675a34cc7aa3e0acac8477c2481ba2f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73006/maquinillas-afeitar-desechables-gillette-blue-plus-2-hojas-paquete	t
2490	48	1	Maquinillas de afeitar desechables Deliplus Active 3 hojas	1.95	0.49	ud	https://prod-mercadona.imgix.net/images/f0a4e8d546b8051615d134fbab796d11.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73445/maquinillas-afeitar-desechables-deliplus-active-3-hojas-paquete	t
2491	48	1	Maquinillas de afeitar desechables Gillette Sensor Comfort 3 hojas	5.00	1.00	ud	https://prod-mercadona.imgix.net/images/9f85972e940c668392c49d18a7e666c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73002/maquinillas-afeitar-desechables-gillette-sensor-comfort-3-hojas-paquete	t
2492	48	1	Maquinillas de afeitar desechables Gillette Blue Plus 2 hojas	8.00	0.40	ud	https://prod-mercadona.imgix.net/images/64b16f7cc4953da2b7bfc01e03cbf05b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73045/maquinillas-afeitar-desechables-gillette-blue-plus-2-hojas-paquete	t
2493	48	1	Maquinilla de afeitar recargable Deliplus Precision System 3 hojas	3.00	3.00	ud	https://prod-mercadona.imgix.net/images/5ea5ad8adb7a0b54c506d859c5357c36.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22083/maquinilla-afeitar-recargable-deliplus-precision-system-3-hojas-caja	t
2494	48	1	Maquinillas de afeitar desechables Deliplus Active 2 hojas	1.40	0.14	ud	https://prod-mercadona.imgix.net/images/8af7576741177d734bd62d81ffb93f49.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35342/maquinillas-afeitar-desechables-deliplus-active-2-hojas-paquete	t
2495	48	1	Maquinilla de afeitar recargable Deliplus Precision System 6 hojas	5.00	5.00	ud	https://prod-mercadona.imgix.net/images/42bf037841ad8a55ca3b79902cbb09bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13804/maquinilla-afeitar-recargable-deliplus-precision-system-6-hojas-caja	t
2496	48	1	Maquinilla de afeitar recargable Gillette Fusion Sport 5 hojas	8.60	8.60	ud	https://prod-mercadona.imgix.net/images/8fc6e28a5426fbb6cc32cd288aeba506.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52645/maquinilla-afeitar-recargable-gillette-fusion-sport-5-hojas-caja	t
2497	48	1	Maquinilla de afeitar recargable Gillette Mach Sport 3 hojas	8.95	8.95	ud	https://prod-mercadona.imgix.net/images/79a48e0fcbf2e35bd695d7955ff875c5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52647/maquinilla-afeitar-recargable-gillette-mach-sport-3-hojas-incluye-tres-recambios-caja	t
2498	48	1	Maquinilla de afeitar recargable Deliplus Flection System 6 hojas	6.00	6.00	ud	https://prod-mercadona.imgix.net/images/dca6106505111ca6054d7ffe3d648faf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8900/maquinilla-afeitar-recargable-deliplus-flection-system-6-hojas-caja	t
2499	48	1	Recambios maquinilla de afeitar Deliplus Precision System 3 hojas	3.50	0.88	ud	https://prod-mercadona.imgix.net/images/656c1b9ff5cfe508b195f2a0e38d0444.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22084/recambios-maquinilla-afeitar-deliplus-precision-system-3-hojas-caja	t
2500	48	1	Recambios maquinilla de afeitar Deliplus Precision System 6 hojas	5.50	1.38	ud	https://prod-mercadona.imgix.net/images/2540665c5bb12b7573b6ff6a240083f6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13805/recambios-maquinilla-afeitar-deliplus-precision-system-6-hojas-caja	t
2501	48	1	Recambios maquinilla de afeitar Gillette Fusion Sport 5 hojas	12.70	3.18	ud	https://prod-mercadona.imgix.net/images/2b1d2f6341df5881fcdcecc295229930.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52646/recambios-maquinilla-afeitar-gillette-fusion-sport-5-hojas-caja	t
2502	48	1	Recambios maquinilla de afeitar Gillette Mach Sport 3 hojas	8.95	2.24	ud	https://prod-mercadona.imgix.net/images/0310745e0bf8b008554c837192fee598.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52648/recambios-maquinilla-afeitar-gillette-mach-sport-3-hojas-caja	t
2503	48	1	Recambios maquinilla de afeitar Deliplus Flection System 6 hojas	7.00	1.75	ud	https://prod-mercadona.imgix.net/images/4f5e64948723e1ea2277d1b456269af0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8901/recambios-maquinilla-afeitar-deliplus-flection-system-6-hojas-caja	t
2504	48	1	Cuidado hidratante Hydra energetic L'Oréal men expert anti-fatiga 24h	6.95	139.00	l	https://prod-mercadona.imgix.net/images/d5eb8fdbbfde7e19c47115e6817b36f3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74817/cuidado-hidratante-hydra-energetic-loreal-men-expert-anti-fatiga-24h-bote	t
2505	49	1	Contorno de ojos Men Care Regen Skin Deliplus	5.00	333.33	l	https://prod-mercadona.imgix.net/images/6097e19a3d0ec47d71ed66267aef8ea1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46866/contorno-ojos-men-care-regen-skin-deliplus-tipo-piel-tubo	t
2506	49	1	Quitaesmalte con acetona Deliplus	1.15	5.75	l	https://prod-mercadona.imgix.net/images/e9852ed93d16865af9b9a3577837d305.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79631/quitaesmalte-con-acetona-deliplus-bote	t
2507	49	1	Quitaesmalte acetona pura Deliplus	1.70	8.50	l	https://prod-mercadona.imgix.net/images/a247a033a6f33be71213ec69fe739007.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79633/quitaesmalte-acetona-pura-deliplus-bote	t
2508	49	1	Quitaesmalte 0% acetona Deliplus	1.30	6.50	l	https://prod-mercadona.imgix.net/images/38b00d0e159420b348f21bf961bc6903.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79632/quitaesmalte-0-acetona-deliplus-bote	t
2509	49	1	Tijera uñas Deliplus	4.20	4.20	ud	https://prod-mercadona.imgix.net/images/80c0d64a42a71eade0e54694f764202d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35402/tijera-unas-deliplus-paquete	t
2510	49	1	Corta cutículas Deliplus	2.10	2.10	ud	https://prod-mercadona.imgix.net/images/ccec9fd9836987aebdc2bd3b3724d0d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22528/corta-cuticulas-deliplus-paquete	t
2511	48	1	Lima fibra de vidrio Deliplus	1.00	1.00	ud	https://prod-mercadona.imgix.net/images/d4547b94d73408d0abcd240124dc912e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78031/lima-fibra-vidrio-deliplus-paquete	t
2512	48	1	Cortaúñas manos y pies Deliplus	1.90	1.90	ud	https://prod-mercadona.imgix.net/images/ed02edc100e47a7cc5646082a3682044.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22170/cortaunas-manos-pies-deliplus-paquete	t
2513	48	1	Lima raspador durezas pies Deliplus	3.10	3.10	ud	https://prod-mercadona.imgix.net/images/21d3ac16bf97ea676020b279a8bc603f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22527/lima-raspador-durezas-pies-deliplus-paquete	t
2514	48	1	Alicate uñas Deliplus	4.90	4.90	ud	https://prod-mercadona.imgix.net/images/4c12f7e773e71a57f31af01d86a9ce0e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13559/alicate-unas-deliplus-paquete	t
2515	48	1	Body spray citronela Deliplus	1.35	9.00	l	https://prod-mercadona.imgix.net/images/5ca2cf91fca3edfde7791f8af0420cf3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78694/body-spray-citronela-deliplus-bote	t
2516	48	1	Agua de colonia S3 Classic fresh	3.75	5.00	l	https://prod-mercadona.imgix.net/images/92b5b89f5ae5276905d53beec7f4febd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46204/agua-colonia-s3-classic-fresh-botella	t
2517	52	1	Eau de parfum mujer Rose Nude	9.00	90.00	l	https://prod-mercadona.imgix.net/images/09a2a539e7291c35ad1fb383abf1b421.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35641/eau-parfum-mujer-rose-nude-frasco	t
2518	52	1	Eau de parfum mujer Elección	9.00	90.00	l	https://prod-mercadona.imgix.net/images/45fc230362db8d3ee5c1960e41809a51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/76937/eau-parfum-mujer-eleccion-frasco	t
2519	52	1	Eau de toilette mujer 9.60 Sport water	3.90	19.50	l	https://prod-mercadona.imgix.net/images/ca51be62080d61db19f04f42b1fc5ca7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74538/eau-toilette-mujer-960-sport-water-frasco	t
2520	52	1	Eau de parfum mujer Como Tú Amor	7.00	70.00	l	https://prod-mercadona.imgix.net/images/e2c3018bad403c05156da9be13f12d1e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60655/eau-parfum-mujer-amor-frasco	t
2521	52	1	Eau de toilette mujer Ikiru	8.00	80.00	l	https://prod-mercadona.imgix.net/images/256c1d1ac65f7280a19e2999b39a3d19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46659/eau-toilette-mujer-ikiru-frasco	t
2522	52	1	Eau de toilette mujer Vuela	3.80	38.00	l	https://prod-mercadona.imgix.net/images/134eb9f0c70f4eeca8a6ba901481ace9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15705/eau-toilette-mujer-vuela-frasco	t
2523	52	1	Eau de toilette mujer Soplo	7.00	70.00	l	https://prod-mercadona.imgix.net/images/617fdae09c3617ef54b7a74cd1fd720f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46673/eau-toilette-mujer-soplo-frasco	t
2524	52	1	Eau de toilette mujer Capítulo Floral	6.50	32.50	l	https://prod-mercadona.imgix.net/images/4167052ee0bff96d5c464cf45fae0d41.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78510/eau-toilette-mujer-capitulo-floral-frasco	t
2525	52	1	Eau de parfum mujer Blue Shine	11.00	110.00	l	https://prod-mercadona.imgix.net/images/a8c1bc91ec4f6fa2e690cc28b9cec1f6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40387/eau-parfum-mujer-blue-shine-frasco	t
2526	52	1	Eau de parfum mujer Como Tú Extratime A Day	8.00	80.00	l	https://prod-mercadona.imgix.net/images/a98dfd88865e38732dbb9c417c326e33.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60661/eau-parfum-mujer-extratime-day-frasco	t
2527	52	1	Eau de parfum mujer My Soul Supreme	11.00	110.00	l	https://prod-mercadona.imgix.net/images/ed6a418fbed7966b3a6493695bf0d85a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13436/eau-parfum-mujer-my-soul-supreme-for-her-frasco	t
2528	52	1	Eau de parfum mujer Verissime Bright	11.00	110.00	l	https://prod-mercadona.imgix.net/images/163290dc9f11465c42ecbde79c338021.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13428/eau-parfum-mujer-verissime-bright-frasco	t
2529	52	1	Eau de parfum mujer Cosmic Shine	9.50	95.00	l	https://prod-mercadona.imgix.net/images/91671453f7a74583ec525312ff8ee20f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23116/eau-parfum-mujer-cosmic-shine-frasco	t
2530	52	1	Eau de parfum mujer My Soul Enchanted	12.00	120.00	l	https://prod-mercadona.imgix.net/images/eb861c3987b6dc9cd346c9511a2bebd6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35177/eau-parfum-mujer-my-soul-enchanted-frasco	t
2531	52	1	Eau de parfum mujer Éclant Shine	12.00	120.00	l	https://prod-mercadona.imgix.net/images/4fdb95314ea21885a1e632594bbe760f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60905/eau-parfum-mujer-eclat-shine-frasco	t
2532	52	1	Eau de toilette mujer Monogotas coco	4.00	40.00	l	https://prod-mercadona.imgix.net/images/acbf504311c321afc50e71442dfec060.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23892/eau-toilette-monogotas-coco-frasco	t
2533	52	1	Eau de toilette mujer Monogotas vainilla	4.00	40.00	l	https://prod-mercadona.imgix.net/images/399c8667cb8ed74499c2ab8426670d09.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23893/eau-toilette-monogotas-vainilla-frasco	t
2534	52	1	Eau de toilette mujer Capítulo Chypre	6.50	32.50	l	https://prod-mercadona.imgix.net/images/433acf0f6be881dcc0b0029917d0f7a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35881/eau-toilette-mujer-capitulo-chypre-frasco	t
2535	52	1	Eau de parfum mujer Soirée My Soul	12.00	120.00	l	https://prod-mercadona.imgix.net/images/d3652e2f357d6683b25dae403012bc24.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52566/eau-parfum-mujer-soiree-my-soul-for-her-frasco	t
2536	52	1	Eau de parfum mujer Boem Shine	9.50	95.00	l	https://prod-mercadona.imgix.net/images/0d8995d8b90aea8aad0f891199dc029f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52571/eau-parfum-mujer-poem-shine-frasco	t
2537	52	1	Eau de parfum mujer Como Tú Sinfonía	8.00	80.00	l	https://prod-mercadona.imgix.net/images/a8192e00455ddacc1ce465e5526eb93a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60662/eau-parfum-mujer-sinfonia-frasco	t
2538	52	1	Eau de parfum mujer Como Tú Gold	8.00	80.00	l	https://prod-mercadona.imgix.net/images/6c048ed3d2b7905b4eff899c000fe876.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60659/eau-parfum-mujer-gold-frasco	t
2539	52	1	Eau de parfum mujer Como Tú Extratime Likes	8.00	80.00	l	https://prod-mercadona.imgix.net/images/9e8c3cb2f2df28930752ebbc7ea261f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60660/eau-parfum-mujer-extratime-likes-frasco	t
2540	52	1	Eau de parfum mujer Como Tú Enciende	7.00	70.00	l	https://prod-mercadona.imgix.net/images/f3c527b7f73ebb617c576327f4a36ff6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60657/eau-parfum-mujer-enciende-frasco	t
2541	52	1	Eau de parfum mujer Como Tú Atracción	8.00	80.00	l	https://prod-mercadona.imgix.net/images/2deaac9fd1737fe9447ac294b55013b9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60663/eau-parfum-mujer-atraccion-frasco	t
2542	52	1	Eau de parfum mujer Como Tú Soplo Intense	8.00	80.00	l	https://prod-mercadona.imgix.net/images/328e2347970e9582d26f8a16d62ab2a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86384/eau-parfum-mujer-soplo-intense-frasco	t
2543	52	1	Eau de parfum mujer Ella	10.00	100.00	l	https://prod-mercadona.imgix.net/images/e63983a7a8a7355499090e5317070d6c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8893/eau-parfum-mujer-frasco	t
2544	52	1	Eau de toilette mujer 9.60 Bloom Sport water	3.90	19.50	l	https://prod-mercadona.imgix.net/images/87e77e81a676f5a0f2a6c168fe51f3c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8878/eau-toilette-mujer-960-bloom-sport-water-frasco	t
2545	52	1	Eau de parfum mujer Como Tú The Rose	8.00	80.00	l	https://prod-mercadona.imgix.net/images/859d949cbd168c2f718caf3f2d44565d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86382/eau-parfum-mujer-the-rose-frasco	t
2546	52	1	Eau de parfum mujer My Soul Rouge	9.50	95.00	l	https://prod-mercadona.imgix.net/images/8aafc3cdb1160c32a753d59b021b0cc8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9938/eau-parfum-mujer-my-soul-rouge-frasco	t
2547	52	1	Eau de parfum mujer Como tú Cerise	8.00	80.00	l	https://prod-mercadona.imgix.net/images/c157603f9a45111a892214f5e622ba9e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9940/eau-parfum-mujer-cerise-frasco	t
2548	52	1	Eau de parfum mujer Shine Special	12.00	120.00	l	https://prod-mercadona.imgix.net/images/77f03a1704f887010de6a64a16069c7b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9921/eau-parfum-mujer-shine-special-frasco	t
2549	52	1	Eau de parfum mujer Como Tú Santal	8.00	80.00	l	https://prod-mercadona.imgix.net/images/0eb033488e2cdabbfab09af19579a1b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13023/eau-parfum-mujer-santal-frasco	t
2550	52	1	Eau de toilette mujer Monogotas banana	2.00	20.00	l	https://prod-mercadona.imgix.net/images/ff1afa3556ec4f614d3092661baf1416.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14229/eau-toilette-mujer-monogotas-banana-frasco	t
2551	52	1	Fragancia Mist Amatista Glow Deliplus	4.00	16.00	l	https://prod-mercadona.imgix.net/images/1709c5bb842b6470c4cc8374dd89e625.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14180/fragancia-mist-amatista-glow-deliplus-pelo-cuerpo-frasco	t
2552	52	1	Fragancia Mist Vainilla Sunset Deliplus	4.00	16.00	l	https://prod-mercadona.imgix.net/images/d44575b7a5ce663a6fbb158b87e911bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14174/fragancia-mist-vainilla-sunset-deliplus-pelo-cuerpo-frasco	t
2553	52	1	Fragancia Mist Pistacho Cream Deliplus	4.00	16.00	l	https://prod-mercadona.imgix.net/images/95970bb453c5affe973abf110c256cc2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14181/fragancia-mist-pistacho-cream-deliplus-pelo-cuerpo-frasco	t
2554	52	1	Agua de colonia Deliplus Citrus Classic	2.75	3.67	l	https://prod-mercadona.imgix.net/images/7788c8b3600c12a1e0985c7759a507ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14391/agua-colonia-deliplus-citrus-classic-botella	t
2555	52	1	Agua de colonia Deliplus Floral Infusion	2.75	3.67	l	https://prod-mercadona.imgix.net/images/277976d30d026ba16097803fdb3012f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14390/agua-colonia-deliplus-floral-infusion-botella	t
2556	52	1	Eau de toilette hombre 9.60 Sport water acción	3.90	19.50	l	https://prod-mercadona.imgix.net/images/4b3ab31392f4f9b3de6b6d377115ab4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74606/eau-toilette-hombre-960-sport-water-accion-frasco	t
2557	52	1	Eau de parfum hombre Como Tú Fuerza	7.00	70.00	l	https://prod-mercadona.imgix.net/images/201471165dfd17e45a5a924814eea726.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60667/eau-parfum-hombre-fuerza-frasco	t
2558	52	1	Eau de parfum hombre Como Tú Viento	7.00	70.00	l	https://prod-mercadona.imgix.net/images/6d217889599c4f1e5e743d067df810a5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60668/eau-parfum-hombre-viento-frasco	t
2559	52	1	Eau de toilette hombre Gesto	5.50	55.00	l	https://prod-mercadona.imgix.net/images/8a750fa2c3928e8797c80e19f48e8cc4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13435/eau-toilette-hombre-gesto-frasco	t
2560	52	1	Eau de toilette hombre Ikiru	8.00	80.00	l	https://prod-mercadona.imgix.net/images/5d7b7765752bd17104de351d8d9fe65d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46658/eau-toilette-hombre-ikiru-frasco	t
2561	52	1	Eau de parfum hombre Él	10.00	100.00	l	https://prod-mercadona.imgix.net/images/e3f369eacc9247df7688f5cd747635e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60598/eau-parfum-hombre-frasco	t
2562	52	1	Eau de toilette hombre Misty Wood Esencia vital	3.80	38.00	l	https://prod-mercadona.imgix.net/images/6573a8b7f50886291bea78433c43a19d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46858/eau-toilette-hombre-misty-wood-esencia-vital-frasco	t
2563	52	1	Eau de toilette hombre Misty Wood Bosque místico	3.80	38.00	l	https://prod-mercadona.imgix.net/images/e676a9c3823ef0d7ed56575d15083655.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46871/eau-toilette-hombre-misty-wood-bosque-mistico-frasco	t
2564	52	1	Eau de toilette hombre Capítulo Marino	6.50	32.50	l	https://prod-mercadona.imgix.net/images/d7143f6862106caf905628f0cd049bfd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78516/eau-toilette-hombre-capitulo-marino-frasco	t
2565	52	1	Eau de parfum hombre My Soul	9.50	95.00	l	https://prod-mercadona.imgix.net/images/b39768b9865da3982a5f097faf9246d6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40384/eau-parfum-hombre-my-soul-for-him-frasco	t
2566	52	1	Eau de parfum hombre Como Tú Extratime A Day	8.00	80.00	l	https://prod-mercadona.imgix.net/images/0b7093c585b613aa949c8c63a5e24ee2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60665/eau-parfum-hombre-extratime-day-frasco	t
2567	52	1	Eau de parfum hombre My Soul Supreme	11.00	110.00	l	https://prod-mercadona.imgix.net/images/5525358b9c67420d5da84c4122f7a1d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13437/eau-parfum-hombre-my-soul-supreme-for-him-frasco	t
2568	52	1	Eau de parfum hombre Borealia Shine	11.00	110.00	l	https://prod-mercadona.imgix.net/images/2df438295abbe318df06eb25bfccd6fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13616/eau-parfum-hombre-borealia-shine-frasco	t
2569	52	1	Eau de parfum hombre My Soul Enchanted	9.50	95.00	l	https://prod-mercadona.imgix.net/images/0c8ec4cc224bdc1de13dacafa0600f46.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35216/eau-parfum-hombre-my-soul-enchanted-for-him-frasco	t
2570	52	1	Eau de parfum hombre My Soul Glacier	12.00	120.00	l	https://prod-mercadona.imgix.net/images/93767d78abb59f871f6aa0c31903de95.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60888/eau-parfum-hombre-my-soul-glacier-frasco	t
2571	52	1	Eau de parfum hombre My Soul Soirée	9.50	95.00	l	https://prod-mercadona.imgix.net/images/19b50a389fb4bc5fccacf49d16fa16b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52567/eau-parfum-hombre-my-soul-soiree-for-him-frasco	t
2572	52	1	Eau de parfum hombre Como Tú Rebel	8.00	80.00	l	https://prod-mercadona.imgix.net/images/25148eb678fe57748a3f2b037240c6ae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60669/eau-parfum-hombre-rebel-frasco	t
2573	52	1	Eau de parfum hombre Como Tú Enciende	7.00	70.00	l	https://prod-mercadona.imgix.net/images/97efbf678fa4808c0f86b9640a12d342.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60664/eau-parfum-hombre-enciende-frasco	t
2574	52	1	Eau de parfum hombre Como Tú Extratime Likes	8.00	80.00	l	https://prod-mercadona.imgix.net/images/d000f7aeb2dd54ae7048b6d25882e6fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60666/eau-parfum-hombre-extratime-likes-frasco	t
2575	52	1	Mini eau de parfum hombre Flor de Mayo Mistery intense	2.50	55.56	l	https://prod-mercadona.imgix.net/images/d9d49498f202fa8d8c623990d1d6bec3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7883/mini-eau-parfum-hombre-flor-mayo-mistery-intense-frasco	t
2576	52	1	Eau de parfum hombre My Soul Vert	9.50	95.00	l	https://prod-mercadona.imgix.net/images/4ef36bcb34094e0de23f86d9aa0276cb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9939/eau-parfum-hombre-my-soul-vert-frasco	t
2577	52	1	Eau de parfum hombre Como tú Eternal	8.00	80.00	l	https://prod-mercadona.imgix.net/images/0bd75f7dbab42dba3af3379ecdf37d9a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9941/eau-parfum-hombre-eternal-frasco	t
2578	52	1	Eau de toilette hombre Capítulo Amaderado	6.50	32.50	l	https://prod-mercadona.imgix.net/images/faee023ad9dfa884dff4949e74f0f74d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12853/eau-toilette-hombre-capitulo-amaderado-frasco	t
2579	52	1	Lote hombre Gesto	7.50	7.50	ud	https://prod-mercadona.imgix.net/images/3292860fa9568b9c3e5aaaf01548e2d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60902/lote-hombre-gesto-contiene-eau-toilette-100-ml-gel-bano-100-ml-after-shave-100-ml-champu-100-ml-caja	t
2580	52	1	Lote hombre Dj Mariio	10.00	10.00	ud	https://prod-mercadona.imgix.net/images/75412992e44974f897e4e88bd3762f64.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19939/lote-hombre-dj-mariio-contiene-eau-toilette-100-ml-desodorante-75-ml-spray-bucal-10-ml-caja	t
2581	52	1	Lote hombre Como Tú Rebel	11.00	11.00	ud	https://prod-mercadona.imgix.net/images/a035799ff74ae50f1a6b57f047e280d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15291/lote-hombre-rebel-contiene-eau-parfum-100ml-gel-champu-100ml-mini-eau-parfum-15ml-caja	t
2582	52	1	Lote hombre 9.60 Acción	6.00	6.00	ud	https://prod-mercadona.imgix.net/images/497fb4d0e6ff2cfdb2d6eaf34ed7a855.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15292/lote-hombre-960-accion-contiene-sport-water-200-ml-gel-champu-100-ml-gel-fijador-100-ml-caja	t
2583	52	1	Eau de toilette infantil Disney Minnie Mouse	4.00	20.00	l	https://prod-mercadona.imgix.net/images/4ef7678ee68029b6120ca240ec0b0275.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46920/colonia-corporal-infantil-disney-minnie-mouse-bote	t
2584	40	1	Eau de toilette infantil Marvel Spiderman	4.00	20.00	l	https://prod-mercadona.imgix.net/images/4b7008739f2f08c63f8734b9aaae1cde.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8260/colonia-corporal-infantil-marvel-spiderman-bote	t
2585	40	1	Lote infantil Peppa Pig	9.00	9.00	ud	https://prod-mercadona.imgix.net/images/b351fb76bf01818d1f957673e805dfcb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52536/lote-infantil-peppa-pig-contiene-eau-toilette-150-ml-figuras-abuelita-peppa-pig-caja	t
2586	40	1	Lote infantil Gabby's Dollhouse	9.50	9.50	ud	https://prod-mercadona.imgix.net/images/e8dcac8d065b663218aa6ef10b743d84.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14973/lote-infantil-gabbys-dollhouse-contiene-eau-toilette-150ml-ganchos-cabello-laminas-magicas-pintar-con-agua-rotulador-caja	t
2587	51	1	Protector solar infantil pediátrico Sun Med FPS 50+	7.50	30.00	l	https://prod-mercadona.imgix.net/images/7f5ddc97bc4b3b8f37d198d6ae820d7f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60608/protector-solar-infantil-pediatrico-sun-med-fps-50-resistente-agua-spray	t
2588	51	1	Crema protección solar facial Deliplus FPS 50+	6.00	120.00	l	https://prod-mercadona.imgix.net/images/e4799d4a1bfb2e2cbe85a344d9707abb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60613/crema-proteccion-solar-facial-deliplus-fps-50-resistente-agua-bote	t
2589	48	1	Champú protección y brillo Deliplus todo tipo de cabello	1.60	1.60	l	https://prod-mercadona.imgix.net/images/a49366621a784d2cf90babefbfd51827.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35419/champu-proteccion-brillo-deliplus-tipo-cabello-con-extracto-frutas-naturales-botella	t
2590	48	1	Champú Repair & Nutrition Deliplus cabello seco y dañado	1.90	4.75	l	https://prod-mercadona.imgix.net/images/0891f55285889e7710c46691b5041668.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46568/champu-repair-nutrition-deliplus-cabello-seco-danado-con-8-agentes-reparadores-bote	t
2591	43	1	Envase rellenable Deliplus tamaño viaje	0.90	0.90	l	https://prod-mercadona.imgix.net/images/ae1756350478307cb7e68ae3c5f7ec7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/45297/envase-rellenable-deliplus-tamano-viaje-botella	t
2592	48	1	Champú Argan Oil Deliplus cabello seco y dañado	1.90	4.75	l	https://prod-mercadona.imgix.net/images/67aa74c19b8824a67a1c9950e574feff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44337/champu-argan-oil-deliplus-cabello-seco-danado-bote	t
2593	48	1	Champú Repara & Protege Pantene cabello débil y dañado	3.00	10.00	l	https://prod-mercadona.imgix.net/images/8c373a738664c54e4bf0f7388ef6d0c5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35612/champu-repara-protege-pantene-cabello-debil-danado-bote	t
2594	48	1	Champú Detox Deliplus cabello graso	1.90	4.75	l	https://prod-mercadona.imgix.net/images/d4064ef1b2783e1324ce53efc5371a20.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44296/champu-detox-deliplus-cabello-graso-con-extracto-pepino-bote	t
2595	48	1	Champú Hydra hyaluronic Deliplus cabello de normal a seco	1.90	4.75	l	https://prod-mercadona.imgix.net/images/4141f8e2e8426ae45d896867a3f24c03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52931/champu-hydra-hyaluronic-deliplus-cabello-normal-seco-con-acido-hialuronico-niacinamida-provitamina-b5-bote	t
2596	48	1	Champú Liss Frizz Control Deliplus cabello rebelde	1.90	4.75	l	https://prod-mercadona.imgix.net/images/4edd85d00a29e75ebf49a43b992f658b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44281/champu-liss-frizz-control-deliplus-cabello-rebelde-con-vitamina-queratina-bote	t
2597	48	1	Champú Natural Deliplus todo tipo de cabello	1.90	4.75	l	https://prod-mercadona.imgix.net/images/90a97212275e5b40dfb483a8b9e9aa31.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44335/champu-natural-deliplus-tipo-cabello-con-extracto-tilo-aceites-esenciales-salvia-cedro-97-origen-natural-bote	t
2598	48	1	Champú Color Vive Elvive cabello teñido o con mechas	3.45	11.50	l	https://prod-mercadona.imgix.net/images/5b34e6ab745562f7c66a3093187f30eb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52800/champu-color-vive-elvive-cabello-tenido-con-mechas-bote	t
2599	48	1	Champú Curl Perfect Deliplus cabello rizado	1.90	4.75	l	https://prod-mercadona.imgix.net/images/8aea9238d8b602b366990e648a3d9353.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22629/champu-curl-perfect-deliplus-cabello-rizado-apto-metodo-curly-bote	t
2600	48	1	Champú seco O'lysee	2.00	10.00	l	https://prod-mercadona.imgix.net/images/c0b9665dc3582775f0eb02f411f27da8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44233/champu-seco-olysee-bote	t
2601	48	1	Champú Dermo Sensitive Deliplus cuero cabelludo sensible	1.90	4.75	l	https://prod-mercadona.imgix.net/images/85d1dadfc6eb5c169105f034c967c480.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44330/champu-dermo-sensitive-deliplus-cuero-cabelludo-sensible-con-extracto-almendra-dulce-aceite-algodon-bote	t
2602	48	1	Champú Extra Suave Deliplus todo tipo de cabello	1.80	2.40	l	https://prod-mercadona.imgix.net/images/46ec825ccec4c16a28c75c902255fbef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44280/champu-extra-suave-deliplus-tipo-cabello-con-extracto-miel-botella	t
2603	48	1	Champú Zero Deliplus todo tipo de cabello	1.90	4.75	l	https://prod-mercadona.imgix.net/images/7668fd19aab4db27edd00667a57e2702.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44286/champu-zero-deliplus-tipo-cabello-bote	t
2604	48	1	Champú Plex Repair Deliplus cabello muy dañado	1.90	4.75	l	https://prod-mercadona.imgix.net/images/8086f6603c71e0bf816055f34327ef9d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67794/champu-plex-repair-deliplus-cabello-muy-danado-con-argan-jojoba-bote	t
2605	48	1	Champú Hidra Hialurónico Elvive cabello deshidratado	3.45	11.50	l	https://prod-mercadona.imgix.net/images/d36296426a7fe182e68e46dd0db9aa12.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52801/champu-hidra-hialuronico-elvive-cabello-deshidratado-bote	t
2606	48	1	Champú Liso Keratina TRESemmé cabello encrespado o dañado	2.95	8.43	l	https://prod-mercadona.imgix.net/images/3359c88b16ae89049248b36093c2e0ff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7942/champu-liso-keratina-tresemme-cabello-encrespado-danado-con-keratina-hidrolizada-aminoacidos-bote	t
2607	48	1	Champú Anticaída Fortificante Deliplus	1.90	4.75	l	https://prod-mercadona.imgix.net/images/27f4c6a21cc76cf8c12958246d1e89b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11585/champu-anticaida-fortificante-deliplus-con-ginseng-biotina-acido-salicilico-bote	t
2608	48	1	Champú anticaspa Citrus Fresh H&S cabello graso	3.95	11.97	l	https://prod-mercadona.imgix.net/images/497289ddadfff3bf037a165e971b351d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20955/champu-anticaspa-citrus-fresh-hs-cabello-graso-bote	t
2609	48	1	Champú anticaspa Menthol Fresh H&S	3.95	11.97	l	https://prod-mercadona.imgix.net/images/aaeb8b56ea29d1553342ce5b4b45e53c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20956/champu-anticaspa-menthol-fresh-hs-bote	t
2610	48	1	Champú y acondicionador anticaspa Classic 2 en 1 H&S	3.95	11.97	l	https://prod-mercadona.imgix.net/images/8728b2a96d16589fbb9f8743d5555895.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/20954/champu-acondicionador-anticaspa-classic-2-1-hs-bote	t
2611	48	1	Champú anticaspa Citric Ultrex cabello graso	2.50	6.94	l	https://prod-mercadona.imgix.net/images/6dd47afcb7700ee1ca3762136ce9bc4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35397/champu-anticaspa-citric-ultrex-cabello-graso-bote	t
2612	48	1	Champú anticaspa Menthol Ultrex todo tipo de cabello	2.50	6.94	l	https://prod-mercadona.imgix.net/images/00f5a60296c388aa36525ab931454270.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35398/champu-anticaspa-menthol-ultrex-tipo-cabello-bote	t
2613	48	1	Champú y acondicionador anticaspa Classic 2 en 1 Ultrex todo tipo de cabello	2.50	6.94	l	https://prod-mercadona.imgix.net/images/c8cef616fadb27bca5f4298ec033c0dd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35399/champu-acondicionador-anticaspa-classic-2-1-ultrex-tipo-cabello-bote	t
2614	40	1	Champú infantil Kids 3 en 1 Deliplus	1.70	5.67	l	https://prod-mercadona.imgix.net/images/692e048257f0561f22f575805ca3d116.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44320/champu-infantil-kids-3-1-deliplus-champu-acondicionador-gel-bote	t
2615	40	1	Loción infantil elimina liendres y piojos Deliplus	5.00	33.33	l	https://prod-mercadona.imgix.net/images/a87e76641ef640be9e3963b5657c6b27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67802/locion-infantil-elimina-liendres-piojos-deliplus-contiene-gorro-lendrera-bote	t
2616	51	1	Champú Protect Triple Action Deliplus preventivo y protector	2.50	8.33	l	https://prod-mercadona.imgix.net/images/8e6e410cded9870c708a0b083214a1c4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67800/champu-protect-triple-action-deliplus-preventivo-protector-con-arbol-te-vinagre-quassia-amara-bote	t
2617	48	1	Acondicionador Suavidad y Brillo Deliplus todo tipo de cabello	1.75	1.75	l	https://prod-mercadona.imgix.net/images/c7dec8b810ef41fbe1dad74f1488f0c4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35420/acondicionador-suavidad-brillo-deliplus-tipo-cabello-con-queratina-botella	t
2618	48	1	Acondicionador Repair & Nutrition Deliplus cabello seco y dañado	1.40	4.67	l	https://prod-mercadona.imgix.net/images/d4104f4e2c5072b09ea5894d8cdd7ba1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44363/acondicionador-repair-nutrition-deliplus-cabello-seco-danado-con-8-agentes-reparadores-bote	t
2619	48	1	Acondicionador instantáneo Kids Deliplus	1.70	6.80	l	https://prod-mercadona.imgix.net/images/7df71d175a538b4e2fec0098b1fe2e9d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9970/acondicionador-instantaneo-kids-deliplus-bote	t
2620	48	1	Acondicionador instantáneo Repair & Nutrition Deliplus cabello seco y dañado	3.00	7.50	l	https://prod-mercadona.imgix.net/images/d3a954964a64124dd51a75dcac685c44.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44326/acondicionador-instantaneo-repair-nutrition-deliplus-cabello-seco-danado-con-8-agentes-reparadores-con-pistola-botella	t
2621	48	1	Acondicionador Repara & Protege Pantene	3.40	13.60	l	https://prod-mercadona.imgix.net/images/7048088d522bc15f6cb460ec8d3cd881.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35615/acondicionador-repara-protege-pantene-cabello-debil-danado-bote	t
2622	48	1	Acondicionador Protector Color Vive Elvive cabello teñido o con mechas	3.40	13.60	l	https://prod-mercadona.imgix.net/images/1a6084511de888c1efda1027debead6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75532/acondicionador-protector-color-vive-elvive-cabello-tenido-con-mechas-bote	t
2623	48	1	Acondicionador instantáneo Hydra hyaluronic Deliplus cabello de normal a seco	2.00	8.00	l	https://prod-mercadona.imgix.net/images/9f0066b491165c658ada87e024c9ce19.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52933/acondicionador-instantaneo-hydra-hyaluronic-deliplus-cabello-normal-seco-con-acido-hialuronico-niacinamida-provitamina-b5-bote	t
2624	48	1	Acondicionador Liso Keratina TRESemmé cabello encrespado o dañado	2.95	8.43	l	https://prod-mercadona.imgix.net/images/4efd8c97739e464f7d377d340b3e173a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7943/acondicionador-liso-keratina-tresemme-cabello-encrespado-danado-con-keratina-hidrolizada-aminoacidos-bote	t
2625	48	1	Mascarilla Repair & Nutrition Deliplus cabello seco y dañado	2.40	6.00	l	https://prod-mercadona.imgix.net/images/a633371d3a0e4a33ecba0219f8674845.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46569/mascarilla-repair-nutrition-deliplus-cabello-seco-danado-con-8-agentes-reparadores-tarro	t
2626	48	1	Mascarilla Argan Oil Deliplus cabello seco y dañado	2.40	6.00	l	https://prod-mercadona.imgix.net/images/e7ccbcb436cb0941fff41c70c2ae1199.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44338/mascarilla-argan-oil-deliplus-cabello-seco-danado-tarro	t
2627	48	1	Mascarilla Liss Frizz Control Deliplus cabello rebelde	2.40	6.00	l	https://prod-mercadona.imgix.net/images/6c18b20be6bd5c4919d59fcb3b49eeaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44283/mascarilla-liss-frizz-control-deliplus-cabello-rebelde-con-vitamina-queratina-tarro	t
2628	48	1	Mascarilla Curl Perfect Deliplus cabello rizado	2.40	6.00	l	https://prod-mercadona.imgix.net/images/53f08dd7c5d38f39c69e6dfbd0c34c8a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22630/mascarilla-curl-perfect-deliplus-cabello-rizado-apto-metodo-curly-tarro	t
2629	48	1	Mascarilla Repara & Protege Pantene cabello dañado y seco	2.50	12.50	l	https://prod-mercadona.imgix.net/images/3239085e1c4edeeb10be6eb52473b340.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35613/mascarilla-repara-protege-pantene-cabello-danado-seco-tarro	t
2630	48	1	Mascarilla sin aclarado Repair & Nutrition Deliplus cabello seco y dañado	3.80	25.33	l	https://prod-mercadona.imgix.net/images/30b727fc6855b99190c4ad8555cd1272.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44216/mascarilla-sin-aclarado-repair-nutrition-deliplus-cabello-seco-danado-con-8-agentes-reparadores-bote	t
2631	48	1	Mascarilla Natural Deliplus todo tipo de cabello	2.40	6.00	l	https://prod-mercadona.imgix.net/images/6a520c3d6c821b13129b6ffb7c233106.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23195/mascarilla-natural-deliplus-tipo-cabello-con-aceite-abisinia-aceites-esenciales-salvia-cedro-97-origen-natural-tarro	t
2632	48	1	Mascarilla sin aclarado Argan Oil Deliplus cabello seco y dañado	3.80	25.33	l	https://prod-mercadona.imgix.net/images/bb87d61a674c68c11a21ac4e921fd7bf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44218/mascarilla-sin-aclarado-argan-oil-deliplus-cabello-seco-danado-bote	t
2633	48	1	Mascarilla Protectora Color Vive Elvive cabello teñido o con mechas	4.40	14.19	l	https://prod-mercadona.imgix.net/images/7dbe21de261c9e162a66997ff3c7c0e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75538/mascarilla-protectora-color-vive-elvive-cabello-tenido-con-mechas-tarro	t
2758	48	1	Mascarilla cabello violín Color Mask	2.10	2.10	l	https://prod-mercadona.imgix.net/images/3f0b4f6e57b7777a2f3bc57e87385c50.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35768/mascarilla-cabello-violin-deliplus-caja	t
2634	48	1	Mascarilla Plex Repair Deliplus cabello muy dañado	2.10	10.50	l	https://prod-mercadona.imgix.net/images/c9254412af11fc74da2098ebb259cb40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67795/mascarilla-plex-repair-deliplus-cabello-muy-danado-con-aceite-argan-jojoba-karite-bote	t
2635	48	1	Mascarilla sin aclarado Curl Perfect Deliplus cabello rizado	4.00	20.00	l	https://prod-mercadona.imgix.net/images/68939f0f87aef6d073573c26ef89d252.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22631/mascarilla-sin-aclarado-curl-perfect-deliplus-cabello-rizado-apto-metodo-curly-bote	t
2636	48	1	Mascarilla Hydra hyaluronic Deliplus cabello de normal a seco	2.10	10.50	l	https://prod-mercadona.imgix.net/images/3c4349d013e4212676950b328bc2fb52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52932/mascarilla-hydra-hyaluronic-deliplus-cabello-normal-seco-con-acido-hialuronico-niacinamida-provitamina-b5-bote	t
2637	48	1	Mascarilla Hidra Hialurónico Elvive cabello deshidratado	4.40	14.19	l	https://prod-mercadona.imgix.net/images/5626cc445d1a2f37f4ea09b210a415bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67899/mascarilla-hidra-hialuronico-elvive-cabello-deshidratado-tarro	t
2638	48	1	Mascarilla intensiva Liso Keratina 1 Minute Wow! TRESemmé cabello encrespado o dañado	2.65	15.59	l	https://prod-mercadona.imgix.net/images/0ab958476d17007e2dbeb0837621ca1e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7944/mascarilla-intensiva-liso-keratina-1-minute-wow-tresemme-cabello-encrespado-danado-con-keratina-hidrolizada-pro-bond-complex-bote	t
2639	48	1	Ampollas tratamiento intensivo Repara & Protege Pantene cabello dañado	3.90	1.30	l	https://prod-mercadona.imgix.net/images/bd432167b57144afcca6e855bbbf070b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35614/ampollas-tratamiento-intensivo-repara-protege-pantene-cabello-danado-caja	t
2640	48	1	Hidrocrema Liss Frizz Control Deliplus cabello rebelde	2.75	13.75	l	https://prod-mercadona.imgix.net/images/63d46d2ad6fa39a02713d04768413ed4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44284/hidrocrema-liss-frizz-control-deliplus-cabello-rebelde-con-vitamina-queratina-proteccion-termica-230oc-bote	t
2641	48	1	Sérum Be Radiant 10 en 1 Deliplus cabello apagado	4.00	40.00	l	https://prod-mercadona.imgix.net/images/6171e8d5453af5c2cdf954f2660e864e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44289/serum-be-radiant-10-1-deliplus-cabello-apagado-con-aceite-camelia-bote	t
2642	48	1	Sérum Plex Repair Deliplus cabello muy dañado	4.00	40.00	l	https://prod-mercadona.imgix.net/images/eaa6b3e671358aeb9e9554adad450c76.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67796/serum-plex-repair-deliplus-cabello-muy-danado-con-aceite-argan-jojoba-karite-bote	t
2643	48	1	Sérum oil Curl Perfect Deliplus cabello rizado	4.00	40.00	l	https://prod-mercadona.imgix.net/images/fc95936f4a45533daf431eb177e93735.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22632/serum-oil-curl-perfect-deliplus-cabello-rizado-apto-metodo-curly-bote	t
2644	49	1	Tratamiento Anti Frizz Deliplus todo tipo de cabello	4.00	20.00	l	https://prod-mercadona.imgix.net/images/f8c25ba12eafdd39d277b416f3abf1fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60532/tratamiento-anti-frizz-deliplus-tipo-cabello-control-encrespamiento-spray	t
2645	48	1	Sérum Liss Frizz Control Deliplus iluminador	4.00	40.00	l	https://prod-mercadona.imgix.net/images/a7bc0d2b0313877fb3295407303c9b71.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8896/serum-liss-frizz-control-deliplus-iluminador-con-proteccion-termica-bote	t
2646	50	1	Sérum Anticaída Fortificante Deliplus	6.00	60.00	l	https://prod-mercadona.imgix.net/images/b192d59d5e25ddb6f64d46b2caaffa72.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11586/serum-anticaida-fortificante-deliplus-con-ginseng-biotina-cafeina-bote	t
2647	48	1	Laca cabello Nelly	2.50	6.25	l	https://prod-mercadona.imgix.net/images/f22c942ec615c32dd83e6ed1a4cb10b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75210/laca-cabello-nelly-spray	t
2648	48	1	Laca cabello Forte Deliplus fijación 3	1.90	4.75	l	https://prod-mercadona.imgix.net/images/69206f7ae9b5b5e6706fc4b1c42de143.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52693/laca-cabello-flex-deliplus-fijacion-3-spray	t
2649	48	1	Espuma cabello Rizos Definidos Pantene fijación 5	3.80	15.20	l	https://prod-mercadona.imgix.net/images/e4a6858bad86d21193214ecfb6f5d5f0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35328/espuma-cabello-rizos-definidos-pantene-fijacion-5-con-aceite-coco-spray	t
2650	48	1	Laca cabello Normal Deliplus fijación 2	1.90	4.75	l	https://prod-mercadona.imgix.net/images/3321681abed5e2c82da42a631fbffaf0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52684/laca-cabello-suave-deliplus-fijacion-2-spray	t
2651	48	1	Laca cabello Ultra Fuerte Pantene fijación 5	3.80	12.67	l	https://prod-mercadona.imgix.net/images/80b61c92bd094d1ad91678f9f4c22308.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35327/laca-cabello-ultra-fuerte-pantene-fijacion-5-con-aceite-jojoba-spray	t
2652	48	1	Laca cabello Xtra Forte Deliplus fijación 4	1.90	4.75	l	https://prod-mercadona.imgix.net/images/dd35abf51df26c814a1acbb114896a7e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52694/laca-cabello-xtra-forte-deliplus-fijacion-4-spray	t
2653	48	1	Laca cabello Xtra Forte Deliplus fijación 4	1.10	14.67	l	https://prod-mercadona.imgix.net/images/c55516eba6bfdf2751a715637d61e5ec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52695/laca-cabello-xtra-forte-deliplus-fijacion-4-tamano-viaje-spray	t
2654	48	1	Espuma cabello Xtra Forte Deliplus fijación 4	1.90	6.33	l	https://prod-mercadona.imgix.net/images/c847f94da8673900542804758648ed15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9973/espuma-cabello-xtra-forte-deliplus-fijacion-4-bote	t
2655	48	1	Espuma cabello Xtra Forte Deliplus fijación 4	1.65	16.50	l	https://prod-mercadona.imgix.net/images/591a45eadf682bae0b46c2bf90a004fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9974/espuma-cabello-xtra-forte-deliplus-fijacion-4-tamano-viaje-bote	t
2656	48	1	Espuma cabello Rizos Descarados Giorgi fijación 4	3.25	13.00	l	https://prod-mercadona.imgix.net/images/94a89d266bf85a77dca9224ad7a252ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23764/espuma-cabello-rizos-descarados-giorgi-fijacion-4-spray	t
2657	48	1	Espuma cabello Ondas Curly Deliplus fijación 3	1.90	6.33	l	https://prod-mercadona.imgix.net/images/5a85c04ed33944cb98c88aba201df28e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35660/espuma-cabello-ondas-curly-deliplus-fijacion-3-profix-bote	t
2658	51	1	Protector térmico cabello Termo Protect Deliplus	3.00	15.00	l	https://prod-mercadona.imgix.net/images/89cfa6414f496a56d45bb91fbcf56bab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44317/protector-termico-cabello-termo-protect-deliplus-fijacion-1-con-pistola-profix-spray	t
2659	48	1	Agua de peinado cabello Aqua Styling Deliplus	2.10	10.50	l	https://prod-mercadona.imgix.net/images/9182a1bc5ffa4a841f5d7dbcf5e55ad8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44313/agua-peinado-cabello-aqua-styling-deliplus-fijacion-1-profix-spray	t
2660	48	1	Spray cabello Ondas Surfing Deliplus	2.40	12.00	l	https://prod-mercadona.imgix.net/images/94d0d70e4377147e68c55e763febbe71.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46897/spray-cabello-ondas-surfing-deliplus-fijacion-2-profix-spray	t
2661	48	1	Mousse fijador cabello Deliplus fijación 2	2.60	13.00	l	https://prod-mercadona.imgix.net/images/fbdbf7d76a949cd323db77e5f9051a67.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44342/mousse-fijador-cabello-deliplus-fijacion-2-profix-bote	t
2662	48	1	Laca cabello Elnett fijación fuerte	5.95	14.88	l	https://prod-mercadona.imgix.net/images/ba41eb1acee152ed2b2f43969a99928d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75230/laca-cabello-elnett-fijacion-fuerte-loreal-spray	t
2663	48	1	Polvos voluminizador para el cabello Volum Fix Deliplus mate fijación 4	3.75	375.00	kg	https://prod-mercadona.imgix.net/images/c847e4510ad30285f1a9e8af6e18f293.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11933/polvos-voluminizador-cabello-volum-fix-deliplus-mate-fijacion-4-bote	t
2664	48	1	Gel fijador cabello Xtra Forte Deliplus fijación 4	1.60	6.40	l	https://prod-mercadona.imgix.net/images/03ced9a1f31ca4756c0c7578fa82225a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44276/gel-fijador-cabello-xtra-forte-deliplus-fijacion-4-profix-bote	t
2665	48	1	Gel fijador cabello Forte Deliplus fijación 3	1.60	4.00	l	https://prod-mercadona.imgix.net/images/60e5e1c1f424336e3e7f578e42e69ada.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44275/gel-fijador-cabello-forte-deliplus-fijacion-3-profix-bote	t
2666	48	1	Cera cabello Mate Deliplus fijación 4	3.10	31.00	l	https://prod-mercadona.imgix.net/images/f4b244432ad8c7c16511e2444b30330a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14433/cera-cabello-mate-deliplus-fijacion-4-bote	t
2667	48	1	Gel fijador cabello X-trem Deliplus fijación 6	1.60	6.40	l	https://prod-mercadona.imgix.net/images/52b3d2e70a0adff8e7c79f3744e92dfe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44316/gel-fijador-cabello-x-trem-deliplus-fijacion-6-profix-bote	t
2668	48	1	Gel fijador cabello extra fuerte Giorgi fijación 3	3.25	19.12	l	https://prod-mercadona.imgix.net/images/23d0595e9ef7c005fb388830a3fecf0e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23762/gel-fijador-cabello-extra-fuerte-giorgi-fijacion-3-bote	t
2669	48	1	Gel fijador cabello control total Giorgi fijación 5	3.25	19.12	l	https://prod-mercadona.imgix.net/images/1f7e3144e4006e5ee13accc06f8cef5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23763/gel-fijador-cabello-control-total-giorgi-fijacion-5-bote	t
2670	48	1	Cera cabello Brillo Deliplus fijación 4	3.10	31.00	l	https://prod-mercadona.imgix.net/images/5b453bcb4be5cb8e772762f88938679a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35639/cera-cabello-brillo-deliplus-fijacion-4-profix-bote	t
2671	48	1	Gel activador de rizos cabello Curl Perfect Deliplus fix 3	2.80	14.00	l	https://prod-mercadona.imgix.net/images/ffe5c0c75e6f6b5d9be39c77814521cc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23019/gel-activador-rizos-cabello-curl-perfect-deliplus-fix-3-apto-metodo-curly-bote	t
2672	48	1	Gel fijador cabello con aceite de oliva Eco style	2.85	12.08	l	https://prod-mercadona.imgix.net/images/dfd34409aed0c7081962b37853f32869.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13924/gel-fijador-cabello-con-aceite-oliva-eco-style-bote	t
2673	48	1	Coloración permanente 1 negro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/19dfc9dfdf601476608bb8301880ccde.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73182/coloracion-permanente-1-negro-deliplus-colorcor-caja	t
2674	48	1	Coloración permanente 0% amoníaco 1 negro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/272e748b8f5ed9e11a924e05db293767.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73252/coloracion-permanente-1-negro-deliplus-0-amoniaco-colorcor-caja	t
2675	48	1	Coloración permanente 1.0 ultra negro Color Sensation	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/aed52e9b45fee3259e70e838295c0064.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77783/coloracion-permanente-garnier-10-ultra-negro-color-sensation-caja	t
2676	48	1	Coloración permanente 0% amoníaco 1.88 negro azulado intenso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/fc6df7232807e49a487297eb11295462.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73253/coloracion-permanente-188-negro-azulado-intenso-deliplus-0-amoniaco-colorcor-caja	t
2677	48	1	Coloración permanente 2.10 negro azulado Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/c1612215ed4b85731abb10dc86438508.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73149/coloracion-permanente-210-negro-azulado-deliplus-colorcor-caja	t
2678	48	1	Coloración permanente 3 castaño oscuro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/c57ec63ed78f187307959ca18f79aeec.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73150/coloracion-permanente-3-castano-oscuro-deliplus-colorcor-caja	t
2679	48	1	Coloración permanente 0% amoníaco 3 castaño oscuro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e1d20d1b8d99d02fea9ed715635c9815.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73014/coloracion-permanente-3-castano-oscuro-deliplus-0-amoniaco-colorcor-caja	t
2680	48	1	Coloración permanente 3 castaño oscuro Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/9df2ec3f081caa547b8a734ef5ca635a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75301/coloracion-permanente-loreal-3-castano-oscuro-excellence-creme-caja	t
2681	48	1	Mascarilla cabello negro Color Mask	2.10	2.10	l	https://prod-mercadona.imgix.net/images/ba335a1f8f0221a5e8967aeacb49ba8b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35763/mascarilla-cabello-negro-deliplus-caja	t
2682	48	1	Coloración permanente 4 castaño medio Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/34f18e4aed2b80b483cd4ec50ea391fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73195/coloracion-permanente-4-castano-medio-deliplus-colorcor-caja	t
2683	48	1	Coloración permanente 4 castaño 0% amoníaco Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/2f70a9c0f7af79e072d4ae7ea082089e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73255/coloracion-permanente-4-castano-deliplus-0-amoniaco-colorcor-caja	t
2684	48	1	Coloración permanente 4 castaño Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/95e6473f4a8515d10879426556102d4e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75302/coloracion-permanente-loreal-4-castano-excellence-creme-caja	t
2685	48	1	Coloración permanente 4.15 chocolate helado Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/1b60457b19c2b53711cd928ca9022be8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73153/coloracion-permanente-415-chocolate-helado-deliplus-colorcor-caja	t
2686	48	1	Coloración permanente 0% amoníaco 4.15 chocolate helado Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/a0529d6aadb216787fdd7967f362c507.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73256/coloracion-permanente-415-chocolate-helado-deliplus-0-amoniaco-colorcor-caja	t
2687	48	1	Coloración permanente 5 castaño claro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e6d226a65ce6ea35b636f117fe98a439.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73196/coloracion-permanente-5-castano-claro-deliplus-colorcor-caja	t
2688	48	1	Coloración permanente 0% amoníaco 5 castaño claro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/7ea38076571615f05a7d6adbbb24f85c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73257/coloracion-permanente-5-castano-claro-deliplus-0-amoniaco-colorcor-caja	t
2689	48	1	Coloración permanente 5 castaño claro Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/137036002e07540ab6a34bf9e5f0d6ad.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75303/coloracion-permanente-loreal-5-castano-claro-excellence-creme-caja	t
2690	48	1	Coloración permanente 5.0 castaño luminoso Color Sensation	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/42c5fefa8c0710e914a01f08b9c2c0f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77791/coloracion-permanente-garnier-50-castano-luminoso-color-sensation-caja	t
2691	48	1	Coloración permanente 0% amoníaco 5.1 castaño claro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/26b9001a11799835cd3134f411d28630.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22693/coloracion-permanente-51-castano-claro-ceniza-deliplus-0-amoniaco-colorcor-caja	t
2692	48	1	Coloración permanente 0% amoníaco 5.35 chocolate Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/fc2ff5415e619348acc6e7e1b9e3313c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73258/coloracion-permanente-535-chocolate-deliplus-0-amoniaco-colorcor-caja	t
2693	48	1	Coloración permanente 5.35 castaño canela Color Sensatión	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/8993289510006a43b28c2d2ecd782053.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78595/coloracion-permanente-garnier-535-castano-canela-color-sensation-caja	t
2694	48	1	Coloración permanente 5.77 castaño claro marrón intenso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/09b41d441d899dbc1c10a08da57131d9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73159/coloracion-permanente-577-castano-claro-marron-intenso-deliplus-colorcor-caja	t
2695	48	1	Coloración permanente 5.79 marrón chocolate Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/042d816ddc0e71c305592d868ea257b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73160/coloracion-permanente-579-marron-chocolate-deliplus-colorcor-caja	t
2696	48	1	Coloración permanente 6 rubio oscuro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/34bcdfa0414e6d78ad454452a895a7e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73197/coloracion-permanente-6-rubio-oscuro-deliplus-colorcor-caja	t
2697	48	1	Coloración permanente 6 rubio oscuro Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/ce3e66e1918a5eead300bf11e08c16b5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75304/coloracion-permanente-loreal-6-rubio-oscuro-excellence-creme-caja	t
2698	48	1	Coloración permanente 6.0  rubio oscuro Color Sensation	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/4225308f822ab6c168eacf231054f6fb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77794/coloracion-permanente-garnier-60-rubio-oscuro-color-sensation-caja	t
2699	48	1	Coloración permanente 0% amoníaco 6.0 rubio oscuro luminoso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/1711c468ba00e7ee94e227bad660c315.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73260/coloracion-permanente-60-rubio-oscuro-luminoso-deliplus-0-amoniaco-colorcor-caja	t
2700	48	1	Coloración permanente 6.1 rubio oscuro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/04e29a6c5e50fc7a6490ee906904c797.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73162/coloracion-permanente-61-rubio-oscuro-ceniza-deliplus-colorcor-caja	t
2701	48	1	Coloración permanente 0% amoníaco 6.1 rubio oscuro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/d36aced46ec8c4dcfe2a32273418a392.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22694/coloracion-permanente-61-rubio-oscuro-ceniza-deliplus-0-amoniaco-colorcor-caja	t
2702	48	1	Coloración permanente 6.15 marrón macadamia Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/1d7e5458a5443a421d51ee336612601a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73163/coloracion-permanente-615-marron-macadamia-deliplus-colorcor-caja	t
2703	48	1	Coloración permanente 6.25 marrón avellana Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/ff7d9690dae8e134ddd391749994ff4b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73164/coloracion-permanente-625-marron-avellana-deliplus-colorcor-caja	t
2704	48	1	Coloración permanente 0% amoníaco 6.34 caramelo miel Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/6327e986df872c25235c68655e0114ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86414/coloracion-permanente-634-caramelo-miel-deliplus-0-amoniaco-colorcor-caja	t
2705	48	1	Coloración permanente 6.35 marrón caramelo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/9efaf81771f21bdfb239512580953d5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73165/coloracion-permanente-635-marron-caramelo-deliplus-colorcor-caja	t
2706	48	1	Coloración permanente 6.35 rubio caramelo Color Sensation	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/c2e18d05ecb90edd6a95ba9f60ac2559.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77795/coloracion-permanente-garnier-635-rubio-caramelo-color-sensation-caja	t
2707	48	1	Mascarilla cabello chocolate Color Mask	2.10	2.10	l	https://prod-mercadona.imgix.net/images/ec3353c6f60c704d3b6ebcb700372fdf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35769/mascarilla-cabello-chocolate-deliplus-caja	t
2708	48	1	Coloración permanente 7 rubio medio Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e0f4f08d7aeb7bab54fc84bacd5360b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73168/coloracion-permanente-7-rubio-medio-deliplus-colorcor-caja	t
3383	5	23	Arroz redondo ecológico Sos 1 kg.	3.89	3.89	kg	https://static.carrefour.es/hd_350x_/img_pim_food/088559_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-ecologico-sos-1-kg/R-855700480/p	t
2709	48	1	Coloración permanente 0% amoníaco 7 rubio Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/1b931afc7c433e34663a16af06a8b659.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72000/coloracion-permanente-7-rubio-deliplus-0-amoniaco-colorcor-caja	t
2710	48	1	Coloración permanente 7 rubio Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/7cbd5127bed7cec648a3b0b5344cf86c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75305/coloracion-permanente-loreal-7-rubio-excellence-creme-caja	t
2711	48	1	Coloración permanente 0% amoníaco 7.0 rubio medio luminoso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/68c4b8a91b9291868e4d709b02e5383f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73264/coloracion-permanente-70-rubio-medio-luminoso-deliplus-0-amoniaco-colorcor-caja	t
2712	48	1	Coloración permanente 7.1 rubio ceniza Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/2f6e7e97917ab7d67bf5da8abeb212ee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75309/coloracion-permanente-loreal-71-rubio-ceniza-excellence-creme-caja	t
2713	48	1	Coloración permanente 7.1 rubio medio ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e8385a5152df53e7f740d3502c54dbb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73169/coloracion-permanente-71-rubio-medio-ceniza-deliplus-colorcor-caja	t
2714	48	1	Coloración permanente 0% amoníaco 7.1 rubio medio ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/af365f9a43afa782e67ea7a917f58ffe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22695/coloracion-permanente-71-rubio-medio-ceniza-deliplus-0-amoniaco-colorcor-caja	t
2715	48	1	Coloración permanente 7 1/2.1 rubio medio ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/255c617483ca64e9ca91c834cc67ea43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73192/coloracion-permanente-7-121-rubio-medio-ceniza-deliplus-colorcor-caja	t
2716	48	1	Coloración permanente 0% amoníaco 7.13 rubio beige Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/8640f41e1ffc022752e810f449b487c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73265/coloracion-permanente-713-rubio-beige-deliplus-0-amoniaco-colorcor-caja	t
2717	48	1	Coloración permanente 7.3 rubio medio dorado Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/c764dac63f49700dd06bd89bb4f74d3a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73170/coloracion-permanente-73-rubio-medio-dorado-deliplus-colorcor-caja	t
2718	48	1	Coloración permanente 7.31 nude beige Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/a68bc07bd582fac6ff701528dc0cf040.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73198/coloracion-permanente-731-nude-beige-deliplus-colorcor-caja	t
2719	48	1	Coloración permanente 7.77 rubio marrón intenso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/007e8f8b7668445483890c20f38a40e7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73173/coloracion-permanente-777-rubio-marron-intenso-deliplus-colorcor-caja	t
2720	48	1	Coloración permanente 8 rubio claro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/8a1438445d390514915fee7fdf44a64b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73174/coloracion-permanente-8-rubio-claro-deliplus-colorcor-caja	t
2721	48	1	Coloración permanente 8 rubio claro Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/c1e4a8b4f9b5c757e5211ab1b6dea490.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75306/coloracion-permanente-loreal-8-rubio-claro-excellence-creme-caja	t
2722	48	1	Coloración permanente 0% amoníaco 8.0 rubio claro luminoso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/cd1079f3852eddb237877923180d7af3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73268/coloracion-permanente-80-rubio-claro-luminoso-deliplus-0-amoniaco-colorcor-caja	t
2723	48	1	Coloración permanente 8.1 rubio claro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/092dc109c6419f1bb0d1ff109b786e25.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73175/coloracion-permanente-81-rubio-claro-ceniza-deliplus-colorcor-caja	t
2724	48	1	Coloración permanente 0% amoníaco 8.1 rubio claro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/546cd8cffc08c1afadd8a6a9b435749b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22696/coloracion-permanente-81-rubio-claro-ceniza-deliplus-0-amoniaco-colorcor-caja	t
2725	48	1	Coloración permanente 8 1/2.1 rubio claro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e1d10f35a08d14b3669abd9173668973.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73194/coloracion-permanente-8-121-rubio-claro-ceniza-deliplus-colorcor-caja	t
2726	48	1	Coloración permanente 8.3 rubio claro dorado Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/fd22186ed887cfbda65478f3a728950b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73176/coloracion-permanente-83-rubio-claro-dorado-deliplus-colorcor-caja	t
2727	48	1	Coloración permanente 8.31 nude arena Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/ba2c78d296abe21bfec9c2cdbbe0f61c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73199/coloracion-permanente-831-nude-arena-deliplus-colorcor-caja	t
2728	48	1	Coloración permanente 0% amoníaco 8.31 rubio miel Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/559f112f8614b2bd8a217e749d0de89a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73269/coloracion-permanente-831-rubio-miel-deliplus-0-amoniaco-colorcor-caja	t
2729	48	1	Coloración permanente 9 rubio clarísimo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e08db777ff5aeace53e8081b019e38de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73179/coloracion-permanente-9-rubio-clarisimo-deliplus-colorcor-caja	t
2730	48	1	Coloración permanente 0% amoníaco 9.0 rubio muy claro luminoso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/89a8bf3db652a0f61453deb1728d0df2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73272/coloracion-permanente-90-rubio-muy-claro-luminoso-deliplus-0-amoniaco-colorcor-caja	t
2731	48	1	Coloración permanente 9.1 rubio clarísimo ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e581138bbc78c52aae708d7db9579b8d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73180/coloracion-permanente-91-rubio-clarisimo-ceniza-deliplus-colorcor-caja	t
2732	48	1	Coloración permanente 0% amoníaco 9.1 rubio muy claro ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/8e599232e4f72df4b27123ae81c8f0a7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22697/coloracion-permanente-91-rubio-muy-claro-ceniza-deliplus-0-amoniaco-colorcor-caja	t
3470	18	23	Lentejas estilo casero Carretilla 300 g.	2.85	9.50	kg	https://static.carrefour.es/hd_350x_/img_pim_food/727943_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-estilo-casero-carretilla-300-g/R-526517631/p	t
2733	48	1	Coloración permanente 9.3 rubio clarísimo dorado Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/2e3d7da01ef07494f49eadd661a7c2fc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73181/coloracion-permanente-93-rubio-clarisimo-dorado-deliplus-colorcor-caja	t
2734	48	1	Coloración permanente 10 rubio extra claro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/60957bc42a9c9cd892e23fa166f0f4f0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73184/coloracion-permanente-10-rubio-extra-claro-deliplus-colorcor-caja	t
2735	48	1	Coloración permanente 10 rubio muy claro Excellence Creme	8.90	8.90	ud	https://prod-mercadona.imgix.net/images/ab8efe83d5996020ac03552e0796b2d6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/75625/coloracion-permanente-loreal-10-rubio-muy-claro-excellence-creme-caja	t
2736	48	1	Coloración permanente 0% amoníaco 10.0 rubio extra claro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/5d5fc13e3f5542e6347ea9ad0773589b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73273/coloracion-permanente-100-rubio-extra-claro-deliplus-0-amoniaco-colorcor-caja	t
2737	48	1	Mascarilla cabello rubio miel Color Mask	2.10	2.10	l	https://prod-mercadona.imgix.net/images/879618623915610bc580e8e7bf240f85.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35772/mascarilla-cabello-rubio-miel-deliplus-caja	t
2738	48	1	Coloración permanente 100 rubio platino natural Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/904b932443affab5b4998cc8fb440747.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73185/coloracion-permanente-100-rubio-platino-natural-deliplus-colorcor-caja	t
2739	48	1	Coloración permanente 101 rubio platino ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/eeaee616bb4a7a7ebbfecad524f7b9d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73147/coloracion-permanente-101-rubio-platino-ceniza-deliplus-colorcor-caja	t
2740	48	1	Coloración permanente 0% amoníaco 101 rubio platino ceniza Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/00e503a3347ecb028e06d18cfbd5f40b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73274/coloracion-permanente-101-rubio-platino-ceniza-deliplus-0-amoniaco-colorcor-caja	t
2741	48	1	Coloración permanente 110 rubio extra claro ceniza Color Sensation	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/f44022d035ff3ecc5afe942ef5c4f8e5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77799/coloracion-permanente-garnier-110-rubio-extra-claro-ceniza-color-sensation-caja	t
2742	48	1	Coloración permanente 4.5 caoba oscuro Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/9968cdf02f278ef02a2a15994adc427f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73154/coloracion-permanente-45-caoba-oscuro-deliplus-colorcor-caja	t
2743	48	1	Coloración permanente 5.20 violín Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/2c9ca2aec6802e248a2092ba55a16af3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73415/coloracion-permanente-520-violin-deliplus-colorcor-caja	t
2744	48	1	Coloración permanente 0% amoníaco 5.69 violín Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/de84ae3cfd5912eaba1ce1ac2ecf4791.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73259/coloracion-permanente-569-violin-deliplus-0-amoniaco-colorcor-caja	t
2745	48	1	Coloración permanente 6.4 rubio oscuro cobrizo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/ce4be40acc918ffcdf4740460fa6090f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73166/coloracion-permanente-64-rubio-oscuro-cobrizo-deliplus-colorcor-caja	t
2746	48	1	Coloración permanente 0% amoníaco 6.6 rubio oscuro rojizo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/546f7d5ed6226917df6ff8d340fa6283.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73261/coloracion-permanente-0-amoniaco-deliplus-66-rubio-oscuro-rojizo-colorcor-caja	t
2747	48	1	Coloración permanente 6.60 rojo pasión Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/73a4f54848a59a2397d0c47b5c341055.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73167/coloracion-permanente-660-rojo-pasion-deliplus-colorcor-caja	t
2748	48	1	Coloración permanente 6.60 rojo intenso Color Sensation	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/f8a1f977465f36e3b448bdee95b5ab15.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77796/coloracion-permanente-garnier-660-rojo-intenso-color-sensation-caja	t
2749	48	1	Coloración permanente 0% amoníaco 6.74 marrón cobrizo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/5418f8c457de6b05c8e7f71adf255340.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73262/coloracion-permanente-674-marron-cobrizo-deliplus-0-amoniaco-colorcor-caja	t
2750	48	1	Coloración permanente 7.40 rubio cobrizo intenso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/298c32bd8140e4a18b721de797da6ec1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73171/coloracion-permanente-740-rubio-cobrizo-intenso-deliplus-colorcor-caja	t
2751	48	1	Coloración permanente 7.43 cobre cálido Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/e79020481b9158d85e1268ba536a3597.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73172/coloracion-permanente-743-cobre-calido-deliplus-colorcor-caja	t
2752	48	1	Coloración permanente 0% amoníaco 7.44 rubio cobrizo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/3141d3a92d8393b4712cd0c1c1e50b0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73266/coloracion-permanente-744-rubio-cobrizo-deliplus-0-amoniaco-colorcor-caja	t
2753	48	1	Coloración permanente 8.44 rubio claro cobrizo Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/2b8b20b7917c868565aa089accdde74f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73177/coloracion-permanente-844-rubio-claro-cobrizo-deliplus-colorcor-caja	t
2754	48	1	Coloración permanente 8.6 rojo intenso Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/78690815495eef6cac44598a4222e8cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73178/coloracion-permanente-86-rojo-intenso-deliplus-colorcor-caja	t
2755	48	1	Coloración permanente 0% amoníaco 8.66 rojo rubí Colorcor	3.90	3.90	ud	https://prod-mercadona.imgix.net/images/2fff2df2c69de9ae5a5f8fac1c3b44a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73270/coloracion-permanente-866-rojo-rubi-deliplus-0-amoniaco-colorcor-caja	t
2756	48	1	Mascarilla cabello cobre Color Mask	2.10	2.10	ud	https://prod-mercadona.imgix.net/images/1fe31d4be04c2300ba70d5f90bfceadf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35771/mascarilla-cabello-cobre-deliplus-caja	t
2757	48	1	Mascarilla cabello rojo Color Mask	2.10	2.10	l	https://prod-mercadona.imgix.net/images/c4d3914863da0eaa808fd3ee367d5de2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35770/mascarilla-cabello-rojo-deliplus-caja	t
2759	48	1	Tinte cabello hombre 0% amoníaco 3 moreno 4 castaño Colorcor	5.00	5.00	ud	https://prod-mercadona.imgix.net/images/d2986be569802c53005848b55233ff6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35923/tinte-cabello-hombre-3-moreno-4-castano-deliplus-0-amoniaco-colorcor-caja	t
2760	48	1	Tinte cabello hombre 0% amoníaco 5 castaño natural Colorcor	5.00	5.00	ud	https://prod-mercadona.imgix.net/images/ab5922489a0a9e760fb7afdcf51e7d1d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73319/tinte-cabello-hombre-5-castano-natural-deliplus-0-amoniaco-colorcor-caja	t
2761	48	1	Retoca raíces instantáneo negro Magic Retouch	6.10	81.33	l	https://prod-mercadona.imgix.net/images/ddd68b2451ef8c7c1ef72d16308af076.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8795/retoca-raices-instantaneo-loreal-negro-magic-retouch-spray	t
2762	48	1	Retoca raíces instantáneo castaño Magic Retouch	6.10	81.33	l	https://prod-mercadona.imgix.net/images/c291703f8ebf796877a29d158dfb3e58.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8796/retoca-raices-instantaneo-loreal-castano-magic-retouch-spray	t
2763	48	1	Retoca raíces instantáneo castaño caoba Magic retouch	6.10	81.33	l	https://prod-mercadona.imgix.net/images/4f3f9d6a5f170b304973e3b2549967ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8799/retoca-raices-instantaneo-loreal-castano-caoba-magic-retouch-spray	t
2764	48	1	Retoca raíces instantáneo rubio Magic Retouch	6.10	81.33	l	https://prod-mercadona.imgix.net/images/c1ad1b1336f5cba6d40edc577ad40d31.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8798/retoca-raices-instantaneo-loreal-rubio-magic-retouch-spray	t
2765	48	1	Quitamanchas de tinte capilar Deliplus	2.40	28.24	l	https://prod-mercadona.imgix.net/images/df6036aa288272a3ba68b59eea4a08e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35947/quitamanchas-tinte-capilar-deliplus-con-aceite-rosa-mosqueta-bote	t
2766	49	1	Bruma facial multifuncional Make Up Fixer Deliplus	5.50	5.50	l	https://prod-mercadona.imgix.net/images/12c3c91a1afdeea20f1ceb8e0a131543.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16446/bruma-facial-multifuncional-make-up-fixer-deliplus	t
2767	50	1	Vaselina hidratante Deliplus	2.00	20.00	kg	https://prod-mercadona.imgix.net/images/03d022d20f7c59c7686b71445810bb54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77749/vaselina-hidratante-deliplus-tarro	t
2768	50	1	Vaselina perfumada para labios Deliplus frambuesa	1.60	106.67	kg	https://prod-mercadona.imgix.net/images/1b8e86d03fae83d78ce00b7727867c85.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/95730/vaselina-perfumada-labios-deliplus-frambuesa-tarro	t
2769	50	1	Bálsamo reparador labios Deliplus	2.60	173.33	l	https://prod-mercadona.imgix.net/images/7817091b123d312c4687290f0d54a08e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22804/balsamo-reparador-labios-deliplus-con-aloe-vera-vitamina	t
2770	49	1	Rizador de pestañas Deliplus	4.50	4.50	ud	https://prod-mercadona.imgix.net/images/fab044ed98eec39709d38c95e855f7f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13556/rizador-pestanas-deliplus-caja	t
2771	49	1	Kit nude de pinceles ojos Deliplus	5.50	5.50	ud	https://prod-mercadona.imgix.net/images/2353c007845a4a525ebb9fd465af1969.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12955/kit-nude-pinceles-ojos-deliplus-contiene-pincel-difuminador-pincel-sombra-pincel-precision-pincel-duo-caja	t
2772	49	1	Kit nude Esencial Deliplus	3.50	3.50	ud	https://prod-mercadona.imgix.net/images/423a6d63b1256a9327860b30c56414e2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12956/kit-nude-esencial-deliplus-contiene-brocha-polvos-limpiador-pinceles-caja	t
2773	49	1	Aceite árbol del té 100% puro Deliplus con pipeta dosificadora	3.00	300.00	l	https://prod-mercadona.imgix.net/images/532cc6cd619ada2e87a793350a793022.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23017/aceite-arbol-te-100-puro-deliplus-con-pipeta-dosificadora-bote	t
2774	50	1	Colágeno soluble sabor limón Colagen	5.30	21.20	kg	https://prod-mercadona.imgix.net/images/b373e369d67ce9234fcc5cd617cbf5df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35588/colageno-soluble-sabor-limon-colagen-complemento-alimenticio-deliplus-bote	t
2775	15	1	Barritas con proteínas Enervit Sport sabor coco y chocolate	3.60	30.00	kg	https://prod-mercadona.imgix.net/images/1991058d642d7c44258039986faec5af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9445/barritas-con-proteinas-enervit-sport-sabor-coco-chocolate-caja	t
2776	50	1	Comprimidos Vitaminas y Minerales Deliplus	3.00	0.10	kg	https://prod-mercadona.imgix.net/images/a76d83ad146c5d3893731b1ea5023c0e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79621/comprimidos-vitaminas-minerales-deliplus-caja	t
2777	50	1	Comprimidos efervescentes vitamina C y zinc Deliplus sabor limón	1.95	0.10	kg	https://prod-mercadona.imgix.net/images/416bab6bde6f729dfc06b4bfeac42369.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35620/comprimidos-efervescentes-vitamina-c-zinc-deliplus-sabor-limon-tubo	t
2778	28	1	Gel energético con cafeína Enervit Sport sabor cítricos	3.75	40.76	kg	https://prod-mercadona.imgix.net/images/05c6179d3b18ec06e77d176a5889c825.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/28116/gel-energetico-con-cafeina-enervit-sport-sabor-citricos-pack-3	t
2779	50	1	Perlas Omega 3 Deliplus	3.95	0.07	kg	https://prod-mercadona.imgix.net/images/fb166c4e7962e8ff1b6cc8a01a2a6fd0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22986/perlas-omega-3-deliplus-caja	t
2780	50	1	Cápsulas LaxForte Deliplus	3.95	0.13	kg	https://prod-mercadona.imgix.net/images/b1b9139665016cecd9148604ff9ea0ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13797/capsulas-laxforte-deliplus-contiene-sen-cascara-sagrada-elaborado-base-especies-vegetales-aminoacidos-caja	t
2781	50	1	Cápsulas Valeriana Deliplus	4.15	0.07	kg	https://prod-mercadona.imgix.net/images/8fb6a51421d7ffe705431dc11d698ef6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23367/capsulas-valeriana-deliplus-elaborado-base-especies-vegetales-caja	t
2782	50	1	Spray oral Própolis Deliplus	3.60	180.00	l	https://prod-mercadona.imgix.net/images/7b7a1b899876dc2ab66a488f0298037e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22233/spray-oral-propolis-deliplus-contiene-equinacea-eucalipto-elaborado-base-especies-vegetales-liquen-islandia-spray	t
2783	50	1	Sticks Jalea Real y Própolis Deliplus	4.95	0.41	l	https://prod-mercadona.imgix.net/images/0408925318c8ac301c1e74a66f4db061.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79655/sticks-jalea-real-propolis-deliplus-contiene-manuka-hiedra-hinojo-vitamina-c-elaborado-base-miel-aceite-esencial-manuka-extractos-vegetales-caja	t
2784	50	1	Cápsulas Cola de caballo Deliplus	3.85	0.13	kg	https://prod-mercadona.imgix.net/images/90348a62757950642debb3e4be3db505.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13861/capsulas-cola-caballo-deliplus-elaborado-base-especies-vegetales-caja	t
2785	50	1	Cápsulas Alcachofa Deliplus	3.95	0.13	kg	https://prod-mercadona.imgix.net/images/763c4feebbde2ab257d534f3953311d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13796/capsulas-alcachofa-deliplus-elaborado-base-especies-vegetales-caja	t
2786	50	1	Cápsulas Memory Forte Deliplus	3.95	0.13	kg	https://prod-mercadona.imgix.net/images/622d2532c2a9f94344a248af92db2856.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35945/capsulas-memory-forte-deliplus-contiene-bacopa-ashwagandha-gaba-elaborado-base-especies-vegetales-fosfatidilserina-vitaminas-caja	t
2787	50	1	Cápsulas Quemagrasas Deliplus	3.95	0.13	kg	https://prod-mercadona.imgix.net/images/093324a34d82cd8d40d53c131d5a953f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79063/capsulas-quemagrasas-deliplus-elaborado-base-especies-vegetales-vitamina-c-caja	t
2788	50	1	Cápsulas Colagen Antiox piel Deliplus	4.95	0.17	kg	https://prod-mercadona.imgix.net/images/38031028785ecc5203da496d6b8321d0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35943/capsulas-colagen-antiox-piel-deliplus-contiene-colageno-acido-hialuronico-wakame-q10-elaborado-base-especies-vegetales-vitaminas-minerales-caja	t
2789	50	1	Cápsulas Articular Forte Deliplus	4.20	0.14	kg	https://prod-mercadona.imgix.net/images/7f5414ff4911e9af334062cece55ae7d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35944/capsulas-articular-forte-deliplus-contiene-boswellia-ortiga-vitamina-d3-elaborado-base-especies-vegetales-acido-hialuronico-vitaminas-caja	t
2790	50	1	Cápsulas Spirulina + vitamina B12 Deliplus	5.00	0.08	kg	https://prod-mercadona.imgix.net/images/261f87d422a623b7ee129f0674fa4b27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35991/capsulas-spirulina-vitamina-b12-deliplus-caja	t
2791	50	1	Cápsulas Menopausia Deliplus	4.50	0.15	kg	https://prod-mercadona.imgix.net/images/35a3922f8b9ba426b90c3531efde1950.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79704/capsulas-menopausia-deliplus-con-isoflavonas-salvia-melisa-elaborado-base-especies-vegetales-vitaminas-minerales-caja	t
2792	50	1	Comprimidos efervescentes magnesio Deliplus 300 mg sabor naranja	1.95	0.10	kg	https://prod-mercadona.imgix.net/images/baaf70fb06ddd10e54e167a919e8fd2c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79594/comprimidos-efervescentes-magnesio-deliplus-300-mg-sabor-naranja-vitaminas-b1-b6-b12-tubo	t
2793	50	1	Comprimidos cabello y uñas Deliplus	3.95	0.13	kg	https://prod-mercadona.imgix.net/images/38b914b15183bd88b42e6c049c58e155.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52965/comprimidos-cabello-unas-deliplus-contiene-biotina-zinc-caja	t
2794	50	1	Cápsulas Gases Deliplus	4.50	0.15	kg	https://prod-mercadona.imgix.net/images/b8b1e45df6e352e52bc971a7a76c7eff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35880/capsulas-gases-deliplus-contiene-hinojo-manzanilla-jengibre-elaborado-base-especies-vegetales-caja	t
2795	50	1	Cápsulas Probiótico Deliplus	5.95	0.20	kg	https://prod-mercadona.imgix.net/images/d94188b7a400445efd52f09bc4349a8f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52589/capsulas-probiotico-deliplus-contiene-5-variedades-cepas-elaborado-base-microorganismos-fos-caja	t
2796	50	1	Aceite de Ricino Deliplus	3.45	115.00	l	https://prod-mercadona.imgix.net/images/fc6ee2aef0e5948f98ed863f05d48ea9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52590/aceite-ricino-deliplus-nutre-fortalece-contiene-aplicador-bote	t
2797	50	1	Gominolas Regulación del sueño Melatonina Gummies Vitaldin	4.95	0.17	kg	https://prod-mercadona.imgix.net/images/9f5611a7168602a14915eccfe53f2220.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14297/gominolas-regulacion-sueno-melatonina-gummies-vitaldin-contiene-vitamina-b6-extractos-herbales-sabor-mora-bote	t
2798	50	1	Bastoncillos de algodón 100% Deliplus	0.85	0.00	ud	https://prod-mercadona.imgix.net/images/0c122b2667a171618222455899ce5a0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79007/bastoncillos-algodon-100-deliplus-caja	t
2799	50	1	Alcohol 96º Deliplus antiséptico	0.75	3.00	l	https://prod-mercadona.imgix.net/images/890df56ed20035ca9add4a642bcd5c95.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77248/alcohol-96o-deliplus-antiseptico-botella	t
2800	50	1	Agua oxigenada Deliplus desinfectante antiséptico	0.65	2.60	l	https://prod-mercadona.imgix.net/images/87da79c7a7b3c04f21b2132ad8e2948a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77241/agua-oxigenada-deliplus-desinfectante-antiseptico-botella	t
2801	50	1	Solución única para lentes de contacto blandas Deliplus con ácido hialurónico	4.00	11.11	l	https://prod-mercadona.imgix.net/images/d8ddb642a7fa24e828c6d69715b22225.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/33357/solucion-unica-lentes-contacto-blandas-deliplus-con-acido-hialuronico-contiene-estuche-portalentes-bote	t
2802	50	1	Bandas adhesivas fijación fuerte color beige Deliplus para cortar	1.50	0.15	ud	https://prod-mercadona.imgix.net/images/e4f8c4f5a848ff90c6c5e195ac0f364c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79673/bandas-adhesivas-fijacion-fuerte-color-beige-deliplus-cortar-caja	t
2803	50	1	Esparadrapo textil adhesivo resistente color beige Deliplus	1.40	1.40	ud	https://prod-mercadona.imgix.net/images/4aa9ce776a9127b5d2a2ff0b6261d768.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79666/esparadrapo-textil-adhesivo-resistente-color-beige-deliplus-5-m-x-25-cm-caja	t
2804	50	1	Vaselina hidratante Deliplus	2.00	20.00	kg	https://prod-mercadona.imgix.net/images/03d022d20f7c59c7686b71445810bb54.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77749/vaselina-hidratante-deliplus-tarro	t
2805	50	1	Algodón hidrófilo 100% zig-zag hipoalergénico Deliplus	1.20	12.00	kg	https://prod-mercadona.imgix.net/images/7c912d34825b258b4db81cea111b1a97.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12051/algodon-hidrofilo-100-zig-zag-hipoalergenico-deliplus-paquete	t
2806	50	1	Povidona yodada 10% Deliplus	2.15	17.20	l	https://prod-mercadona.imgix.net/images/3b343d40c2d5d63b04401d3e7ef19c5c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35940/povidona-yodada-10-cuidaplus-botella	t
2807	50	1	Alcohol de romero Deliplus	2.00	8.00	l	https://prod-mercadona.imgix.net/images/b1135b4dd25fb2d5a225b519837ddb60.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77322/alcohol-romero-deliplus-botella	t
2808	50	1	Esparadrapo de papel adhesivo microporoso color blanco Deliplus	1.30	1.30	ud	https://prod-mercadona.imgix.net/images/773f16b80c9d08633008f7f4c13d7b00.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79667/esparadrapo-papel-adhesivo-microporoso-color-blanco-deliplus-5-m-x-25-cm-caja	t
2809	50	1	Tiras adhesivas protectoras de espuma acolchado Deliplus protección extra	1.30	1.30	ud	https://prod-mercadona.imgix.net/images/38d6e92932ea5f75d5d782dc79cf1e64.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35734/tiras-adhesivas-protectoras-espuma-acolchado-deliplus-proteccion-extra-caja	t
2810	50	1	Tiras adhesivas protectoras de poliuretano Aqua Deliplus surtidas resistentes al agua	1.30	0.11	ud	https://prod-mercadona.imgix.net/images/160a9b9a017acf1f044008290727bb57.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12779/tiras-adhesivas-protectoras-poliuretano-aqua-deliplus-surtidas-resistentes-agua-caja	t
2811	50	1	Apósitos hidrocoloides adhesivos para ampollas y rozaduras Deliplus surtidos	4.30	0.72	ud	https://prod-mercadona.imgix.net/images/3233c4f6f14b6479de209e1f99714c9e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35735/apositos-hidrocoloides-adhesivos-ampollas-rozaduras-deliplus-surtidos-caja	t
2812	50	1	Venda elástica cohesiva Deliplus fijación fuerte	2.10	2.10	ud	https://prod-mercadona.imgix.net/images/8781445170fec768288c7e7e75bdea52.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79678/venda-elastica-cohesiva-deliplus-fijacion-fuerte-2-m-x-5-cm-caja	t
2813	46	1	Spray repelente fuerte Deliplus antimosquitos	2.75	27.50	l	https://prod-mercadona.imgix.net/images/7b44f52a06d56bfa544130b8bb0029d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52996/spray-repelente-fuerte-deliplus-antimosquitos-spray	t
2814	48	1	Protectores para los oídos de espuma Moldex	1.70	0.43	ud	https://prod-mercadona.imgix.net/images/ed880020917310258121bd0ebdd7874d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22712/protectores-oidos-espuma-moldex-ruido-caja	t
2815	48	1	Lágrimas hidratantes para los ojos Deliplus con hialuronato sódico 0,2%	5.70	0.19	ud	https://prod-mercadona.imgix.net/images/047156c118c7ba89a713eecb169de26e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7895/lagrimas-hidratantes-ojos-deliplus-con-hialuronato-sodico-02-sin-conservantes-caja	t
2816	48	1	Stick de árnica Cata Pum Deliplus	4.00	4.00	l	https://prod-mercadona.imgix.net/images/8385ca3502cd60d049b3c5277ea994c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52740/stick-arnica-cata-pum-deliplus-caja	t
2817	48	1	Gasas esterilizadas de algodón 100% hidrófilo Deliplus	1.20	0.12	ud	https://prod-mercadona.imgix.net/images/3385ce62bd7a37d6424b173f90ee0d74.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79506/gasas-esterilizadas-algodon-100-hidrofilo-deliplus-caja	t
2818	48	1	Spray desinfectante antiséptico transparente Deliplus contiene clorhexidina y digluconato 2%	1.80	36.00	l	https://prod-mercadona.imgix.net/images/b28ab29e53c2a41f806b23a87d9af470.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79438/spray-desinfectante-antiseptico-transparente-deliplus-contiene-clorhexidina-digluconato-2-spray	t
2819	48	1	Toallitas de manos hidroalcohólicas Deliplus 75% Alcohol	1.00	0.07	ud	https://prod-mercadona.imgix.net/images/548bffd0cffb76066bacee754df40f4c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79712/toallitas-manos-hidroalcoholicas-deliplus-75-alcohol-paquete	t
2820	48	1	Mascarillas quirúrgicas Deliplus no reutilizables	1.50	0.15	ud	https://prod-mercadona.imgix.net/images/765167f8170d057b524ba081bef25dce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8945/mascarillas-quirurgicas-deliplus-reutilizables-paquete	t
2821	48	1	Preservativos natural On	3.00	0.25	ud	https://prod-mercadona.imgix.net/images/93aa5a401886c6287851ad16bc75dded.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11606/preservativos-natural-on-caja	t
2822	48	1	Preservativos natural Durex	7.25	0.60	ud	https://prod-mercadona.imgix.net/images/1c8d6b7f1d83d906a8c7ba16a27eb1ba.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/77427/preservativos-natural-durex-caja	t
2823	48	1	Preservativos sensitive On	3.20	0.27	ud	https://prod-mercadona.imgix.net/images/8d1bb4d41d0c7e377dcf342d91b62a2b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11607/preservativos-sensitive-on-caja	t
2824	39	1	Papilla verduritas con merluza Hero Solo +6 meses	1.85	7.87	kg	https://prod-mercadona.imgix.net/images/ff64697398b8e860ec176a9f98a74beb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9280/papilla-verduritas-con-merluza-hero-baby-8-meses-tarrito	t
2825	39	1	Papilla verduritas con pollo y ternera Hero Solo +6 meses	1.85	7.87	kg	https://prod-mercadona.imgix.net/images/e9bc85e5aa1facd74517d87e04e0c175.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9058/papilla-verduritas-con-pollo-ternera-hero-baby-6-meses-tarrito	t
2826	39	1	Papilla arroz con pollo Hero Solo +6 meses	1.85	7.87	kg	https://prod-mercadona.imgix.net/images/75cda11051647ecf75d499fc89309b47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9247/papilla-arroz-con-pollo-hero-baby-6-meses-tarrito	t
2827	39	1	Papilla verduritas con delicias de pavo Hero Solo natur +6 meses	1.85	7.87	kg	https://prod-mercadona.imgix.net/images/62740ad5fe1cf1916602bd1ec18ce5be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9246/papilla-verduritas-con-delicias-pavo-hero-baby-natur-6-meses-tarrito	t
2828	39	1	Papilla zanahorias baby con ternera Hero Solo +6 meses	1.85	7.87	kg	https://prod-mercadona.imgix.net/images/18e45fcbfe8b6177bcfd9e1c09ecc350.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9242/papilla-zanahorias-baby-con-ternera-hero-baby-6-meses-tarrito	t
2829	39	1	Papilla zanahorias con arroz en caldito de pollo Hero Solo +6 meses	1.85	7.87	kg	https://prod-mercadona.imgix.net/images/dcd2dc8aafeaee28d5bee0b6d49b3635.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9259/papilla-zanahorias-con-arroz-caldito-pollo-hero-baby-6-meses-tarrito	t
2830	25	1	Preparado lácteo crecimiento Peques 3 Puleva	11.34	1.89	l	https://prod-mercadona.imgix.net/images/f3cc514aaf94b626490339c53a0f8426.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9049/preparado-lacteo-crecimiento-peques-3-puleva-12-36-meses-pack-6	t
2831	25	1	Preparado lácteo crecimiento Peques 3 Puleva	1.89	1.89	l	https://prod-mercadona.imgix.net/images/d5a1c7fde0736e47b3e5be274f77d7e9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9040/preparado-lacteo-crecimiento-peques-3-puleva-12-36-meses-brick	t
2832	25	1	Preparado lácteo con cereales crecimiento Peques 3 Puleva	11.34	1.89	l	https://prod-mercadona.imgix.net/images/e5e1301ff5e69ab5414099fb56077e0a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9057/preparado-lacteo-con-cereales-crecimiento-peques-3-puleva-12-36-meses-pack-6	t
2833	25	1	Preparado lácteo con cereales crecimiento Peques 3 Puleva	1.89	1.89	l	https://prod-mercadona.imgix.net/images/baacf218d2c86d98e969527f0fc9317a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9034/preparado-lacteo-con-cereales-crecimiento-peques-3-puleva-12-36-meses-brick	t
2834	25	1	Preparado lácteo crecimiento Hacendado +1 año	8.40	1.40	l	https://prod-mercadona.imgix.net/images/ed4e235859bc9c08970385babaa0fdb5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9187/preparado-lacteo-crecimiento-1-ano-hacendado-pack-6	t
2835	25	1	Preparado lácteo crecimiento Hacendado +1 año	1.40	1.40	l	https://prod-mercadona.imgix.net/images/01c077a7a1d4408f51d3b03a924e68fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9188/preparado-lacteo-crecimiento-1-ano-hacendado-brick	t
2836	25	1	Preparado lácteo con cereales crecimiento Hacendado +1 año	9.60	1.60	l	https://prod-mercadona.imgix.net/images/e699a50cc6e2a0cf252768c44dc58ee3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9398/preparado-lacteo-con-cereales-crecimiento-hacendado-1-ano-pack-6	t
2837	25	1	Preparado lácteo con cereales crecimiento Hacendado +1 año	1.60	1.60	l	https://prod-mercadona.imgix.net/images/d20912c3ad645e1e9590a692d4ddce51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9397/preparado-lacteo-con-cereales-crecimiento-hacendado-1-ano-brick	t
2838	39	1	Leche para lactantes en polvo 1 Nativa Nestlé	11.70	14.63	kg	https://prod-mercadona.imgix.net/images/02f1e6f72b9089d00b47a674612ad3ea.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9421/leche-lactantes-polvo-1-nativa-nestle-primer-dia-bote	t
2839	39	1	Leche de continuación en polvo 2 Nativa Nestlé	11.70	14.63	kg	https://prod-mercadona.imgix.net/images/864398e89e2972bc707e121d6603e190.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9407/leche-continuacion-polvo-2-nativa-nestle-6-meses-bote	t
2840	39	1	Leche para lactantes en polvo 1 Nidina Nestlé	14.00	17.50	kg	https://prod-mercadona.imgix.net/images/659ca6174541aafa5986c075159e700a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9420/leche-lactantes-polvo-1-nidina-nestle-primer-dia-bote	t
2841	39	1	Leche de continuación en polvo 2 Nidina Nestlé	17.20	21.50	kg	https://prod-mercadona.imgix.net/images/f83e6cd1354e765bc6b639b2b0feb6ff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9408/leche-continuacion-polvo-2-nidina-nestle-6-meses-bote	t
2842	39	1	Papilla 8 cereales con galleta María Nestlé +6 meses	4.95	6.83	kg	https://prod-mercadona.imgix.net/images/b2a20eb9d74a1a026e1c828bf105a189.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35602/papilla-8-cereales-con-galleta-maria-nestle-6-meses-0-azucares-anadidos-caja	t
2843	39	1	Papilla 8 cereales con miel Nestlé +6 meses	4.95	6.83	kg	https://prod-mercadona.imgix.net/images/2941f526cd91ac7dce5bb5cef92a2df2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35601/papilla-8-cereales-con-miel-nestle-6-meses-caja	t
2844	39	1	Papilla 8 cereales Hero Solo +6 meses	3.90	9.51	kg	https://prod-mercadona.imgix.net/images/133c26ee0d0c0605eae785e98793b7cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9580/papilla-8-cereales-hero-baby-6-meses-0-azucares-anadidos-caja	t
2845	39	1	Papilla sin gluten crema de arroz Hero Solo +4 meses	2.95	13.41	kg	https://prod-mercadona.imgix.net/images/df93989958840997d653077fe5aacace.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9579/papilla-sin-gluten-crema-arroz-hero-baby-4-meses-0-azucares-anadidos-caja	t
2846	40	1	Cambiador multiusos desechable Deliplus	4.15	0.42	ud	https://prod-mercadona.imgix.net/images/4e847d354aa157f815b43a04bb360d5a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60654/cambiador-multiusos-desechable-deliplus-60-x-60-cm-paquete	t
2847	40	1	Pañal bebé braguita talla L de 12-18 kg Deliplus	6.90	0.29	ud	https://prod-mercadona.imgix.net/images/17fda1e099559881bf19e63041d10586.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47038/panal-bebe-braguita-talla-l-12-18-kg-deliplus-paquete	t
2848	40	1	Pañal bebé braguita talla XL de 16-28 kg Deliplus	6.90	0.31	ud	https://prod-mercadona.imgix.net/images/fc15c9b3e552296bd754dc4daefd7aae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47039/panal-bebe-braguita-talla-xl-16-28-kg-deliplus-paquete	t
2849	40	1	Pañal junior braguita noche infantil de 17-30 kg Deliplus	10.65	0.67	ud	https://prod-mercadona.imgix.net/images/ab5ab01394682b55648f53037b863396.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47366/panal-junior-braguita-noche-infantil-deliplus-17-30-kg-4-7-anos-paquete	t
2850	40	1	Pañal junior braguita noche infantil de 27-57 kg Deliplus	10.65	0.82	ud	https://prod-mercadona.imgix.net/images/4ea9010e5edf81ae786b02bb544f270f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47367/panal-junior-braguita-noche-infantil-deliplus-27-57-kg-8-15-anos-paquete	t
2851	40	1	Pañales bebé talla 1 de 2-5 kg Dodot	16.95	0.29	ud	https://prod-mercadona.imgix.net/images/b1713884986ec3fdf02b9d4ab72de256.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11553/panales-bebe-talla-1-2-5-kg-dodot-sensitive-paquete	t
2852	40	1	Pañales bebé talla 2 de 3-6 kg Deliplus	6.90	0.16	ud	https://prod-mercadona.imgix.net/images/32b74db1340368883001409725460657.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13296/panales-bebe-talla-2-3-6-kg-deliplus-paquete	t
2853	40	1	Pañales bebé talla 2 de 4-8 kg Dodot	16.95	0.29	ud	https://prod-mercadona.imgix.net/images/1a9b686285c95bc20666da0111b4de8b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47287/panales-bebe-talla-2-4-8-kg-dodot-sensitive-paquete	t
2854	40	1	Pañales bebé talla 3 de 6-10 kg Dodot	16.95	0.30	ud	https://prod-mercadona.imgix.net/images/34c76a981cf73cd5f76ce557ecd542b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52879/panales-bebe-talla-3-6-10-kg-dodot-sensitive-paquete	t
2855	40	1	Pañales bebé talla 3 de 4-10 kg Deliplus	6.95	0.15	ud	https://prod-mercadona.imgix.net/images/c97344868ee9ad06496e40b9213aca0e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13297/panales-bebe-talla-3-4-10-kg-deliplus-paquete	t
2856	40	1	Pañales bebé talla 1 de 2-4 kg Deliplus	6.60	0.22	ud	https://prod-mercadona.imgix.net/images/abdb0378802a8ef377bd443eb2768c9b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86935/panales-bebe-talla-1-2-4-kg-deliplus-paquete	t
2857	40	1	Pañales bebé talla 4 de 9-15 kg Deliplus	16.95	0.17	ud	https://prod-mercadona.imgix.net/images/fc846b0a4adf91229e839bd3823ec999.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13299/panales-bebe-talla-4-9-15-kg-deliplus	t
2858	40	1	Pañales bebé talla 4 de 9-15 kg Deliplus	5.85	0.17	ud	https://prod-mercadona.imgix.net/images/f1d8616906ae393ff27996c9971bf158.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13298/panales-bebe-talla-4-9-15-kg-deliplus-paquete	t
2859	40	1	Pañales bebé talla 4 de 9-14 kg Dodot	18.95	0.33	ud	https://prod-mercadona.imgix.net/images/61cbc65857c58d92b522811dfb493dd7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35390/panales-bebe-talla-4-9-14-kg-dodot-paquete	t
2860	40	1	Pañales bebé talla 5 de 13-18 kg Deliplus	17.50	0.19	ud	https://prod-mercadona.imgix.net/images/5f5ebb8be4ee3b46b5b3fd1c10b39899.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13321/panales-bebe-talla-5-13-18-kg-deliplus	t
2861	40	1	Pañales bebé talla 5 de 11-16 kg Dodot	18.95	0.35	ud	https://prod-mercadona.imgix.net/images/82be84088a675c464595fafe1ed9c3e4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35391/panales-bebe-talla-5-11-16-kg-dodot-paquete	t
2862	40	1	Pañales bebé talla 6 de 17-28 kg Deliplus	6.30	0.29	ud	https://prod-mercadona.imgix.net/images/018778550cdf1169a730614040f81650.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13324/panales-bebe-talla-6-17-28-kg-deliplus-paquete	t
2863	40	1	Pañales bebé talla 6 de 13-18 kg Dodot	18.95	0.39	ud	https://prod-mercadona.imgix.net/images/fa9232ec794d5cc6f2dc08d7b80b358e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11556/panales-bebe-talla-6-13-18-kg-dodot-paquete	t
2864	40	1	Pañales bebé talla 5 de 13-18 kg Deliplus	6.05	0.20	ud	https://prod-mercadona.imgix.net/images/7d264787f7bb33bcf70a0e5d7933ab4b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13301/panales-bebe-talla-5-13-18-kg-deliplus-paquete	t
2865	40	1	Gel corporal infantil Deliplus	1.80	4.50	l	https://prod-mercadona.imgix.net/images/fdbbecf936992cdf5905ddd730899410.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13064/gel-corporal-infantil-deliplus-bote	t
2866	40	1	Champú infantil Deliplus	1.95	4.88	l	https://prod-mercadona.imgix.net/images/fe2948fb90b0bf4f37d70efade277c09.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13065/champu-infantil-deliplus-con-manzanilla-tila-bote	t
2867	40	1	Pomada del pañal sin perfume Deliplus	2.75	27.50	l	https://prod-mercadona.imgix.net/images/7ab942bb99afc2f8d69ffe1aff623b10.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79344/pomada-panal-sin-perfume-deliplus-tubo	t
2868	40	1	Loción corporal infantil hidratante Deliplus	2.65	6.63	l	https://prod-mercadona.imgix.net/images/7d2f81edf7d83e72154e5df9c21a027d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13066/locion-corporal-infantil-hidratante-deliplus-bote	t
2869	40	1	Bálsamo facial corporal infantil pieles atópicas Deliplus	4.40	22.00	l	https://prod-mercadona.imgix.net/images/4273eb8b305a6d0d851c5111c3cebd8d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52760/balsamo-facial-corporal-infantil-pieles-atopicas-deliplus-bote	t
2870	40	1	Agua de colonia bebé Nenuco	2.85	5.70	l	https://prod-mercadona.imgix.net/images/5ff603934a45cb735217009e38ba9f20.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35516/agua-colonia-bebe-nenuco-botella	t
2871	40	1	Agua de colonia fresca infantil Deliplus con notas cítricas	1.90	3.17	l	https://prod-mercadona.imgix.net/images/13f6228d59a8851dadd8d1bd236d6b9f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8949/agua-colonia-fresca-infantil-deliplus-con-notas-citricas-bote	t
2872	40	1	Agua perfumada bebé con notas florales Deliplus	3.20	32.00	l	https://prod-mercadona.imgix.net/images/f68047d9b7843232e746c6e0c69f0047.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46559/agua-perfumada-bebe-con-notas-florales-deliplus-bote	t
2873	40	1	Gasas para bebé no tejidas Deliplus	1.97	0.02	ud	https://prod-mercadona.imgix.net/images/de6a3878e3ddc47a3d196f29f851b4da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/78132/gasas-bebe-tejidas-deliplus-limpieza-ojos-cara-paquete	t
2874	40	1	Esponja anatómica para bebés Deliplus	1.00	1.00	ud	https://prod-mercadona.imgix.net/images/3639feb5107289f320cc1b30d4eb564d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47489/esponja-anatomica-bebes-deliplus-paquete	t
2875	40	1	Polvos de talco Deliplus	1.80	9.00	kg	https://prod-mercadona.imgix.net/images/77210a9523fbe8ffc08745e67be67f36.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35595/polvos-talco-deliplus-bote	t
2876	40	1	Bastoncillos algodón para bebés Deliplus	1.05	0.02	ud	https://prod-mercadona.imgix.net/images/14c6f53b241eabd431dffae364f87e51.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52856/bastoncillos-algodon-bebes-deliplus-caja	t
2877	40	1	Cepillo limpiabiberón y tetina Deliplus	2.50	2.50	ud	https://prod-mercadona.imgix.net/images/2e1bb94345c07383535f6c898e0eb1b7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79576/cepillo-limpiabiberon-tetina-deliplus-paquete	t
2878	40	1	Limpiador bebé para biberones y tetinas Deliplus	2.90	5.80	l	https://prod-mercadona.imgix.net/images/2cb0eb4b8fb1ef3b778920eccd31ba6b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79501/limpiador-bebe-biberones-tetinas-deliplus-bote	t
2879	40	1	Chupete silicona reversible Deliplus +0 a 6 meses	2.50	2.50	ud	https://prod-mercadona.imgix.net/images/e6ff5f06234c08856dfa65d5a904d1b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79663/chupete-silicona-reversible-0-6-meses-deliplus-paquete	t
2880	40	1	Chupete silicona reversible Deliplus +6 a 18 meses luminiscente	2.50	2.50	ud	https://prod-mercadona.imgix.net/images/0ea9eb3e3aceae8e0b9b3fae630290a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79493/chupete-silicona-reversible-6-18-meses-deliplus-luminiscente-paquete	t
2881	40	1	Chupete silicona reversible Deliplus +18 meses	2.50	2.50	ud	https://prod-mercadona.imgix.net/images/14a14b5c9b1bdf315bfc7363cfa5a439.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79497/chupete-silicona-reversible-18-meses-deliplus-paquete	t
2882	53	1	Paté perro junior Delikuit con ternera y cordero	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/1c5d86e676019e5393757b1baac0a212.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8956/pate-perro-junior-delikuit-con-ternera-cordero-paquete	t
2883	53	1	Paté perro adulto Delikuit con ternera y cordero	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/a870d76611647a899c75d174f00a329c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8955/pate-perro-adulto-delikuit-con-ternera-cordero-paquete	t
2884	53	1	Paté perro adulto Delikuit con salmón y verduras	0.95	3.17	kg	https://prod-mercadona.imgix.net/images/f944a3675865d9462e2eed2b2b34ecd3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70733/pate-perro-adulto-delikuit-con-salmon-verduras-tarrina	t
2885	53	1	Trozos en salsa perro adulto Delikuit con salmón y verduras	0.95	3.17	kg	https://prod-mercadona.imgix.net/images/327619998acebafc86875f36c7c289e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70735/trozos-salsa-perro-adulto-delikuit-con-salmon-verduras-tarrina	t
2886	53	1	Trozos en salsa para perros adultos Quartett con pollo y verduras	2.25	5.63	kg	https://prod-mercadona.imgix.net/images/1f830a7a6b4f85ab3a1ed0c7662d1d88.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60552/trozos-salsa-perros-adultos-quartett-con-pollo-verduras-paquete	t
2887	53	1	Bocaditos en salsa perro adulto Special Dog Excellence con salmón y verduras	1.50	1.22	kg	https://prod-mercadona.imgix.net/images/7cf69a2dd67016694191f93777116a0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9833/bocaditos-salsa-perro-adulto-special-dog-excellence-con-salmon-verduras-bote	t
2888	53	1	Paté perro adulto Delikuit con pollo	1.75	2.19	kg	https://prod-mercadona.imgix.net/images/95aa76d8ac6f0774f5a363e95b4f07db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12900/pate-perro-adulto-delikuit-con-pollo-bote	t
2889	53	1	Mousse con lenguado y salmón gato adulto Delikuit	2.00	5.88	kg	https://prod-mercadona.imgix.net/images/a8a3813be7fed348c745fbbb4c510d43.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15985/mousse-con-lenguado-salmon-gato-adulto-delikuit-caja	t
2890	53	1	Mousse con ternera y pollo gato adulto Delikuit	2.00	5.88	kg	https://prod-mercadona.imgix.net/images/f45fc61a285dc30ae5c6b7c7319cccd6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15984/mousse-con-ternera-pollo-gato-adulto-delikuit-caja	t
2891	53	1	Bocaditos en gelatina gato júnior Delikuit con pollo y pavo	2.50	3.13	kg	https://prod-mercadona.imgix.net/images/cff6be7f5e3bb601884d53db9e25f823.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22007/bocaditos-gelatina-gato-junior-delikuit-con-pollo-pavo-paquete	t
2892	53	1	Bocaditos en gelatina gato adulto Delikuit	2.30	2.88	kg	https://prod-mercadona.imgix.net/images/ca6cab2d8dd92957fc8395bc0c8ed08d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70705/bocaditos-gelatina-gato-adulto-delikuit-contiene-4-con-atun-trucha-verduras-4-con-salmon-bacalo-verduras-caja	t
2893	53	1	Bocaditos en gelatina gato adulto Delikuit	2.30	2.88	kg	https://prod-mercadona.imgix.net/images/5182eda869d4213d3b345404391fed09.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70704/bocaditos-gelatina-gato-adulto-delikuit-contiene-4-con-ternera-higado-verduras-4-con-pato-pollo-verduras-caja	t
2894	53	1	Gelatina gato adulto selección de aves Quartett	1.90	5.59	kg	https://prod-mercadona.imgix.net/images/af2bb28e3b69ec2ebcd7a48fe217c749.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35266/gelatina-gato-adulto-seleccion-aves-quartett-paquete	t
2895	53	1	Gelatina gato adulto selección de pescado Quartett	1.90	5.59	kg	https://prod-mercadona.imgix.net/images/786e674060bdb8273f461d172e20f582.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35267/gelatina-gato-adulto-seleccion-pescado-quartett-paquete	t
2896	53	1	Bocaditos en salsa gato adulto Delikuit esterilizado	3.80	3.17	kg	https://prod-mercadona.imgix.net/images/f334a95b0c8bfcd89253c7ee017ec7fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14915/bocaditos-salsa-gato-adulto-delikuit-esterilizado-contiene-6-con-pavo-salsa-6-con-ternera-salsa-caja	t
2897	53	1	Paté gato júnior Delikuit con pollo y ternera	2.00	5.00	kg	https://prod-mercadona.imgix.net/images/be41e529323283dcb0e5022434446c50.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9888/pate-gato-junior-delikuit-con-pollo-ternera-paquete	t
2898	53	1	Paté gato adulto Delikuit con pollo y ternera	2.00	5.00	kg	https://prod-mercadona.imgix.net/images/fce4116cb323e1de1662f84bd0c4fe10.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9889/pate-gato-adulto-delikuit-con-pollo-ternera-paquete	t
2899	53	1	Paté gato adulto Delikuit con salmón y atún	2.00	5.00	kg	https://prod-mercadona.imgix.net/images/16ead34bec730edce05f2bd9280dc0b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9890/pate-gato-adulto-delikuit-con-salmon-atun-paquete	t
2900	53	1	Paté gato adulto Delikuit con ternera	1.10	2.78	kg	https://prod-mercadona.imgix.net/images/a065d8f41db25ffbcf585540811e1a26.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12899/pate-gato-adulto-delikuit-con-ternera-bote	t
2901	53	1	Aritos perro adulto y sénior Compy	8.30	2.08	kg	https://prod-mercadona.imgix.net/images/446ef36b9a5b3d45d85bb72aa4a2088b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23173/aritos-perro-adulto-senior-compy-razas-medianas-grandes-saco	t
2902	53	1	Mini aritos perro adulto y sénior Compy	4.15	2.77	kg	https://prod-mercadona.imgix.net/images/97045254cf9d4a494a417a69bd73b783.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23172/mini-aritos-perro-adulto-senior-compy-razas-pequenas-paquete	t
2903	53	1	Comida perro adulto Compy original	12.80	0.71	kg	https://prod-mercadona.imgix.net/images/9d65f8669d70fe74f8441cc076458318.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52101/comida-perro-adulto-compy-original-saco	t
2904	53	1	Comida perro sénior esterilizados Supreme Compy pollo fresco con frutas y verduras	6.00	4.00	kg	https://prod-mercadona.imgix.net/images/13fce346978da5bba7251fc4d7dd61ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23171/comida-perro-senior-esterilizados-supreme-compy-pollo-fresco-con-frutas-verduras-razas-pequenas-paquete	t
2905	53	1	Comida perro adulto Supreme Compy salmón fresco con frutas y verduras	26.50	2.65	kg	https://prod-mercadona.imgix.net/images/06855deba17638e02f3d89bbb8d01897.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15981/comida-perro-adulto-supreme-compy-salmon-fresco-con-frutas-verduras-razas-medianas-grandes-saco	t
2906	53	1	Comida perro adulto Supreme Compy salmón fresco con frutas y verduras	10.50	3.50	kg	https://prod-mercadona.imgix.net/images/429f7abe723f184825bd581d2e4cdcd6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15980/comida-perro-adulto-supreme-compy-salmon-fresco-con-frutas-verduras-razas-medianas-grandes-paquete	t
2907	53	1	Comida perro adulto Supreme Compy salmón fresco con frutas y verduras	6.00	4.00	kg	https://prod-mercadona.imgix.net/images/1b14358f5b1ee191fe7720a2e2db971e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15977/comida-perro-adulto-supreme-compy-salmon-fresco-con-frutas-verduras-razas-pequenas-paquete	t
2908	53	1	Comida perro adulto Supreme Compy pollo fresco con frutas y verduras	24.50	2.45	kg	https://prod-mercadona.imgix.net/images/b83cc921c9e362d97363b1f7c8162485.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15979/comida-perro-adulto-supreme-compy-pollo-fresco-con-frutas-verduras-razas-medianas-grandes-saco	t
2909	53	1	Comida perro adulto Supreme Compy pollo fresco con frutas y verduras	9.50	3.17	kg	https://prod-mercadona.imgix.net/images/bde2b24e27567b9eb706c59c34ea3e75.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15978/comida-perro-adulto-supreme-compy-pollo-fresco-con-frutas-verduras-razas-medianas-grandes-paquete	t
2910	53	1	Comida perro adulto Supreme Compy pollo fresco con frutas y verduras	5.25	3.50	kg	https://prod-mercadona.imgix.net/images/8e95110dc5b64b20479426779400374f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15976/comida-perro-adulto-supreme-compy-pollo-fresco-con-frutas-verduras-razas-pequenas-paquete	t
2911	53	1	Ministick dental perro adulto Compy	2.20	8.80	kg	https://prod-mercadona.imgix.net/images/da3f038cad0acfdea0c4acb24bc5fcb1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52139/ministick-dental-perro-adulto-compy-razas-pequenas-paquete	t
2912	53	1	Stick dental perro adulto con menta Compy	1.75	8.41	kg	https://prod-mercadona.imgix.net/images/e1709e81afca84d53b8c28cfc81f6e0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23812/stick-dental-perro-adulto-con-menta-compy-razas-medianas-grandes-paquete	t
2913	53	1	Huesos de cuero con pollo y zanahoria Compy perro adulto	1.75	14.58	kg	https://prod-mercadona.imgix.net/images/f29862bc2c2f87459f3d760d0abfa29c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13494/huesos-cuero-con-pollo-zanahoria-compy-perro-adulto-razas-medianas-grandes-paquete	t
2914	53	1	Hueso dental perro adulto sabor menta y perejil Compy	1.75	9.11	kg	https://prod-mercadona.imgix.net/images/793831d6e778e16446535abe44706c55.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52143/hueso-dental-perro-adulto-sabor-menta-perejil-compy-paquete	t
2915	53	1	Bolsas para residuos caninos Nuske Doggy bags	1.30	0.03	ud	https://prod-mercadona.imgix.net/images/8ef33001c04f5a1e3247cf5d3381b7b4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49760/bolsas-residuos-caninos-kordis-doggy-bags-paquete	t
2916	53	1	Champú perros y gatos con aloe vera Nuske efecto repelente	3.50	11.29	l	https://prod-mercadona.imgix.net/images/63287eedb880186ac90e2198a398d79d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8925/champu-perros-gatos-con-aloe-vera-nuske-efecto-repelente-botella	t
2917	53	1	Arena para gato antibacterias Nuske	1.50	0.30	kg	https://prod-mercadona.imgix.net/images/2391d7974190920d576ab7490642803e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90080/arena-gato-antibacterias-nuske-paquete	t
2918	53	1	Arena para gato aglomerante Nuske perfumada	3.75	0.75	kg	https://prod-mercadona.imgix.net/images/f21119185ae69c41e0705585fa3b2b3a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13658/arena-gato-aglomerante-nuske-perfumada-caja	t
2919	53	1	Arena para gato de perlas sílice Single	3.55	0.89	l	https://prod-mercadona.imgix.net/images/835c249bc054d7ae1c7f4cf171544c08.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90947/arena-gato-perlas-silice-single-paquete	t
2920	53	1	Malta para gato Natura con queso	4.00	40.00	kg	https://prod-mercadona.imgix.net/images/2baa4a05a71339b0772b83fd3ed330bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52098/malta-gato-natura-con-queso-tubo	t
2921	53	1	Champú perros y gatos con aloe vera Nuske efecto repelente	3.50	11.29	l	https://prod-mercadona.imgix.net/images/63287eedb880186ac90e2198a398d79d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8925/champu-perros-gatos-con-aloe-vera-nuske-efecto-repelente-botella	t
2922	53	1	Alimento completo para periquitos Granzoo	1.90	1.90	kg	https://prod-mercadona.imgix.net/images/56f2799b4a49b45c460e415561f017ba.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/38131/alimento-completo-periquitos-granzoo-paquete	t
2923	53	1	Barritas de fruta y miel para periquitos Natura	2.30	25.56	kg	https://prod-mercadona.imgix.net/images/6da035abb410607af8753a8f6d3a7603.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/38145/barritas-fruta-miel-periquitos-natura-caja	t
2924	53	1	Alimento completo para canarios y jilgueros Granzoo	1.88	1.88	kg	https://prod-mercadona.imgix.net/images/7e208005ab1342ff5918424b0fc8c3bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/38130/alimento-completo-canarios-jilgueros-granzoo-paquete	t
2925	53	1	Barritas de fruta y miel para canarios Natura	2.30	25.56	kg	https://prod-mercadona.imgix.net/images/dd343c75df218a9df5ee874d4278bfbf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/38111/barritas-fruta-miel-canarios-natura-caja	t
2926	53	1	Alimento completo para loros y cotorras Granzoo	3.30	4.71	kg	https://prod-mercadona.imgix.net/images/830c1868d06cf27957268bb469a8389c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/38220/alimento-completo-loros-cotorras-granzoo-paquete	t
2927	53	1	Alimento completo para ninfa y agaporni Granzoo	1.85	2.31	kg	https://prod-mercadona.imgix.net/images/ceca49751989999975457baa23d7edaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13646/alimento-completo-ninfa-agaporni-granzoo-paquete	t
2928	47	1	Detergente ropa jabón natural de Marsella Bosque Verde líquido	3.40	1.13	l	https://prod-mercadona.imgix.net/images/ce125c37c76010be23a65a2f588c076a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86397/detergente-ropa-jabon-natural-marsella-bosque-verde-liquido-botella	t
2929	47	1	Detergente ropa Blanca y de Color Bosque Verde en gel concentrado	3.35	4.14	l	https://prod-mercadona.imgix.net/images/d7d3cf05c5162a35ed107bc310f505a0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40404/detergente-ropa-blanca-color-bosque-verde-gel-concentrado-botella	t
2930	47	1	Detergente ropa de Color Bosque Verde líquido	4.40	1.47	l	https://prod-mercadona.imgix.net/images/294613f06de31979a209314d0fe409d1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40537/detergente-ropa-color-bosque-verde-liquido-botella	t
2931	47	1	Detergente ropa Blanca y de Color Bosque Verde líquido	5.65	1.88	l	https://prod-mercadona.imgix.net/images/425dec7ec4f37d38dfa1380f1e292637.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86400/detergente-ropa-blanca-color-bosque-verde-liquido-botella	t
2932	47	1	Detergente ropa Prendas Delicadas Bosque Verde líquido	2.50	1.26	l	https://prod-mercadona.imgix.net/images/9797257703d2e4f77d7d846efbcd84e6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40530/detergente-ropa-prendas-delicadas-bosque-verde-liquido-botella	t
2933	47	1	Detergente ropa Ariel líquido	5.95	4.56	l	https://prod-mercadona.imgix.net/images/4c73ffd9c3bfeb2275c2c829740c87af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16830/detergente-ropa-total-ariel-liquido-botella	t
2934	47	1	Detergente ropa Pieles Sensibles Bosque Verde líquido	4.80	2.42	l	https://prod-mercadona.imgix.net/images/e0c6bf972b3f52f80cbdff23d108586d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13643/detergente-ropa-pieles-sensibles-bosque-verde-liquido-botella	t
2935	47	1	Detergente ropa colada mixta Micolor en gel	5.95	4.72	l	https://prod-mercadona.imgix.net/images/d2fe09165db835922138be22d01803e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14946/detergente-ropa-colada-mixta-micolor-gel-botella	t
2936	47	1	Detergente ropa oscura Bosque Verde líquido	4.00	2.05	l	https://prod-mercadona.imgix.net/images/a6ac6ad815962f15f684f2c134ca60c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40573/detergente-ropa-oscura-bosque-verde-liquido-botella	t
2937	47	1	Desinfectante Tejidos y Lavadora Bosque Verde sin lejía	2.10	2.10	l	https://prod-mercadona.imgix.net/images/e12b22b9d1d9c4b77dc2741d17a92166.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40567/desinfectante-tejidos-lavadora-bosque-verde-sin-lejia-botella	t
2938	47	1	Detergente ropa Colonia Hipoalergénico Bosque Verde líquido	3.40	1.13	l	https://prod-mercadona.imgix.net/images/d8d69f071387be7f553362f46163dfda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86399/detergente-ropa-colonia-hipoalergenico-bosque-verde-liquido-botella	t
2939	47	1	Detergente ropa blanca y de color Bosque Verde en polvo	6.65	2.42	kg	https://prod-mercadona.imgix.net/images/c75203fbc5e74f0715cf4be74bf8707e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14270/detergente-ropa-blanca-color-bosque-verde-polvo-contiene-dosificador-caja	t
3471	20	23	Espárragos verdes Classic Carrefour 190 g.	2.85	15.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/182325_00_1.jpg	https://www.carrefour.es/supermercado/esparragos-verdes-classic-carrefour-190-g/R-871005020/p	t
2940	47	1	Detergente ropa todo en 1 Ariel Pods en cápsulas	6.90	0.38	kg	https://prod-mercadona.imgix.net/images/b6638a1df050dc42bf9e5546efc52f6e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52553/detergente-ropa-all-in-1-ariel-pods-capsulas-lavadora-caja	t
2941	47	1	Detergente ropa todo en 1 frescor floral Ariel Pods en cápsulas	6.90	0.36	kg	https://prod-mercadona.imgix.net/images/ac78c0a8f08e2ff7e0d1a5f054bbcba3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16442/detergente-ropa-1-frescor-floral-ariel-pods-capsulas-caja	t
2942	47	1	Detergente ropa jabón de Marsella Bosque Verde en polvo	5.65	2.05	kg	https://prod-mercadona.imgix.net/images/9bd953189306103748aaec9fe8d1097c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14271/detergente-ropa-jabon-marsella-bosque-verde-polvo-contiene-dosificador-caja	t
2943	47	1	Detergente Lavado a Mano Bosque Verde en polvo	1.90	2.92	kg	https://prod-mercadona.imgix.net/images/aaeaf34a357f844bb096a7b6ce32767e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52752/detergente-lavado-mano-bosque-verde-polvo-caja	t
2944	47	1	Jabón Natural con glicerina Bosque Verde	1.85	4.63	kg	https://prod-mercadona.imgix.net/images/49889e4d79b71f6c50be183b72b20810.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13607/jabon-natural-con-glicerina-bosque-verde-paquete	t
2945	47	1	Eliminador de olores tejidos Bosque Verde	1.70	3.40	l	https://prod-mercadona.imgix.net/images/a6623927ae2dd17358d7472870a30b80.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40552/eliminador-olores-higienizante-tejidos-bosque-verde-con-pistola-botella	t
2946	41	1	Toallitas lavadora Bosque Verde anti-transferencia de color	1.85	0.09	ud	https://prod-mercadona.imgix.net/images/cac1a7c079067259c478c509671ceead.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79083/toallitas-lavadora-bosque-verde-accion-2-1-anti-transferencia-color-paquete	t
2947	47	1	Jabón blando 100% natural Beltrán quitamanchas	2.90	5.80	kg	https://prod-mercadona.imgix.net/images/97c7d48aba7d278b20c1c76e7c31d8dc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40135/jabon-blando-natural-beltran-bote	t
2948	41	1	Disuelve manchas Bosque Verde	1.90	2.53	l	https://prod-mercadona.imgix.net/images/305820ba25da1d91195a04b84c8f88a6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40178/disuelve-manchas-bosque-verde-con-pistola-botella	t
2949	41	1	Pastillas antical para lavadora Bosque Verde	3.25	0.08	ud	https://prod-mercadona.imgix.net/images/eacb45c5370af64fcc829c252c2331d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35980/pastillas-antical-lavadora-bosque-verde-caja	t
2950	41	1	Activador Quitamanchas ropa de color Oxi Active Bosque Verde en polvo	3.10	3.10	kg	https://prod-mercadona.imgix.net/images/897dec3caf09f976da529c45a3b7ea90.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40317/activador-quitamanchas-ropa-color-oxi-active-bosque-verde-polvo-con-oxigeno-activo-bote	t
2951	41	1	Activador Blanqueante ropa blanca Oxi Active Bosque Verde en polvo	3.10	3.10	kg	https://prod-mercadona.imgix.net/images/9beeaafc75d836d9621d939ebf93a97e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40315/activador-blanqueante-ropa-blanca-bosque-verde-polvo-con-oxigeno-activo-bote	t
2952	41	1	Activador Quitamanchas ropa de color Oxi Active Bosque Verde líquido	1.75	0.88	l	https://prod-mercadona.imgix.net/images/dd3f517dde1bb097a451cf1ae7087225.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40233/activador-lavado-ropa-color-oxi-active-bosque-verde-gel-con-oxigeno-activo-botella	t
2953	41	1	Activador Blanqueante ropa blanca Oxi Active Bosque Verde líquido	1.75	0.88	l	https://prod-mercadona.imgix.net/images/54664d21e4042fb53849340644453038.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40230/activador-lavado-ropa-blanca-oxi-active-bosque-verde-gel-botella	t
2954	41	1	Percarbonato blanqueante Bosque Verde	1.65	2.20	kg	https://prod-mercadona.imgix.net/images/4eeed51e4f131ac1a777f20b6a1a6015.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15679/percarbonato-blanqueante-bosque-verde-paquete	t
2955	41	1	Limpia lavadoras Bosque Verde líquido	1.95	7.80	l	https://prod-mercadona.imgix.net/images/fa018d0d91390102fee83c50e35049aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13678/limpia-lavadoras-bosque-verde-liquido-botella	t
2956	47	1	Suavizante ropa Azul Bosque Verde concentrado	1.80	1.13	l	https://prod-mercadona.imgix.net/images/7ba82fe12606fbea55210671392285d5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14122/suavizante-ropa-azul-bosque-verde-concentrado-botella	t
2957	47	1	Suavizante ropa Talco Bosque Verde concentrado	1.80	1.13	l	https://prod-mercadona.imgix.net/images/d2ff070519163e2e1bb174f18664dbeb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14163/suavizante-ropa-talco-bosque-verde-concentrado-botella	t
2958	47	1	Suavizante ropa Spa Bosque Verde concentrado	1.80	1.13	l	https://prod-mercadona.imgix.net/images/b3b71f5a7b09eb48f8a038603c03791c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14165/suavizante-ropa-spa-bosque-verde-concentrado-botella	t
2959	47	1	Suavizante ropa Floral Bosque Verde concentrado	1.80	1.13	l	https://prod-mercadona.imgix.net/images/92c27a197b41c050112a41a76833a785.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14148/suavizante-ropa-floral-bosque-verde-concentrado-botella	t
2960	47	1	Suavizante ropa Hipoalergénico Colonia Bosque Verde concentrado	1.80	1.13	l	https://prod-mercadona.imgix.net/images/d2cbedbc71a3c689e6554904dd78f083.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14170/suavizante-ropa-hipoalergenico-colonia-bosque-verde-concentrado-botella	t
2961	41	1	Perfumador ropa Bosque Verde intensificador de fragancia	3.15	4.38	l	https://prod-mercadona.imgix.net/images/eafe95f619a08f57d0e050eecf824710.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40752/perfumador-ropa-bosque-verde-intensificador-fragancia-botella	t
2962	47	1	Suavizante ropa Violets Bosque Verde concentrado	1.80	1.13	l	https://prod-mercadona.imgix.net/images/f79288843d6ba82534acf08c3195fc40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11661/suavizante-ropa-violets-bosque-verde-concentrado-botella	t
2963	41	1	Agua destilada Bosque Verde	0.90	0.45	l	https://prod-mercadona.imgix.net/images/97a14ac137b896e603ef688f2efccd6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90505/agua-destilada-bosque-verde-garrafa	t
2964	41	1	Agua para plancha Bosque Verde perfume ropa limpia	1.50	1.50	l	https://prod-mercadona.imgix.net/images/56e716e04c1c57d3bb5ab98657d35875.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44413/agua-plancha-bosque-verde-perfume-ropa-limpia-botella	t
2965	41	1	Planchado fácil Bosque Verde	2.20	2.93	l	https://prod-mercadona.imgix.net/images/d1ef88df67282223ca7f07085a0d5413.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44404/planchado-facil-bosque-verde-con-pistola-botella	t
2966	41	1	Lavavajillas Ultra concentrado Bosque Verde	1.90	1.46	l	https://prod-mercadona.imgix.net/images/30ccd8015874b0d2ed7b3b5b87a8cd25.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35998/lavavajillas-ultra-concentrado-bosque-verde-lavado-mano-botella	t
2967	41	1	Lavavajillas Ultra concentrado Bosque Verde	1.10	1.83	l	https://prod-mercadona.imgix.net/images/3b0fbbfda78fa4884ca20f5416c993a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35997/lavavajillas-ultra-concentrado-bosque-verde-lavado-mano-botella	t
2968	41	1	Lavavajillas Ultra Original Fairy líquido	3.95	4.39	l	https://prod-mercadona.imgix.net/images/5edbbd0a4e91886aa71a3c1f622cbcb7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42135/lavavajillas-ultra-original-fairy-liquido-lavado-mano-botella	t
2969	41	1	Lavavajillas Aloe Bosque Verde concentrado	1.80	1.80	l	https://prod-mercadona.imgix.net/images/687795500e63d9effd25ec16e423d78d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13644/lavavajillas-aloe-bosque-verde-concentrado-lavado-mano-botella	t
2970	41	1	Lavavajillas Aloe Vera y Pepino Fairy líquido	2.50	3.85	l	https://prod-mercadona.imgix.net/images/baefe04b5a18fe7ee06e0c1811b55a8d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86329/lavavajillas-aloe-vera-pepino-fairy-liquido-lavado-mano-botella	t
2971	41	1	Limpiador de Ollas y Cacerolas Bosque Verde	1.90	7.60	l	https://prod-mercadona.imgix.net/images/abd5b06a8db2fdc04afff6df3a85862b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35963/limpiador-ollas-cacerolas-bosque-verde-bote	t
2972	41	1	Lavavajillas Todo en 1 Bosque Verde en pastillas	2.95	0.10	kg	https://prod-mercadona.imgix.net/images/13b4aa8b101159645eecf432acff03a9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42384/lavavajillas-1-bosque-verde-pastillas-lavado-maquina-paquete	t
2973	41	1	Sal lavavajillas Bosque Verde en grano	0.95	0.48	kg	https://prod-mercadona.imgix.net/images/2561ed0e8a1ddc85955b781f5b1299b0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35504/sal-lavavajillas-bosque-verde-grano-paquete	t
2974	41	1	Abrillantador lavavajillas líquido Bosque Verde	1.20	1.60	l	https://prod-mercadona.imgix.net/images/61cc1dbab75ccc62b3297d5563e3c399.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42314/abrillantador-lavavajillas-liquido-bosque-verde-botella	t
2975	41	1	Lavavajillas Todo en 1 Fairy en pastillas	5.85	0.17	kg	https://prod-mercadona.imgix.net/images/a16d1bd70b91f533925dd3b3cc2e0303.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12076/lavavajillas-1-fairy-pastillas-lavado-maquina-paquete	t
2976	41	1	Lavavajillas Bosque Verde en gel	3.45	4.79	l	https://prod-mercadona.imgix.net/images/5e088b30edbe7f6f70920172db6fda8f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35575/lavavajillas-bosque-verde-gel-lavado-maquina-botella	t
2977	41	1	Lavavajillas Todo en 1 Bosque Verde en pastillas	2.95	0.10	kg	https://prod-mercadona.imgix.net/images/44394e4e72f1e5ea21478c01ca30f9f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42385/lavavajillas-classic-bosque-verde-pastillas-lavado-maquina-paquete	t
2978	41	1	Limpiamáquinas lavavajillas líquido Bosque Verde	1.55	6.20	l	https://prod-mercadona.imgix.net/images/eae06924feb4b33c7a3645dc928ceebc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42318/limpiamaquinas-lavavajillas-liquido-bosque-verde-botella	t
2979	42	1	Ambientador lavavajillas Limón Bosque Verde	1.50	1.50	ud	https://prod-mercadona.imgix.net/images/3f744e4aef59b0d0eaffa14c4cbe6247.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43058/ambientador-lavavajillas-limon-bosque-verde-paquete	t
2980	41	1	Limpiamáquinas lavavajillas Finish líquido	2.95	11.80	l	https://prod-mercadona.imgix.net/images/8342b5b29b6a4ad09c4aeed01883a0fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42371/limpiamaquinas-lavavajillas-finish-liquido-botella	t
2981	41	1	Abrillantador lavavajillas líquido Finish	3.95	9.88	l	https://prod-mercadona.imgix.net/images/909bb57b28f58a5c6129d87ceb5790da.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86652/abrillantador-lavavajillas-liquido-essential-finish-botella	t
2982	41	1	Lavavajillas frescor anti-olor Somat en gel duo	4.95	8.59	l	https://prod-mercadona.imgix.net/images/cd0a4370f14af4c0be7bb22171f5e277.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86379/lavavajillas-frescor-anti-olor-somat-gel-duo-lavado-maquina-botella	t
2983	41	1	Lavavajillas Power Essential limón Finish en pastillas	3.75	0.14	kg	https://prod-mercadona.imgix.net/images/667b3a38b2f8367477e9b16c3b619810.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86653/lavavajillas-power-essential-limon-finish-pastillas-lavado-maquina-caja	t
2984	41	1	Lavavajillas Ultra Todo en 1 Fairy en pastillas	3.95	0.20	kg	https://prod-mercadona.imgix.net/images/5d8e5bc6293ca1e62168466a9951c141.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86380/lavavajillas-ultra-1-fairy-pastillas-lavado-maquina-paquete	t
2985	41	1	Quitagrasas Bosque Verde perfume Marsella	1.50	2.00	l	https://prod-mercadona.imgix.net/images/6a855e64ebdb0f85dfd88939bb43c336.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43914/quitagrasas-bosque-verde-perfume-marsella-con-pistola-botella	t
2986	41	1	Quitagrasas KH-7	3.70	4.74	l	https://prod-mercadona.imgix.net/images/afe472e40a5cdce8cd51b3db3ecdf15d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23801/quitagrasas-kh-7-con-pistola-botella	t
2987	41	1	Toallitas limpiadoras desengrasantes de Cocina Bosque Verde	1.30	0.03	ud	https://prod-mercadona.imgix.net/images/92d5bc169085d0f92660ed0cb56ea37a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43935/toallitas-limpiadoras-desengrasantes-cocina-bosque-verde-paquete	t
2988	41	1	Limpiador de Hornos Bosque Verde	1.35	4.50	l	https://prod-mercadona.imgix.net/images/eb12e866b8644b2ca933b8883d400231.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44210/limpiador-hornos-bosque-verde-spray	t
2989	41	1	Limpiador Vitrocerámicas Bosque Verde 3 en 1	1.70	3.40	l	https://prod-mercadona.imgix.net/images/d8cbad586a8159856a1d369cc465f693.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44000/limpiador-vitroceramicas-bosque-verde-3-1-botella	t
2990	41	1	Limpiador Placas de Inducción Bosque Verde líquido	1.75	3.50	l	https://prod-mercadona.imgix.net/images/5ef5166d6b6cf3d2c86386150c942737.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44215/limpiador-placas-induccion-bosque-verde-liquido-3-1-con-pistola-botella	t
2991	41	1	Crema limpiadora Vitrocerámicas Vitroclen 5 en 1	4.90	11.67	l	https://prod-mercadona.imgix.net/images/ddd76867325a12438e3ad6a68fb0e143.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13633/crema-limpiadora-vitroceramicas-vitroclen-5-1-botella	t
2992	41	1	Rasqueta Vitrocerámicas Bosque Verde	3.25	3.25	ud	https://prod-mercadona.imgix.net/images/b34c3e6afdfb8079c6fa910f76dfb697.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9795/rasqueta-vitroceramicas-bosque-verde-contiene-5-recambios-paquete	t
2993	41	1	Limpiador desincrustante y chimeneas Bosque Verde	3.55	4.73	l	https://prod-mercadona.imgix.net/images/37eed54529d21e97fa80b439505c6527.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44232/limpiador-desincrustante-chimeneas-bosque-verde-con-pistola-botella	t
2994	41	1	Limpiador WC con lejía Bosque Verde en gel	0.95	0.95	l	https://prod-mercadona.imgix.net/images/1b142bc3421384906c340bee5e2a9b98.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43113/limpiador-wc-con-lejia-bosque-verde-gel-botella	t
2995	41	1	Limpiador Baños Bosque Verde en gel	1.45	0.97	l	https://prod-mercadona.imgix.net/images/cace544e66f97684af31ab8f8866926a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43496/limpiador-banos-bosque-verde-gel-botella	t
2996	42	1	Colgador WC Azul perfume marino Bosque Verde	1.25	15.63	kg	https://prod-mercadona.imgix.net/images/92123675a6e17897648463b65ed2a191.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43474/colgador-wc-azul-perfume-marino-bosque-verde-triple-accion-paquete	t
2997	41	1	Limpiador Antical Bosque Verde	1.60	2.13	l	https://prod-mercadona.imgix.net/images/43e98df421a6232d6126bfe0702ae5ef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43025/limpiador-antical-bosque-verde-con-pistola-botella	t
2998	41	1	Colgador WC Azul limpieza activa Bosque Verde	1.25	15.63	kg	https://prod-mercadona.imgix.net/images/da7803a87e1a2a18588249dc80366124.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43484/colgador-wc-azul-limpieza-activa-bosque-verde-triple-accion-paquete	t
2999	41	1	Limpiador WC Flor de Cerezo Bosque Verde en gel	1.15	1.15	l	https://prod-mercadona.imgix.net/images/4cc007813f1d1db3f4f45816c4633635.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42203/limpiador-wc-flor-cerezo-bosque-verde-gel-botella	t
3000	41	1	Limpiador Baños desinfectante Bosque Verde	1.55	2.07	l	https://prod-mercadona.imgix.net/images/63e7053501dba27c7a449a511fd8a5bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43089/limpiador-banos-desinfectante-bosque-verde-con-pistola-botella	t
3001	41	1	Toallitas limpiadoras de baños Bosque Verde	1.30	0.03	ud	https://prod-mercadona.imgix.net/images/5a57b9bc73d3bc5b552a93ea31f8d93b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43482/toallitas-limpiadoras-banos-bosque-verde-paquete	t
3002	41	1	Limpiador WC Desincrustante Bosque Verde en gel	1.65	1.65	l	https://prod-mercadona.imgix.net/images/fe5423e0722bd05495d115f651839d47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43028/limpiador-wc-desincrustante-bosque-verde-gel-botella	t
3003	41	1	Limpiador Ducha Bosque Verde	2.10	2.10	l	https://prod-mercadona.imgix.net/images/74edf4ce6378bec43caa3e6715a0f5b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43421/limpiador-ducha-bosque-verde-con-pistola-botella	t
3004	41	1	Limpiador WC Polvo Activo Bosque Verde	1.80	7.50	kg	https://prod-mercadona.imgix.net/images/6ac916429f3e573c2cd20ed9084dd6f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52650/limpiador-wc-polvo-activo-bosque-verde-caja	t
3005	41	1	Colgador WC Power Activ Pino Bref	2.95	29.50	kg	https://prod-mercadona.imgix.net/images/db6f1f95abbb9cf91f7bba299703cdbb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35926/colgador-wc-power-activ-pino-bref-paquete	t
3006	41	1	Colgador WC Maxigotas Spa Bosque Verde	1.30	16.25	kg	https://prod-mercadona.imgix.net/images/438d7f7cfe510618a0d26ed1de99721f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8264/colgador-wc-maxigotas-spa-bosque-verde-paquete	t
3007	41	1	Pastillas cisterna Bosque Verde	1.45	7.25	kg	https://prod-mercadona.imgix.net/images/6d234c5e74e29024753506901b2eb69d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86354/pastillas-cisterna-bosque-verde-paquete	t
3008	41	1	Limpiador Muebles jabonoso para Madera Bosque Verde	1.55	1.55	l	https://prod-mercadona.imgix.net/images/a4a2024299e600220ec790e456e9a7b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44110/limpiador-muebles-jabonoso-madera-bosque-verde-botella	t
3009	41	1	Limpiador de Muebles con ceras Bosque Verde	1.65	4.13	l	https://prod-mercadona.imgix.net/images/6b5c2da214ccbee634423a287c6891c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35882/limpiador-muebles-con-ceras-bosque-verde-spray	t
3010	41	1	Toallitas limpiadoras de Muebles Bosque Verde	1.50	0.05	ud	https://prod-mercadona.imgix.net/images/4670622ac7e9a72604904c2f6caf205d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44127/toallitas-limpiadoras-muebles-bosque-verde-paquete	t
3011	41	1	Limpiador de Muebles Classic Pronto	2.90	11.60	l	https://prod-mercadona.imgix.net/images/b83670a2e974bb62afec997d6ad01b46.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35663/limpiador-muebles-classic-pronto-spray	t
3012	41	1	Limpiador de Muebles y Parquet Bosque Verde	2.00	2.67	l	https://prod-mercadona.imgix.net/images/ac76e84e5e6e7a45083e78bc24bcbeff.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44116/limpiador-muebles-parquet-bosque-verde-con-pistola-botella	t
3013	41	1	Limpia Tapicerías y Alfombras con espuma activa Bosque Verde	1.75	2.33	l	https://prod-mercadona.imgix.net/images/cf4f1681a00a7928b8bf55256460e5fa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44303/limpia-tapicerias-alfombras-con-espuma-activa-bosque-verde-con-pistola-botella	t
3014	41	1	Vinagre de Limpieza Bosque Verde concentrado	0.90	0.90	l	https://prod-mercadona.imgix.net/images/5867958a0a1d9023358a768a0a5a7b1b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49402/vinagre-limpieza-bosque-verde-concentrado-botella	t
3015	42	1	Multiusos Perfumado Bosque Verde	1.30	1.30	l	https://prod-mercadona.imgix.net/images/023e47cacc6b6b646be2cf431d8fe270.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44138/multiusos-perfumado-bosque-verde-con-alcohol-con-pistola-botella	t
3016	41	1	70% Alcohol de Limpieza Perfumado Bosque Verde	2.30	2.30	l	https://prod-mercadona.imgix.net/images/2a424afb3d0ea32daffee50d579e5e28.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43861/70-alcohol-limpieza-perfumado-bosque-verde-botella	t
3017	41	1	Multiusos Desinfectante antibacterias Bosque Verde	1.95	2.60	l	https://prod-mercadona.imgix.net/images/d41d4613ade2dde055147ce6a8efe206.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44019/multiusos-desinfectante-antibacterias-bosque-verde-sin-lejia-con-pistola-botella	t
3018	41	1	Multiusos pH Neutro Las 3 Brujas	2.55	3.40	l	https://prod-mercadona.imgix.net/images/dc5419b16ed79b9e7ffad60c96aa80b2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44001/multiusos-ph-neutro-3-brujas-con-pistola-botella	t
3019	41	1	Limpia Mopas Bosque Verde	2.85	3.80	l	https://prod-mercadona.imgix.net/images/63c561c1e88719094eed493c6c0c80a1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44310/limpia-mopas-bosque-verde-spray	t
3020	41	1	Desincrustante de Cementos y Limpiajuntas Bosque Verde	4.00	5.33	l	https://prod-mercadona.imgix.net/images/d883a070e2c327008783553c876b039c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43931/desincrustante-cementos-limpiajuntas-bosque-verde-2-1-botella	t
3021	41	1	Algodón mágico Aladdin	3.80	50.67	kg	https://prod-mercadona.imgix.net/images/0d27ff266805ca8a9e8333d668cfb7e3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43705/algodon-magico-aladdin-bote	t
3022	41	1	70% Alcohol limpieza hogar Bosque Verde	2.60	3.47	l	https://prod-mercadona.imgix.net/images/f8f5be02ca76a6bbcde467b440392a24.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43112/70-alcohol-limpieza-hogar-bosque-verde-perfumado-con-pistola-botella	t
3023	41	1	Limpiador abrillantador Bosque Verde	2.90	7.25	l	https://prod-mercadona.imgix.net/images/cbf1b4a9a8d199649659f17a3eccf765.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8886/limpiador-abrillantador-bosque-verde-spray	t
3024	41	1	Friegasuelos Pino Bosque Verde líquido	0.95	0.63	l	https://prod-mercadona.imgix.net/images/ecbacb1a7fbbe9854e091dbd90addc27.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43347/friegasuelos-pino-bosque-verde-liquido-botella	t
3025	41	1	Friegasuelos Spa Bosque Verde líquido	0.95	0.63	l	https://prod-mercadona.imgix.net/images/710460cd3335f95111222c75d8d1a3d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43320/friegasuelos-spa-bosque-verde-liquido-botella	t
3026	41	1	Friegasuelos Classic Bosque Verde concentrado	1.60	1.60	l	https://prod-mercadona.imgix.net/images/a587f976dec17de63bf8f5fc6619c9be.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44300/friegasuelos-classic-bosque-verde-concentrado-perfume-intenso-duradero-botella	t
3027	41	1	Friegasuelos Pétalos Bosque Verde concentrado	1.60	1.60	l	https://prod-mercadona.imgix.net/images/cec5d5dd8a001a15bd4a166df4f6696a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44301/friegasuelos-petalos-bosque-verde-concentrado-perfume-intenso-duradero-botella	t
3028	41	1	Friegasuelos Floral Bosque Verde líquido	0.95	0.63	l	https://prod-mercadona.imgix.net/images/3cbb9d39e8c0d5bce5734249ee0b43bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/7963/friegasuelos-floral-bosque-verde-liquido-botella	t
3029	41	1	Friegasuelos Tropical Bosque Verde líquido	0.95	0.63	l	https://prod-mercadona.imgix.net/images/996641084bab3627ce38a74e12e13145.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14457/friegasuelos-tropical-bosque-verde-liquido-botella	t
3030	46	1	Friegasuelos Insecticida Krisul líquido	2.35	2.35	l	https://prod-mercadona.imgix.net/images/29bb3e58f87fe4671e364098c500a25f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43070/friegasuelos-insecticida-krisul-liquido-botella	t
3031	41	1	Toallitas limpiadoras de suelo Bosque Verde	1.60	0.08	ud	https://prod-mercadona.imgix.net/images/bb7d5f4ba6de2434ccee0b538e88e581.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71527/toallitas-limpiadoras-suelo-bosque-verde-paquete	t
3032	41	1	Cera Multisuperficies Bosque Verde	4.50	4.50	l	https://prod-mercadona.imgix.net/images/8f1c22d3f032d0e2dbd58ff6b4f6fede.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13995/cera-multisuperficies-bosque-verde-botella	t
3033	41	1	Abrillantador suelos Bosque Verde	2.50	2.50	l	https://prod-mercadona.imgix.net/images/c8ade149aeb0cd20e31f61ee2e610e3f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13994/abrillantador-suelos-bosque-verde-botella	t
3034	41	1	Limpiahogar Aloe Vera Bosque Verde concentrado	2.15	1.43	l	https://prod-mercadona.imgix.net/images/d586630437251cc9fb5c40afd0c3e437.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43315/limpiahogar-aloe-vera-bosque-verde-concentrado-botella	t
3035	41	1	Limpiador concentrado Las 3 Brujas	2.85	2.85	l	https://prod-mercadona.imgix.net/images/f439dcdb4e24ef2af2a9639aeec91eaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35962/limpiador-concentrado-3-brujas-marmol-granito-ceramica-botella	t
3036	41	1	Limpiahogar PH Neutro Bosque Verde delicado	1.55	1.03	l	https://prod-mercadona.imgix.net/images/9e1af01a53f78d103c47351eb3af3126.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43329/limpiahogar-ph-neutro-bosque-verde-delicado-marmol-parquet-ceramica-botella	t
3037	41	1	Limpiahogar Multiusos Pino Bosque Verde líquido	1.60	1.07	l	https://prod-mercadona.imgix.net/images/c1e0ef8a65a71fe2f804627e77b7f7a2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/42204/limpiahogar-multiusos-pino-bosque-verde-liquido-con-alcohol-botella	t
3038	41	1	Limpiahogar con lejía Bosque Verde en gel	1.90	1.27	l	https://prod-mercadona.imgix.net/images/dabeb80bde7b6875bc771b7aa8f91efb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43301/limpiahogar-con-lejia-bosque-verde-gel-botella	t
3039	41	1	Limpiahogar Oxi Active Bosque Verde sin lejía	1.35	1.35	l	https://prod-mercadona.imgix.net/images/d2d88fef43fc70c7f6a18d1cb4ff428a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43338/limpiahogar-oxi-active-bosque-verde-sin-lejia-botella	t
3040	41	1	Limpiahogar desinfectante Bosque Verde	2.10	1.40	l	https://prod-mercadona.imgix.net/images/b09ae2460bbbd2320b423bc7281b3772.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44262/limpiahogar-desinfectante-bosque-verde-sin-lejia-botella	t
3041	41	1	Multiusos Desinfectante antibacterias Bosque Verde	1.95	2.60	l	https://prod-mercadona.imgix.net/images/d41d4613ade2dde055147ce6a8efe206.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/44019/multiusos-desinfectante-antibacterias-bosque-verde-sin-lejia-con-pistola-botella	t
3042	41	1	70% Alcohol limpieza hogar Bosque Verde	2.60	3.47	l	https://prod-mercadona.imgix.net/images/f8f5be02ca76a6bbcde467b440392a24.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43112/70-alcohol-limpieza-hogar-bosque-verde-perfumado-con-pistola-botella	t
3043	41	1	Lejía normal Tradicional Bosque Verde	1.90	0.38	l	https://prod-mercadona.imgix.net/images/8d8167033476f4026199c9463f1f4204.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43011/lejia-normal-tradicional-bosque-verde-garrafa	t
3044	41	1	Lejía normal Tradicional Bosque Verde	0.80	0.40	l	https://prod-mercadona.imgix.net/images/08774cc4eb549b55b3cfa8fd9604a468.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43075/lejia-normal-tradicional-bosque-verde-botella	t
3045	41	1	Lejía Perfumada con detergente Bosque Verde	1.15	0.58	l	https://prod-mercadona.imgix.net/images/1e6ba2eaf9402a42dfa4e8a053dc88e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43024/lejia-con-detergente-bosque-verde-botella	t
3046	41	1	Lejía ropa blanca denso Bosque Verde	1.25	0.63	l	https://prod-mercadona.imgix.net/images/1a77195801caea881c82609d92741f45.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43022/lejia-ropa-blanca-denso-bosque-verde-botella	t
3047	41	1	Lejía Perfumada con detergente limón Bosque Verde	1.15	0.58	l	https://prod-mercadona.imgix.net/images/090b5f559b111d8776d31b4ef29226d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43054/lejia-perfumada-con-detergente-bosque-verde-limon-botella	t
3048	41	1	Lejía Multiusos Bosque Verde	1.60	2.13	l	https://prod-mercadona.imgix.net/images/f3a793d010763b0e947c597b091435fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43060/lejia-multiusos-bosque-verde-con-pistola-botella	t
3049	41	1	Amoníaco perfumado Bosque Verde	0.75	0.50	l	https://prod-mercadona.imgix.net/images/cd307d95ae845266f3886e0046918e04.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43818/amoniaco-perfumado-bosque-verde-botella	t
3050	41	1	Amoníaco con detergente Bosque Verde	0.95	0.63	l	https://prod-mercadona.imgix.net/images/b826321dd74b57aa5e67490403949e7c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43802/amoniaco-con-detergente-bosque-verde-botella	t
3051	41	1	Desatascador de Tuberías Bosque Verde en gel	1.85	1.85	l	https://prod-mercadona.imgix.net/images/e05151dfc7e023ef071e9d5b96d750a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43853/desatascador-tuberias-bosque-verde-gel-botella	t
3052	41	1	Desatascador Turbo Bosque Verde en gel	1.70	3.40	l	https://prod-mercadona.imgix.net/images/a1fbefde7d524e93676dd74bac83f913.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43042/desatascador-turbo-bosque-verde-gel-botella	t
3053	41	1	Sosa cáustica Bosque Verde	3.55	3.55	kg	https://prod-mercadona.imgix.net/images/4d1c5a8d8bfb823e18227faf0350e04f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23412/sosa-caustica-bosque-verde-botella	t
3054	41	1	Limpiador de Tuberías Bosque Verde	3.80	3.80	l	https://prod-mercadona.imgix.net/images/821d152215cf4f7bbf63fa92fe09b844.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43806/limpiador-tuberias-bosque-verde-botella	t
3055	41	1	Limpiador fosas sépticas Bosque Verde bolsitas solubles	6.25	20.83	kg	https://prod-mercadona.imgix.net/images/cf69624dfd9889cde9a2b289f0735df5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23415/limpiador-fosas-septicas-bosque-verde-bolsitas-solubles-caja	t
3056	41	1	Alguicida sin espuma líquido Bosque Verde para piscina	12.50	2.50	l	https://prod-mercadona.imgix.net/images/7c6cbdf30d00b64e982382767a96f4ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90309/antialgas-liquido-bosque-verde-piscina-garrafa	t
3057	41	1	Cloro rápido granulado para piscina	32.50	6.50	kg	https://prod-mercadona.imgix.net/images/04845cfa53add062fc925fd537ff4011.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80320/cloro-rapido-granulado-piscina-bote	t
3058	41	1	Eliminador de turbidez líquido Bosque Verde para piscina	14.00	2.80	l	https://prod-mercadona.imgix.net/images/53817cd225881323d367877585970add.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90303/eliminador-turbidez-liquido-bosque-verde-piscina-garrafa	t
3059	41	1	Reductor de pH Bosque Verde para piscina	10.00	2.00	l	https://prod-mercadona.imgix.net/images/ce1b2795e1eaf032ee4708ce9a82772c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/90326/reductor-ph-bosque-verde-piscina-garrafa	t
3060	41	1	Incrementador de pH para piscina	7.00	4.67	kg	https://prod-mercadona.imgix.net/images/d7739e42c631da2255017080858529f7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/80313/incrementador-ph-piscina-bote	t
3061	41	1	Cloro disolución lenta tabletas para piscina	31.00	6.20	kg	https://prod-mercadona.imgix.net/images/2825d845adf9121a9376fcd0579b7442.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23413/cloro-disolucion-lenta-tabletas-piscina-bote	t
3062	41	1	Cloro 5 acciones disolución lenta tabletas para piscina	31.00	6.20	kg	https://prod-mercadona.imgix.net/images/d0124ee4c87952c1067f40b3c793e7f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23414/cloro-5-acciones-disolucion-lenta-tabletas-piscina-bote	t
3063	41	1	Limpiacristales y multiusos Bosque Verde	1.20	1.20	l	https://prod-mercadona.imgix.net/images/106716e6d834c4e34c61b6eaf9799cae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43218/limpiacristales-multiusos-bosque-verde-con-pistola-botella	t
3064	41	1	Toallitas Limpiagafas Bosque Verde monodosis	1.60	0.05	ud	https://prod-mercadona.imgix.net/images/ecae45d1232c42803836d9790983b525.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43088/toallitas-limpiagafas-bosque-verde-monodosis-perfumadas-caja	t
3065	41	1	Toallitas limpiadoras de Cristales y Espejos Bosque Verde	1.40	0.05	ud	https://prod-mercadona.imgix.net/images/2c0adfb384e90f5b30f1ac55edf8b67d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43223/toallitas-limpiadoras-cristales-espejos-bosque-verde-paquete	t
3066	41	1	Lavaparabrisas Bosque Verde	2.50	1.25	l	https://prod-mercadona.imgix.net/images/3d60ed210529179b7bd9a401edf1fbe7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/43204/lavaparabrisas-bosque-verde-botella	t
3067	41	1	Limpiacristales Bosque Verde	1.90	4.75	l	https://prod-mercadona.imgix.net/images/48c604ec62c1e73c1ebbada61c96441f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73207/limpiacristales-bosque-verde-spray	t
3068	41	1	Limpiagafas Spray con gamuza Bosque Verde	2.55	2.55	l	https://prod-mercadona.imgix.net/images/afe50f309454b93a6a02b2084f4533f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67951/limpiagafas-spray-con-gamuza-bosque-verde-spray	t
3069	41	1	Estropajo suciedad resistente Bosque Verde	0.90	0.30	ud	https://prod-mercadona.imgix.net/images/b1600599959f0d79d9d240be9033e748.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71342/estropajo-suciedad-resistente-bosque-verde-paquete	t
3070	41	1	Estropajo limpieza delicada Bosque Verde	0.90	0.30	ud	https://prod-mercadona.imgix.net/images/052ddcc2917abaf02a2be3fb6820b2ba.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71343/estropajo-limpieza-delicada-bosque-verde-paquete	t
3071	41	1	Estropajo salvauñas suciedad resistente Bosque Verde	0.75	0.25	ud	https://prod-mercadona.imgix.net/images/3cea8e1e18a2c2f46fe499ccbb42b40f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71380/estropajo-suciedad-resistente-bosque-verde-paquete	t
3072	41	1	Estropajo acero inoxidable Bosque Verde limpieza muy fuerte	0.75	0.25	ud	https://prod-mercadona.imgix.net/images/d377aa7b798e88d677c5a368dd831d68.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71344/estropajo-acero-inoxidable-bosque-verde-paquete	t
3073	41	1	Estropajo inox Bosque Verde limpieza muy fuerte	1.20	1.20	ud	https://prod-mercadona.imgix.net/images/f1c4d01e2ec4e742ad60c3184f09777c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71377/estropajo-inox-bosque-verde-paquete	t
3074	41	1	Estropajo salvauñas limpieza delicada Bosque Verde	0.75	0.25	ud	https://prod-mercadona.imgix.net/images/b3efff026e33f4198608df5525b93316.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71341/estropajo-limpieza-delicada-bosque-verde-paquete	t
3075	42	1	Borrador mágico Bosque Verde	1.45	0.48	ud	https://prod-mercadona.imgix.net/images/b6dd8f7f4337006acfbaf8754a61bd94.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71314/borrador-magico-bosque-verde-paquete	t
3076	41	1	Estropajo jabonoso Bosque Verde	1.20	0.12	ud	https://prod-mercadona.imgix.net/images/0b72b88bb90c8ea34a7b910de5c2a0ce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13525/estropajo-jabonoso-bosque-verde-paquete	t
3077	41	1	Estropajo almohadilla Bosque Verde limpieza delicada	0.95	0.48	ud	https://prod-mercadona.imgix.net/images/379643106017b4293ef399a4b52caa5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9778/estropajo-almohadilla-bosque-verde-limpieza-delicada-paquete	t
3078	41	1	Bayeta suave multiusos Bosque Verde	1.20	0.13	ud	https://prod-mercadona.imgix.net/images/a7d9f5f3a7339e3c8719703c64619e01.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71044/bayeta-suave-multiusos-bosque-verde-paquete	t
3079	41	1	Bayeta grande Bosque Verde microfibra	1.75	0.58	ud	https://prod-mercadona.imgix.net/images/6a9739006e032106505b8346f57f8df2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71033/bayeta-grande-bosque-verde-microfibra-paquete	t
3080	41	1	Bayeta pequeña Bosque Verde microfibra	1.60	0.53	ud	https://prod-mercadona.imgix.net/images/3abb6f08a1c5c27a703f4bd12a4f2730.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22774/bayeta-pequena-bosque-verde-microfibra-paquete	t
3081	41	1	Bayeta cristales y espejos Bosque Verde microfibra	0.85	0.85	ud	https://prod-mercadona.imgix.net/images/244c95c61079dea6b43a90f70852eb76.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22825/bayeta-cristales-espejos-bosque-verde-microfibra-paquete	t
3082	41	1	Posavajillas Bosque Verde	1.35	1.35	ud	https://prod-mercadona.imgix.net/images/0f3253e85e3474cd05865be14950d74b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71055/posavajillas-bosque-verde-paquete	t
3083	41	1	Bayeta polvo Bosque Verde microfibra	0.90	0.90	ud	https://prod-mercadona.imgix.net/images/d1e2d00f104605d187444be5b5f9c561.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60620/bayeta-polvo-bosque-verde-microfibra-paquete	t
3084	41	1	Paño seca vajillas Bosque Verde	1.90	1.90	ud	https://prod-mercadona.imgix.net/images/118d930a7fb8f86ef6cca438f600ff3a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35950/pano-seca-vajillas-bosque-verde-paquete	t
3085	43	1	Guantes de látex Bosque Verde talla pequeña-mediana	0.75	0.38	ud	https://prod-mercadona.imgix.net/images/171af63ee8eb16206886fcb9f824eea1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14969/guantes-latex-bosque-verde-talla-pequena-mediana-sensibles-paquete	t
3086	41	1	Guantes de látex Bosque Verde talla mediana-grande	0.75	0.38	ud	https://prod-mercadona.imgix.net/images/148fc521b7ec6256fd32245b909e58a8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14970/guantes-latex-bosque-verde-talla-mediana-grande-sensibles-paquete	t
3087	43	1	Guantes de látex Bosque Verde talla pequeña-mediana	3.00	0.06	ud	https://prod-mercadona.imgix.net/images/841a7f2f85266a62918c3cf61f59bff5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71203/guantes-latex-bosque-verde-talla-pequena-mediana-desechables-caja	t
3088	41	1	Guantes de látex Bosque Verde talla mediana-grande	3.00	0.06	ud	https://prod-mercadona.imgix.net/images/049d739d57cef7897104a8fb7e4b3b2b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71202/guantes-latex-bosque-verde-talla-mediana-grande-desachables-caja	t
3089	41	1	Guantes 100% nitrilo Bosque Verde talla pequeña	1.95	0.98	ud	https://prod-mercadona.imgix.net/images/e3513870fc275671f44e360c98d41d16.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71397/guantes-100-nitrilo-bosque-verde-talla-pequena-resistentes-lejia-paquete	t
3090	41	1	Guantes 100% nitrilo Bosque Verde talla mediana	1.95	0.98	ud	https://prod-mercadona.imgix.net/images/9611024dad30c9bb631e164c9285865e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71398/guantes-100-nitrilo-bosque-verde-talla-mediana-resistentes-lejia-paquete	t
3091	41	1	Guantes 100% nitrilo Bosque Verde talla grande	1.95	0.98	ud	https://prod-mercadona.imgix.net/images/dc9304ab539a6f2d1c8fe47cd726fefc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71399/guantes-100-nitrilo-bosque-verde-talla-grande-resistentes-lejia-paquete	t
3092	41	1	Guantes de nitrilo Bosque Verde talla pequeña	2.85	0.10	ud	https://prod-mercadona.imgix.net/images/c5075657dc3cf2f51ddf965c0f00870c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71225/guantes-nitrilo-bosque-verde-talla-pequena-desechables-caja	t
3093	41	1	Guantes de nitrilo Bosque Verde talla mediana	2.85	0.10	ud	https://prod-mercadona.imgix.net/images/0685bb726ca5ad1db983e103654f855a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71226/guantes-nitrilo-bosque-verde-talla-mediana-desechables-caja	t
3094	41	1	Guantes de nitrilo Bosque Verde talla grande	2.85	0.10	ud	https://prod-mercadona.imgix.net/images/f96bb831e5a233af23ce286606912de7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71227/guantes-nitrilo-bosque-verde-talla-grande-desachables-caja	t
3095	44	1	Servilleta papel Bosque Verde	1.25	0.01	ud	https://prod-mercadona.imgix.net/images/bfcc81e168ee5a8e58f26e2ba67dfb40.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49544/servilleta-papel-bosque-verde-1-capa-30-x-30-cm-paquete	t
3096	44	1	Servilleta papel Cocktail Bosque Verde	2.10	0.01	ud	https://prod-mercadona.imgix.net/images/b1f0583de198e0fe8a5699f056e7255a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49701/servilleta-papel-cocktail-bosque-verde-2-capas-22-x-22-cm-paquete	t
3097	44	1	Servilleta papel suave Bosque Verde	1.55	0.02	ud	https://prod-mercadona.imgix.net/images/8b47fff99894d468256430fb5afb856b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49589/servilleta-papel-suave-bosque-verde-2-capas-33-x-32-cm-paquete	t
3098	44	1	Papel hogar Compacto Absorbente Bosque Verde	2.30	0.77	ud	https://prod-mercadona.imgix.net/images/c2b185d672f992dd957400a4f39d1f5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49619/papel-hogar-compacto-absorbente-bosque-verde-paquete	t
3099	44	1	Papel Multiusos Resistente Bosque Verde	3.60	3.60	ud	https://prod-mercadona.imgix.net/images/68a9193c73346578a71a679044434f6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49173/papel-multiusos-resistente-bosque-verde-paquete	t
3100	44	1	Papel cocina Gigante Absorbente Bosque Verde	2.90	2.90	ud	https://prod-mercadona.imgix.net/images/1754c20c79fab74549f3b7f5a05bfb80.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49176/papel-cocina-gigante-absorbente-bosque-verde-paquete	t
3101	44	1	Papel higiénico Doble Rollo Bosque Verde	4.50	0.38	ud	https://prod-mercadona.imgix.net/images/2114d726e660470b9eea54e72125280a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47818/papel-higienico-doble-rollo-bosque-verde-paquete	t
3102	44	1	Papel higiénico Doble Rollo Bosque Verde	2.30	0.38	ud	https://prod-mercadona.imgix.net/images/7dceeae4ce17bf0c89c9e02330457a4a.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47819/papel-higienico-doble-rollo-bosque-verde-paquete	t
3103	44	1	Papel higiénico doble hoja Bosque Verde	2.50	0.21	ud	https://prod-mercadona.imgix.net/images/913a64d47e21d6dbee7f5a51c482aeaa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47834/papel-higienico-doble-hoja-bosque-verde-paquete	t
3104	44	1	Papel higiénico Suave Bosque Verde	3.55	0.44	ud	https://prod-mercadona.imgix.net/images/c101fb054823f64dfbece29949dd8e23.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12912/papel-higienico-suave-bosque-verde-4-capas-paquete	t
3105	44	1	Papel higiénico húmedo WC Bosque Verde	0.80	0.05	ud	https://prod-mercadona.imgix.net/images/286f24c12adab78274a9cb5cca4f1278.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47293/papel-higienico-humedo-wc-bosque-verde-con-aloe-vera-camomila-paquete	t
3106	44	1	Papel higiénico húmedo WC Bosque Verde	1.55	0.02	ud	https://prod-mercadona.imgix.net/images/d6ab8e94cf1adb75cb470a93d2def3df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47291/papel-higienico-humedo-wc-bosque-verde-con-aloe-vera-camomila-paquete	t
3107	44	1	Pañuelos de papel Extra Suaves Bosque Verde	1.25	0.01	ud	https://prod-mercadona.imgix.net/images/ee570e175d6894f08bb89c0c35c2e6ee.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47609/panuelos-papel-extra-suaves-bosque-verde-2-capas-caja	t
3108	44	1	Pañuelos de papel Aloe Vera Bosque Verde	1.60	0.02	ud	https://prod-mercadona.imgix.net/images/7511317815798a118d92064761a95d4b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/46703/panuelos-papel-aloe-vera-bosque-verde-4-capas-paquete	t
3109	44	1	Pañuelos de papel Extra Suaves Bosque Verde	1.05	0.01	ud	https://prod-mercadona.imgix.net/images/bd2818a21636e62b4935de1f8bacf293.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47620/panuelos-papel-extra-suaves-bosque-verde-4-capas-paquete	t
3110	44	1	Pañuelos de papel Mentol Bosque Verde	1.80	0.02	ud	https://prod-mercadona.imgix.net/images/a9d46a080d602b04ce55132552ad4875.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/47618/panuelos-papel-mentol-bosque-verde-4-capas-paquete	t
3111	45	1	Pila alcalina AA LR6 Bosque Verde	1.70	0.21	ud	https://prod-mercadona.imgix.net/images/427f1283d4f889eafb560f96b695fcab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22302/pila-alcalina-aa-lr6-bosque-verde-paquete	t
3112	45	1	Pila alcalina AAA LR03 Bosque Verde	1.65	0.21	ud	https://prod-mercadona.imgix.net/images/682886706977003712ae6426a121ff18.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22301/pila-alcalina-aaa-lr03-bosque-verde-paquete	t
3113	46	1	Insecticida moscas y mosquitos Bosque Verde perfumado	2.35	3.13	l	https://prod-mercadona.imgix.net/images/587718cb0c6e9c65933d86233b078b66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86480/insecticida-moscas-mosquitos-bosque-verde-perfumado-spray	t
3114	46	1	Insecticida moscas y mosquitos Bosque Verde sin perfume	2.35	3.13	l	https://prod-mercadona.imgix.net/images/9b65fec6c28897843ad1d8277a500fa6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35530/insecticida-moscas-mosquitos-bosque-verde-sin-perfume-spray	t
3115	46	1	Insecticida cucarachas y hormigas Bosque Verde	2.70	6.75	l	https://prod-mercadona.imgix.net/images/18ccf6d62e1b27753e47017b0bd21dcd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72090/insecticida-cucarachas-hormigas-bosque-verde-spray	t
3116	46	1	Insecticida líquido Bosque Verde	2.75	5.50	l	https://prod-mercadona.imgix.net/images/d88b2648919204b7667de44ee3aeda78.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72318/insecticida-liquido-bosque-verde-con-pistola-botella	t
3117	46	1	Insecticida ácaros Bosque Verde especial tejidos	3.30	8.25	l	https://prod-mercadona.imgix.net/images/318b8081a07fdc640796c45559eb85c3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72111/insecticida-acaros-bosque-verde-especial-tejidos-spray	t
3118	46	1	Spray repelente fuerte Deliplus antimosquitos	2.75	27.50	l	https://prod-mercadona.imgix.net/images/7b44f52a06d56bfa544130b8bb0029d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52996/spray-repelente-fuerte-deliplus-antimosquitos-spray	t
3119	46	1	Difusor insecticida antimosquitos Bosque Verde eléctrico	3.10	3.10	ud	https://prod-mercadona.imgix.net/images/885bd009e173a8d0c7fcf01211de3f3b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72205/difusor-insecticida-antimosquitos-electrico-incluye-recambio-liquido-bosque-verde-caja	t
3120	46	1	Insecticida antimosquitos eléctrico recambio líquido	1.90	42.22	ud	https://prod-mercadona.imgix.net/images/3976c13432d1abe8f2adc817049115db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72641/insecticida-antimosquitos-electrico-recambio-liquido-bosque-verde-caja	t
3121	46	1	Insecticida antimosquitos eléctrico recambio pastillas	1.55	0.05	ud	https://prod-mercadona.imgix.net/images/e057225b6f00d382a7758c80d24c1bfb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72034/insecticida-antimosquitos-electrico-recambio-pastillas-bosque-verde-caja	t
3122	46	1	Colgador antipolillas Ropa Limpia Bosque Verde	1.55	0.78	ud	https://prod-mercadona.imgix.net/images/a40d1c78721c83cc183f39b427d88d93.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52423/colgador-antipolillas-ropa-limpia-bosque-verde-paquete	t
3123	46	1	Bolsitas antipolillas Lavanda Bosque Verde	1.55	0.06	ud	https://prod-mercadona.imgix.net/images/c2545477e2d8a8e8c3cd12e559ffe4d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52466/bolsitas-antipolillas-lavanda-bosque-verde-paquete	t
3124	46	1	Colgador antipolillas Lavanda Bosque Verde	1.55	0.78	ud	https://prod-mercadona.imgix.net/images/8a08da3d020a258daa896b13013166e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52422/colgador-antipolillas-lavanda-bosque-verde-paquete	t
3125	46	1	Trampa matacucarachas Bosque Verde	2.95	0.49	ud	https://prod-mercadona.imgix.net/images/8efb7a3f7c29217a4e1b8178e5ee5b0d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72320/trampa-matacucarachas-bosque-verde-caja	t
3126	46	1	Trampa con cebo contra hormigas Bosque Verde	3.60	1.20	ud	https://prod-mercadona.imgix.net/images/b89407d63c875c9e7832c322594d1e8e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12836/trampa-con-cebo-hormigas-bosque-verde-caja	t
3127	46	1	Trampa polillas de los alimentos Bosque Verde	2.00	1.00	ud	https://prod-mercadona.imgix.net/images/41e8d8d950f7c5aaf6ce30a788f2c847.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72113/trampa-antipolillas-alimentos-bosque-verde-sin-insecticida-olores-caja	t
3128	46	1	Raticida cebo fresco Bosque Verde	2.60	2.60	ud	https://prod-mercadona.imgix.net/images/11df211bb4efa734305584ebf9736d2b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72088/raticida-cebo-fresco-bosque-verde-caja	t
3129	46	1	Vela citronela antimosquitos y moscas Bosque Verde	2.00	2.00	ud	https://prod-mercadona.imgix.net/images/06f796d3c5b453a52d884b805bcf1a44.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35550/vela-citronela-antimosquitos-moscas-bosque-verde-vaso	t
3130	46	1	Saquitos antipolillas Ropa Limpia Bosque Verde	1.55	0.06	ud	https://prod-mercadona.imgix.net/images/ff94badd7959f672946c3c482eba8e9b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52468/bolsitas-antipolillas-ropa-limpia-bosque-verde-paquete	t
3131	42	1	Ambientador spray Ropa Limpia Bosque Verde	1.15	3.83	l	https://prod-mercadona.imgix.net/images/64f336ebe7a7c26113aabc7a3446bfa0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72537/ambientador-spray-ropa-limpia-bosque-verde-spray	t
3132	42	1	Ambientador spray Fresh Bosque Verde	1.15	3.83	l	https://prod-mercadona.imgix.net/images/ad9a4639cc33740479d5b85758dcccf1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60707/ambientador-spray-spray-fresh-bosque-verde-spray	t
3133	42	1	Ambientador spray Sweet Blossom Bosque Verde	1.15	3.83	l	https://prod-mercadona.imgix.net/images/6c1d5671c980e0727f00719e909ab069.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67997/ambientador-spray-sweet-blossom-bosque-verde-spray	t
3134	42	1	Ambientador spray de tejidos Elixir Floral Bosque Verde	2.15	5.38	l	https://prod-mercadona.imgix.net/images/5859513840ed96886b60d9fcc35fa665.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40159/ambientador-spray-tejidos-elixir-floral-bosque-verde-con-pistola-botella	t
3135	42	1	Difusor ambientador spray manual Bosque Verde con recambio	2.90	2.90	ud	https://prod-mercadona.imgix.net/images/e2864990c78d5144bd01661ec16fe9cf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35858/difusor-ambientador-spray-manual-bosque-verde-con-recambio-brisa-azul-caja	t
3136	42	1	Recambio ambientador mini spray Brisa Azul Bosque Verde	1.80	60.00	l	https://prod-mercadona.imgix.net/images/f8bd5b31d0aebd81f1a201ecfb65810e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35859/ambientador-mini-spray-brisa-azul-bosque-verde-difusor-manual-caja	t
3137	42	1	Ambientador spray Red Elixir Bosque Verde	1.15	3.83	l	https://prod-mercadona.imgix.net/images/9aa1123675b098b55a14fdf4d92de4bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13040/ambientador-spray-red-elixir-bosque-verde-spray	t
3138	42	1	Difusor ambientador eléctrico Bosque Verde	2.20	2.20	ud	https://prod-mercadona.imgix.net/images/a6357b2fb566aefcd2685bf508c36c38.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52833/difusor-ambientador-electrico-bosque-verde-con-regulador-intensidad-caja	t
3139	42	1	Difusor multifragancia eléctrico Bosque Verde	3.20	3.20	ud	https://prod-mercadona.imgix.net/images/472d86fdf508a119040a9671ed28b493.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52759/difusor-multifragancia-electrico-bosque-verde-con-regulador-intensidad-caja	t
3140	42	1	Recambio ambientador eléctrico Ropa Limpia Bosque Verde	1.60	64.00	l	https://prod-mercadona.imgix.net/images/81f175e4e81b22ca50bf7a8e3726ee56.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72547/ambientador-electrico-ropa-limpia-bosque-verde-recambio-caja	t
3141	42	1	Recambio ambientador eléctrico Brisa Azul Bosque Verde	1.60	64.00	l	https://prod-mercadona.imgix.net/images/785f0f323d3411b9dbd83427ab380067.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72542/ambientador-electrico-brisa-azul-bosque-verde-recambio-caja	t
3142	42	1	Recambio ambientador eléctrico Orquídea Bosque Verde	1.60	64.00	l	https://prod-mercadona.imgix.net/images/eaffedba237b65c4c548a923ac1f78d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72544/ambientador-electrico-orquidea-bosque-verde-recambio-caja	t
3143	42	1	Recambio ambientador eléctrico Spa 6 fragancias Bosque Verde	2.90	116.00	l	https://prod-mercadona.imgix.net/images/025d868ca8ef7d7e10c987de835d0930.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72616/ambientador-electrico-spa-bosque-verde-6-fragancias-recambio-caja	t
3144	42	1	Recambio ambientador eléctrico Jardín 6 fragancias Bosque Verde	2.90	116.00	l	https://prod-mercadona.imgix.net/images/78afc3832c6922a7180f5c0e2e02e01f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72614/ambientador-electrico-jardin-bosque-verde-6-fragancias-recambio-caja	t
3145	42	1	Recambio ambientador eléctrico Mundo 6 fragancias Bosque Verde	2.90	116.00	l	https://prod-mercadona.imgix.net/images/24acf0f1a31d4cca1a35d329612e83af.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72647/ambientador-electrico-mundo-bosque-verde-6-fragancias-recambio-caja	t
3146	42	1	Recambio ambientador eléctrico Sugar 6 fragancias Bosque Verde	2.90	116.00	l	https://prod-mercadona.imgix.net/images/8b315f93c619a2cc08f5a4ffb2c1d18d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52588/ambientador-electrico-sugar-bosque-verde-6-fragancias-recambio-caja	t
3147	42	1	Recambio ambientador eléctrico Matcha Bosque Verde	1.60	64.00	l	https://prod-mercadona.imgix.net/images/3c6a5207e56bd803ee8caa8ffc7717b1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11489/ambientador-electrico-matcha-bosque-verde-recambio-caja	t
3148	42	1	Recambio ambientador eléctrico Coconut Cream Bosque Verde	1.60	64.00	l	https://prod-mercadona.imgix.net/images/58d78e41d2cf66d8c759bdc29bcb7bbf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12894/recambio-ambientador-electrico-coconut-cream-bosque-verde-caja	t
3149	42	1	Difusor ambientador automático Bosque Verde	4.50	4.50	ud	https://prod-mercadona.imgix.net/images/3e484fb0a16229f460fcb430494e9eda.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13041/difusor-ambientador-automatico-bosque-verde-incluye-2-pilas-caja	t
3150	42	1	Recambio ambientador automático Love Bosque Verde	1.80	7.20	l	https://prod-mercadona.imgix.net/images/2956a940dc2d1c2f992af0f9209ef251.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72411/ambientador-automatico-love-bosque-verde-recambio-bote	t
3151	42	1	Recambio ambientador automático Ropa Limpia Bosque Verde	1.80	7.20	l	https://prod-mercadona.imgix.net/images/65c0197f9a1249b5a7546b18c238a784.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72405/ambientador-automatico-ropa-limpia-bosque-verde-recambio-bote	t
3152	42	1	Recambio ambientador automático Flower Bosque Verde	1.80	7.20	l	https://prod-mercadona.imgix.net/images/4aeb307fa63f99a0da3ba0300b0918bd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60790/ambientador-automatico-flower-bosque-verde-recambio-bote	t
3153	42	1	Recambio ambientador automático Infantil Bosque Verde	1.80	7.20	l	https://prod-mercadona.imgix.net/images/5030d6e14276f0bb0e8387e672fc7c4d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72410/ambientador-automatico-infantil-bosque-verde-recambio-bote	t
3154	42	1	Recambio ambientador automático Delice Bosque Verde	1.80	7.20	l	https://prod-mercadona.imgix.net/images/9c2db5c62eee92775923445da7a9ff48.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23842/ambientador-automatico-delice-bosque-verde-recambio-bote	t
3155	42	1	Ambientador coche Bali Bosque Verde	1.85	1.85	ud	https://prod-mercadona.imgix.net/images/99aa13bd05f29f0e2d0164e0b5423364.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79425/ambientador-coche-bali-bosque-verde-caja	t
3156	42	1	Ambientador coche Frutos Silvestres Bosque Verde	1.85	1.85	ud	https://prod-mercadona.imgix.net/images/cfa19cbd573a630030ca7860e7a3d0b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79446/ambientador-coche-frutos-silvestres-bosque-verde-caja	t
3157	42	1	Ambientador coche Exótico Bosque Verde	1.85	1.85	ud	https://prod-mercadona.imgix.net/images/4b8b860972a5864861c501c7f69c5fb8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79447/ambientador-coche-exotico-bosque-verde-incluye-difusor-2-recambios-paquete	t
3158	42	1	Ambientador coche Marine Bosque Verde	1.85	1.85	ud	https://prod-mercadona.imgix.net/images/b470b56f565272913653ac326e95efed.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/79448/ambientador-coche-marine-bosque-verde-incluye-difusor-2-recambios-paquete	t
3159	42	1	Ambientador varitas Frambuesa Bosque Verde	2.10	52.50	l	https://prod-mercadona.imgix.net/images/c588013d2e1a9f986947c485526442db.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13789/ambientador-varitas-frambuesa-bosque-verde-caja	t
3160	42	1	Ambientador varitas Bambú Bosque Verde	2.10	52.50	l	https://prod-mercadona.imgix.net/images/0815d4ce2d6ac20b823fbe94dd8edf6d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13788/ambientador-varitas-bambu-bosque-verde-caja	t
3161	42	1	Ambientador varitas Fruta Tropical Bosque Verde	2.10	52.50	l	https://prod-mercadona.imgix.net/images/782878de45d4df397b9a2bc0832a1ee5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13780/ambientador-varitas-fruta-tropical-bosque-verde-caja	t
3162	42	1	Ambientador varitas Magnolia Bosque Verde	2.10	52.50	l	https://prod-mercadona.imgix.net/images/133e7fb44513afd304cc1d0423ae5650.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13055/ambientador-varitas-magnolia-bosque-verde-caja	t
3163	42	1	Vela perfumada Chai Bosque Verde	1.85	0.10	ud	https://prod-mercadona.imgix.net/images/b560f3a1e8fb79bbbc148ce263473ef3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72077/vela-perfumada-te-chai-bosque-verde-pequena-caja	t
3164	42	1	Vela perfumada Fruta Tropical Bosque Verde	1.85	0.10	ud	https://prod-mercadona.imgix.net/images/866fc698b613a34d18b47a0a83de58b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35457/vela-perfumada-fruta-tropical-bosque-verde-pequena-caja	t
3165	42	1	Ambientador Spa armarios y cajones Bosque Verde	1.75	0.58	ud	https://prod-mercadona.imgix.net/images/a431d99075627c923b4cb225e8a1ff5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8876/ambientador-armarios-spa-bosque-verde-caja	t
3166	42	1	Ambientador líquido concentrado Foresan deluxe	1.70	13.60	l	https://prod-mercadona.imgix.net/images/756ac621147f01cc731d6c64506f7263.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72873/ambientador-liquido-concentrado-foresan-deluxe-botella	t
3167	42	1	Ambientador Talco armarios y cajones Bosque Verde	1.75	1.75	ud	https://prod-mercadona.imgix.net/images/27241d437d66a3f0fe53fe61954c11d7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13295/ambientador-talco-armarios-cajones-bosque-verde-paquete	t
3168	42	1	Ambientador varitas Pistacho Bosque Verde	2.10	52.50	l	https://prod-mercadona.imgix.net/images/bed8b35f93148b4bff7a229c79e63d14.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13056/ambientador-varitas-pistacho-bosque-verde-caja	t
3169	42	1	Vela perfumada Chai Bosque Verde	1.85	1.85	ud	https://prod-mercadona.imgix.net/images/f136bbeb784d2b62910fe8ce2861d4c2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14717/vela-perfumada-chai-bosque-verde-caja	t
3170	42	1	Absorbeolores en gel para frigorífico Bosque Verde	1.80	1.80	ud	https://prod-mercadona.imgix.net/images/50989fc13967db4f9e58a578e97ed579.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72878/absorbeolores-gel-frigorifico-bosque-verde-paquete	t
3171	42	1	Recambio antihumedad con aromas cítricos Bosque Verde	2.00	2.00	ud	https://prod-mercadona.imgix.net/images/ee6740f72af8accbbc6164c27f3cb762.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/72515/recambio-antihumedad-con-aromas-citricos-bosque-verde-caja	t
3172	45	1	Molde de aluminio cuadrado 2,7L Alibérico	2.45	1.23	ud	https://prod-mercadona.imgix.net/images/5f0e4a9bc62d2f73ce377f3399895d79.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49867/molde-aluminio-cuadrado-27l-aliberico-paquete	t
3173	45	1	Recipiente de plástico rectangular 1,3L Bosque Verde	2.40	0.60	ud	https://prod-mercadona.imgix.net/images/4c1d99af2dd557001f9548ece60f6842.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/48361/recipiente-plastico-rectangular-13l-bosque-verde-paquete	t
3174	45	1	Recipiente de plástico redondo 0,5L Bosque Verde	2.05	0.68	ud	https://prod-mercadona.imgix.net/images/f1c691f390b5e4aa3c674d9c17a550aa.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/48001/recipiente-plastico-redondo-05l-bosque-verde-con-rosca-paquete	t
3175	45	1	Recipiente de plástico cuadrado bajo 0,8L Bosque Verde	2.25	0.45	ud	https://prod-mercadona.imgix.net/images/da5c690ac03cdbea3ffec504965b8589.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/48360/recipiente-plastico-cuadrado-bajo-08l-bosque-verde-paquete	t
3176	45	1	Recipiente de plástico redondo 1L Bosque Verde	2.05	1.03	ud	https://prod-mercadona.imgix.net/images/0cdc8757f14b271a3282dba31c4c0d5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/48009/recipiente-plastico-redondo-1l-bosque-verde-con-rosca-paquete	t
3177	45	1	Recipiente de plástico redondo 240 ml Bosque Verde	1.95	0.65	ud	https://prod-mercadona.imgix.net/images/57ee53cfb96d0d6ef3209f84223590fe.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/48005/recipiente-plastico-redondo-240-ml-bosque-verde-con-rosca-paquete	t
3178	45	1	Molde de aluminio rectangular 0,5L Alibérico	1.95	0.39	ud	https://prod-mercadona.imgix.net/images/925e954f147073a63c7057a955f9c5d4.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49837/molde-aluminio-rectangular-05l-aliberico-con-tapa-paquete	t
3179	45	1	Molde de aluminio redondo 1L Alibérico	2.00	0.67	ud	https://prod-mercadona.imgix.net/images/e9c2500b98b15edbb974b1f6a83c19c0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49869/molde-aluminio-redondo-1l-aliberico-paquete	t
3180	45	1	Molde de aluminio rectangular 1,5L Alibérico	3.35	1.12	ud	https://prod-mercadona.imgix.net/images/4d833b447f94ee204e27adce79bd5918.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49863/molde-aluminio-rectangular-15l-aliberico-con-tapa-paquete	t
3181	45	1	Recipiente hermético de plástico rectangular 1L Bosque Verde	3.00	3.00	ud	https://prod-mercadona.imgix.net/images/ead406c7f2a2bdd9ed67fe47d3df62a3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35894/recipiente-hermetico-plastico-rectangular-1l-bosque-verde-paquete	t
3182	45	1	Recipiente hermético de plástico rectangular 3L Bosque Verde	4.50	4.50	ud	https://prod-mercadona.imgix.net/images/299dfd44455d80acd6f99f1018c5b683.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60517/recipiente-hermetico-plastico-rectangular-3l-bosque-verde-paquete	t
3183	45	1	Molde de papel Bosque Verde para freidora de aire 20 cm	2.50	0.05	ud	https://prod-mercadona.imgix.net/images/278ac417f4bc77d00e1c72f6671a15f1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/11681/molde-papel-pulpa-madera-silicona-bosque-verde-freidora-aire-20-cm-paquete	t
3184	43	1	Film transparente Bosque Verde con sierra deslizante	1.85	0.02	m	https://prod-mercadona.imgix.net/images/2edf6e6d627c5e1f86efa0519b06761c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60294/film-transparente-bosque-verde-con-sierra-deslizante-caja	t
3185	44	1	Papel vegetal Bosque Verde	1.70	0.06	ud	https://prod-mercadona.imgix.net/images/605886a19237ab9712a3c8572caa375b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23608/papel-vegetal-bosque-verde-38-x-42-cm-caja	t
3186	43	1	Bolsas congelación medianas Bosque Verde	0.85	0.02	ud	https://prod-mercadona.imgix.net/images/6a5795e7807bdbe0bbf40c85f5f2654b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49224/bolsas-congelacion-medianas-bosque-verde-22-x-35-cm-caja	t
3187	43	1	Bolsas zip congelación medianas Bosque Verde	1.20	0.06	ud	https://prod-mercadona.imgix.net/images/831e513726a8229b86294e6417d83528.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49073/bolsas-zip-congelacion-medianas-bosque-verde-18-x-185-cm-caja	t
3188	43	1	Bolsas congelación grandes Bosque Verde	1.30	0.04	ud	https://prod-mercadona.imgix.net/images/4734fcc5d772f42666cb016b4ec4d7cd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14456/bolsas-congelacion-grandes-bosque-verde-30-x-45-cm-caja	t
3189	43	1	Bolsas zip congelación grandes Bosque Verde	1.30	0.09	ud	https://prod-mercadona.imgix.net/images/4722375a9666f35f2c9a43ff23506098.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49074/bolsas-zip-congelacion-grandes-bosque-verde-27-x-308-cm-caja	t
3190	43	1	Bolsas reutilizables Bosque Verde	1.20	0.30	ud	https://prod-mercadona.imgix.net/images/685008206542888bc80b4916f3aaa892.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15777/bolsas-reutilizables-bosque-verde-paquete	t
3191	43	1	Vasos grandes de plástico Bosque Verde reutilizables	1.65	0.17	ud	https://prod-mercadona.imgix.net/images/2e160ea1eb91c926dfdef9b5142379c9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/15968/vasos-grandes-plastico-bosque-verde-reutilizables-multiusos-550-ml-paquete	t
3192	45	1	Vaso mediano Bosque Verde apto para bebida caliente	2.35	0.24	ud	https://prod-mercadona.imgix.net/images/36a92299e9aa991f9488417d5dcb8771.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/35627/vaso-mediano-bosque-verde-apto-bebida-caliente-desechable-200-ml	t
3193	45	1	Vaso pequeño Bosque Verde apto para bebida caliente	1.35	0.07	ud	https://prod-mercadona.imgix.net/images/4236813a2b75331346d4af878b2a9733.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/67981/vaso-pequeno-bosque-verde-apto-bebida-caliente-desechable-100-ml-paquete	t
3194	45	1	Plato llano biodegradable Bosque Verde	1.60	0.11	ud	https://prod-mercadona.imgix.net/images/8d28f927b30fb8289edb3629c147cce9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23187/plato-llano-biodegradable-bosque-verde-22-cm-paquete	t
3195	45	1	Plato postre biodegradable Bosque Verde	1.45	0.10	ud	https://prod-mercadona.imgix.net/images/74e5011e0473a5334475519fbcc3d207.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23188/plato-postre-biodegradable-bosque-verde-175-cm-paquete	t
3196	45	1	Bol biodegradable Bosque Verde	2.00	0.13	ud	https://prod-mercadona.imgix.net/images/045299d3920a1e2fd26472413f0f1e1d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23189/bol-biodegradable-bosque-verde-400-ml-paquete	t
3197	45	1	Cucharas de plástico Bosque Verde reutilizables	1.55	0.10	ud	https://prod-mercadona.imgix.net/images/eb5fd74a96cff2c66236e5a697a8434e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13717/cucharas-plastico-bosque-verde-reutilizables-paquete	t
3198	45	1	Cucharas postre de plástico Bosque Verde reutilizables	1.45	0.10	ud	https://prod-mercadona.imgix.net/images/31b12751a793f5260220469596a67b9b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13719/cucharas-postre-plastico-bosque-verde-reutilizables-paquete	t
3199	45	1	Tenedores de plástico Bosque Verde reutilizables	1.55	0.10	ud	https://prod-mercadona.imgix.net/images/20ed85f5f043b509687ab4752fbc68d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13716/tenedores-plastico-bosque-verde-reutilizables-paquete	t
3200	45	1	Cuchillos de plástico Bosque Verde reutilizables	1.55	0.10	ud	https://prod-mercadona.imgix.net/images/a419d3cb4a078d3362483e018b7ddb42.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13718/cuchillos-plastico-bosque-verde-reutilizables-paquete	t
3201	45	1	Pajitas rectas reutilizables	1.10	0.04	ud	https://prod-mercadona.imgix.net/images/719ef2ae4c03cb91edcea0b9700515de.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23516/pajitas-rectas-reutilizables-paquete	t
3202	45	1	Palillos redondos Bosque Verde	1.25	0.00	ud	https://prod-mercadona.imgix.net/images/0ca2eea1ee82e1ff9518702e4c2c5cc5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49319/palillos-redondos-bosque-verde-bote	t
3203	45	1	Bandeja de cartón rectangular Bosque Verde	2.35	0.59	ud	https://prod-mercadona.imgix.net/images/98df0dea4e42b48252bbc717ca2084d3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49632/bandeja-carton-rectangular-bosque-verde-desechable-25-x-34-cm-incluye-4-bandejas-4-blondas-paquete	t
3204	45	1	Vasos medianos de plástico Bosque Verde reutilizables	1.60	0.16	ud	https://prod-mercadona.imgix.net/images/9caa5f6908b2ebbca44090698b1e1721.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22496/vasos-medianos-plastico-bosque-verde-reutilizables-400-ml-paquete	t
3205	45	1	Pastillas enciende fuegos Encendido	1.05	0.03	ud	https://prod-mercadona.imgix.net/images/69bc8cd76ea799fed6dffe118bbfdd03.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/92091/pastillas-enciende-fuegos-encendido-caja	t
3206	45	1	Carbón vegetal Bosque Verde	4.25	1.70	kg	https://prod-mercadona.imgix.net/images/aed633656426063edf7c348e555af792.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12056/carbon-vegetal-bosque-verde-paquete	t
3207	45	1	Mini mechero Clipper	2.50	0.83	ud	https://prod-mercadona.imgix.net/images/2de97805b25dd712ad31a10294d678bb.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49330/mini-mechero-clipper-paquete	t
3208	45	1	Encendedor cocina largo Clipper	2.60	2.60	ud	https://prod-mercadona.imgix.net/images/99f97e3b1f99751d32eb2c77824fe5b8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/49080/encendedor-cocina-largo-clipper-paquete	t
3209	41	1	Fregona Microfibra Absorbente Bosque Verde	2.70	1.35	ud	https://prod-mercadona.imgix.net/images/0193fc9cf60e3a8661fda34775409fce.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71403/fregona-microfibra-absorbente-bosque-verde-suelos-interior-paquete	t
3210	41	1	Fregona Resistente y Absorbente Bosque Verde	1.75	0.88	ud	https://prod-mercadona.imgix.net/images/fdf84f35b894bddb92bbec9668128f74.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71071/fregona-resistente-absorbente-bosque-verde-suelos-interior-exterior-paquete	t
3211	41	1	Fregona Microfibra Resistente Bosque Verde	3.50	3.50	ud	https://prod-mercadona.imgix.net/images/eae38fc546d0975976d45e7547531fae.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71407/fregona-microfibra-resistente-bosque-verde-suelos-interior-exterior-paquete	t
3212	41	1	Mopa atrapa polvo Bosque Verde multiusos	4.50	4.50	ud	https://prod-mercadona.imgix.net/images/e4d3f339f2c515f99477045afc84a908.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/86836/mopa-atrapa-polvo-bosque-verde-multiusos-1-mopa-10-gamuzas-paquete	t
3213	41	1	Gamuzas atrapa polvo Bosque Verde	1.80	0.06	ud	https://prod-mercadona.imgix.net/images/1ae35728df80a90961898ca31112047d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71533/gamuzas-atrapa-polvo-bosque-verde-paquete	t
3214	41	1	Recambio mopa microfibra pequeño Bosque Verde	4.90	4.90	ud	https://prod-mercadona.imgix.net/images/300ece8725e384858516ccb2577d0d22.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71054/recambio-mopa-microfibra-pequeno-bosque-verde-paquete	t
3215	41	1	Toallitas limpiadoras de suelo Bosque Verde	1.60	0.08	ud	https://prod-mercadona.imgix.net/images/bb7d5f4ba6de2434ccee0b538e88e581.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/71527/toallitas-limpiadoras-suelo-bosque-verde-paquete	t
3216	45	1	Pinzas de ropa Bosque Verde	1.50	0.06	ud	https://prod-mercadona.imgix.net/images/b208a7d252f854b33109e2087f8c8add.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/9900/pinzas-ropa-bosque-verde-paquete	t
3217	41	1	Recambios plumero Bosque Verde	2.20	0.37	ud	https://prod-mercadona.imgix.net/images/d234a6affa0f872aa356f768d0f5290b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52559/recambios-plumero-bosque-verde-desechables-paquete	t
3218	41	1	Plumero atrapa polvo Bosque Verde	2.00	2.00	ud	https://prod-mercadona.imgix.net/images/e0c940dc9c2bb4a899b27b8705e741f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/8999/plumero-atrapa-polvo-bosque-verde-1-mango-3-recambios-paquete	t
3219	41	1	Crema de calzado blanco autobrillante Bosque Verde con aplicador	0.95	19.00	l	https://prod-mercadona.imgix.net/images/a8517cc51a0236cfc85c3b7de6e2b6b3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70030/crema-calzado-blanco-autobrillante-bosque-verde-con-aplicador-bote	t
3220	41	1	Crema de calzado marrón autobrillante Bosque Verde con aplicador	0.95	19.00	l	https://prod-mercadona.imgix.net/images/adba95ecb6c80aee005fdca82d55c313.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70028/crema-calzado-marron-autobrillante-bosque-verde-con-aplicador-bote	t
3221	41	1	Crema de calzado negro autobrillante Bosque Verde con aplicador	0.95	19.00	l	https://prod-mercadona.imgix.net/images/4b962ad6bf4f0ca92934f7f162d4fdf3.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/70024/crema-calzado-negro-autobrillante-bosque-verde-con-aplicador-bote	t
3222	41	1	Desodorante de calzado Bosque Verde	2.95	11.80	l	https://prod-mercadona.imgix.net/images/c3d6c5a31e1debed00daf7b8aed4caaf.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/23183/desodorante-calzado-bosque-verde-spray	t
3223	35	23	Pechuga de Pollo Ecológica Carrefour Bio 500 g aprox	13.97	27.95	kg	https://static.carrefour.es/hd_350x_/img_pim_food/333865_00_1.jpg	https://www.carrefour.es/supermercado/pechuga-de-pollo-ecologica-carrefour-bio-500-g-aprox/R-fprod1310075/p	t
3224	35	23	Pollo campero limpio Círculo de Calidad 1,8 kg aprox	12.04	6.69	kg	https://static.carrefour.es/hd_350x_/img_pim_food/826990_00_1.jpg	https://www.carrefour.es/supermercado/pollo-campero-limpio-circulo-de-calidad-18-kg-aprox/R-prod460411/p	t
3225	35	23	Pechuga de Pollo Fileteada Ecológica Carrefour Bio 550 g aprox	15.92	28.95	kg	https://static.carrefour.es/hd_350x_/img_pim_food/333866_00_1.jpg	https://www.carrefour.es/supermercado/pechuga-de-pollo-fileteada-ecologica-carrefour-bio-550-g-aprox/R-fprod1310074/p	t
3226	35	23	Filetes de pollo empanado El Mercado sin gluten 500 g aprox	4.35	8.70	kg	https://static.carrefour.es/hd_350x_/img_pim_food/249481_00_1.jpg	https://www.carrefour.es/supermercado/filetes-de-pollo-empanado-el-mercado-sin-gluten-500-g-aprox/R-VC4AECOMM-249481/p	t
3227	35	23	Pollo entero en trozos Carrefour 2 kg aprox	8.12	4.06	kg	https://static.carrefour.es/hd_350x_/img_pim_food/128501_00_1.jpg	https://www.carrefour.es/supermercado/pollo-entero-en-trozos-carrefour-2-kg-aprox/R-VC4AECOMM-128501/p	t
3228	35	23	Filetes de contramuslo de pollo Carrefour El Mercado 600 g aprox	3.83	6.39	kg	https://static.carrefour.es/hd_350x_/img_pim_food/577203_00_1.jpg	https://www.carrefour.es/supermercado/filetes-de-contramuslo-de-pollo-carrefour-el-mercado-600-g-aprox/R-VC4AECOMM-577203/p	t
3229	35	23	Pollo certificado limpio Carrefour 2 kg	9.78	4.89	kg	https://static.carrefour.es/hd_350x_/img_pim_food/887242_00_1.jpg	https://www.carrefour.es/supermercado/pollo-certificado-limpio-carrefour-2-kg/R-791562917/p	t
3230	35	23	Hamburguesas de pollo de corral 250 g	3.85	15.40	kg	https://static.carrefour.es/hd_350x_/img_pim_food/247917_00_1.jpg	https://www.carrefour.es/supermercado/hamburguesas-de-pollo-de-corral-250-g/R-prod810892/p	t
3231	35	23	Solomillos de pollo Carrefour El Mercado 600 g aprox	4.71	7.85	kg	https://static.carrefour.es/hd_350x_/img_pim_food/577621_00_1.jpg	https://www.carrefour.es/supermercado/solomillos-de-pollo-carrefour-el-mercado-600-g-aprox/R-VC4AECOMM-577621/p	t
3232	35	23	Patas de pollo Carreofur El Mercado 400 g aprox	1.84	4.60	kg	https://static.carrefour.es/hd_350x_/img_pim_food/577282_00_1.jpg	https://www.carrefour.es/supermercado/patas-de-pollo-carreofur-el-mercado-400-g-aprox/R-VC4AECOMM-577282/p	t
3233	35	23	Pollo campero limpio Círculo de Calidad 1,6 kg aprox	10.70	6.69	kg	https://static.carrefour.es/hd_350x_/img_pim_food/832324_00_1.jpg	https://www.carrefour.es/supermercado/pollo-campero-limpio-circulo-de-calidad-16-kg-aprox/R-prod500438/p	t
3234	35	23	Hamburguesa de pollo 360 g	3.20	8.89	kg	https://static.carrefour.es/hd_350x_/img_pim_food/497342_00_1.jpg	https://www.carrefour.es/supermercado/hamburguesa-de-pollo-360-g/R-VC4AECOMM-497342/p	t
3235	35	23	Medio Pollo Certificado troceado 1 kg aprox	6.05	6.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/248849_00_1.jpg	https://www.carrefour.es/supermercado/medio-pollo-certificado-troceado-1-kg-aprox/R-prod810867/p	t
3530	35	2	Alas partidas de pollo	5.05	5.10	kg	https://prod-mercadona.imgix.net/images/ede5538914ce8073545beba4e7cc13e1.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/4195/alas-partidas-pollo-bandeja	t
3236	35	23	Pollos enteros Carrefour El Mercado 3,2 kg aprox	11.04	3.45	kg	https://static.carrefour.es/hd_350x_/img_pim_food/577595_00_1.jpg	https://www.carrefour.es/supermercado/pollos-enteros-carrefour-el-mercado-32-kg-aprox/R-VC4AECOMM-577595/p	t
3237	35	23	Hamburguesas mini de picaña angus Lord Dani 280 g	4.89	17.46	kg	https://static.carrefour.es/hd_350x_/img_pim_food/415286_00_1.jpg	https://www.carrefour.es/supermercado/hamburguesas-mini-de-picana-angus-lord-dani-280-g/R-VC4AECOMM-415286/p	t
3238	35	23	Filetes de pechuga pollo corte fino El Mercado 600 g aprox	4.83	8.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/691153_00_1.jpg	https://www.carrefour.es/supermercado/filetes-de-pechuga-pollo-corte-fino-el-mercado-600-g-aprox/R-VC4AECOMM-691153/p	t
3239	35	23	Contra de pollo con piel Carrefour El Mercado 1 kg aprox	4.05	4.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/577179_00_1.jpg	https://www.carrefour.es/supermercado/contra-de-pollo-con-piel-carrefour-el-mercado-1-kg-aprox/R-VC4AECOMM-577179/p	t
3240	35	23	Albóndigas de Añojo Círculo de Calidad 360 g	5.15	14.31	kg	https://static.carrefour.es/hd_350x_/img_pim_food/676570_00_1.jpg	https://www.carrefour.es/supermercado/albondigas-de-anojo-circulo-de-calidad-360-g/R-VC4AECOMM-676570/p	t
3241	35	23	Brocheta de pollo marinado 400 g aprox	6.49	12.99	kg	https://static.carrefour.es/hd_350x_/img_pim_food/770190_00_1.jpg	https://www.carrefour.es/supermercado/brocheta-de-pollo-marinado-400-g-aprox/R-VC4AECOMM-770190/p	t
3242	35	23	Brocheta de Pollo Adobado 400 g aprox	6.49	12.99	kg	https://static.carrefour.es/hd_350x_/img_pim_food/770215_00_1.jpg	https://www.carrefour.es/supermercado/brocheta-de-pollo-adobado-400-g-aprox/R-VC4AECOMM-770215/p	t
3243	37	23	Fresa origen Huelva Círculo de Calidad 400 g	2.99	7.48	kg	https://static.carrefour.es/hd_350x_/img_pim_food/658002_00_1.jpg	https://www.carrefour.es/supermercado/fresa-origen-huelva-circulo-de-calidad-400-g/R-VC4AECOMM-658002/p	t
3244	37	23	Berenjena Carrefour a granel 1 kg aprox	2.29	2.29	kg	https://static.carrefour.es/hd_350x_/img_pim_food/394518_00_1.jpg	https://www.carrefour.es/supermercado/berenjena-carrefour-a-granel-1-kg-aprox/R-VC4AECOMM-394518/p	t
3245	37	23	Cebolleta blanca manojo de 3-4  piezas	1.69	3.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/050295_00_1.jpg	https://www.carrefour.es/supermercado/cebolleta-blanca-manojo-de-3-4-piezas/R-521032283/p	t
3246	37	23	Espinaca troceada Carrefour El Mercado 300 g	1.19	3.97	kg	https://static.carrefour.es/hd_350x_/img_pim_food/261718_00_1.jpg	https://www.carrefour.es/supermercado/espinaca-troceada-carrefour-el-mercado-300-g/R-526574300/p	t
3247	37	23	Alcachofa Carrefour 1 kg aprox	1.75	1.75	kg	https://static.carrefour.es/hd_350x_/img_pim_food/744605_00_1.jpg	https://www.carrefour.es/supermercado/alcachofa-carrefour-1-kg-aprox/R-VC4AECOMM-744605/p	t
3248	37	23	Patata para guarnición Carrefour El Mercado 1 kg	1.77	1.77	kg	https://static.carrefour.es/hd_350x_/img_pim_food/809256_00_1.jpg	https://www.carrefour.es/supermercado/patata-para-guarnicion-carrefour-el-mercado-1-kg/R-693401847/p	t
3249	37	23	Escarola Rizada Carrefour El Mercado 150 g	1.25	8.33	kg	https://static.carrefour.es/hd_350x_/img_pim_food/522123_00_1.jpg	https://www.carrefour.es/supermercado/escarola-rizada-carrefour-el-mercado-150-g/R-521032343/p	t
3250	37	23	Repollo liso nacional  1,5 kg	1.98	1.98	kg	https://static.carrefour.es/hd_350x_/img_pim_food/050258_00_1.jpg	https://www.carrefour.es/supermercado/repollo-liso-nacional-15-kg/R-529916719/p	t
3251	37	23	Repollo rizado 1 Kg	2.42	2.20	kg	https://static.carrefour.es/hd_350x_/img_pim_food/050205_00_1.jpg	https://www.carrefour.es/supermercado/repollo-rizado-1-kg/R-529916713/p	t
3252	37	23	Berenjena Soraya Carrefour 1 kg aprox	2.39	2.39	kg	https://static.carrefour.es/hd_350x_/img_pim_food/100142_00_1.jpg	https://www.carrefour.es/supermercado/berenjena-soraya-carrefour-1-kg-aprox/R-VC4AECOMM-100142/p	t
3253	37	23	Seta Círculo de Calidad Carrefour El Mercado 400 g aprox.	3.02	7.55	kg	https://static.carrefour.es/hd_350x_/img_pim_food/540581_00_1.jpg	https://www.carrefour.es/supermercado/seta-circulo-de-calidad-carrefour-el-mercado-400-g-aprox/R-VC4AECOMM-540581/p	t
3254	37	23	Escarola rizada 1 ud	1.90	1.90	ud	https://static.carrefour.es/hd_350x_/img_pim_food/050298_00_1.jpg	https://www.carrefour.es/supermercado/escarola-rizada-1-ud/R-522714495/p	t
3255	37	23	Berenjena Carrefour Bio 2 Piezas	3.35	6.70	kg	https://static.carrefour.es/hd_350x_/img_pim_food/376873_00_1.jpg	https://www.carrefour.es/supermercado/berenjena-carrefour-bio-2-piezas/R-fprod1450030/p	t
3256	37	23	Judía verde plana ecológica Carrefour Bio 250 g	2.89	11.56	kg	https://static.carrefour.es/hd_350x_/img_pim_food/476582_00_1.jpg	https://www.carrefour.es/supermercado/judia-verde-plana-ecologica-carrefour-bio-250-g/R-prod393094/p	t
3257	37	23	Espárrago verde barbacoa selecta manojo de  500 g	5.15	10.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/763637_00_1.jpg	https://www.carrefour.es/supermercado/esparrago-verde-barbacoa-selecta-manojo-de-500-g/R-754706029/p	t
3258	37	23	Alcachofa en Aove 250 g	3.25	13.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/686049_00_1.jpg	https://www.carrefour.es/supermercado/alcachofa-en-aove-250-g/R-VC4AECOMM-686049/p	t
3259	37	23	Coliflor color Carrefour troceada 400 g	2.55	6.37	kg	https://static.carrefour.es/hd_350x_/img_pim_food/444623_00_1.jpg	https://www.carrefour.es/supermercado/coliflor-color-carrefour-troceada-400-g/R-VC4AECOMM-444623/p	t
3260	37	23	Judía fina 1 kg aprox	6.39	6.39	kg	https://static.carrefour.es/hd_350x_/img_pim_food/091352_00_1.jpg	https://www.carrefour.es/supermercado/judia-fina-1-kg-aprox/R-530102387/p	t
3261	16	23	Bloque vegano estilo griego Violife sin gluten sin lactosa 200 g.	4.79	23.95	kg	https://static.carrefour.es/hd_350x_/img_pim_food/702245_00_1.jpg	https://www.carrefour.es/supermercado/bloque-vegano-estilo-griego-violife-sin-gluten-sin-lactosa-200-g/R-VC4AECOMM-702245/p	t
3262	16	23	Lochas vegetarianas con verduras Carrefour Veggie sin gluten y sin lactosa 100 g.	1.35	13.50	kg	https://static.carrefour.es/hd_350x_/img_pim_food/697189_00_1.jpg	https://www.carrefour.es/supermercado/lochas-vegetarianas-con-verduras-carrefour-veggie-sin-gluten-y-sin-lactosa-100-g/R-VC4AECOMM-697189/p	t
3263	16	23	Paleta asada al horno en lonchas Noel Delizias sin gluten y sin lactosa 150 g.\n	3.39	22.60	kg	https://static.carrefour.es/hd_350x_/img_pim_food/369452_00_1.jpg	https://www.carrefour.es/supermercado/paleta-asada-al-horno-en-lonchas-noel-delizias-sin-gluten-y-sin-lactosa-150-g/R-fprod1420346/p	t
3264	16	23	Pollo relleno al corte La Carloteña 150 g aprox	2.38	15.89	kg	https://static.carrefour.es/hd_350x_/img_pim_food/415159_00_1.jpg	https://www.carrefour.es/supermercado/pollo-relleno-al-corte-la-carlotena-150-g-aprox/R-607902896/p	t
3265	23	23	Serenitos gourmet Carrefour El Mercado 420 g	4.99	11.88	kg	https://static.carrefour.es/hd_350x_/img_pim_food/418463_00_1.jpg	https://www.carrefour.es/supermercado/serenitos-gourmet-carrefour-el-mercado-420-g/R-VC4AECOMM-418463/p	t
3266	24	23	Dots Dubai 2 uds.	2.50	17.48	kg	https://static.carrefour.es/hd_350x_/img_pim_food/682042_00_1.jpg	https://www.carrefour.es/supermercado/dots-dubai-2-uds/R-VC4AECOMM-682042/p	t
3267	24	23	Dots nubes Carrefour 2 uds.	1.75	15.62	kg	https://static.carrefour.es/hd_350x_/img_pim_food/645581_00_1.jpg	https://www.carrefour.es/supermercado/dots-nubes-carrefour-2-uds/R-VC4AECOMM-645581/p	t
3268	18	23	Empanada rectangular vegana El Mercado 700 g	5.25	5.25	ud	https://static.carrefour.es/hd_350x_/img_pim_food/555474_00_1.jpg	https://www.carrefour.es/supermercado/empanada-rectangular-vegana-el-mercado-700-g/R-VC4AECOMM-555474/p	t
3269	18	23	Crunch Roll de Pollo Sushi Daily 224 g	7.99	7.99	ud	https://static.carrefour.es/hd_350x_/img_pim_food/909207_00_1.jpg	https://www.carrefour.es/supermercado/crunch-roll-de-pollo-sushi-daily-224-g/R-801332956/p	t
3270	18	23	Gyoza de Pollo 130 g	7.99	7.99	ud	https://static.carrefour.es/hd_350x_/img_pim_food/367886_00_1.jpg	https://www.carrefour.es/supermercado/gyoza-de-pollo-130-g/R-682008508/p	t
3271	18	23	Crunch Roll de Pollo Picante Sushi Daily 220 g	8.79	8.79	ud	https://static.carrefour.es/hd_350x_/img_pim_food/250066_00_1.jpg	https://www.carrefour.es/supermercado/crunch-roll-de-pollo-picante-sushi-daily-220-g/R-VC4AECOMM-250066/p	t
3272	18	23	Combo Two Sushi Daily 212 g	9.89	9.89	ud	https://static.carrefour.es/hd_350x_/img_pim_food/866788_00_1.jpg	https://www.carrefour.es/supermercado/combo-two-sushi-daily-212-g/R-prod290591/p	t
3273	18	23	Pollo asado troceado 1,3 kg aprox	8.38	6.45	kg	https://static.carrefour.es/hd_350x_/img_pim_food/077576_00_1.jpg	https://www.carrefour.es/supermercado/pollo-asado-troceado-13-kg-aprox/R-VC4AECOMM-077576/p	t
3274	18	23	Pollo asado entero Granja Gourmet 1 kg aprox	5.50	5.50	kg	https://static.carrefour.es/hd_350x_/img_pim_food/547827_00_1.jpg	https://www.carrefour.es/supermercado/pollo-asado-entero-granja-gourmet-1-kg-aprox/R-VC4AECOMM-547827/p	t
3275	18	23	Croquetas de pollo 10 ud	4.40	4.40	ud	https://static.carrefour.es/hd_350x_/img_pim_food/789528_00_1.jpg	https://www.carrefour.es/supermercado/croquetas-de-pollo-10-ud/R-prod590499/p	t
3276	18	23	Arroz de verduras Socarraet 280 g	3.49	3.49	ud	https://static.carrefour.es/hd_350x_/img_pim_food/683993_00_1.jpg	https://www.carrefour.es/supermercado/arroz-de-verduras-socarraet-280-g/R-VC4AECOMM-683993/p	t
3277	18	23	Arroz negro Carrefour 350 g	2.94	8.40	kg	https://static.carrefour.es/hd_350x_/img_pim_food/412918_00_1.jpg	https://www.carrefour.es/supermercado/arroz-negro-carrefour-350-g/R-719504485/p	t
3278	18	23	Arroz a banda Socarraet 280 g	3.99	3.99	ud	https://static.carrefour.es/hd_350x_/img_pim_food/683887_00_1.jpg	https://www.carrefour.es/supermercado/arroz-a-banda-socarraet-280-g/R-VC4AECOMM-683887/p	t
3279	18	23	Nuggets de pechuga de pollo 250 g	3.10	12.40	kg	https://static.carrefour.es/hd_350x_/img_pim_food/099633_00_1.jpg	https://www.carrefour.es/supermercado/nuggets-de-pechuga-de-pollo-250-g/R-prod1022705/p	t
3280	18	23	Arroz largo categoria 1 Carrefour Classic´ 1 kg.	1.12	1.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/197726_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-categoria-1-carrefour-classic-1-kg/R-538408171/p	t
3281	20	23	Garbanzos cocidos categoría extra Classic Carrefour 400 g.	0.85	2.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/686220_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-cocidos-categoria-extra-classic-carrefour-400-g/R-521005495/p	t
3282	5	23	Arroz categoría primera Carrefour 1 kg. 	1.30	1.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/101424_00_1.jpg	https://www.carrefour.es/supermercado/arroz-categoria-primera-carrefour-1-kg/R-prod1022743/p	t
3283	20	23	Garbanzo cocido categoría extra Luengo 400 g.	1.31	3.27	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032627_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-cocido-categoria-extra-luengo-400-g/R-546305864/p	t
3284	20	23	Alubias cocidas categoría extra Classic Carrefour 400 g.	0.80	2.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/686224_00_1.jpg	https://www.carrefour.es/supermercado/alubias-cocidas-categoria-extra-classic-carrefour-400-g/R-521005493/p	t
3285	5	23	Arroz redondo Sos 1 kg.	1.88	1.88	kg	https://static.carrefour.es/hd_350x_/img_pim_food/002277_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-sos-1-kg/R-521012514/p	t
3286	20	23	Garbanzos cocidos sin sal añadida categoría extra Classic Carrefour 400 g.	0.85	2.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/709626_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-cocidos-sin-sal-anadida-categoria-extra-classic-carrefour-400-g/R-521005485/p	t
3287	5	23	Arroz basmati para microondas Classic Carrefour sin gluten pack de 2 unidades de 125 g.	1.15	4.60	kg	https://static.carrefour.es/hd_350x_/img_pim_food/099191_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-para-microondas-classic-carrefour-sin-gluten-pack-de-2-unidades-de-125-g/R-VC4AECOMM-099191/p	t
3288	5	23	Lenteja pardina categoría extra Classic Carrefour 1 kg.	2.05	2.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/645734_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-categoria-extra-classic-carrefour-1-kg/R-616401946/p	t
3289	20	23	Lentejas cocidas categoría extra Carrefour 400 g.	0.90	2.25	kg	https://static.carrefour.es/hd_350x_/img_pim_food/686242_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-cocidas-categoria-extra-carrefour-400-g/R-521005501/p	t
3290	20	23	Alubia cocida categoría extra Luengo 400 g.	1.31	3.27	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032625_00_1.jpg	https://www.carrefour.es/supermercado/alubia-cocida-categoria-extra-luengo-400-g/R-546305860/p	t
3291	5	23	Arroz redondo integral para microondas Classic Carrefour sin gluten pack de 2 unidades de 125 g.	1.10	4.40	kg	https://static.carrefour.es/hd_350x_/img_pim_food/099187_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-integral-para-microondas-classic-carrefour-sin-gluten-pack-de-2-unidades-de-125-g/R-VC4AECOMM-099187/p	t
3292	5	23	Arroz basmati Sensation Carrefour 1 kg.	2.09	2.09	kg	https://static.carrefour.es/hd_350x_/img_pim_food/724474_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-sensation-carrefour-1-kg/R-VC4AECOMM-724474/p	t
3293	5	23	Garbanzo categoría extra Carrefour 1 kg.	2.19	2.19	kg	https://static.carrefour.es/hd_350x_/img_pim_food/201578_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-categoria-extra-carrefour-1-kg/R-536500289/p	t
3294	5	23	Garbanzo pedrosillano Classic Carrefour 400 g.	0.95	2.37	kg	https://static.carrefour.es/hd_350x_/img_pim_food/128412_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-classic-carrefour-400-g/R-VC4AECOMM-128412/p	t
3295	20	23	Garbanzos cocidos al natural Classic Carrefour 210 g.	0.70	3.33	kg	https://static.carrefour.es/hd_350x_/img_pim_food/551496_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-cocidos-al-natural-classic-carrefour-210-g/R-VC4AECOMM-551496/p	t
3296	5	23	Arroz basmati para microondas Brillante sin gluten pack de 2 unidades de 125 g.	1.42	5.68	kg	https://static.carrefour.es/hd_350x_/img_pim_food/449472_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-para-microondas-brillante-sin-gluten-pack-de-2-unidades-de-125-g/R-521005542/p	t
3297	5	23	Arroz largo vaporizado Carrefour Classic 1 kg.	1.65	1.65	kg	https://static.carrefour.es/hd_350x_/img_pim_food/523827_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-vaporizado-carrefour-classic-1-kg/R-521005536/p	t
3298	5	23	Arroz redondo para microondas Brillante pack de 2 unidades de 125 g.	1.29	5.16	kg	https://static.carrefour.es/hd_350x_/img_pim_food/737039_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-para-microondas-brillante-pack-de-2-unidades-de-125-g/R-521005546/p	t
3299	5	23	Arroz categoría extra La Fallera 1 kg.	1.74	1.74	kg	https://static.carrefour.es/hd_350x_/img_pim_food/013185_00_1.jpg	https://www.carrefour.es/supermercado/arroz-categoria-extra-la-fallera-1-kg/R-521005512/p	t
3300	5	23	Lenteja pardina categoría extra Luengo 1 kg.	3.79	3.79	kg	https://static.carrefour.es/hd_350x_/img_pim_food/097243_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-categoria-extra-luengo-1-kg/R-526538843/p	t
3301	20	23	Lentejas cocidas categoría extra Classic Carrefour sin sal añadida 400 g.	0.90	2.25	kg	https://static.carrefour.es/hd_350x_/img_pim_food/709624_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-cocidas-categoria-extra-classic-carrefour-sin-sal-anadida-400-g/R-521005483/p	t
3302	20	23	Alubia cocida categoría extra Classic Carrefour sin sal añadida 400 g.	0.80	2.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/709406_00_1.jpg	https://www.carrefour.es/supermercado/alubia-cocida-categoria-extra-classic-carrefour-sin-sal-anadida-400-g/R-521005481/p	t
3303	5	23	Arroz redondo Brillante Sabroz 1 kg.	2.79	2.79	kg	https://static.carrefour.es/hd_350x_/img_pim_food/698871_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-brillante-sabroz-1-kg/R-624601818/p	t
3304	20	23	Alubias rojas cocidas Classic Carrefour 400 g.	1.20	3.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/784128_00_1.jpg	https://www.carrefour.es/supermercado/alubias-rojas-cocidas-classic-carrefour-400-g/R-VC4AECOMM-784128/p	t
3305	5	23	Lenteja categoría extra Carrefour 1 kg.	1.85	1.85	kg	https://static.carrefour.es/hd_350x_/img_pim_food/201629_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-categoria-extra-carrefour-1-kg/R-536500291/p	t
3306	5	23	Arroz integral para microondas Brillante pack de 2 unidades de 125 g.	1.25	5.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/580798_00_1.jpg	https://www.carrefour.es/supermercado/arroz-integral-para-microondas-brillante-pack-de-2-unidades-de-125-g/R-521005544/p	t
3307	20	23	Lenteja cocida categoría extra Luengo 400 g.	1.31	3.27	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032626_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-cocida-categoria-extra-luengo-400-g/R-546305862/p	t
3308	5	23	Arroz basmati Tilda 1 kg.	3.69	3.69	kg	https://static.carrefour.es/hd_350x_/img_pim_food/935338_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-tilda-1-kg/R-809105957/p	t
3309	5	23	Arroz vaporizado largo Brillante 1 kg.	1.99	1.99	kg	https://static.carrefour.es/hd_350x_/img_pim_food/002279_00_1.jpg	https://www.carrefour.es/supermercado/arroz-vaporizado-largo-brillante-1-kg/R-521005540/p	t
3310	5	23	Arroz integral Sos 1 kg.	2.05	2.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/052162_00_1.jpg	https://www.carrefour.es/supermercado/arroz-integral-sos-1-kg/R-696810961/p	t
3311	5	23	Arroz redondo Sos 2 kg.	3.65	1.82	kg	https://static.carrefour.es/hd_350x_/img_pim_food/384976_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-sos-2-kg/R-521008350/p	t
3312	5	23	Alubia blanca categoría extra Carrefour 1 kg.	2.45	2.45	kg	https://static.carrefour.es/hd_350x_/img_pim_food/717239_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-categoria-extra-carrefour-1-kg/R-740822685/p	t
3313	5	23	Alubia roja categoría extra Luengo 400 g.	1.65	4.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/693620_00_1.jpg	https://www.carrefour.es/supermercado/alubia-roja-categoria-extra-luengo-400-g/R-620102390/p	t
3314	5	23	Garbanzo lechoso categoría extra Original Carrefour 1 kg.	2.49	2.49	kg	https://static.carrefour.es/hd_350x_/img_pim_food/810401_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-lechoso-categoria-extra-original-carrefour-1-kg/R-635701946/p	t
3315	5	23	Alubia pinta categoría extra Classic Carrefour 1 kg.	2.39	2.39	kg	https://static.carrefour.es/hd_350x_/img_pim_food/811358_00_1.jpg	https://www.carrefour.es/supermercado/alubia-pinta-categoria-extra-classic-carrefour-1-kg/R-636701845/p	t
3316	5	23	Arroz redondo integral Carrefour 1 kg.	1.63	1.63	kg	https://static.carrefour.es/hd_350x_/img_pim_food/689578_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-integral-carrefour-1-kg/R-VC4AECOMM-689578/p	t
3317	5	23	Alubia pinta cocida Classic Carrefour 400 g.	1.25	3.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/551493_00_1.jpg	https://www.carrefour.es/supermercado/alubia-pinta-cocida-classic-carrefour-400-g/R-VC4AECOMM-551493/p	t
3318	5	23	Arroz largo La Cigala 1 kg.	2.15	2.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/002278_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-la-cigala-1-kg/R-521005530/p	t
3319	5	23	Garbanzo pedrosillano Classic Carrefour 1 kg.	1.90	1.90	kg	https://static.carrefour.es/hd_350x_/img_pim_food/024668_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-classic-carrefour-1-kg/R-VC4AECOMM-024668/p	t
3320	20	23	Lentejas cocidas al natural Classic Carrefour 210 g.	0.75	3.57	kg	https://static.carrefour.es/hd_350x_/img_pim_food/551499_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-cocidas-al-natural-classic-carrefour-210-g/R-VC4AECOMM-551499/p	t
3321	20	23	Alubias cocidas con verduras Classic Carrefour 400 g.	1.24	3.10	kg	https://static.carrefour.es/hd_350x_/img_pim_food/686246_00_1.jpg	https://www.carrefour.es/supermercado/alubias-cocidas-con-verduras-classic-carrefour-400-g/R-521005506/p	t
3322	5	23	Lenteja pardina categoría extra Luengo 500 g.	2.09	4.18	kg	https://static.carrefour.es/hd_350x_/img_pim_food/088491_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-categoria-extra-luengo-500-g/R-692808652/p	t
3323	5	23	Arroz categoría extra La Fallera 2 kg.	3.09	1.54	kg	https://static.carrefour.es/hd_350x_/img_pim_food/048533_00_1.jpg	https://www.carrefour.es/supermercado/arroz-categoria-extra-la-fallera-2-kg/R-590202529/p	t
3324	20	23	Alubia cocida al natural Classic Carrefour 210 g.	0.70	3.33	kg	https://static.carrefour.es/hd_350x_/img_pim_food/551491_00_1.jpg	https://www.carrefour.es/supermercado/alubia-cocida-al-natural-classic-carrefour-210-g/R-VC4AECOMM-551491/p	t
3325	5	23	Arroz redondo Nomen 1 kg.	2.05	2.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/670793_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-nomen-1-kg/R-VC4AECOMM-670793/p	t
3326	20	23	Garbanzo castellano cocido categoría extra De Nuestra Tierra 400 g.	1.76	4.40	kg	https://static.carrefour.es/hd_350x_/img_pim_food/540115_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-castellano-cocido-categoria-extra-de-nuestra-tierra-400-g/R-521008516/p	t
3327	5	23	Lenteja pardina categoría extra De Nuestra Tierra 1 kg.	3.59	3.59	kg	https://static.carrefour.es/hd_350x_/img_pim_food/226666_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-categoria-extra-de-nuestra-tierra-1-kg/R-521005433/p	t
3328	5	23	Arroz grueso para paella categoría extra La Fallera 1 kg.	2.65	2.65	kg	https://static.carrefour.es/hd_350x_/img_pim_food/273213_00_1.jpg	https://www.carrefour.es/supermercado/arroz-grueso-para-paella-categoria-extra-la-fallera-1-kg/R-526510955/p	t
3329	5	23	Arroz bomba categoría extra La Fallera 1 kg.	5.85	5.85	kg	https://static.carrefour.es/hd_350x_/img_pim_food/702944_00_1.jpg	https://www.carrefour.es/supermercado/arroz-bomba-categoria-extra-la-fallera-1-kg/R-526539121/p	t
3330	5	23	Arroz para caldosos Sos 1 kg.	3.09	3.09	kg	https://static.carrefour.es/hd_350x_/img_pim_food/951157_00_1.jpg	https://www.carrefour.es/supermercado/arroz-para-caldosos-sos-1-kg/R-818615346/p	t
3331	5	23	Arroz bomba Sos 1 kg.	6.65	6.65	kg	https://static.carrefour.es/hd_350x_/img_pim_food/215410_00_1.jpg	https://www.carrefour.es/supermercado/arroz-bomba-sos-1-kg/R-590207413/p	t
3332	5	23	Garbanzos con espinacas Classic Carrefour 350 g.	1.14	3.26	kg	https://static.carrefour.es/hd_350x_/img_pim_food/783921_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-con-espinacas-classic-carrefour-350-g/R-VC4AECOMM-783921/p	t
3333	5	23	Arroz redondo para microondas Brillante pack de 2 unidades de 200 g.	2.45	6.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/819748_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-para-microondas-brillante-pack-de-2-unidades-de-200-g/R-650001913/p	t
3334	5	23	Alubia blanca categoría extra Luengo 1 kg.	4.25	4.25	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032612_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-categoria-extra-luengo-1-kg/R-522713750/p	t
3335	20	23	Judión cocido categoría extra Classic Carrefour 400 g.	1.99	4.97	kg	https://static.carrefour.es/hd_350x_/img_pim_food/776398_00_1.jpg	https://www.carrefour.es/supermercado/judion-cocido-categoria-extra-classic-carrefour-400-g/R-768263785/p	t
3336	20	23	Garbanzos cocidos ecológicos Carrefour Bio sin sal añadida 400 g.	3.09	7.72	kg	https://static.carrefour.es/hd_350x_/img_pim_food/433974_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-cocidos-ecologicos-carrefour-bio-sin-sal-anadida-400-g/R-VC4AECOMM-433974/p	t
3337	20	23	Garbanzo pedrosillano cocido Pedro Luis 500 g.	2.55	5.10	kg	https://static.carrefour.es/hd_350x_/img_pim_food/974719_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-cocido-pedro-luis-500-g/R-837306010/p	t
3338	5	23	Arroz para paella Sos 1 kg.	3.89	3.89	kg	https://static.carrefour.es/hd_350x_/img_pim_food/836370_00_1.jpg	https://www.carrefour.es/supermercado/arroz-para-paella-sos-1-kg/R-prod550351/p	t
3339	5	23	Arroz para sushi Sundari 500 g.	2.15	4.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/088282_00_1.jpg	https://www.carrefour.es/supermercado/arroz-para-sushi-sundari-500-g/R-692808562/p	t
3340	20	23	Alubia blanca cocida La Asturiana 400 g.	1.94	4.85	kg	https://static.carrefour.es/hd_350x_/img_pim_food/030073_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-cocida-la-asturiana-400-g/R-prod260131/p	t
3341	5	23	Lenteja pardina Don Pedro 500 g.	1.99	3.98	kg	https://static.carrefour.es/hd_350x_/img_pim_food/911315_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-don-pedro-500-g/R-803482609/p	t
3342	5	23	Arroz largo para microondas Brillante pack de 2 unidades de 200 g.	2.45	6.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/819750_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-para-microondas-brillante-pack-de-2-unidades-de-200-g/R-650001915/p	t
3343	5	23	Lenteja categoría extra Luengo 1 kg.	4.15	4.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/097237_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-categoria-extra-luengo-1-kg/R-526538841/p	t
3344	5	23	Lenteja categoría extra ecológica Carrefour Bio 500 g.	1.82	3.64	kg	https://static.carrefour.es/hd_350x_/img_pim_food/322607_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-categoria-extra-ecologica-carrefour-bio-500-g/R-fprod1260232/p	t
3345	5	23	Arroz salvaje y basmati para microondas Brillante pack de 2 unidades de 125 g.	1.99	7.96	kg	https://static.carrefour.es/hd_350x_/img_pim_food/580799_00_1.jpg	https://www.carrefour.es/supermercado/arroz-salvaje-y-basmati-para-microondas-brillante-pack-de-2-unidades-de-125-g/R-546307004/p	t
3346	5	23	Arroz para caldosos Sos 500 g.	1.62	3.24	kg	https://static.carrefour.es/hd_350x_/img_pim_food/051682_00_1.jpg	https://www.carrefour.es/supermercado/arroz-para-caldosos-sos-500-g/R-678901849/p	t
3347	20	23	Lenteja pardina cocida categoría extra De Nuestra Tierra 400 g.	1.76	4.40	kg	https://static.carrefour.es/hd_350x_/img_pim_food/540106_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-cocida-categoria-extra-de-nuestra-tierra-400-g/R-521005503/p	t
3348	20	23	Garbanza blanca cocida Don Pedro 400 g.	2.09	5.22	kg	https://static.carrefour.es/hd_350x_/img_pim_food/867885_00_1.jpg	https://www.carrefour.es/supermercado/garbanza-blanca-cocida-don-pedro-400-g/R-782418252/p	t
3349	20	23	Judión cocido Granja La Asturiana 350 g.	2.99	7.48	kg	https://static.carrefour.es/hd_350x_/img_pim_food/530132_00_1.jpg	https://www.carrefour.es/supermercado/judion-cocido-granja-la-asturiana-350-g/R-521014159/p	t
3350	20	23	Alubia riñón cocida categoría extra De Nuestra Tierra 400 g.	1.84	4.60	kg	https://static.carrefour.es/hd_350x_/img_pim_food/540114_00_1.jpg	https://www.carrefour.es/supermercado/alubia-rinon-cocida-categoria-extra-de-nuestra-tierra-400-g/R-521005491/p	t
3351	5	23	Arroz basmati ecológico Carrefour Bio 500 g.	2.15	4.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/401917_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-ecologico-carrefour-bio-500-g/R-fprod1460570/p	t
3352	5	23	Lenteja roja La Cochura 500 g.	2.59	5.18	kg	https://static.carrefour.es/hd_350x_/img_pim_food/971771_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-roja-la-cochura-500-g/R-859100666/p	t
3353	20	23	Garbanzos con verduras cocidas Classic Carrefour 400 g.	1.24	3.10	kg	https://static.carrefour.es/hd_350x_/img_pim_food/686245_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-con-verduras-cocidas-classic-carrefour-400-g/R-521005508/p	t
3354	5	23	Garbanzo categoría extra Luengo 1 kg.	4.15	4.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/037769_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-categoria-extra-luengo-1-kg/R-522713774/p	t
3355	5	23	Garbanzo pedrosillano categoría extra De Nuestra Tierra 1 kg.	3.69	3.69	kg	https://static.carrefour.es/hd_350x_/img_pim_food/467754_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-categoria-extra-de-nuestra-tierra-1-kg/R-521005461/p	t
3356	5	23	Alubia pinta categoría extra Luengo 1 kg.	4.79	4.79	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032614_00_1.jpg	https://www.carrefour.es/supermercado/alubia-pinta-categoria-extra-luengo-1-kg/R-522713752/p	t
3357	20	23	Garbanzos con su sofrito Hoy Legumbres Litoral sin gluten 440 g.	1.95	4.43	kg	https://static.carrefour.es/hd_350x_/img_pim_food/134592_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-con-su-sofrito-hoy-legumbres-litoral-sin-gluten-440-g/R-546306108/p	t
3358	5	23	Alubia blanca riñón categoría extra De Nuestra Tierra 1 kg.	4.49	4.49	kg	https://static.carrefour.es/hd_350x_/img_pim_food/226664_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-rinon-categoria-extra-de-nuestra-tierra-1-kg/R-521012684/p	t
3359	5	23	Arroz largo Sos 1 kg.	2.25	2.25	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032849_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-sos-1-kg/R-546305868/p	t
3360	5	23	Arroz J Sendra Extra Carrefour 1 kg.	1.60	1.60	kg	https://static.carrefour.es/hd_350x_/img_pim_food/130117_00_1.jpg	https://www.carrefour.es/supermercado/arroz-j-sendra-extra-carrefour-1-kg/R-VC4AECOMM-130117/p	t
3361	5	23	Alubia roja La Cochura 1 kg.	3.19	3.19	kg	https://static.carrefour.es/hd_350x_/img_pim_food/971764_00_1.jpg	https://www.carrefour.es/supermercado/alubia-roja-la-cochura-1-kg/R-835176231/p	t
3362	20	23	Lentejas cocidas ecológicas Carrefour Bio sin sal añadida 400 g.	3.15	7.87	kg	https://static.carrefour.es/hd_350x_/img_pim_food/415546_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-cocidas-ecologicas-carrefour-bio-sin-sal-anadida-400-g/R-fprod1490030/p	t
3363	20	23	Garbanzo cocido ecológico Pedro Luis 425 g.	3.45	6.90	kg	https://static.carrefour.es/hd_350x_/img_pim_food/895982_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-cocido-ecologico-pedro-luis-425-g/R-795411396/p	t
3364	5	23	Garbanzo castellano categoría extra De Nuestra Tierra 1 kg.	3.79	3.79	kg	https://static.carrefour.es/hd_350x_/img_pim_food/226665_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-castellano-categoria-extra-de-nuestra-tierra-1-kg/R-521005463/p	t
3365	5	23	Alubia roja Pedro Luis 500 g.	2.69	5.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/913008_00_1.jpg	https://www.carrefour.es/supermercado/alubia-roja-pedro-luis-500-g/R-804323970/p	t
3366	20	23	Garbanzo baby cocido Don Pedro 400 g.	1.95	4.87	kg	https://static.carrefour.es/hd_350x_/img_pim_food/826299_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-baby-cocido-don-pedro-400-g/R-prod460002/p	t
3367	5	23	Lenteja pardina Don Pedro 1 kg.	4.49	4.49	kg	https://static.carrefour.es/hd_350x_/img_pim_food/911318_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-don-pedro-1-kg/R-prod100389/p	t
3368	5	23	Garbanzo pedrosillano categoría extra Luengo 1 kg.	3.89	3.89	kg	https://static.carrefour.es/hd_350x_/img_pim_food/139296_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-categoria-extra-luengo-1-kg/R-526538889/p	t
3369	5	23	Arroz de Valencia categoría extra De Nuestra Tierra 1 kg.	3.55	3.55	kg	https://static.carrefour.es/hd_350x_/img_pim_food/379835_00_1.jpg	https://www.carrefour.es/supermercado/arroz-de-valencia-categoria-extra-de-nuestra-tierra-1-kg/R-546306740/p	t
3370	5	23	Garbanza blanca premium Don Pedro 1 kg.	4.49	4.49	kg	https://static.carrefour.es/hd_350x_/img_pim_food/728772_00_1.jpg	https://www.carrefour.es/supermercado/garbanza-blanca-premium-don-pedro-1-kg/R-543602510/p	t
3371	5	23	Alubia morada Luengo 1 kg.	5.49	5.49	kg	https://static.carrefour.es/hd_350x_/img_pim_food/032628_00_1.jpg	https://www.carrefour.es/supermercado/alubia-morada-luengo-1-kg/R-590201741/p	t
3372	5	23	Arroz integral largo Carrefour 1 kg.	1.65	1.65	kg	https://static.carrefour.es/hd_350x_/img_pim_food/135561_00_1.jpg	https://www.carrefour.es/supermercado/arroz-integral-largo-carrefour-1-kg/R-VC4AECOMM-135561/p	t
3373	5	23	Alubia blanca premium Don Pedro 1 kg.	3.15	3.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/911304_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-premium-don-pedro-1-kg/R-prod120522/p	t
3374	5	23	Arroz integral para microondas ecológico Carrefour Bio pack de 2 unidades de 125 g.	1.70	6.80	kg	https://static.carrefour.es/hd_350x_/img_pim_food/652640_00_1.jpg	https://www.carrefour.es/supermercado/arroz-integral-para-microondas-ecologico-carrefour-bio-pack-de-2-unidades-de-125-g/R-VC4AECOMM-652640/p	t
3375	5	23	Arroz thai Sensation Carrefour 1 kg.	2.69	2.69	kg	https://static.carrefour.es/hd_350x_/img_pim_food/141170_00_1.jpg	https://www.carrefour.es/supermercado/arroz-thai-sensation-carrefour-1-kg/R-prod1070643/p	t
3376	5	23	Alubia frijol La Cochura 1 kg.	2.99	2.99	kg	https://static.carrefour.es/hd_350x_/img_pim_food/609044_00_1.jpg	https://www.carrefour.es/supermercado/alubia-frijol-la-cochura-1-kg/R-prod1120060/p	t
3377	5	23	Garbanzo mediano categoría extra Luengo 1 kg.	4.09	4.09	kg	https://static.carrefour.es/hd_350x_/img_pim_food/913026_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-mediano-categoria-extra-luengo-1-kg/R-804323976/p	t
3378	5	23	Arroz para guarniciones Sos 500 g.	1.62	3.24	kg	https://static.carrefour.es/hd_350x_/img_pim_food/051686_00_1.jpg	https://www.carrefour.es/supermercado/arroz-para-guarniciones-sos-500-g/R-678901859/p	t
3379	5	23	Arroz bomba para paella categoría extra Carrefour 1 kg.	5.15	5.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/819237_00_1.jpg	https://www.carrefour.es/supermercado/arroz-bomba-para-paella-categoria-extra-carrefour-1-kg/R-649302125/p	t
3380	5	23	Alubia tipo granja Classic Carrefour 500 g.	3.45	6.90	kg	https://static.carrefour.es/hd_350x_/img_pim_food/066374_00_1.jpg	https://www.carrefour.es/supermercado/alubia-tipo-granja-classic-carrefour-500-g/R-VC4AECOMM-066374/p	t
3381	5	23	Arroz largo Nomen 1 kg.	1.74	1.74	kg	https://static.carrefour.es/hd_350x_/img_pim_food/016304_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-nomen-1-kg/R-521005532/p	t
3382	5	23	Lenteja rápida categoría extra Luengo 1 kg.	4.15	4.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/052794_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-rapida-categoria-extra-luengo-1-kg/R-808943384/p	t
3384	5	23	Alubia pinta categoría extra De Nuestra Tierra 1 kg.	4.39	4.39	kg	https://static.carrefour.es/hd_350x_/img_pim_food/412837_00_1.jpg	https://www.carrefour.es/supermercado/alubia-pinta-categoria-extra-de-nuestra-tierra-1-kg/R-521005475/p	t
3385	5	23	Lenteja de la Armuña categoría extra De Nuestra Tierra 1 kg.	5.19	5.19	kg	https://static.carrefour.es/hd_350x_/img_pim_food/467749_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-de-la-armuna-categoria-extra-de-nuestra-tierra-1-kg/R-521005435/p	t
3386	5	23	Arroz redondo integral ecológico Carrefour Bio 1 kg.	3.35	3.35	kg	https://static.carrefour.es/hd_350x_/img_pim_food/718631_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-integral-ecologico-carrefour-bio-1-kg/R-VC4AECOMM-718631/p	t
3387	20	23	Alubia blanca cocida Pedro Luis 500 g.	2.69	5.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/913005_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-cocida-pedro-luis-500-g/R-804323968/p	t
3388	5	23	Lenteja verdina Don Pedro 1 kg.	4.09	4.09	kg	https://static.carrefour.es/hd_350x_/img_pim_food/328243_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-verdina-don-pedro-1-kg/R-fprod1280135/p	t
3389	5	23	Arroz integral Nomen 1 kg.	2.25	2.25	kg	https://static.carrefour.es/hd_350x_/img_pim_food/016306_00_1.jpg	https://www.carrefour.es/supermercado/arroz-integral-nomen-1-kg/R-521005562/p	t
3390	5	23	Lenteja castellana Don Pedro 1 kg.	3.15	3.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/914821_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-castellana-don-pedro-1-kg/R-804324086/p	t
3391	5	23	Arroz redondo ecológico Carrefour Bio 1 kg.	3.69	3.69	kg	https://static.carrefour.es/hd_350x_/img_pim_food/718627_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-ecologico-carrefour-bio-1-kg/R-VC4AECOMM-718627/p	t
3392	20	23	Lenteja cocida categoría extra Origen Luengo 400 g.	1.46	3.65	kg	https://static.carrefour.es/hd_350x_/img_pim_food/324850_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-cocida-categoria-extra-origen-luengo-400-g/R-prod273652/p	t
3393	5	23	Lenteja roja ecológica Naturgreen 500 g.	3.15	6.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/979488_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-roja-ecologica-naturgreen-500-g/R-841202389/p	t
3394	20	23	Alubia blanca cocida ecológica Pedro Luis 425 g.	3.45	6.90	kg	https://static.carrefour.es/hd_350x_/img_pim_food/895971_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-cocida-ecologica-pedro-luis-425-g/R-795411365/p	t
3395	5	23	Lenteja pardina categoría extra La Asturiana 1 kg.	5.45	5.45	kg	https://static.carrefour.es/hd_350x_/img_pim_food/030045_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-categoria-extra-la-asturiana-1-kg/R-521016407/p	t
3396	5	23	Lentejas peladas Luengo 400 g.	2.65	6.62	kg	https://static.carrefour.es/hd_350x_/img_pim_food/478403_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-peladas-luengo-400-g/R-VC4AECOMM-478403/p	t
3397	5	23	Alubia roja ecológica Pedro Luis 500 g.	3.60	7.20	kg	https://static.carrefour.es/hd_350x_/img_pim_food/119375_00_1.jpg	https://www.carrefour.es/supermercado/alubia-roja-ecologica-pedro-luis-500-g/R-859001956/p	t
3398	5	23	Arroz redondo La Cigala 1 kg.	2.15	2.15	kg	https://static.carrefour.es/hd_350x_/img_pim_food/815489_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-la-cigala-1-kg/R-645107399/p	t
3399	5	23	Garbanzo pedrosillano extra ecológico Carrefour Bio 500 g.	3.25	6.50	kg	https://static.carrefour.es/hd_350x_/img_pim_food/322601_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-extra-ecologico-carrefour-bio-500-g/R-fprod1260234/p	t
3400	5	23	Proteína de guisante texturizada ecológica Vegetalia 250 g.	3.99	15.96	kg	https://static.carrefour.es/hd_350x_/img_pim_food/667785_00_1.jpg	https://www.carrefour.es/supermercado/proteina-de-guisante-texturizada-ecologica-vegetalia-250-g/R-VC4AECOMM-667785/p	t
3401	5	23	Frijoles rojos pequeños Goya 500 g.	3.35	6.70	kg	https://static.carrefour.es/hd_350x_/img_pim_food/683994_00_1.jpg	https://www.carrefour.es/supermercado/frijoles-rojos-pequenos-goya-500-g/R-VC4AECOMM-683994/p	t
3402	5	23	Arroz tres colores Carrefour 1 kg.	3.49	3.49	kg	https://static.carrefour.es/hd_350x_/img_pim_food/005010_00_1.jpg	https://www.carrefour.es/supermercado/arroz-tres-colores-carrefour-1-kg/R-prod870670/p	t
3403	5	23	Arroz bomba Nomen 1 kg.	6.55	6.55	kg	https://static.carrefour.es/hd_350x_/img_pim_food/384680_00_1.jpg	https://www.carrefour.es/supermercado/arroz-bomba-nomen-1-kg/R-699603821/p	t
3404	5	23	Arroz albufera categoría extra De Nuestra Tierra 500 g.	3.69	7.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/965659_00_1.jpg	https://www.carrefour.es/supermercado/arroz-albufera-categoria-extra-de-nuestra-tierra-500-g/R-831313977/p	t
3405	5	23	Alubia granja La Cochura 500 g.	3.75	7.50	kg	https://static.carrefour.es/hd_350x_/img_pim_food/592673_00_1.jpg	https://www.carrefour.es/supermercado/alubia-granja-la-cochura-500-g/R-VC4AECOMM-592673/p	t
3406	5	23	Arroz Thai Carrefour Bio 500 g.	2.39	4.78	kg	https://static.carrefour.es/hd_350x_/img_pim_food/401867_00_1.jpg	https://www.carrefour.es/supermercado/arroz-thai-carrefour-bio-500-g/R-fprod1460467/p	t
3407	5	23	Arroz redondo para microondas Nomen sin gluten pack de 2 unidades de 200 g.	2.69	6.72	kg	https://static.carrefour.es/hd_350x_/img_pim_food/009574_00_1.jpg	https://www.carrefour.es/supermercado/arroz-redondo-para-microondas-nomen-sin-gluten-pack-de-2-unidades-de-200-g/R-VC4AECOMM-009574/p	t
3408	5	23	Arroz basmati para microondas Nomen sin gluten pack de 2 unidades de 140 g.	2.35	8.39	kg	https://static.carrefour.es/hd_350x_/img_pim_food/186480_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-para-microondas-nomen-sin-gluten-pack-de-2-unidades-de-140-g/R-VC4AECOMM-186480/p	t
3409	5	23	Alubia blanca ecológica Baena 500 g.	3.19	6.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/405956_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-ecologica-baena-500-g/R-VC4AECOMM-405956/p	t
3410	5	23	Arroz basmati para microondas Nomen sin gluten pack de 2 unidades de 200 g.	2.69	6.72	kg	https://static.carrefour.es/hd_350x_/img_pim_food/009570_00_1.jpg	https://www.carrefour.es/supermercado/arroz-basmati-para-microondas-nomen-sin-gluten-pack-de-2-unidades-de-200-g/R-VC4AECOMM-009570/p	t
3411	5	23	Harina de garbanzos ecológica Ecocesta sin gluten 500 g.	4.69	9.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/185283_00_1.jpg	https://www.carrefour.es/supermercado/harina-de-garbanzos-ecologica-ecocesta-sin-gluten-500-g/R-590205989/p	t
3412	5	23	Arroz largo aromático Kamalis SOS 500 g.	1.74	3.48	kg	https://static.carrefour.es/hd_350x_/img_pim_food/399008_00_1.jpg	https://www.carrefour.es/supermercado/arroz-largo-aromatico-kamalis-sos-500-g/R-prod620641/p	t
3413	5	23	Soja texturizada fina ecológica Ecocesta 250 g.	4.49	17.96	kg	https://static.carrefour.es/hd_350x_/img_pim_food/811707_00_1.jpg	https://www.carrefour.es/supermercado/soja-texturizada-fina-ecologica-ecocesta-250-g/R-640001945/p	t
3414	5	23	Arroz integral para microondas Nomen sin gluten pack de 2 unidades de 200 g.	2.69	6.72	kg	https://static.carrefour.es/hd_350x_/img_pim_food/009571_00_1.jpg	https://www.carrefour.es/supermercado/arroz-integral-para-microondas-nomen-sin-gluten-pack-de-2-unidades-de-200-g/R-VC4AECOMM-009571/p	t
3415	5	23	Alubia blanca Pedro 1 kg.	3.65	3.65	kg	https://static.carrefour.es/hd_350x_/img_pim_food/226051_00_1.jpg	https://www.carrefour.es/supermercado/alubia-blanca-pedro-1-kg/R-590207723/p	t
3416	5	23	Lenteja pardina ecológica Baena 500 g.	3.15	6.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/405957_00_1.jpg	https://www.carrefour.es/supermercado/lenteja-pardina-ecologica-baena-500-g/R-VC4AECOMM-405957/p	t
3417	28	23	Bebida isotónica sabor limón Sensation Carrefour doy pack 400 g.	5.05	12.62	kg	https://static.carrefour.es/hd_350x_/img_pim_food/544862_00_1.jpg	https://www.carrefour.es/supermercado/bebida-isotonica-sabor-limon-sensation-carrefour-doy-pack-400-g/R-VC4AECOMM-544862/p	t
3418	11	23	Bebida de caramelo avellana con café Protein Starbucks 330 ml.	3.19	9.67	l	https://static.carrefour.es/hd_350x_/img_pim_food/566409_00_1.jpg	https://www.carrefour.es/supermercado/bebida-de-caramelo-avellana-con-cafe-protein-starbucks-330-ml/R-VC4AECOMM-566409/p	t
3419	19	23	Arroz con leche Carrefour pack de 4 unidades de 115 g.	1.27	2.76	kg	https://static.carrefour.es/hd_350x_/img_pim_food/440130_00_1.jpg	https://www.carrefour.es/supermercado/arroz-con-leche-carrefour-pack-de-4-unidades-de-115-g/R-VC4AECOMM-440130/p	t
3420	19	23	Arroz con leche Danone pack de 2 unidades de 130 g.	2.15	8.27	kg	https://static.carrefour.es/hd_350x_/img_pim_food/425379_00_1.jpg	https://www.carrefour.es/supermercado/arroz-con-leche-danone-pack-de-2-unidades-de-130-g/R-712515123/p	t
3421	19	23	Arroz con leche Carrefour 450 g.	1.60	3.56	kg	https://static.carrefour.es/hd_350x_/img_pim_food/605891_00_1.jpg	https://www.carrefour.es/supermercado/arroz-con-leche-carrefour-450-g/R-VC4AECOMM-605891/p	t
3422	19	23	Crema bombón 0,7% materia grasa Clesa sin gluten pack de 4 unidades de 125 g.	1.57	3.14	kg	https://static.carrefour.es/hd_350x_/img_pim_food/945119_00_1.jpg	https://www.carrefour.es/supermercado/crema-bombon-07-materia-grasa-clesa-sin-gluten-pack-de-4-unidades-de-125-g/R-816214589/p	t
3423	25	23	Yogur griego con caramelo Danone Oikos pack de 2 unidades de 110 g.	2.15	9.77	kg	https://static.carrefour.es/hd_350x_/img_pim_food/962196_00_1.jpg	https://www.carrefour.es/supermercado/yogur-griego-con-caramelo-danone-oikos-pack-de-2-unidades-de-110-g/R-827614183/p	t
3424	19	23	Arroz con leche Carrefour pack de 4 unidades de 115 g.	1.78	3.87	kg	https://static.carrefour.es/hd_350x_/img_pim_food/347619_00_1.jpg	https://www.carrefour.es/supermercado/arroz-con-leche-carrefour-pack-de-4-unidades-de-115-g/R-VC4AECOMM-347619/p	t
3425	19	23	Pudding caramelo salado Protein Arla 200 g.	2.35	11.75	kg	https://static.carrefour.es/hd_350x_/img_pim_food/395348_00_1.jpg	https://www.carrefour.es/supermercado/pudding-caramelo-salado-protein-arla-200-g/R-VC4AECOMM-395348/p	t
3426	24	23	Conchas mini original Codan 5 ud.	1.55	8.61	kg	https://static.carrefour.es/hd_350x_/img_pim_food/131958_00_1.jpg	https://www.carrefour.es/supermercado/conchas-mini-original-codan-5-ud/R-590204033/p	t
3427	24	23	Conchas originales Codan 10 uds.	3.59	6.53	kg	https://static.carrefour.es/hd_350x_/img_pim_food/057560_00_1.jpg	https://www.carrefour.es/supermercado/conchas-originales-codan-10-uds/R-538001814/p	t
3428	23	23	Burger rústica Bimbo Sin Gluten sin lactosa 160 g.	3.05	19.06	kg	https://static.carrefour.es/hd_350x_/img_pim_food/647101_00_1.jpg	https://www.carrefour.es/supermercado/burger-rustica-bimbo-sin-gluten-sin-lactosa-160-g/R-VC4AECOMM-647101/p	t
3429	24	23	Conchas originales Codan 6 ud.	2.59	7.85	kg	https://static.carrefour.es/hd_350x_/img_pim_food/432334_00_1.jpg	https://www.carrefour.es/supermercado/conchas-originales-codan-6-ud/R-711612181/p	t
3430	18	23	Pizza barbacoa Carrefour Classic 400 g.	2.39	5.97	kg	https://static.carrefour.es/hd_350x_/img_pim_food/743623_00_1.jpg	https://www.carrefour.es/supermercado/pizza-barbacoa-carrefour-classic-400-g/R-521030200/p	t
3431	20	23	Guisantes muy finos Classic Carrefour 250 g.	0.95	3.80	kg	https://static.carrefour.es/hd_350x_/img_pim_food/767712_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-muy-finos-classic-carrefour-250-g/R-758904356/p	t
3432	20	23	Yemas de esparragos blancos medios Classic Carrefour 110 g.	1.71	15.55	kg	https://static.carrefour.es/hd_350x_/img_pim_food/182322_00_1.jpg	https://www.carrefour.es/supermercado/yemas-de-esparragos-blancos-medios-classic-carrefour-110-g/R-871005018/p	t
3433	18	23	Pizza de pepperoni Casa Tarradellas 405 g	3.29	8.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/219977_00_1.jpg	https://www.carrefour.es/supermercado/pizza-de-pepperoni-casa-tarradellas-405-g/R-766604849/p	t
3434	20	23	Judías verdes finas cortadas Classic Carrefour 360 g.	1.20	3.33	kg	https://static.carrefour.es/hd_350x_/img_pim_food/725430_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-finas-cortadas-classic-carrefour-360-g/R-VC4AECOMM-725430/p	t
3435	20	23	Lentejas a la riojana Original Carrefour 430 g.	1.38	3.21	kg	https://static.carrefour.es/hd_350x_/img_pim_food/228296_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-a-la-riojana-original-carrefour-430-g/R-521006729/p	t
3436	20	23	Guisantes extrafinos Classic Carrefour 230 g.	1.21	5.26	kg	https://static.carrefour.es/hd_350x_/img_pim_food/067754_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-extrafinos-classic-carrefour-230-g/R-681602162/p	t
3437	18	23	Hamburguesa original a base de proteína de guisante Heura 200 g.	5.45	27.25	kg	https://static.carrefour.es/hd_350x_/img_pim_food/647960_00_1.jpg	https://www.carrefour.es/supermercado/hamburguesa-original-a-base-de-proteina-de-guisante-heura-200-g/R-VC4AECOMM-647960/p	t
3438	20	23	Albóndigas de pollo Classic Carrefour sin gluten 415 g.	1.78	4.29	kg	https://static.carrefour.es/hd_350x_/img_pim_food/419547_00_1.jpg	https://www.carrefour.es/supermercado/albondigas-de-pollo-classic-carrefour-sin-gluten-415-g/R-VC4AECOMM-419547/p	t
3439	20	23	Espinacas sin sal añadida Carrefour 425 g.	1.41	3.32	kg	https://static.carrefour.es/hd_350x_/img_pim_food/341975_00_1.jpg	https://www.carrefour.es/supermercado/espinacas-sin-sal-anadida-carrefour-425-g/R-fprod1360340/p	t
3440	23	23	Tortillas mexicanas extra tiernas Old El Paso sin gluten pack de 6 unidades de 36 g.	3.25	15.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/854824_00_1.jpg	https://www.carrefour.es/supermercado/tortillas-mexicanas-extra-tiernas-old-el-paso-sin-gluten-pack-de-6-unidades-de-36-g/R-prod730699/p	t
3441	20	23	Judías verdes planas contenido bajo de sal Carrefour 360 g.	1.84	5.11	kg	https://static.carrefour.es/hd_350x_/img_pim_food/094503_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-planas-contenido-bajo-de-sal-carrefour-360-g/R-695700875/p	t
3442	18	23	Pizza de pepperoni Carrefour Classic' 410 g.	2.75	6.71	kg	https://static.carrefour.es/hd_350x_/img_pim_food/459353_00_1.jpg	https://www.carrefour.es/supermercado/pizza-de-pepperoni-carrefour-classic-410-g/R-VC4AECOMM-459353/p	t
3443	18	23	Pizza romana Casa Tarradellas 410 g.	3.19	7.78	kg	https://static.carrefour.es/hd_350x_/img_pim_food/051679_00_1.jpg	https://www.carrefour.es/supermercado/pizza-romana-casa-tarradellas-410-g/R-521030229/p	t
3444	23	23	Tortillas de maíz Carrefour Sensation sin gluten 10 ud.	2.49	9.96	kg	https://static.carrefour.es/hd_350x_/img_pim_food/696573_00_1.jpg	https://www.carrefour.es/supermercado/tortillas-de-maiz-carrefour-sensation-sin-gluten-10-ud/R-VC4AECOMM-696573/p	t
3445	20	23	Guisantes medianos Classic Carrefour pack de 3 unidades de 120 g.	3.05	7.26	kg	https://static.carrefour.es/hd_350x_/img_pim_food/349661_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-medianos-classic-carrefour-pack-de-3-unidades-de-120-g/R-618404740/p	t
3446	20	23	Garbanzos a la riojana Original Carrefour sin gluten 420 g.	1.35	3.21	kg	https://static.carrefour.es/hd_350x_/img_pim_food/419559_00_1.jpg	https://www.carrefour.es/supermercado/garbanzos-a-la-riojana-original-carrefour-sin-gluten-420-g/R-VC4AECOMM-419559/p	t
3447	18	23	Ternera a la jardinera Carretilla 300 g.	5.19	17.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/040854_00_1.jpg	https://www.carrefour.es/supermercado/ternera-a-la-jardinera-carretilla-300-g/R-677401827/p	t
3448	18	23	Gyoza de pollo Ta-Tung 144 g.	4.25	29.51	kg	https://static.carrefour.es/hd_350x_/img_pim_food/022607_00_1.jpg	https://www.carrefour.es/supermercado/gyoza-de-pollo-ta-tung-144-g/R-VC4AECOMM-022607/p	t
3449	20	23	Guisantes extra finos Bonduelle 465 g.	4.35	9.35	kg	https://static.carrefour.es/hd_350x_/img_pim_food/008671_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-extra-finos-bonduelle-465-g/R-522713698/p	t
3450	18	23	Producto vegetal a base de proteína de soja sabor pollo Heura 180 g.	4.35	24.17	kg	https://static.carrefour.es/hd_350x_/img_pim_food/569473_00_1.jpg	https://www.carrefour.es/supermercado/producto-vegetal-a-base-de-proteina-de-soja-sabor-pollo-heura-180-g/R-VC4AECOMM-569473/p	t
3451	20	23	Judias verdes tira Gvtarra 350 g.	3.45	9.86	kg	https://static.carrefour.es/hd_350x_/img_pim_food/107957_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-tira-gvtarra-350-g/R-606700698/p	t
3452	20	23	Menestra de verduras Classic Carrefour sin sal añadida 400 g.	2.65	6.62	kg	https://static.carrefour.es/hd_350x_/img_pim_food/182321_00_1.jpg	https://www.carrefour.es/supermercado/menestra-de-verduras-classic-carrefour-sin-sal-anadida-400-g/R-871005014/p	t
3453	20	23	Fabada asturiana Classic Carrefour 765 g.	2.99	3.42	kg	https://static.carrefour.es/hd_350x_/img_pim_food/228288_00_1.jpg	https://www.carrefour.es/supermercado/fabada-asturiana-classic-carrefour-765-g/R-521006709/p	t
3454	18	23	Tortita kebab de pollo Aldelís 334 g.	4.05	12.13	kg	https://static.carrefour.es/hd_350x_/img_pim_food/147689_00_1.jpg	https://www.carrefour.es/supermercado/tortita-kebab-de-pollo-aldelis-334-g/R-VC4AECOMM-147689/p	t
3455	20	23	judías verde redondas Ybarra 360 g.	1.79	4.97	kg	https://static.carrefour.es/hd_350x_/img_pim_food/351644_00_1.jpg	https://www.carrefour.es/supermercado/judias-verde-redondas-ybarra-360-g/R-prod301058/p	t
3456	18	23	Hamburguesa clásica Garden Gourmet 150 g.	3.55	23.67	kg	https://static.carrefour.es/hd_350x_/img_pim_food/976546_00_1.jpg	https://www.carrefour.es/supermercado/hamburguesa-clasica-garden-gourmet-150-g/R-839204669/p	t
3457	20	23	Judías verdes finas al natural Classic Carrefour 440 g.	1.61	3.66	kg	https://static.carrefour.es/hd_350x_/img_pim_food/236341_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-finas-al-natural-classic-carrefour-440-g/R-521005916/p	t
3458	18	23	Gyozas de pollo Carrefour Sensation 170 g.	3.39	19.94	kg	https://static.carrefour.es/hd_350x_/img_pim_food/398906_00_1.jpg	https://www.carrefour.es/supermercado/gyozas-de-pollo-carrefour-sensation-170-g/R-VC4AECOMM-398906/p	t
3459	18	23	Nuggets veganos Garden Gourmet 200 g.	3.79	18.95	kg	https://static.carrefour.es/hd_350x_/img_pim_food/495365_00_1.jpg	https://www.carrefour.es/supermercado/nuggets-veganos-garden-gourmet-200-g/R-VC4AECOMM-495365/p	t
3460	18	23	Pizza barbacoa Carrefour Classic 580 g.	3.29	5.67	kg	https://static.carrefour.es/hd_350x_/img_pim_food/946628_00_1.jpg	https://www.carrefour.es/supermercado/pizza-barbacoa-carrefour-classic-580-g/R-819256046/p	t
3461	18	23	Pizza Margarita Carrefour Classic 340 g.	2.19	6.44	kg	https://static.carrefour.es/hd_350x_/img_pim_food/676946_00_1.jpg	https://www.carrefour.es/supermercado/pizza-margarita-carrefour-classic-340-g/R-VC4AECOMM-676946/p	t
3462	20	23	Judías verdes troceadas al natural La Hacienda de Ybarra 360 g.	1.92	5.33	kg	https://static.carrefour.es/hd_350x_/img_pim_food/222928_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-troceadas-al-natural-la-hacienda-de-ybarra-360-g/R-521005918/p	t
3463	20	23	Lentejas a la riojana -30% sal y grasas Litoral sin gluten 425 g.	2.89	6.80	kg	https://static.carrefour.es/hd_350x_/img_pim_food/189294_00_1.jpg	https://www.carrefour.es/supermercado/lentejas-a-la-riojana-30-sal-y-grasas-litoral-sin-gluten-425-g/R-prod1130630/p	t
3464	18	23	Pizza Tartufo Fratelli Colombo 370 g.	6.75	18.24	kg	https://static.carrefour.es/hd_350x_/img_pim_food/622696_00_1.jpg	https://www.carrefour.es/supermercado/pizza-tartufo-fratelli-colombo-370-g/R-VC4AECOMM-622696/p	t
3465	20	23	Guisantes extra finos ecológico Carrefour Bio 230 g.	2.35	10.22	kg	https://static.carrefour.es/hd_350x_/img_pim_food/509307_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-extra-finos-ecologico-carrefour-bio-230-g/R-522714192/p	t
3466	20	23	Judías verdes finas troceadas Bonduelle 360 g.	3.65	10.14	kg	https://static.carrefour.es/hd_350x_/img_pim_food/039237_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-finas-troceadas-bonduelle-360-g/R-522713783/p	t
3467	18	23	Puré de patata natural sabor original Mousline sin gluten 520 g.	4.09	7.87	kg	https://static.carrefour.es/hd_350x_/img_pim_food/845522_00_1.jpg	https://www.carrefour.es/supermercado/pure-de-patata-natural-sabor-original-mousline-sin-gluten-520-g/R-prod670269/p	t
3468	20	23	Garbanzo Pedrosillano ecológico Pedro Luis 500 g.	3.19	6.38	kg	https://static.carrefour.es/hd_350x_/img_pim_food/186488_00_1.jpg	https://www.carrefour.es/supermercado/garbanzo-pedrosillano-ecologico-pedro-luis-500-g/R-VC4AECOMM-186488/p	t
3469	18	23	Arroz marinera Carrefour 250 g.	2.55	10.20	kg	https://static.carrefour.es/hd_350x_/img_pim_food/300517_00_1.jpg	https://www.carrefour.es/supermercado/arroz-marinera-carrefour-250-g/R-590505782/p	t
3472	18	23	Albóndigas vegetarianas Veggie Balls Garden Gourmet 200 g.	3.79	18.95	kg	https://static.carrefour.es/hd_350x_/img_pim_food/400900_00_1.jpg	https://www.carrefour.es/supermercado/albondigas-vegetarianas-veggie-balls-garden-gourmet-200-g/R-VC4AECOMM-400900/p	t
3473	18	23	Guisantes con jamón y zanahoria Carrefour Extra 300 g.	2.45	8.17	kg	https://static.carrefour.es/hd_350x_/img_pim_food/248248_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-con-jamon-y-zanahoria-carrefour-extra-300-g/R-fprod1190679/p	t
3474	20	23	Frijoles negros La Costeña 290 gr	3.89	13.41	kg	https://static.carrefour.es/hd_350x_/img_pim_food/033244_00_1.jpg	https://www.carrefour.es/supermercado/frijoles-negros-la-costena-290-gr/R-prod260116/p	t
3475	18	23	Tempe de garbanzo ecológico Vegetalia 250 g.	4.45	17.80	kg	https://static.carrefour.es/hd_350x_/img_pim_food/518360_00_1.jpg	https://www.carrefour.es/supermercado/tempe-de-garbanzo-ecologico-vegetalia-250-g/R-VC4AECOMM-518360/p	t
3476	18	23	Menestra de verduras Carrefour 300 g.	2.55	8.50	kg	https://static.carrefour.es/hd_350x_/img_pim_food/675124_00_1.jpg	https://www.carrefour.es/supermercado/menestra-de-verduras-carrefour-300-g/R-521006771/p	t
3477	20	23	Alcachofas Gvtarra 400 g.	8.85	22.12	kg	https://static.carrefour.es/hd_350x_/img_pim_food/030084_00_1.jpg	https://www.carrefour.es/supermercado/alcachofas-gvtarra-400-g/R-591001495/p	t
3478	18	23	Pizza Serrana DeOro 400 g.	2.89	7.22	kg	https://static.carrefour.es/hd_350x_/img_pim_food/471513_00_1.jpg	https://www.carrefour.es/supermercado/pizza-serrana-deoro-400-g/R-VC4AECOMM-471513/p	t
3479	20	23	Guisantes ecológicos Pedro Luis 230 g.	3.35	14.57	kg	https://static.carrefour.es/hd_350x_/img_pim_food/185102_00_1.jpg	https://www.carrefour.es/supermercado/guisantes-ecologicos-pedro-luis-230-g/R-590205937/p	t
3480	18	23	Wraps Schär sin gluten y sin lactosa 160 g.	5.05	31.56	kg	https://static.carrefour.es/hd_350x_/img_pim_food/783742_00_1.jpg	https://www.carrefour.es/supermercado/wraps-schar-sin-gluten-y-sin-lactosa-160-g/R-803482435/p	t
3481	20	23	Judias verdes al natural extra ecológicas Pedro Luis 360 g.	3.65	10.14	kg	https://static.carrefour.es/hd_350x_/img_pim_food/185103_00_1.jpg	https://www.carrefour.es/supermercado/judias-verdes-al-natural-extra-ecologicas-pedro-luis-360-g/R-595501661/p	t
3482	18	23	Kit fajitas Carrefour Sensation 505 g.	2.55	5.05	kg	https://static.carrefour.es/hd_350x_/img_pim_food/671992_00_1.jpg	https://www.carrefour.es/supermercado/kit-fajitas-carrefour-sensation-505-g/R-VC4AECOMM-671992/p	t
3483	20	23	Frijoles de la hacienda Texicana Maggi sin gluten 425 g.	3.39	7.98	kg	https://static.carrefour.es/hd_350x_/img_pim_food/124088_00_1.jpg	https://www.carrefour.es/supermercado/frijoles-de-la-hacienda-texicana-maggi-sin-gluten-425-g/R-521008092/p	t
3484	20	23	Brotes de soja Bonduelle pack de 3 unidades de 90 g.	3.85	14.26	kg	https://static.carrefour.es/hd_350x_/img_pim_food/215516_00_1.jpg	https://www.carrefour.es/supermercado/brotes-de-soja-bonduelle-pack-de-3-unidades-de-90-g/R-521006086/p	t
3485	20	23	Menestra de verduras De Nuestra Tierra 400 g.	7.35	18.37	kg	https://static.carrefour.es/hd_350x_/img_pim_food/891916_00_1.jpg	https://www.carrefour.es/supermercado/menestra-de-verduras-de-nuestra-tierra-400-g/R-793622723/p	t
3486	18	23	Algas Nori Sensation Carrefour 14 g.	2.25	160.71	kg	https://static.carrefour.es/hd_350x_/img_pim_food/572269_00_1.jpg	https://www.carrefour.es/supermercado/algas-nori-sensation-carrefour-14-g/R-VC4AECOMM-572269/p	t
3487	20	23	Frijoles negros refritos La Costeña 580 g.	4.15	7.16	kg	https://static.carrefour.es/hd_350x_/img_pim_food/772477_00_1.jpg	https://www.carrefour.es/supermercado/frijoles-negros-refritos-la-costena-580-g/R-764213798/p	t
3488	18	23	Albóndigas Jardinera Original Carrefour 350 g.	3.35	9.57	kg	https://static.carrefour.es/hd_350x_/img_pim_food/525562_00_1.jpg	https://www.carrefour.es/supermercado/albondigas-jardinera-original-carrefour-350-g/R-VC4AECOMM-525562/p	t
3489	14	23	Pipas gigantes aguasal Classic Carrefour sin gluten 200 g.	1.16	5.80	kg	https://static.carrefour.es/hd_350x_/img_pim_food/623535_00_1.jpg	https://www.carrefour.es/supermercado/pipas-gigantes-aguasal-classic-carrefour-sin-gluten-200-g/R-VC4AECOMM-623535/p	t
3490	20	23	Mix de pepinillos y cebollitas Classic Carrefour 370 g.	1.95	5.27	kg	https://static.carrefour.es/hd_350x_/img_pim_food/355211_00_1.jpg	https://www.carrefour.es/supermercado/mix-de-pepinillos-y-cebollitas-classic-carrefour-370-g/R-VC4AECOMM-355211/p	t
3491	13	23	Cortezas de lentejas ecológicas Ecocesta 65 g.	3.25	50.00	kg	https://static.carrefour.es/hd_350x_/img_pim_food/980957_00_1.jpg	https://www.carrefour.es/supermercado/cortezas-de-lentejas-ecologicas-ecocesta-65-g/R-842010803/p	t
3492	20	23	Berenjenas de Almagro De Nuestra Tierra sin gluten 300 g.	3.99	13.30	kg	https://static.carrefour.es/hd_350x_/img_pim_food/335255_00_1.jpg	https://www.carrefour.es/supermercado/berenjenas-de-almagro-de-nuestra-tierra-sin-gluten-300-g/R-fprod1320442/p	t
3493	20	23	Pepinillos Carrefour Selección 110 g.	1.67	15.18	kg	https://static.carrefour.es/hd_350x_/img_pim_food/796046_00_1.jpg	https://www.carrefour.es/supermercado/pepinillos-carrefour-seleccion-110-g/R-526539421/p	t
3494	28	23	Carrefour Sensation Isofresh bebida isotónica blue botella 50 cl.	0.70	1.40	l	https://static.carrefour.es/hd_350x_/img_pim_food/841803_00_1.jpg	https://www.carrefour.es/supermercado/carrefour-sensation-isofresh-bebida-isotonica-blue-botella-50-cl/R-prod620190/p	t
3495	28	23	Carrefour Sensation Isofresh bebida isotónica sabor limón botella 1,5 l.	0.99	0.66	l	https://static.carrefour.es/hd_350x_/img_pim_food/309180_00_1.jpg	https://www.carrefour.es/supermercado/carrefour-sensation-isofresh-bebida-isotonica-sabor-limon-botella-15-l/R-657201693/p	t
3496	28	23	Carrefour Sensation Isofresh bebida isotónica sabor naranja botella 1,5 l.	0.99	0.66	l	https://static.carrefour.es/hd_350x_/img_pim_food/309183_00_1.jpg	https://www.carrefour.es/supermercado/carrefour-sensation-isofresh-bebida-isotonica-sabor-naranja-botella-15-l/R-657201697/p	t
3497	28	23	Aquarius bebida isotónica sabor limón pack de 2 botellas de 1,5 l.	4.09	1.36	l	https://static.carrefour.es/hd_350x_/img_pim_food/311056_00_1.jpg	https://www.carrefour.es/supermercado/aquarius-bebida-isotonica-sabor-limon-pack-de-2-botellas-de-15-l/R-789915234/p	t
3498	28	23	Prime Ice Pop bebida isotónica botella 50 cl.	3.19	6.38	l	https://static.carrefour.es/hd_350x_/img_pim_food/194928_00_1.jpg	https://www.carrefour.es/supermercado/prime-ice-pop-bebida-isotonica-botella-50-cl/R-VC4AECOMM-194928/p	t
3499	28	23	Aquarius bebida isotónica sabor naranja pack 2 botellas 1,5 l.	4.09	1.36	l	https://static.carrefour.es/hd_350x_/img_pim_food/106602_00_1.jpg	https://www.carrefour.es/supermercado/aquarius-bebida-isotonica-sabor-naranja-pack-2-botellas-15-l/R-857900578/p	t
3531	35	2	Pollo entero	7.00	3.50	kg	https://prod-mercadona.imgix.net/images/cb8d3cd457f1c0c8bce835505ad77695.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2781/pollo-entero-bandeja	t
3500	28	23	Carrefour Sensation Isofresh bebida isotónica blue botella 1,5 l.	1.60	1.07	l	https://static.carrefour.es/hd_350x_/img_pim_food/547116_00_1.jpg	https://www.carrefour.es/supermercado/carrefour-sensation-isofresh-bebida-isotonica-blue-botella-15-l/R-VC4AECOMM-547116/p	t
3501	28	23	Carrefour Sensation Isofresh bebida isotónica yellow botella 50 cl.	0.70	1.40	l	https://static.carrefour.es/hd_350x_/img_pim_food/841804_00_1.jpg	https://www.carrefour.es/supermercado/carrefour-sensation-isofresh-bebida-isotonica-yellow-botella-50-cl/R-prod620189/p	t
3502	28	23	Bodyarmor Lyte bebida isotónica sandía botella 575 ml.	2.69	4.68	l	https://static.carrefour.es/hd_350x_/img_pim_food/652923_00_1.jpg	https://www.carrefour.es/supermercado/bodyarmor-lyte-bebida-isotonica-sandia-botella-575-ml/R-760342130/p	t
3503	28	23	Bodyarmor Lyte bebida isotónica citrus botella 575 ml. 	2.69	4.68	l	https://static.carrefour.es/hd_350x_/img_pim_food/652918_00_1.jpg	https://www.carrefour.es/supermercado/bodyarmor-lyte-bebida-isotonica-citrus-botella-575-ml/R-VC4AECOMM-652918/p	t
3504	28	23	Prime bebida isotónica sabor strawberry y banana botella 50 cl.	2.95	5.90	l	https://static.carrefour.es/hd_350x_/img_pim_food/408165_00_1.jpg	https://www.carrefour.es/supermercado/prime-bebida-isotonica-sabor-strawberry-y-banana-botella-50-cl/R-704302139/p	t
3505	28	23	Prime Ice bebida isotónica blue chill botella 50 cl.	2.89	5.78	l	https://static.carrefour.es/hd_350x_/img_pim_food/580615_00_1.jpg	https://www.carrefour.es/supermercado/prime-ice-bebida-isotonica-blue-chill-botella-50-cl/R-VC4AECOMM-580615/p	t
3506	28	23	Aquarius bebida isotónica sabor limón zero botella 1.5 l.	2.09	1.39	l	https://static.carrefour.es/hd_350x_/img_pim_food/196322_00_1.jpg	https://www.carrefour.es/supermercado/aquarius-bebida-isotonica-sabor-limon-zero-botella-15-l/R-546003741/p	t
3507	28	23	Aquarius bebida isotónica sabor naranja pack 4 botellas 1,5 l.	8.18	1.36	l	https://static.carrefour.es/hd_350x_/img_pim_food/146661_00_1.jpg	https://www.carrefour.es/supermercado/aquarius-bebida-isotonica-sabor-naranja-pack-4-botellas-15-l/R-526591747/p	t
3508	28	23	Prime bebida isotónica anime botella 50 cl.	1.99	3.98	l	https://static.carrefour.es/hd_350x_/img_pim_food/701786_00_1.jpg	https://www.carrefour.es/supermercado/prime-bebida-isotonica-anime-botella-50-cl/R-VC4AECOMM-701786/p	t
3509	34	23	Bebida de fruta mango y maracuyá Capri Sun bolsita de 33 cl. 	1.42	4.30	l	https://static.carrefour.es/hd_350x_/img_pim_food/340759_00_1.jpg	https://www.carrefour.es/supermercado/bebida-de-fruta-mango-y-maracuya-capri-sun-bolsita-de-33-cl/R-VC4AECOMM-340759/p	t
3510	34	23	Bebida de fruta de naranja Capri-Sun 20 cl.	0.77	3.85	l	https://static.carrefour.es/hd_350x_/img_pim_food/447108_00_1.jpg	https://www.carrefour.es/supermercado/bebida-de-fruta-de-naranja-capri-sun-20-cl/R-VC4AECOMM-447108/p	t
3511	34	23	Bebida refrescante mixta de leche y zumo de frutas Bifrutas Dark 330 ml.	1.36	4.12	l	https://static.carrefour.es/hd_350x_/img_pim_food/595902_00_1.jpg	https://www.carrefour.es/supermercado/bebida-refrescante-mixta-de-leche-y-zumo-de-frutas-bifrutas-dark-330-ml/R-VC4AECOMM-595902/p	t
3512	34	23	Bebida de fruta naranja y mango Granini Selección Mix botella 1 l.	3.25	3.25	l	https://static.carrefour.es/hd_350x_/img_pim_food/578431_00_1.jpg	https://www.carrefour.es/supermercado/bebida-de-fruta-naranja-y-mango-granini-seleccion-mix-botella-1-l/R-520660931/p	t
3513	34	23	Bebida de fruta multivitamínico Capri-Sun 20 cl.	0.77	3.85	l	https://static.carrefour.es/hd_350x_/img_pim_food/447116_00_1.jpg	https://www.carrefour.es/supermercado/bebida-de-fruta-multivitaminico-capri-sun-20-cl/R-VC4AECOMM-447116/p	t
3514	24	87	Torrijas 2 unidades El Horno Real 300 g	3.99	13.30	KILO	https://www.dia.es/product_images/262689/262689_ISO_0_ES.jpg	https://www.dia.es/galletas-bollos-y-cereales/bolleria/p/262689	t
3515	37	2	Cogollos de lechuga	1.05	0.35	ud	https://prod-mercadona.imgix.net/images/ed00cb0a9feaf3a20d726b38ad22f70c.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69581/cogollos-lechuga-paquete	t
3516	37	2	Yuca	1.88	3.30	kg	https://prod-mercadona.imgix.net/images/3c82a0206ba8e480e6b24eba31eae9d8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69173/yuca-pieza	t
3517	37	2	Calabacín verde	0.80	2.00	kg	https://prod-mercadona.imgix.net/images/ebbfb6a904fe02ba5a88b02f2be911fd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69338/calabacin-verde-pieza	t
3518	37	2	Calabacín blanco	0.84	2.40	kg	https://prod-mercadona.imgix.net/images/50a267029cedf70b9f9a52c389deb4bc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69339/calabacin-blanco-pieza	t
3519	37	2	Coliflor	2.40	2.05	kg	https://prod-mercadona.imgix.net/images/6d23e41208a9f845dbde60697cb4d5d2.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69220/coliflor-pieza	t
3520	37	2	Repollo liso	2.90	1.80	kg	https://prod-mercadona.imgix.net/images/e8d49b238aa9719d457753bd31390f74.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69236/repollo-liso-pieza	t
3521	37	2	Repollo liso partido	1.94	2.15	kg	https://prod-mercadona.imgix.net/images/3f9de2a797f15ec969b407d8ad2e65df.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/68462/medio-repollo-liso-12-pieza	t
3522	37	2	Setas	2.05	8.20	kg	https://prod-mercadona.imgix.net/images/19fbcb54ccf207787b3182ba1f072619.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69653/seta-bandeja	t
3523	37	2	Brócoli	1.17	2.60	kg	https://prod-mercadona.imgix.net/images/2ef72b37fe1021e9ff4ea8f46f9204f8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69580/brocoli-pieza	t
3524	37	2	Berenjena	0.77	2.40	kg	https://prod-mercadona.imgix.net/images/cbd784174d4dfee4fedee9f32d3ad0ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69326/berenjena-pieza	t
3525	37	2	Judía verde plana	2.95	3.93	kg	https://prod-mercadona.imgix.net/images/6fe3bd1734dacc3f8751577ed526b7ab.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69889/judia-verde-plana-bandeja	t
3526	37	2	Judía verde plana	1.70	4.86	kg	https://prod-mercadona.imgix.net/images/5515ca89e69b67a1664edbe0c85da6b6.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/68131/judia-verde-plana-paquete	t
3527	37	2	Judía verde redonda	2.80	5.60	kg	https://prod-mercadona.imgix.net/images/c1071ba21363f4cb41267b5781591082.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69878/judia-verde-redonda-bandeja	t
3528	37	2	Espárragos verdes finos	2.45	9.80	kg	https://prod-mercadona.imgix.net/images/246f658b35834114e902bbbfdb7d6650.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/69656/esparrago-verde-fino-paquete	t
3529	35	2	Alas partidas de pollo	3.12	5.20	kg	https://prod-mercadona.imgix.net/images/dc49d9d7c2badc6e75fc0efd12b078e0.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/2785/alas-partidas-pollo-bandeja	t
3532	35	2	Mini muslo de pollo 98% La Carloteña asado al horno	3.45	11.50	kg	https://prod-mercadona.imgix.net/images/7f4cc81e1da2dc9d11da411514683911.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/19994/muslo-pollo-98-mini-relleno-carlotena-asado-horno-paquete	t
3533	5	2	Harina de garbanzo Hacendado	2.00	4.00	kg	https://prod-mercadona.imgix.net/images/618e741aec78f29e6da87ec913990715.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/29373/harina-garbanzo-hacendado-paquete	t
3534	5	2	Arroz redondo Hacendado	1.30	1.30	kg	https://prod-mercadona.imgix.net/images/0daf43fb5761b823ce83c985930c97c9.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/5044/arroz-redondo-hacendado-paquete	t
3535	5	2	Arroz cocido integral Sabroz	1.10	4.40	kg	https://prod-mercadona.imgix.net/images/3c538ead2ed048792639ef28915cfaef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22281/arroz-cocido-integral-sabroz-brillante-pack-2	t
3536	5	2	Arroz cocido redondo Sabroz	1.10	4.40	kg	https://prod-mercadona.imgix.net/images/b87d489084215ea73d35d6c2d465f39e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22279/arroz-cocido-redondo-sabroz-brillante-pack-2	t
3537	5	2	Arroz cocido integral Sabroz	1.10	4.40	kg	https://prod-mercadona.imgix.net/images/3c538ead2ed048792639ef28915cfaef.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22281/arroz-cocido-integral-sabroz-brillante-pack-2	t
3538	5	2	Arroz cocido redondo Sabroz	1.10	4.40	kg	https://prod-mercadona.imgix.net/images/b87d489084215ea73d35d6c2d465f39e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/22279/arroz-cocido-redondo-sabroz-brillante-pack-2	t
3539	20	2	Garbanza cocida Hacendado	1.35	2.37	kg	https://prod-mercadona.imgix.net/images/f0b411e3a61f1382c88afe28f8d8cecd.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/14381/garbanza-cocida-hacendado-tarro	t
3540	18	2	Pizza barbacoa Hacendado	2.50	6.02	kg	https://prod-mercadona.imgix.net/images/9601cc63f4a6fca6845af8491e26eea7.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63613/pizza-barbacoa-hacendado	t
3541	18	2	Pizza barbacoa familiar Hacendado	3.40	5.67	kg	https://prod-mercadona.imgix.net/images/92e18a06b6f91e10051849add2686143.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63629/pizza-barbacoa-familiar-hacendado	t
3542	18	2	Pizza barbacoa Hacendado	2.90	6.59	kg	https://prod-mercadona.imgix.net/images/c1be6016c94e7e2a3c2bf2e6e19147e8.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60685/pizza-barbacoa-hacendado-pack-2	t
3543	18	2	Pizza serrana Hacendado	2.90	7.25	kg	https://prod-mercadona.imgix.net/images/46cb0fc16ebe88e123f4946403a4a191.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63551/pizza-serrana-hacendado	t
3544	18	2	Pizza carbonara Hacendado	2.90	6.74	kg	https://prod-mercadona.imgix.net/images/6e24d5b8ab318b473fafb9f727a2dc5b.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63653/pizza-carbonara-hacendado	t
3545	18	2	Pizza pepperoni Hacendado	2.90	7.07	kg	https://prod-mercadona.imgix.net/images/b57899dd9110969856c162219b6957f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63556/pizza-pepperoni-hacendado	t
3546	18	2	Pizza pollo Hacendado	2.90	6.74	kg	https://prod-mercadona.imgix.net/images/47e6c431cec9e52dc50cb73176d63196.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63529/pizza-pollo-hacendado	t
3547	18	2	Pizza margarita Hacendado	2.20	6.47	kg	https://prod-mercadona.imgix.net/images/455e7b81b9d3197c03a26cf4217b0b66.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/63585/pizza-margarita-hacendado	t
3548	18	2	Pizza carnívora Hacendado	3.40	5.67	kg	https://prod-mercadona.imgix.net/images/805cf5c28f9ddb5b90589b9463bd8b7e.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12083/pizza-carnivora-hacendado	t
3549	23	2	Masa pizza fresca familiar Hacendado	1.70	4.25	kg	https://prod-mercadona.imgix.net/images/db3376bba214345ed6e40be45311ff6f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/52454/masa-pizza-fresca-familiar-hacendado-paquete	t
3550	21	2	Espárrago verde troceado Hacendado ultracongelado	2.55	8.50	kg	https://prod-mercadona.imgix.net/images/c2686b829eeca97a18ea1f44a36fa022.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/61238/esparrago-verde-troceado-hacendado-ultracongelado-paquete	t
3551	28	2	Bebida isotónica melocotón rojo Aquarius	1.69	1.13	l	https://prod-mercadona.imgix.net/images/9e075b1fa48488deaf02e82d27e03b85.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16438/bebida-isotonica-melocoton-rojo-aquarius-botella	t
3552	28	2	Bebida energética Furious Energy drink Hacendado	1.00	2.00	l	https://prod-mercadona.imgix.net/images/ee7e6af21f26d79f3c2e8fc78e179f0f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/40322/bebida-energetica-furious-energy-drink-lata	t
3553	28	2	Bebida energética Zero Furious Hacendado Energy drink	1.00	2.00	l	https://prod-mercadona.imgix.net/images/1c829695d5b03f125a66d595849ab446.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/60603/bebida-energetica-zero-furious-energy-drink-lata	t
3554	28	2	Bebida energética Zero Katrine Energy drink Hacendado	1.00	2.00	l	https://prod-mercadona.imgix.net/images/a9701e3471217976976de644137508f5.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/12854/bebida-energetica-zero-katrine-energy-drink-lata	t
3555	28	2	Bebida energética Zero Full Tropic Energy drink	1.00	2.00	l	https://prod-mercadona.imgix.net/images/819b912973652e61a234f910de647071.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13976/bebida-energetica-zero-full-tropic-energy-drink-lata	t
3556	28	2	Bebida energética Energy Ultra zero Strawberry Monster	1.45	2.90	l	https://prod-mercadona.imgix.net/images/006ee50e1872ac3c9c15c89da4151095.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/16440/bebida-energetica-energy-ultra-zero-strawberry-monster-lata	t
3557	48	2	Crema facial regeneradora Anti Ox Dragon's Blood FPS 12	5.00	100.00	l	https://prod-mercadona.imgix.net/images/71cdf50b8ef60389f8053c323c2bbe89.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50124/crema-facial-dragons-blood-anti-ox-deliplus-fps-12-tipo-piel-tarro	t
3558	48	2	Crema facial hidratante anti-rojeces Deliplus Sensitive con vitamina K Ox	6.00	120.00	l	https://prod-mercadona.imgix.net/images/77b72113278cc8a8de2e95e350606d5d.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/50326/crema-facial-hidratante-fortalecedora-deliplus-sensitive-con-vitamina-k-ox-piel-sensible-reactiva-tarro	t
3559	48	2	Crema facial hidratante con color Skiny Glow Tint Deliplus con pigmentos encapsulados	7.50	250.00	l	https://prod-mercadona.imgix.net/images/c8eb3a19f64d05a9a7f9a12c45ae6c47.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/21364/crema-facial-hidratante-con-color-skiny-glow-tint-deliplus-con-pigmentos-encapsulados-tipo-piel-bote	t
3560	48	2	Crema corporal Olive Deliplus	1.80	6.00	l	https://prod-mercadona.imgix.net/images/8113349a13f84f1d45d4d3d76083c10f.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/13970/crema-corporal-olive-deliplus-tarro	t
3561	48	2	Crema de manos, cara y cuerpo Nivea Soft hidratante intensiva	1.95	26.00	l	https://prod-mercadona.imgix.net/images/a086654477e99eb9d9b5076f63366728.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/74102/crema-manos-cara-cuerpo-nivea-soft-hidratante-intensiva-bote	t
3562	48	2	Crema cara, cuerpo y manos Nivea Men	4.95	33.00	l	https://prod-mercadona.imgix.net/images/4e9757950a6d9739cfe2ec51e783fefc.jpg?fit=crop&h=300&w=300	https://tienda.mercadona.es/product/73984/crema-cara-cuerpo-manos-nivea-men-lata	t
\.


--
-- Data for Name: productos_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_tags (id_producto, id_tag) FROM stdin;
\.


--
-- Data for Name: subcategorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subcategorias (id, id_cat, nombre) FROM stdin;
1	1	Aceite y vinagre
2	1	Sal y bicarbonato
3	1	Especias
4	1	Salsas
5	1	Arroz, legumbres y pastas
6	1	Azúcar y edulcorantes
7	1	Chicles, caramelos y golosinas
8	1	Chocolate
9	1	Mermelada y miel
10	1	Cacao
11	1	Café
12	1	Infusiones
13	1	Snacks y aperitivos
14	1	Frutos secos
15	1	Galletas y cereales
16	1	Charcutería
17	1	Quesos
18	1	Platos preparados
19	1	Postres
20	1	Conservas
21	1	Congelados
22	1	Caldos y cremas
23	1	Panadería
24	1	Bollería y repostería
25	1	Lácteos
26	1	Bebidas vegetales
27	2	Agua
28	2	Refrescos
29	2	Cerveza
30	2	Licores y cremas
31	2	Sidra
32	2	Cava y champagne
33	2	Vino
34	2	Zumos
35	3	Carne
36	3	Pescado y marisco
37	3	Fruta y verdura
38	3	Huevos
39	4	Alimentación infantil
40	4	Higiene infantil
41	5	Productos de limpieza
42	5	Ambientadores
43	5	Bolsas y envoltorios
44	5	Papel y cartón
45	5	Menaje y utensilios
46	5	Insecticidas y plagas
47	5	Detergentes y suavizantes
48	6	Higiene personal
49	6	Maquillaje
50	6	Parafarmacia
51	6	Protectores solares
52	6	Perfumería
53	7	Alimentación mascotas
54	7	Higiene mascotas
\.


--
-- Data for Name: super_loc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.super_loc (id, id_super, nombre, cp, almacen) FROM stdin;
1	1	mercadona	41013	svq1
2	2	Mercadona	41001	svq1
3	2	Mercadona	41002	svq1
4	2	Mercadona	41003	svq1
5	2	Mercadona	41004	svq1
6	2	Mercadona	41005	svq1
7	2	Mercadona	41006	svq1
8	2	Mercadona	41007	svq1
9	2	Mercadona	41008	svq1
10	2	Mercadona	41009	svq1
11	2	Mercadona	41010	svq1
12	2	Mercadona	41011	svq1
13	2	Mercadona	41012	svq1
14	2	Mercadona	41013	svq1
15	2	Mercadona	41014	svq1
16	2	Mercadona	41015	svq1
17	2	Mercadona	41016	svq1
18	2	Mercadona	41018	svq1
19	2	Mercadona	41019	svq1
20	2	Mercadona	41020	svq1
21	2	Mercadona	41089	svq1
22	2	Mercadona	41092	svq1
23	3	Carrefour	41001	004361
24	3	Carrefour	41002	004361
25	3	Carrefour	41003	004361
26	3	Carrefour	41004	004361
27	3	Carrefour	41005	004361
28	3	Carrefour	41006	004361
29	3	Carrefour	41007	004361
30	3	Carrefour	41008	004361
31	3	Carrefour	41009	004361
32	3	Carrefour	41010	004361
33	3	Carrefour	41011	004361
34	3	Carrefour	41012	004361
35	3	Carrefour	41013	004361
36	3	Carrefour	41014	004361
37	3	Carrefour	41015	004361
38	3	Carrefour	41016	004361
39	3	Carrefour	41017	004361
40	3	Carrefour	41018	004361
41	3	Carrefour	41019	004361
42	3	Carrefour	41020	004361
43	3	Carrefour	41089	0000HZ
44	3	Carrefour	41092	004361
45	1	mercadona	41001	svq1
46	1	mercadona	41002	svq1
47	1	mercadona	41003	svq1
48	1	mercadona	41004	svq1
49	1	mercadona	41005	svq1
50	1	mercadona	41006	svq1
51	1	mercadona	41007	svq1
52	1	mercadona	41008	svq1
53	1	mercadona	41009	svq1
54	1	mercadona	41010	svq1
55	1	mercadona	41011	svq1
56	1	mercadona	41012	svq1
57	1	mercadona	41014	svq1
58	1	mercadona	41015	svq1
59	1	mercadona	41016	svq1
60	1	mercadona	41018	svq1
61	1	mercadona	41019	svq1
62	1	mercadona	41020	svq1
63	1	mercadona	41089	svq1
64	1	mercadona	41092	svq1
65	4	carrefour	41001	004361
66	4	carrefour	41002	004361
67	4	carrefour	41003	004361
68	4	carrefour	41004	004361
69	4	carrefour	41005	004361
70	4	carrefour	41006	004361
71	4	carrefour	41007	004361
72	4	carrefour	41008	004361
73	4	carrefour	41009	004361
74	4	carrefour	41010	004361
75	4	carrefour	41011	004361
76	4	carrefour	41012	004361
77	4	carrefour	41013	004361
78	4	carrefour	41014	004361
79	4	carrefour	41015	004361
80	4	carrefour	41016	004361
81	4	carrefour	41017	004361
82	4	carrefour	41018	004361
83	4	carrefour	41019	004361
84	4	carrefour	41020	004361
85	4	carrefour	41089	0000HZ
86	4	carrefour	41092	004361
87	5	dia	41013	
\.


--
-- Data for Name: supermercados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supermercados (id, nombre) FROM stdin;
1	mercadona
2	Mercadona
3	Carrefour
4	carrefour
5	dia
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, nombre, id_scat) FROM stdin;
1	mezcla	37
2	semillas	37
3	manzana	37
4	lechuga	37
5	uva	37
6	sandía	37
7	baja	37
8	melón	37
9	piña	37
10	cortada	37
11	plátano	37
12	piel	37
13	sapo	37
14	naranjas	37
15	cerezas	37
16	ciruela	37
17	iceberg	37
18	brotes	37
19	tiernos	37
20	canónigos	37
21	gourmet	37
22	romana	37
23	rúcula	37
24	canarias	37
25	banana	37
26	macho	37
27	golden	37
28	pera	37
29	dulce	37
30	granny	37
31	smith	37
32	acidulce	37
33	galia	37
34	limones	37
35	limón	37
36	naranja	37
37	zumo	37
38	pomelo	37
39	lima	37
40	kiwi	37
41	aguacate	37
42	natural	37
43	mango	37
44	papaya	37
45	nectarina	37
46	fresas	37
47	frambuesas	37
48	moras	37
49	arándanos	37
50	melocotón	37
51	paraguayo	37
52	estaciones	37
53	lavados	37
54	tierna	37
55	primavera	37
56	escarola	37
57	rizada	37
58	espinacas	37
59	baby	37
60	césar	37
61	california	37
62	wraps	37
63	texas	37
64	ensatún	37
65	relleno	37
66	fajitas	37
67	coliflor	37
68	helado	21
69	ultracongelado	21
70	ultracongeladas	21
71	ultracongelada	21
72	ultracongelados	21
73	congelado	21
74	merluza	21
75	congelada	21
76	congeladas	21
77	pollo	21
78	bacalao	21
79	mini	21
80	chocolate	21
81	verduras	21
82	filetes	21
83	argentina	21
84	sepia	21
85	nata	21
86	vainilla	21
87	cocido	21
88	rodaja	21
89	maredeus	21
90	cabo	21
91	congelados	21
92	patatas	21
93	cucurucho	21
94	porciones	21
95	atún	21
96	limpio	21
97	limpia	21
98	calamar	21
99	solomillo	21
100	sándwich	21
101	troceada	21
102	salteado	21
103	crema	21
104	migas	21
105	negro	21
106	pota	21
107	pavo	21
108	marinado	21
109	cerdo	21
110	galleta	21
111	troceado	21
112	prefritas	21
113	grande	21
114	langostino	21
115	medallones	21
116	salmón	21
117	lomos	21
118	cabeza	21
119	rodajas	21
120	entera	21
121	faraónica	21
122	potón	21
123	pacífico	21
124	jamoncitos	21
125	alas	21
126	lechal	21
127	arroz	21
128	lasaña	21
129	bombón	21
130	caramelo	21
131	fino	21
132	cebolla	21
133	preparado	21
134	gambón	21
135	crudo	21
136	gamba	21
137	pequeña	21
138	pelado	21
139	colas	21
140	empanadas	21
141	anillas	21
142	croquetas	21
143	cobertura	21
144	azúcares	21
145	añadidos	21
146	blanco	21
147	choco	21
148	trozos	21
149	fresa	21
150	guisante	21
151	tierno	21
152	judía	21
153	ajo	21
154	espinaca	21
155	habas	21
156	setas	21
157	tempura	21
158	corte	21
159	pelada	21
160	cruda	21
161	tamaño	21
162	palitos	21
163	surimi	21
164	carne	21
165	mejillón	21
166	chile	21
167	panga	21
168	emperador	21
169	filete	21
170	rosado	21
171	salvaje	21
172	fritura	21
173	pescado	21
174	tintorera	21
175	pescadilla	21
176	cola	21
177	rape	21
178	espinas	21
179	dorado	21
180	paja	21
181	aleta	21
182	amarilla	21
183	tacos	21
184	marrajo	21
185	grandes	21
186	acedía	21
187	lomo	21
188	lenguado	21
189	huevo	21
190	tubo	21
191	huevas	21
192	tiras	21
193	tinta	21
194	nortindal	21
195	puntilla	21
196	índia	21
197	patagónico	21
198	pequeño	21
199	nuggets	21
200	delicias	21
201	marinados	21
202	cuartos	21
203	traseros	21
204	duplo	21
205	pierna	21
206	rabo	21
207	vacuno	21
208	añojo	21
209	chuletas	21
210	cordero	21
211	barbacoa	21
212	trenza	21
213	hojaldre	21
214	mantequilla	21
215	boloñesa	21
216	almendrado	21
217	cookie	21
218	cacahuete	21
219	leche	21
220	mochi	21
221	coco	21
222	vegetal	21
223	base	21
224	anacardo	21
225	helados	21
226	biscuit	21
227	caramelizada	21
228	dochi	21
229	queso	21
230	masa	21
231	salsa	21
232	nueces	21
233	pecán	21
234	sorbete	21
235	turrón	21
236	tarta	21
237	barra	21
238	tubitos	21
239	hielo	21
240	enteras	21
241	enteros	21
242	mix	21
243	frutas	21
244	tropical	21
245	ensaladilla	21
246	garrofón	21
247	garbanzo	21
248	plana	21
249	redonda	21
250	alcachofa	21
251	picada	21
252	menestra	21
253	habitas	21
254	tiernas	21
255	fina	21
256	pimiento	21
257	rojo	21
258	asadas	21
259	parrillada	21
260	maíz	21
261	espárrago	21
262	brócoli	21
263	patata	21
264	salchicha	21
265	pimientos	21
266	piquillo	21
267	rellenos	21
268	pisto	21
269	rollitos	21
270	coles	21
271	bruselas	21
272	edamame	21
273	soja	21
274	wok	21
275	asiático	21
276	wakame	21
277	alga	21
278	marina	21
279	gyozas	21
280	grueso	21
281	gajo	21
282	waffle	21
283	fries	21
284	lambweston	21
285	fritas	21
286	horno	21
287	gallineta	21
288	paella	21
289	sopa	21
290	arrocera	21
291	mediano	21
292	camarón	21
293	boreal	21
294	royal	21
295	buey	21
296	mar	21
297	nécora	21
298	cocida	21
299	entero	21
300	almeja	21
301	albóndigas	21
302	camós	21
303	aritos	21
304	empanada	21
305	pan	21
306	varitas	21
307	empanadillas	21
308	figuritas	21
309	caballitos	21
310	rebozados	21
311	boquerón	21
312	buñuelos	21
313	tortillitas	21
314	camarones	21
315	rabas	21
316	adobo	21
317	enharinado	21
318	casero	21
319	rebozado	21
320	crispy	21
321	carrillada	21
322	tres	21
323	precocido	21
324	risotto	21
325	canelones	21
326	gnocchi	21
327	churros	21
328	porras	21
329	crepes	21
330	surtido	21
331	boom	21
332	blanda	21
333	pasta	21
334	avellana	21
335	crocan	21
336	choc	21
337	lengua	21
338	nocciola	21
339	barrita	21
340	pistacho	21
341	cocos	21
342	cream	21
343	cheesecake	21
344	crujientes	21
345	banoffee	21
346	flash	21
347	popitos	21
348	merengada	21
349	cookies	21
350	praliné	21
351	salado	21
352	stracciatella	21
353	capuccino	21
354	menta	21
355	trocitos	21
356	tutti	21
357	frutti	21
358	peanut	21
359	butter	21
360	cups	21
361	dough	21
362	galletas	21
363	brownie	21
364	cacao	21
365	helada	21
366	obleas	21
367	bañados	21
368	cubos	21
369	cocktail	21
370	espina	36
371	libro	36
372	pieza	36
373	dorada	36
374	lubina	36
375	aletas	36
376	escamas	36
377	trucha	36
378	sardina	36
379	espalda	36
380	corvina	36
381	boquerones	36
382	anchoa	36
383	ahumado	36
384	hoja	36
385	cocidas	36
386	escalopin	36
387	patas	36
388	pulpo	36
389	arco	36
390	iris	36
391	rodaballo	36
392	rebozada	36
393	empanado	36
394	bogavante	36
395	americano	36
396	desaladas	36
397	marinada	36
398	sucedáneo	36
399	caviar	36
400	ubago	36
401	caviartic	36
402	pavías	36
403	aliñados	36
404	ahumada	36
405	taquitos	36
406	mojama	36
407	lonchas	36
408	burger	35
409	ibérico	35
410	pechuga	35
411	adobado	35
412	secreto	35
413	costilla	35
414	panceta	35
415	corteza	35
416	entrecot	35
417	contramuslos	35
418	deshuesados	35
419	hueso	35
420	tocino	35
421	adobada	35
422	manos	35
423	flautas	35
424	fiambre	35
425	hígado	35
426	aguja	35
427	lagarto	35
428	ibérica	35
429	contramuslo	35
430	pato	35
431	solomillos	35
432	pechugas	35
433	espinazo	35
434	marinadas	35
435	adobadas	35
436	empanados	35
437	conejo	35
438	burgers	35
439	costillas	35
440	carnosas	35
441	sajonia	35
442	churrasco	35
443	bacón	35
444	manteca	35
445	montpalau	35
446	cocinar	35
447	magro	35
448	presa	35
449	pluma	35
450	provenzal	35
451	magreta	35
452	ajillo	35
453	costilleja	35
454	abanico	35
455	zurrapa	35
456	moreno	35
457	plaza	35
458	duroc	35
459	foie	35
460	gras	35
461	fresco	35
462	codornices	35
463	magret	35
464	brochetas	35
465	muslos	35
466	carcasa	35
467	hígados	35
468	corazones	35
469	mollejas	35
470	sangre	35
471	lagrimitas	35
472	cuellos	35
473	pinchos	35
474	adobados	35
475	pincho	35
476	carpaccio	35
477	steak	35
478	tartar	35
479	riñonada	35
480	chuleteado	35
481	jamón	35
482	americana	35
483	crunchy	35
484	chicken	35
485	hamburguesa	35
486	vaca	35
487	madurada	35
488	compango	35
489	garrón	35
490	gallina	35
491	chorizo	35
492	asturiano	35
493	salada	35
494	paté	16
495	cebo	16
496	bellota	16
497	longaniza	16
498	salchichón	16
499	mortadela	16
500	serrano	16
501	pimienta	16
502	tapas	16
503	paleta	16
504	cular	16
505	salchichas	16
506	morcilla	16
507	picante	16
508	asado	16
509	york	16
510	chopped	16
511	curada	16
512	lacón	16
513	trufa	16
514	ibéricos	16
515	salami	16
516	sarta	16
517	hierbas	16
518	sobrasada	16
519	especialidades	16
520	tripa	16
521	oreado	16
522	chistorra	16
523	criollo	16
524	butifarra	16
525	sal	16
526	braseada	16
527	leña	16
528	budín	16
529	mechada	16
530	pechuguita	16
531	asada	16
532	jugoso	16
533	braseado	16
534	mano	16
535	lata	16
536	galantina	16
537	paletas	16
538	marpa	16
539	trevélez	16
540	taco	16
541	curado	16
542	cecina	16
543	embutidos	16
544	pepperoni	16
545	oreada	16
546	hot	16
547	dog	16
548	bocadillo	16
549	classic	16
550	frankfurt	16
551	bloc	16
552	perdiz	16
553	untar	16
554	fideos	18
555	orientales	18
556	ensalada	18
557	gluten	18
558	garbanzos	18
559	gazpacho	18
560	salmorejo	18
561	rusa	18
562	callos	18
563	ternera	18
564	fabada	18
565	lentejas	18
566	vegetales	18
567	hummus	18
568	varilla	18
569	empanadilla	18
570	pizza	18
571	tortilla	18
572	riojana	18
573	alubias	18
574	hamburguesas	18
575	caracoles	18
576	san	18
577	jacobos	18
578	finas	18
579	preparados	18
580	rogusa	18
581	amarillo	18
582	perejil	18
583	flamenquín	18
584	picantes	18
585	bechamel	18
586	truffata	18
587	requesón	18
588	boletus	18
589	spaghetti	18
590	carbonara	18
591	macarrones	18
592	bacon	18
593	gratinados	18
594	tiburón	18
595	mac&cheese	18
596	mac & cheese	18
597	curry	18
598	basmati	18
599	roti	18
600	codillo	18
601	alitas	18
602	guisadas	18
603	cortadas	18
604	pulled	18
605	pork	18
606	tomate	18
607	bravas	18
608	mayonesa	18
609	berenjenas	18
610	zanahoria	18
611	cabrilla	18
612	proteína	18
613	caldo	18
614	kebab	18
615	sándwiches	18
616	allioli	18
617	mediana	18
618	marisco	18
619	cangrejo	18
620	receta	18
621	clásica	18
622	tofu	18
623	firme	18
624	frias	18
625	tabulé	18
626	pastel	18
627	tsatsiki	18
628	cortado	17
629	cuñitas	17
630	oveja	17
631	cabra	17
632	viejo	17
633	semicurado	17
634	light	17
635	mozzarella	17
636	rallado	17
637	tostado	17
638	fresca	17
639	añejo	17
640	lactosa	17
641	fundido	17
642	grana	17
643	padano	17
644	cheddar	17
645	emmental	17
646	corona	17
647	especial	17
648	suave	17
649	camembert	17
650	azul	17
651	dados	17
652	rulo	17
653	marcillat	17
654	fuerte	17
655	quesos	17
656	gouda	17
657	edam	17
658	cremoso	17
659	polvo	17
660	fundir	17
661	mousse	17
662	texmex	17
663	feta	17
664	perlas	17
665	batido	17
666	desnatado	17
667	mascarpone	17
668	bufala	17
669	campana	17
670	ricotta	17
671	burrata	17
672	cottage	17
673	semidesnatado	17
674	roquefort	17
675	almendra	17
676	liptana	17
677	brie	17
678	plaisir	17
679	gorgonzola	17
680	precortado	17
681	zanetti	17
682	tabla	17
683	manchego	17
684	madurado	17
685	madera	17
686	afrutado	17
687	maasdam	17
688	bola	17
689	provolone	17
690	gratinar	17
691	pizzaroma	17
692	babybel	17
693	molde	23
694	integral	23
695	panes	23
696	trigo	23
697	picos	23
698	integrales	23
699	tortillas	23
700	cereales	23
701	espelta	23
702	crackers	23
703	panecillos	23
704	avena	23
705	piquitos	23
706	picatostes	23
707	cristal	23
708	centeno	23
709	molletes	23
710	rústico	23
711	pipas	23
712	hogaza	23
713	brioche	23
714	panecillo	23
715	tostadas	23
716	tostados	23
717	sésamo	23
718	regañá	23
719	grissini	23
720	baguette	23
721	vienas	23
722	chapata	23
723	barras	23
724	pulguitas	23
725	serranos	23
726	bollo	23
727	redondos	23
728	cortados	23
729	rebanada	23
730	gruesa	23
731	tradicional	23
732	bagel	23
733	redondo	23
734	media	23
735	piadinas	23
736	biscotes	23
737	saladas	23
738	rosquillas	23
739	reventaos	23
740	camperos	23
741	salvado	23
742	harina	24
743	magdalenas	24
744	bizcocho	24
745	croissant	24
746	azúcar	24
747	berlina	24
748	pepitas	24
749	rellena	24
750	bizcochos	24
751	tortas	24
752	impulsor	24
753	gelatina	24
754	croissants	24
755	napolitana	24
756	gofres	24
757	napolitanas	24
758	aceite	24
759	semolosa	24
760	repostería	24
761	levadura	24
762	gasificante	24
763	uso	24
764	alimentario	24
765	flan	24
766	natillas	24
767	proteínas	24
768	yogur	24
769	caracola	24
770	pasas	24
771	muffin	24
772	susos	24
773	surtidos	24
774	surtidas	24
775	mixta	24
776	valencianas	24
777	buns	24
778	ensaimadas	24
779	bocaditos	24
780	sobaos	24
781	palmeritas	24
782	rosegones	24
783	almendras	24
784	cortadillo	24
785	cabello	24
786	ángel	24
787	tortitas	24
788	canela	24
789	mantecadas	24
790	banitas	24
791	aguilera	24
792	caña	24
793	fuerza	24
794	incorporado	24
795	precocida	24
796	sémola	24
797	panificación	24
798	panaeras	24
799	sevillanas	24
800	levital	24
801	neutra	24
802	láminas	24
803	cuajada	24
804	azucarada	24
805	lácteo	24
806	flanes	24
807	maizena	24
808	potax	24
809	aroma	24
810	arándano	24
811	panadería	24
812	instantáneo	24
813	postres	24
814	filo	24
815	molida	24
816	líquido	24
817	desgrasado	24
818	reducido	24
819	grasa	24
820	topping	24
821	avellanas	8
822	extrafino	8
823	barritas	8
824	bombones	8
825	puro	8
826	fussion	8
827	cacahuetes	8
828	bañadas	8
829	gotas	8
830	rellenas	8
831	coloreados	8
832	huevos	8
833	sorpresa	8
834	recubiertas	8
835	chocolatinas	8
836	edulcorante	8
837	troceadas	8
838	disquitos	8
839	pintarolas	8
840	chocoiris	8
841	bolas	8
842	cereal	8
843	peanuts	8
844	chimbote	8
845	plástico	45
846	cumpleaños	45
847	vela	45
848	recipiente	45
849	reutilizables	45
850	rectangular	45
851	aluminio	45
852	biodegradable	45
853	cuadrado	45
854	hermético	45
855	papel	45
856	vasos	45
857	vaso	45
858	plato	45
859	cucharas	45
860	clipper	45
861	velas	45
862	protector	45
863	cama	45
864	freidora	45
865	aire	45
866	llano	45
867	bol	45
868	tenedores	45
869	cuchillos	45
870	pajitas	45
871	palillos	45
872	bandeja	45
873	cartón	45
874	pastillas	45
875	enciende	45
876	fuegos	45
877	carbón	45
878	mechero	45
879	encendedor	45
880	cocina	45
881	pinzas	45
882	ropa	45
883	sobres	6
884	stevia	6
885	sacarina	6
886	vainillado	6
887	panela	6
888	glas	6
889	sirope	6
890	agave	6
891	granulado	6
892	eritritol	6
893	sucralosa	6
894	azucarado	25
895	bebida	25
896	bífidus	25
897	calcio	25
898	condensada	25
899	desnatada	25
900	fibra	25
901	flora	25
902	frutos	25
903	griego	25
904	kéfir	25
905	láctea	25
906	ligera	25
907	ligero	25
908	maracuya	25
909	margarina	25
910	montada	25
911	montar	25
912	omega	25
913	original	25
914	petit	25
915	probiótico	25
916	semidesnatada	25
917	silvestres	25
918	tulipán	25
919	horchata	26
920	chufa	26
921	vitaminas	26
922	café	26
923	crecimiento	39
924	papilla	39
925	meses	39
926	año	39
927	verduritas	39
928	desarrollo	39
929	zanahorias	39
930	lactantes	39
931	nativa	39
932	continuación	39
933	nidina	39
934	caldito	39
935	miel	39
936	camperas	38
937	claras	38
938	líquidas	38
939	pasteurizadas	38
940	super	38
941	cocidos	38
942	codorniz	38
943	copos	15
944	muesli	15
945	barquillos	15
946	secos	15
947	sport	15
948	barquillo	15
949	chocolatina	15
950	pastas	15
951	estrellas	15
952	inflado	15
953	fruta	15
954	granola	15
955	quinoa	15
956	legumbres	15
957	tradicionales	15
958	caramelizadas	15
959	belgas	15
960	tartaletas	15
961	artesanas	15
962	redondas	15
963	cápsula	11
964	descafeinado	11
965	molido	11
966	soluble	11
967	espresso	11
968	cappuccino	11
969	monodosis	11
970	grano	11
971	colombia	11
972	ristretto	11
973	intenso	11
974	forte	11
975	cápsulas	11
976	largo	11
977	solubles	11
978	filtros	11
979	cafeteras	11
980	taza	10
981	infusión	12
982	té	12
983	manzanilla	12
984	chai	12
985	matcha	12
986	hierbabuena	12
987	poleo	12
988	tila	12
989	caballo	12
990	anís	12
991	tomillo	12
992	cítricos	12
993	rojos	12
994	jengibre	12
995	cúrcuma	12
996	hinojo	12
997	mate	12
998	amanda	12
999	fría	12
1000	mermelada	9
1001	flores	9
1002	confitura	9
1003	amarga	9
1004	albaricoque	9
1005	higo	9
1006	frambuesa	9
1007	naranjo	9
1008	golosinas	7
1009	chicles	7
1010	caramelos	7
1011	gragea	7
1012	mentol	7
1013	rega	7
1014	eucalipto	7
1015	respiral	7
1016	tubos	7
1017	pica	7
1018	lámina	7
1019	fruits	7
1020	regaliz	7
1021	melones	7
1022	ácidos	7
1023	eucaliptus	7
1024	blandos	7
1025	masticable	7
1026	dulciora	7
1027	grageas	7
1028	dentaduras	7
1029	néctar	34
1030	smoothie	34
1031	recién	34
1032	exprimido	34
1033	maracuyá	34
1034	rojas	34
1035	guayaba	34
1036	mediterráneo	34
1037	bahamas	34
1038	antioxidante	34
1039	multivitaminas	34
1040	chía	34
1041	mandarina	34
1042	verja	34
1043	pulpa	34
1044	florida	34
1045	clementina	34
1046	postre	19
1047	cereza	19
1048	coulant	19
1049	oliva	1
1050	virgen	1
1051	vinagre	1
1052	girasol	1
1053	refinado	1
1054	balsámico	1
1055	módena	1
1056	picual	1
1057	bálsamica	1
1058	bicarbonato	2
1059	sódio	2
1060	mesa	2
1061	yodada	2
1062	hornear	2
1063	sodio	2
1064	rosa	2
1065	himalaya	2
1066	sazonador	3
1067	pimentón	3
1068	azafrán	3
1069	negra	3
1070	provenzales	3
1071	comino	3
1072	cayena	3
1073	ahumar	3
1074	orégano	3
1075	laurel	3
1076	albahaca	3
1077	romero	3
1078	eneldo	3
1079	cilantro	3
1080	colorante	3
1081	hebra	3
1082	pimientas	3
1083	blanca	3
1084	frita	3
1085	rama	3
1086	nuez	3
1087	moscada	3
1088	guindillas	3
1089	ñoras	3
1090	clavo	3
1091	piñones	3
1092	frito	4
1093	mostaza	4
1094	ketchup	4
1095	piri	4
1096	pesto	4
1097	chili	4
1098	guacamole	4
1099	alioli	4
1100	tikka	4
1101	masala	4
1102	teriyaki	4
1103	thai	4
1104	jlek	4
1105	mexicana	4
1106	ranch	4
1107	aliño	4
1108	rústica	4
1109	choricero	4
1110	alubia	5
1111	fideo	5
1112	macarrón	5
1113	tortellini	5
1114	lenteja	5
1115	penne	5
1116	fusilli	5
1117	cous	5
1118	hélices	5
1119	pagani	5
1120	ravioli	5
1121	medialunas	5
1122	placas	5
1123	pinta	5
1124	tahini	5
1125	aromático	5
1126	bia	5
1127	fideuá	5
1128	infantil	5
1129	pajaritas	5
1130	tortiglioni	5
1131	trottole	5
1132	rigate	5
1133	tallarines	5
1134	nidos	5
1135	noodles	5
1136	roja	5
1137	mejillones	20
1138	espárragos	20
1139	blancos	20
1140	escabeche	20
1141	melva	20
1142	berberechos	20
1143	medianos	20
1144	triturado	20
1145	cortos	20
1146	gruesos	20
1147	judías	20
1148	asados	20
1149	mazorquitas	20
1150	membrillo	20
1151	ventresca	20
1152	bonito	20
1153	norte	20
1154	canutera	20
1155	caballa	20
1156	sur	20
1157	marinara	20
1158	calamares	20
1159	almejones	20
1160	zamburiñas	20
1161	fritada	20
1162	concentrado	20
1163	tamizado	20
1164	seco	20
1165	delgados	20
1166	champiñones	20
1167	laminados	20
1168	champiñón	20
1169	guisantes	20
1170	planas	20
1171	remolacha	20
1172	macedonia	20
1173	palmito	20
1174	condimentados	20
1175	germinados	20
1176	agridulce	20
1177	chucrut	20
1178	acelgas	20
1179	jugo	20
1180	almíbar	20
1181	hida	20
1182	jamar	20
1183	finos	22
1184	sofrito	22
1185	calabaza	22
1186	calabacín	22
1187	fumet	22
1188	puré	22
1189	aceitunas	13
1190	snack	13
1191	pepinillos	13
1192	aliñadas	13
1193	aperitivo	13
1194	banderillas	13
1195	agridulces	13
1196	nachos	13
1197	galletitas	13
1198	aperitivos	13
1199	sticks	13
1200	negras	13
1201	cebollitas	13
1202	clásicas	13
1203	onduladas	13
1204	ondulado	13
1205	agria	13
1206	campestre	13
1207	añadida	13
1208	garfitos	13
1209	conos	13
1210	combinado	13
1211	bombitas	13
1212	torreznos	13
1213	chicharricos	13
1214	cortezas	13
1215	deshidratada	13
1216	aros	13
1217	palomitas	13
1218	fritos	13
1219	redes	13
1220	chupadedos	13
1221	pepinillo	13
1222	jalapeño	13
1223	picadedos	13
1224	dulces	13
1225	encurtidos	13
1226	gildas	13
1227	aceituna	13
1228	pequeños	13
1229	altramuces	13
1230	alcaparras	13
1231	picadillo	13
1232	variantes	13
1233	ajos	13
1234	alcaparrones	13
1235	jalapeños	13
1236	tostada	14
1237	peladas	14
1238	dátiles	14
1239	crujiente	14
1240	macadamia	14
1241	castañas	14
1242	deshidratado	14
1243	ciruelas	14
1244	desecadas	14
1245	desecados	14
1246	deshidratados	14
1247	orejones	14
1248	agua	27
1249	mineral	27
1250	gas	27
1251	gaseosa	27
1252	soda	27
1253	refresco	28
1254	zero	28
1255	energética	28
1256	isotónica	28
1257	iso	28
1258	cafeína	28
1259	tónica	28
1260	cítrico	28
1261	verde	28
1262	diluir	28
1263	limonada	28
1264	piñacoco	28
1265	cherry	28
1266	berry	28
1267	lime	28
1268	gel	28
1269	energético	28
1270	cerveza	29
1271	alcohol	29
1272	pilsen	29
1273	reserva	29
1274	filtrar	29
1275	doble	29
1276	malta	29
1277	vino	33
1278	tinto	33
1279	verano	33
1280	tempranillo	33
1281	comportillo	33
1282	semidulce	33
1283	espumoso	33
1284	sangría	33
1285	aromatizada	33
1286	cosecha	33
1287	sulfitos	33
1288	oloroso	33
1289	cava	31
1290	sidra	31
1291	semi	31
1292	licor	30
1293	ron	30
1294	ginebra	30
1295	gin	30
1296	whisky	30
1297	escocés	30
1298	dry	30
1299	vermouth	30
1300	brandy	30
1301	vodka	30
1302	strawberry	30
1303	sweet	30
1304	colada	30
1305	chicle	30
1306	limoncello	30
1307	mora	30
1308	coloración	48
1309	permanente	48
1310	facial	48
1311	rubio	48
1312	amoníaco	48
1313	normal	48
1314	baño	48
1315	champú	48
1316	corporal	48
1317	compresa	48
1318	mascarilla	48
1319	hojas	48
1320	desodorante	48
1321	claro	48
1322	dentífrico	48
1323	afeitar	48
1324	fijación	48
1325	castaño	48
1326	ceniza	48
1327	hidratante	48
1328	maquinilla	48
1329	dañado	48
1330	antitranspirante	48
1331	sensible	48
1332	ácido	48
1333	toallitas	48
1334	hialurónico	48
1335	sérum	48
1336	dental	48
1337	oscuro	48
1338	fresh	48
1339	tampones	48
1340	ojos	48
1341	tipo	48
1342	cepillo	48
1343	recambios	48
1344	color	48
1345	acondicionador	48
1346	antimanchas	48
1347	bucal	48
1348	jabón	48
1349	aplicador	48
1350	enjuague	48
1351	cera	48
1352	control	48
1353	pies	48
1354	maquinillas	48
1355	depilación	48
1356	fijador	48
1357	desmaquillantes	48
1358	esponja	48
1359	loción	48
1360	desechables	48
1361	recargable	48
1362	incontinencia	48
1363	espuma	48
1364	laca	48
1365	marrón	48
1366	cara	48
1367	noche	48
1368	action	48
1369	precision	48
1370	exfoliante	48
1371	dermo	48
1372	invisible	48
1373	anticaspa	48
1374	algodón	48
1375	seca	48
1376	vitamina	48
1377	antiarrugas	48
1378	hidrata	48
1379	colgate	48
1380	blanqueador	48
1381	aclarado	48
1382	regular	48
1383	teñido	48
1384	mechas	48
1385	luminoso	48
1386	cobrizo	48
1387	faciales	48
1388	contorno	48
1389	spray	48
1390	encías	48
1391	higiene	48
1392	cuerpo	48
1393	rollon	48
1394	tratamiento	48
1395	pañal	48
1396	adulto	48
1397	rizado	48
1398	rizos	48
1399	retoca	48
1400	raíces	48
1401	discos	48
1402	desmaquillante	48
1403	limpiador	48
1404	hidra	48
1405	tónico	48
1406	iluminador	48
1407	reafirmante	48
1408	care	48
1409	nutritiva	48
1410	ampollas	48
1411	protección	48
1412	refrescante	48
1413	eléctrico	48
1414	cepillos	48
1415	interdentales	48
1416	dentales	48
1417	dermoprotector	48
1418	urea	48
1419	pastilla	48
1420	maracujá	48
1421	plegada	48
1422	íntimas	48
1423	bandas	48
1424	depilatoria	48
1425	hombre	48
1426	cejas	48
1427	after	48
1428	shave	48
1429	fix	48
1430	quitaesmalte	48
1431	acetona	48
1432	uñas	48
1433	brillo	48
1434	graso	48
1435	hyaluronic	48
1436	repair	48
1437	liso	48
1438	keratina	48
1439	encrespado	48
1440	clarísimo	48
1441	platino	48
1442	tinte	48
1443	normalmixta	48
1444	micelar	48
1445	limpiadora	48
1446	pieles	48
1447	niacinamida	48
1448	salicílico	48
1449	minerales	48
1450	protectora	48
1451	seboregulador	48
1452	matifica	48
1453	arrugas	48
1454	colágeno	48
1455	silicio	48
1456	reductor	48
1457	bolsas	48
1458	acción	48
1459	dientes	48
1460	prótesis	48
1461	envase	48
1462	rellenable	48
1463	viaje	48
1464	argán	48
1465	marino	48
1466	flor	48
1467	efecto	48
1468	intensivo	48
1469	piernas	48
1470	intensiva	48
1471	pura	48
1472	higiénico	48
1473	húmedo	48
1474	wc	48
1475	rostro	48
1476	refrescantes	48
1477	tanga	48
1478	braguita	48
1479	diario	48
1480	íntima	48
1481	caliente	48
1482	tarro	48
1483	pinza	48
1484	bálsamo	48
1485	volumen	48
1486	anticaída	48
1487	fortificante	48
1488	menthol	48
1489	preventivo	48
1490	ondas	48
1491	azulado	48
1492	caoba	48
1493	cobre	48
1494	beige	48
1495	ovalados	48
1496	desmaquillador	48
1497	labios	48
1498	bifásico	48
1499	waterproof	48
1500	poros	48
1501	purificante	48
1502	prebióticos	48
1503	impregnados	48
1504	purificantes	48
1505	seborreguladores	48
1506	disco	48
1507	reutilizable	48
1508	regenerador	48
1509	revitaliza	48
1510	reestructura	48
1511	ribonucleico	48
1512	regeneradora	48
1513	fortalecedora	48
1514	secante	48
1515	imperfecciones	48
1516	aclarante	48
1517	retinal	48
1518	redensificadora	48
1519	esencia	48
1520	oxigenante	48
1521	ojeras	48
1522	párpados	48
1523	parches	48
1524	hidrogel	48
1525	tensor	48
1526	potenciador	48
1527	licopeno	48
1528	retinol	48
1529	despigmentante	48
1530	ceramidas	48
1531	reparador	48
1532	ricino	48
1533	antiox	48
1534	intensa	48
1535	proexpert	48
1536	especiada	48
1537	signal	48
1538	caries	48
1539	blanqueante	48
1540	clorofila	48
1541	anticaries	48
1542	hidroxiapatita	48
1543	gominola	48
1544	reparación	48
1545	activa	48
1546	parodontax	48
1547	duro	48
1548	sensibles	48
1549	ortodoncia	48
1550	extrafinos	48
1551	explosion	48
1552	adhesiva	48
1553	hilo	48
1554	clorhexidina	48
1555	gingival	48
1556	cinta	48
1557	tabletas	48
1558	limpiadoras	48
1559	ortodoncias	48
1560	arcos	48
1561	interdental	48
1562	frutal	48
1563	frescor	48
1564	honey	48
1565	gelchampú	48
1566	sulfato	48
1567	sales	48
1568	toja	48
1569	magno	48
1570	nutritivo	48
1571	áspera	48
1572	atópica	48
1573	cedro	48
1574	lichi	48
1575	ambar	48
1576	vetiver	48
1577	granada	48
1578	beauty	48
1579	heno	48
1580	pravia	48
1581	glicerina	48
1582	hidroalcohólico	48
1583	antiséptico	48
1584	recarga	48
1585	neutraliza	48
1586	olores	48
1587	esponjas	48
1588	exfoliación	48
1589	masaje	48
1590	fibras	48
1591	naturales	48
1592	rizo	48
1593	guante	48
1594	fashion	48
1595	temptation	48
1596	irritaciones	48
1597	dexpantenol	48
1598	oriental	48
1599	anticelulítica	48
1600	atlantia	48
1601	anticelulítico	48
1602	bronceado	48
1603	nutre	48
1604	cica	48
1605	mosqueta	48
1606	esferas	48
1607	posidónia	48
1608	japón	48
1609	reparadora	48
1610	antisequedad	48
1611	stick	48
1612	antirozaduras	48
1613	gigantes	48
1614	hidroalcohólicas	48
1615	autobronceadoras	48
1616	night	48
1617	plegado	48
1618	ultrafino	48
1619	tena	48
1620	masculina	48
1621	mujer	48
1622	decolorante	48
1623	depilar	48
1624	cuchilla	48
1625	oblicua	48
1626	recta	48
1627	colors	48
1628	cuchillas	48
1629	perfilar	48
1630	vello	48
1631	sensor	48
1632	comfort	48
1633	labs	48
1634	antifatiga	48
1635	revitalizante	48
1636	vital	48
1637	antiedad	48
1638	piedra	48
1639	pómez	48
1640	esmeril	48
1641	tijera	48
1642	corta	48
1643	cutículas	48
1644	vidrio	48
1645	cortaúñas	48
1646	raspador	48
1647	durezas	48
1648	alicate	48
1649	débil	48
1650	detox	48
1651	cuero	48
1652	cabelludo	48
1653	citrus	48
1654	citric	48
1655	elimina	48
1656	liendres	48
1657	piojos	48
1658	conditioner	48
1659	suavidad	48
1660	platinum	48
1661	gris	48
1662	minute	48
1663	hidrocrema	48
1664	radiant	48
1665	apagado	48
1666	definidos	48
1667	descarados	48
1668	curly	48
1669	térmico	48
1670	termo	48
1671	peinado	48
1672	styling	48
1673	surfing	48
1674	polvos	48
1675	voluminizador	48
1676	activador	48
1677	pasión	48
1678	cálido	48
1679	rojizo	48
1680	rubí	48
1681	arena	48
1682	quitamanchas	48
1683	capilar	48
1684	matizador	48
1685	antiamarillos	48
1686	eau	52
1687	parfum	52
1688	perfume	52
1689	colonia	52
1690	fps	51
1691	solar	51
1692	atópicas	51
1693	pediátrico	51
1694	labial	51
1695	protege	51
1696	niños	51
1697	aftersun	51
1698	autobronceador	51
1699	transparente	51
1700	kit	49
1701	vaselina	49
1702	kiss	49
1703	pinceles	49
1704	bruma	49
1705	multifuncional	49
1706	make	49
1707	up	49
1708	fixer	49
1709	perfumada	49
1710	rizador	49
1711	pestañas	49
1712	maquillaje	49
1713	esencial	49
1714	comprimidos	50
1715	adhesivas	50
1716	protectoras	50
1717	preservativos	50
1718	colagen	50
1719	enervit	50
1720	efervescentes	50
1721	própolis	50
1722	bastoncillos	50
1723	desinfectante	50
1724	pulsera	50
1725	citronela	50
1726	esparadrapo	50
1727	adhesivo	50
1728	hidrófilo	50
1729	infantiles	50
1730	apósitos	50
1731	árbol	50
1732	pipeta	50
1733	dosificadora	50
1734	dormir	50
1735	zinc	50
1736	laxforte	50
1737	valeriana	50
1738	oral	50
1739	onagra	50
1740	jalea	50
1741	real	50
1742	quemagrasas	50
1743	articular	50
1744	spirulina	50
1745	menopausia	50
1746	magnesio	50
1747	gases	50
1748	gominolas	50
1749	regulación	50
1750	sueño	50
1751	melatonina	50
1752	gummies	50
1753	vitaldin	50
1754	oxigenada	50
1755	solución	50
1756	única	50
1757	lentes	50
1758	contacto	50
1759	blandas	50
1760	cortar	50
1761	textil	50
1762	resistente	50
1763	zigzag	50
1764	hipoalergénico	50
1765	povidona	50
1766	alivio	50
1767	picor	50
1768	microporoso	50
1769	acolchado	50
1770	poliuretano	50
1771	resistentes	50
1772	hidrocoloides	50
1773	adhesivos	50
1774	rozaduras	50
1775	venda	50
1776	elástica	50
1777	cohesiva	50
1778	repelente	50
1779	antimosquitos	50
1780	protectores	50
1781	oídos	50
1782	moldex	50
1783	lágrimas	50
1784	hidratantes	50
1785	hialuronato	50
1786	sódico	50
1787	árnica	50
1788	gasas	50
1789	esterilizadas	50
1790	digluconato	50
1791	mascarillas	50
1792	quirúrgicas	50
1793	tattoo	50
1794	sensitivo	50
1795	bebé	40
1796	talla	40
1797	pañales	40
1798	desechable	40
1799	chupete	40
1800	silicona	40
1801	reversible	40
1802	bañador	40
1803	junior	40
1804	bebés	40
1805	cambiador	40
1806	multiusos	40
1807	pomada	40
1808	cítricas	40
1809	florales	40
1810	fisiológica	40
1811	salina	40
1812	tejidas	40
1813	anatómica	40
1814	talco	40
1815	limpiabiberón	40
1816	tetina	40
1817	biberones	40
1818	tetinas	40
1819	luminiscente	40
1820	perro	53
1821	gato	53
1822	comida	53
1823	júnior	53
1824	sénior	53
1825	perros	53
1826	gatos	53
1827	adultos	53
1828	razas	53
1829	aloe	53
1830	vera	53
1831	selección	53
1832	hierba	53
1833	natura	53
1834	snacks	53
1835	huesos	53
1836	residuos	53
1837	caninos	53
1838	doggy	53
1839	bags	53
1840	todas	53
1841	pequeñas	53
1842	aves	53
1843	antibacterias	53
1844	aglomerante	53
1845	sílice	53
1846	single	53
1847	gatera	53
1848	cuidado	53
1849	completo	54
1850	periquitos	54
1851	canarios	54
1852	conejos	54
1853	roedores	54
1854	jilgueros	54
1855	loros	54
1856	cotorras	54
1857	ninfa	54
1858	agaporni	54
1859	enanos	54
1860	lecho	54
1861	mascotas	54
1862	nuske	54
1863	detergente	47
1864	suavizante	47
1865	lavadora	47
1866	tejidos	47
1867	pods	47
1868	floral	47
1869	frescura	47
1870	prendas	47
1871	delicadas	47
1872	micolor	47
1873	oscura	47
1874	lejía	47
1875	lavado	47
1876	eliminador	47
1877	antitransferencia	47
1878	blando	47
1879	disuelve	47
1880	manchas	47
1881	antical	47
1882	percarbonato	47
1883	lavadoras	47
1884	spa	47
1885	perfumador	47
1886	intensificador	47
1887	fragancia	47
1888	destilada	47
1889	plancha	47
1890	planchado	47
1891	fácil	47
1892	lavavajillas	41
1893	piscina	41
1894	guantes	41
1895	limpieza	41
1896	estropajo	41
1897	friegasuelos	41
1898	microfibra	41
1899	limpiahogar	41
1900	colgador	41
1901	muebles	41
1902	bayeta	41
1903	látex	41
1904	ultra	41
1905	abrillantador	41
1906	cloro	41
1907	calzado	41
1908	quitagrasas	41
1909	vitrocerámicas	41
1910	baños	41
1911	desincrustante	41
1912	suciedad	41
1913	perfumado	41
1914	delicada	41
1915	fregona	41
1916	autobrillante	41
1917	limpiamáquinas	41
1918	maxigotas	41
1919	jabonoso	41
1920	mágico	41
1921	hogar	41
1922	suelo	41
1923	desatascador	41
1924	tuberías	41
1925	disolución	41
1926	lenta	41
1927	limpiacristales	41
1928	limpiagafas	41
1929	cristales	41
1930	espejos	41
1931	salvauñas	41
1932	absorbente	41
1933	mopa	41
1934	plumero	41
1935	pepino	41
1936	ollas	41
1937	cacerolas	41
1938	ambientador	41
1939	antiolor	41
1940	desengrasantes	41
1941	hornos	41
1942	inducción	41
1943	rasqueta	41
1944	potente	41
1945	óxido	41
1946	ducha	41
1947	activo	41
1948	cisterna	41
1949	ceras	41
1950	pronto	41
1951	parquet	41
1952	tapicerías	41
1953	alfombras	41
1954	mopas	41
1955	cementos	41
1956	limpiajuntas	41
1957	pétalos	41
1958	lavanda	41
1959	insecticida	41
1960	multisuperficies	41
1961	suelos	41
1962	delicado	41
1963	denso	41
1964	desinfectantes	41
1965	turbo	41
1966	sosa	41
1967	cáustica	41
1968	fosas	41
1969	sépticas	41
1970	bolsitas	41
1971	alguicida	41
1972	saquitos	41
1973	rápido	41
1974	dosificador	41
1975	flotante	41
1976	mantenimiento	41
1977	invierno	41
1978	incrementador	41
1979	analizador	41
1980	acciones	41
1981	lavaparabrisas	41
1982	chimeneas	41
1983	gamuza	41
1984	acero	41
1985	inoxidable	41
1986	borrador	41
1987	almohadilla	41
1988	posavajillas	41
1989	paño	41
1990	vajillas	41
1991	pequeñamediana	41
1992	medianagrande	41
1993	gamuzas	41
1994	recambio	41
1995	pañuelos	44
1996	servilleta	44
1997	rollo	44
1998	suaves	44
1999	compacto	44
2000	cubo	43
2001	bolsa	43
2002	basura	43
2003	congelación	43
2004	pila	43
2005	alcalina	43
2006	industrial	43
2007	medianas	43
2008	zip	43
2009	aa	43
2010	aaa	43
2011	jardín	43
2012	envases	43
2013	compostables	43
2014	saco	43
2015	alto	43
2016	film	43
2017	deslizante	43
2018	antipolillas	46
2019	moscas	46
2020	trampa	46
2021	mosquitos	46
2022	hormigas	46
2023	cucarachas	46
2024	barrera	46
2025	ácaros	46
2026	avispas	46
2027	difusor	46
2028	matacucarachas	46
2029	polillas	46
2030	alimentos	46
2031	raticida	46
2032	automático	42
2033	fragancias	42
2034	coche	42
2035	armarios	42
2036	cajones	42
2037	multifragancia	42
2038	absorbeolores	42
2039	frigorífico	42
2040	antihumedad	42
\.


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 7, true);


--
-- Name: productos_super_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_super_id_seq', 3562, true);


--
-- Name: subcategorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategorias_id_seq', 54, true);


--
-- Name: super_loc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.super_loc_id_seq', 87, true);


--
-- Name: supermercados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supermercados_id_seq', 5, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 2040, true);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- Name: productos_super productos_super_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_super
    ADD CONSTRAINT productos_super_pkey PRIMARY KEY (id);


--
-- Name: productos_tags productos_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_tags
    ADD CONSTRAINT productos_tags_pkey PRIMARY KEY (id_producto, id_tag);


--
-- Name: subcategorias subcategorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pkey PRIMARY KEY (id);


--
-- Name: super_loc super_loc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_loc
    ADD CONSTRAINT super_loc_pkey PRIMARY KEY (id);


--
-- Name: supermercados supermercados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supermercados
    ADD CONSTRAINT supermercados_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: productos_super productos_super_id_loc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_super
    ADD CONSTRAINT productos_super_id_loc_fkey FOREIGN KEY (id_loc) REFERENCES public.super_loc(id);


--
-- Name: productos_super productos_super_id_scat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_super
    ADD CONSTRAINT productos_super_id_scat_fkey FOREIGN KEY (id_scat) REFERENCES public.subcategorias(id);


--
-- Name: productos_tags productos_tags_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_tags
    ADD CONSTRAINT productos_tags_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos_super(id);


--
-- Name: productos_tags productos_tags_id_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_tags
    ADD CONSTRAINT productos_tags_id_tag_fkey FOREIGN KEY (id_tag) REFERENCES public.tags(id);


--
-- Name: subcategorias subcategorias_id_cat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_id_cat_fkey FOREIGN KEY (id_cat) REFERENCES public.categorias(id);


--
-- Name: super_loc super_loc_id_super_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_loc
    ADD CONSTRAINT super_loc_id_super_fkey FOREIGN KEY (id_super) REFERENCES public.supermercados(id);


--
-- Name: tags tags_id_scat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_id_scat_fkey FOREIGN KEY (id_scat) REFERENCES public.subcategorias(id);


--
-- PostgreSQL database dump complete
--

