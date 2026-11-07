#!/bin/sh


# Valores por defecto (Dark)
OUTPUT="Clarity-Dark.edj"
COLOR_SOURCE="src/variants/colorclasses_dark.edc"

# Parsear argumentos
for arg in "$@"; do
    case "$arg" in
        -light|--light)
            OUTPUT="Clarity-Light.edj"
            COLOR_SOURCE="src/variants/colorclasses_light.edc"
            shift
            ;;
        -dark|--dark)
            OUTPUT="Clarity-Dark.edj"
            COLOR_SOURCE="src/variants/colorclasses_dark.edc"
            shift
            ;;
        -black|--black)
            OUTPUT="Clarity-Black.edj"
            COLOR_SOURCE="src/variants/colorclasses_black.edc"
            shift
            ;;
    esac
done

# Copiar el archivo de colorclasses correspondiente al destino esperado por default.edc
if [ -f "$COLOR_SOURCE" ]; then
    cp "$COLOR_SOURCE" src/colorclasses.edc
else
    echo "Error: No se encuentra el archivo de colores $COLOR_SOURCE"
    exit 1
fi

# Compilar el tema
edje_cc "$@" -id src -fd src -sd src src/default.edc -o "$OUTPUT"

echo "¡Tema compilado con éxito: $OUTPUT!"