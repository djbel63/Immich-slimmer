#!/bin/bash
set -e

echo "--- 🚀 Iniciando Immich-Slimmer: $(date) ---"

# Definir tamaño mínimo (por defecto 2M si no se especifica)
MIN_SIZE_VAL="${MIN_SIZE:-2M}"

echo "Buscando archivos mayores de $MIN_SIZE_VAL..."

# 1. Buscar y procesar imágenes usando la variable
find /data -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -size "+$MIN_SIZE_VAL" | while read -r file; do
    echo "⚡ Optimizando: $file"
    convert "$file" -resize "${MAX_WIDTH:-1920}x${MAX_HEIGHT:-1920}>" -quality "${QUALITY:-80}" "$file"
done

# 2. Notificar a Immich
echo "Visualizando cambios en Immich..."
curl -s -X PUT "${IMMICH_URL}/api/jobs/metadataExtraction" \
     -H "x-api-key: ${IMMICH_API_KEY}" \
     -H "Content-Type: application/json" \
     -d '{"command": "start"}'

echo "--- ✅ Tarea completada con éxito ---"
