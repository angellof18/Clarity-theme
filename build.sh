#!/bin/sh

# Valores por defecto (Dark y default_shelf)
BASE_NAME="Clarity-Dark"
COLOR_SOURCE="src/variants/colorclasses/colorclasses_dark.edc"
WALLPAPER="src/variants//wallpaper/wallpaper_dark.png"
SHELF_SOURCE="src/variants/shelf/default_shelf.edc"
ROUNDED_SUFFIX=""

# Parsear argumentos
for arg in "$@"; do
    case "$arg" in
        -l|-light)
            BASE_NAME="Clarity-Light"
            COLOR_SOURCE="src/variants/colorclasses/colorclasses_light.edc"
	        WALLPAPER="src/variants/wallpaper/wallpaper_light.png"
            shift
            ;;
        -d|-dark)
            BASE_NAME="Clarity-Dark"
            COLOR_SOURCE="src/variants/colorclasses/colorclasses_dark.edc"
    	    WALLPAPER="src/variants/wallpaper/wallpaper_dark.png"
            shift
            ;;
        -b|-black)
            BASE_NAME="Clarity-Black"
            COLOR_SOURCE="src/variants/colorclasses/colorclasses_black.edc"
    	    WALLPAPER="src/variants/wallpaper/wallpaper_black.png"
            shift
            ;;
        -r|-rounded)
            SHELF_SOURCE="src/variants/shelf/rounded_shelf.edc"
            ROUNDED_SUFFIX="-Rounded"
            shift
            ;;
        -w|-wallpapers)
            cp backgrounds/wallpaper-*.jpg ~/.e/e/backgrounds
	 echo "Copying wallpapers on ~/.e/e/backgrounds"
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