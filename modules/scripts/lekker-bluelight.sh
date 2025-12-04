#! /usr/bin/env bash
# toggle blue light filter (hyprsunset)

read_temp() {
    if [[ "$TEMPERATURE" == "6000" ]]; then
        echo "{\"alt\": \"day\"}"
    else
        echo "{\"alt\": \"night\"}"
    fi
}

toggle_temp() {
    if [[ "$TEMPERATURE" == "6000" ]]; then
        hyprctl hyprsunset temperature 5000 >/dev/null 2>&1
        echo "{\"alt\": \"night\"}"
    else
        hyprctl hyprsunset temperature 6000 >/dev/null 2>&1
        echo "{\"alt\": \"day\"}"
    fi
}

TEMPERATURE=$(hyprctl hyprsunset temperature 2>/dev/null) || exit 1
case "$1" in
    "read") read_temp ;;
    "toggle") toggle_temp ;;
    *) exit 1 ;;
esac
