# Smart Shopping List (TFG)

Repositorio del Trabajo de Fin de Grado: Smart Shopping List. 

Esta aplicación utiliza Inteligencia Artificial (Ollama) y algoritmos de optimización (SCIP) para optimizar listas de la compra. Está construida bajo una arquitectura de microservicios y contenerizada con Docker.

## Requisitos

* Docker Desktop instalado y en ejecución.
* Virtualización y subsistema WSL2 activados (Windows).

## Configuración inicial

Antes de arrancar el proyecto por primera vez, asegúrate de configurar las variables de entorno:

1. **Backend:** En la ruta `/backend/core/`, renombra `template.env` a `.env` (o crea uno nuevo) y configura tus credenciales (`DB_USER` y `DB_PASS`).
2. **Frontend:** En la ruta `/frontend/`, renombra `template.env` a `.env` (o crea uno nuevo) y asegúrate de que apunta a la API (ej. `VITE_API_URL=http://localhost:8000`).

## Ejecución del proyecto

El repositorio incluye un script de Windows (arrancar_app.bat) para automatizar la creación de los contenedores y abrir el navegador web.

* **Arrancar:** Haz doble clic en el archivo `arrancar_app.bat`. Tras unos segundos, la consola encenderá los servicios y se abrirá tu navegador automáticamente en `http://localhost:5173`.

**Nota sobre el primer arranque:** La primera vez que se inicie el proyecto, el proceso tomará varios minutos, ya que Docker descargará las imágenes de los servicios, inicializará la base de datos de pruebas y compilará el modelo de IA local. Las ejecuciones posteriores tomarán apenas unos segundos.
