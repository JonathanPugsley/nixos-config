#! /usr/bin/env bash
# power menu

OPTIONS=("󰒲 Suspend" " Reboot" " Shutdown" "󰍃 Logout" " Lock Screen")

POWER=$( printf "%s\n" "${OPTIONS[@]}" | wofi --dmenu --lines=${#OPTIONS[@]})
[ -z "$POWER" ] && exit 1

CONFIRM=$(printf "Yes, $POWER\nCancel" | wofi --dmenu --lines=2)
[[ -z "$CONFIRM" || "$CONFIRM" == "Cancel" ]] && exit 1

case "$POWER" in
    "Suspend") systemctl suspend;;
    "Reboot") systemctl reboot;;
    "Shutdown") systemctl shutdown now;;
    "Logout") hyprctl dispatch exit;;
    "Lock Screen") hyprlock;;
    *) exit 1
esac
