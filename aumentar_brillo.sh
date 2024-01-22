#!/bin/bash

# Obtener el valor actual de brillo
CURRENT_BRIGHTNESS=$(cat /sys/class/backlight/*/brightness)
MAX_BRIGHTNESS=$(cat /sys/class/backlight/*/max_brightness)

# Calcular el nuevo valor de brillo aumentado en un 30%
NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS * 1.3" | bc | awk '{print int($1+0.5)}')

# Verificar si el nuevo valor excede el brillo máximo
if [ "$NEW_BRIGHTNESS" -gt "$MAX_BRIGHTNESS" ]; then
  NEW_BRIGHTNESS=$MAX_BRIGHTNESS
fi

# Actualizar el brillo
echo "$NEW_BRIGHTNESS" | sudo tee /sys/class/backlight/*/brightness

echo "Brillo aumentado en un 30%."

