#!/bin/bash

echo "Iniciando configuración LLM..."
echo "Inicializando servidor Ollama en segundo plano..."
ollama serve &
sleep 5

echo "Descargando el modelo para el clasificador (mistral)..."
ollama pull mistral

echo "Descargando el modelo para el etiquetador (llama3.2:3b)..."
ollama pull llama3.2

echo "Creando modelo etiquetador usando el Modelfile..."
ollama create llama32_3b_etiquetador -f /tmp/Modelfile
echo "Configuración LLM completada."
wait