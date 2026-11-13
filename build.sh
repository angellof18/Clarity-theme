#!/bin/sh


# Valores por defecto (Dark)
OUTPUT="Clarity-Dark.edj"
COLOR_SOURCE="src/variants/colorclasses_dark.edc"
WALLPAPER="src/variants/wallpaper_dark.png"

# Parsear argumentos
for arg in "$@"; do
    case "$arg" in
        -light|--light)
            OUTPUT="Clarity-Light.edj"
            COLOR_SOURCE="src/variants/colorclasses_light.edc"
	    WALLPAPER="src/variants/wallpaper_light.png"
            shift
            ;;
        -dark|--dark)
            OUTPUT="Clarity-Dark.edj"
            COLOR_SOURCE="src/variants/colorclasses_dark.edc"
    	WALLPAPER="src/variants/wallpaper_dark.png"
            shift
            ;;
        -black|--black)
            OUTPUT="Clarity-Black.edj"
            COLOR_SOURCE="src/variants/colorclasses_black.edc"
    	WALLPAPER="src/variants/wallpaper_black.png"
            shift
            ;;
    esac
done

# Copiar el archivo de colorclasses correspondiente al destino esperado por default.edc
if [ -f "$COLOR_SOURCE" ]; then
    cp "$COLOR_SOURCE" src/colorclasses.edc
    cp "$WALLPAPER" src/m_wallpaper.png
else
    echo "Error: No se encuentra el archivo de colores $COLOR_SOURCE"
    exit 1
fi

# Compilar el tema
edje_cc "$@" -id src -fd src -sd src src/default.edc -o "$OUTPUT"

echo "¡Tema compilado con éxito: $OUTPUT!"