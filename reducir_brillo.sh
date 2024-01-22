#!/bin/bash

# Obtener el valor actual de brillo
CURRENT_BRIGHTNESS=$(cat /sys/class/backlight/*/brightness)
MAX_BRIGHTNESS=$(cat /sys/class/backlight/*/max_brightness)

# Calcular el nuevo valor de brillo reducido en un 30%
NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS * 0.7" | bc | awk '{print int($1+0.5)}')

# Verificar si el nuevo valor es menor que el brillo mínimo (puede ser 0)
if [ "$NEW_BRIGHTNESS" -lt 0 ]; then
  NEW_BRIGHTNESS=0
fi

# Actualizar el brillo
echo "$NEW_BRIGHTNESS" | sudo tee /sys/class/backlight/*/brightness

echo "Brillo reducido en un 30%."
