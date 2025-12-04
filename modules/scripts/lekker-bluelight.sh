#! /usr/bin/env bash
# toggle blue light filter (hyprsunset)

read_temp() {
    temp=$(hyprctl hyprsunset temperature 2>/dev/null) || exit 1
    if [[ "$temp" == "7000" ]]; then
        echo "{\"alt\": \"day\"}"
    else
        echo "{\"alt\": \"night\"}"
    fi
}

toggle_temp() {
    temp=$(hyprctl hyprsunset temperature 2>/dev/null) || exit 1
    if [[ "$temp" == "7000" ]]; then
        hyprctl hyprsunset temperature 5000 >/dev/null 2>&1
        echo "{\"alt\": \"night\"}"
    else
        hyprctl hyprsunset temperature 7000 >/dev/null 2>&1
        echo "{\"alt\": \"day\"}"
    fi
}

case "$1" in
    "toggle") toggle_temp ;;
    "read") read_temp ;;
    *) exit 1 ;;
esac
