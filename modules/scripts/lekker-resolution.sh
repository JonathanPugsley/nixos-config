#! /usr/bin/env bash
# resolution changing menu

MONITOR_INFO=$( hyprctl monitors )
RESOLUTIONS=( "4K" "UWQHD" "QHD" "FHD" )

readarray -t MONITORS <<< "$( grep -oE "Monitor [^[:space:]]+" <<< "$MONITOR_INFO" | cut -d " " -f2 )"
readarray -t HZ <<< "$( grep " at " <<< "$MONITOR_INFO" | grep -oE "@[0-9]+(\.[0-9]+)?" | tr -d "@" )"
readarray -t POS <<< "$( grep -oE "at [^[:space:]]+" <<< "$MONITOR_INFO" | cut -d " " -f2 )"
readarray -t SCALE <<< "$( grep -oE "scale: [^[:space:]]+" <<< "$MONITOR_INFO" | cut -d " " -f2 )"

# monitor selection for > 1 monitor
INDEX=-1
if [[ ${#MONITORS[@]} -gt 1 ]]; then
    SELECTED_MONITOR=$( printf "%s\n" "${MONITORS[@]}" | wofi -dj -L "${#MONITORS[@]}" ) || exit 0
    for i in "${!MONITORS[@]}"; do
        [[ "${MONITORS[$i]}" == "$SELECTED_MONITOR" ]] && INDEX="$i" && break
    done
    [[ "$INDEX" -eq -1 ]] && exit 1
else
    SELECTED_MONITOR="${MONITORS[0]}"
fi

SELECTED_RESOLUTION=$( printf "%s\n" "${RESOLUTIONS[@]}" | wofi -dj -L "${#RESOLUTIONS[@]}" ) || exit 0
case "$SELECTED_RESOLUTION" in
    "4K") RES="3840x2560@${HZ[$INDEX]}" ;;
    "UWQHD") RES="3440x1440@${HZ[$INDEX]}" ;;
    "QHD") RES="2560x1440@${HZ[$INDEX]}" ;;
    "FHD") RES="1920x1080@${HZ[$INDEX]}" ;;
    *) exit 1
esac

hyprctl keyword monitor "$SELECTED_MONITOR", "$RES", "${POS[$INDEX]}", "${SCALE[$INDEX]}" >/dev/null 2>&1
notify-send "$SELECTED_MONITOR resolution is now $SELECTED_RESOLUTION"
