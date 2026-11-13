#!/bin/sh

# Valores por defecto (Dark y default_shelf)
BASE_NAME="Clarity-Dark"
COLOR_SOURCE="src/variants/colorclasses_dark.edc"
WALLPAPER="src/variants/wallpaper_dark.png"
SHELF_SOURCE="src/variants/default_shelf.edc"
ROUNDED_SUFFIX=""

# Parsear argumentos
for arg in "$@"; do
    case "$arg" in
        -light|--light)
            BASE_NAME="Clarity-Light"
            COLOR_SOURCE="src/variants/colorclasses_light.edc"
	        WALLPAPER="src/variants/wallpaper_light.png"
            shift
            ;;
        -dark|--dark)
            BASE_NAME="Clarity-Dark"
            COLOR_SOURCE="src/variants/colorclasses_dark.edc"
    	    WALLPAPER="src/variants/wallpaper_dark.png"
            shift
            ;;
        -black|--black)
            BASE_NAME="Clarity-Black"
            COLOR_SOURCE="src/variants/colorclasses_black.edc"
    	    WALLPAPER="src/variants/wallpaper_black.png"
            shift
            ;;
        -rounded|--rounded)
            SHELF_SOURCE="src/variants/rounded_shelf.edc"
            ROUNDED_SUFFIX="-Rounded"
            shift
            ;;
    esac
done

# Construir el nombre final del archivo combinando el tema y el sufijo opcional
OUTPUT="${BASE_NAME}${ROUNDED_SUFFIX}.edj"

# Copiar el archivo de colorclasses correspondiente al destino esperado por default.edc
if [ -f "$COLOR_SOURCE" ]; then
    cp "$COLOR_SOURCE" src/colorclasses.edc
    cp "$WALLPAPER" src/m_wallpaper.png
else
    echo "Error: No se encuentra el archivo de colores $COLOR_SOURCE"
    exit 1
fi

# Copiar el shelf correspondiente (por defecto o redondeado)
if [ -f "$SHELF_SOURCE" ]; then
    cp "$SHELF_SOURCE" src/edc/shelf.edc
    echo "Usando shelf: $SHELF_SOURCE"
else
    echo "Error: No se encuentra el archivo de shelf $SHELF_SOURCE"
    exit 1
fi

# Compilar el tema
edje_cc -id src -fd src -sd src src/default.edc -o "$OUTPUT"

echo "¡Tema compilado con éxito: $OUTPUT!"