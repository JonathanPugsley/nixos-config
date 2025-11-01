#! /usr/bin/env bash
# power menu

OPTIONS=("󰒲 Suspend" " Reboot" " Shutdown" "󰍃 Logout" " Lock Screen")

POWER=$( printf "%s\n" "${OPTIONS[@]}" | wofi -dj -L ${#OPTIONS[@]}) || exit 0
[[ ! "${OPTIONS[@]}" =~ "$POWER" ]] && exit 1

CONFIRM=$(printf "Yes, $POWER\nCancel" | wofi -dj -L 2)
[[ "$CONFIRM" != "Yes, $POWER" ]] && exit 0

case "${POWER#* }" in
    "Suspend") systemctl suspend;;
    "Reboot") systemctl reboot;;
    "Shutdown") systemctl shutdown now;;
    "Logout") hyprctl dispatch exit;;
    "Lock Screen") hyprlock;;
    *) exit 1
esac
