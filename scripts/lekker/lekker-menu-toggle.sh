#! /usr/bin/env bash
# toggle menu

ENTRIES=( "󱔓  Top Bar" "󰔎  Nightlight" "󰧱  Zen Mode" )

toggleBar() {
    pid=$( pgrep waybar )
    if [ -n "$pid" ]; then
        pkill waybar
    else
        setsid -f waybar
    fi
}

selection=$( printf "%s\n" "${ENTRIES[@]}" | lekker-launcher "${#ENTRIES[@]}" "Lekker" ) || exit 0
case "${selection#*  }" in
    "Top Bar") toggleBar;;
    "Nightlight") lekker-bluelight toggle;;
    "Zen Mode") lekker-zenmode toggle;;
    *) exit 1;;
esac
