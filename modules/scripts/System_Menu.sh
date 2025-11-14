#! /usr/bin/env bash
# power menu

OPTIONS=( "󰒲 Suspend" " Reboot" " Shutdown" "󰍃 Logout" " Lock Screen" )
POWER=$( printf "%s\n" "${OPTIONS[@]}" | wofi -dj -L ${#OPTIONS[@]} ) || exit 0

MATCH=0
for ELEMENT in "${OPTIONS[@]}"; do
    [[ "$ELEMENT" == "$POWER" ]] && MATCH=1
done
[[ MATCH -eq 1 ]] || exit 1

CONFIRM=$( printf "%s\n" "Yes, $POWER" "Cancel" | wofi -dj -L 2 )
[[ "$CONFIRM" != "Yes, $POWER" ]] && exit 0

case "${POWER#* }" in
    "Suspend") systemctl suspend;;
    "Reboot") cliphist wipe && systemctl reboot;;
    "Shutdown") cliphist wipe && shutdown now;;
    "Logout") hyprctl dispatch exit;;
    "Lock Screen") hyprlock;;
    *) exit 1 ;;
esac
