#! /usr/bin/env bash
# resolution changing menu

RESOLUTIONS=( "3840x2160" "3440x1440" "2560x1440" "1920x1080" )

# extract connected monitors' info
monitor_info=$( hyprctl monitors )
readarray -t monitors <<< "$( grep -oE "Monitor [^[:space:]]+" <<< "$monitor_info" | cut -d " " -f2 )"
readarray -t hz <<< "$( grep " at " <<< "$monitor_info" | grep -oE "@[0-9]+(\.[0-9]+)?" | tr -d "@" )"
readarray -t pos <<< "$( grep -oE "at [^[:space:]]+" <<< "$monitor_info" | cut -d " " -f2 )"
readarray -t scale <<< "$( grep -oE "scale: [^[:space:]]+" <<< "$monitor_info" | cut -d " " -f2 )"

# monitor selection for > 1 monitor
index=-1
if [[ ${#monitors[@]} -gt 1 ]]; then
    menu_height=$( lekker-menu-height "${monitors[@]}" )
    selected_monitor=$( printf "%s\n" "${monitors[@]}" | wofi -dj -H "$menu_height" ) || exit 0
    for i in "${!monitors[@]}"; do
        [[ "${monitors[$i]}" == "$selected_monitor" ]] && index="$i" && break
    done
    [[ "$index" -eq -1 ]] && exit 1
else
    selected_monitor="${monitors[0]}"
fi

# resolution selection
match=0;
menu_height=$( lekker-menu-height "${RESOLUTIONS[@]}" )
selected_resolution=$( printf "%s\n" "${RESOLUTIONS[@]}" | wofi -dj -H "$menu_height" ) || exit 0
for element in "${RESOLUTIONS[@]}"; do
    [[ "$element" == "$selected_resolution" ]] && match=1 && break
done
[[ "$match" -eq 0 ]] && exit 0
res="$selected_resolution@${hz[$index]}"

hyprctl keyword monitor "$selected_monitor", "$res", "${pos[$index]}", "${scale[$index]}" >/dev/null 2>&1
notify-send "$selected_monitor resolution is now $selected_resolution"
