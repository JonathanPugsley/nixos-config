#! /usr/bin/env bash
# resolution changing wofi menu

RESOLUTIONS=(3440x1440@100 2560x1440@100 1920x1080@100 1920x1080@60)

MONITORS=$(hyprctl monitors | grep -oP 'Monitor \K[^\s]+' )
SELECTED_MONITOR=$(echo "$MONITORS" | wofi --dmenu --prompt="Select Monitor:")

if [ -z "$SELECTED_MONITOR" ]; then
    echo "No monitor selected, exiting..."
    exit 1
fi

SELECTED_RESOLUTION=$(echo "${RESOLUTIONS[@]}" | tr ' ' '\n' | wofi --dmenu --prompt="Select Resolution:")

if [ -z "$SELECTED_RESOLUTION" ]; then
    echo "No resolution selected, exiting..."
    exit 1
fi

echo "Changing resolution of $SELECTED_MONITOR to $SELECTED_RESOLUTION..."
hyprctl keyword monitor $SELECTED_MONITOR, $SELECTED_RESOLUTION
