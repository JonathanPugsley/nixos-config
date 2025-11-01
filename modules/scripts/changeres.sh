#! /usr/bin/env bash
# resolution changing menu

RESOLUTIONS=(3440x1440@100 2560x1440@100 1920x1080@100 3840x2160@60 1920x1080@60)
MONITORS=$(hyprctl monitors | grep -oP 'Monitor \K[^\s]+' )

if [ ${#MONITORS[@]} -gt 1 ]; then
    SELECTED_MONITOR=$(echo "$MONITORS" | wofi -dj -L ${#MONITORS[@]}) || exit 0
else
    SELECTED_MONITOR=$MONITORS
fi
[[ -z "$SELECTED_MONITOR" || ! "${MONITORS[@]}" =~ "$SELECTED_MONITOR" ]] && exit 1

SELECTED_RESOLUTION=$(echo "${RESOLUTIONS[@]}" | tr ' ' '\n' | wofi -dj -L ${#RESOLUTIONS[@]}) || exit 0
[[ -z "$SELECTED_RESOLUTION" || ! "${RESOLUTIONS[@]}" =~ "$SELECTED_RESOLUTION" ]] && exit 1

hyprctl keyword monitor $SELECTED_MONITOR, $SELECTED_RESOLUTION >/dev/null 2>&1
