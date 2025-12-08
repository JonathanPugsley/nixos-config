#! /usr/bin/env bash
# power menu

OPTIONS=( "󰒲 Suspend" " Reboot" " Shutdown" "󰍃 Logout" " Lock Screen" )

# validate selection
match=0
menu_height=$( lekker-menu-height "${OPTIONS[@]}" )
power=$( printf "%s\n" "${OPTIONS[@]}" | wofi -dj -H "$menu_height" ) || exit 0
for element in "${OPTIONS[@]}"; do
    [[ "$element" == "$power" ]] && match=1
done
[[ "$match" -eq 1 ]] || exit 1

# confirm menu
menu_height=$( lekker-menu-height "" "" )
confirm=$( printf "%s\n" "Yes, $power" "Cancel" | wofi -dj -H "$menu_height" ) || exit 0
[[ "$confirm" == "Yes, $power" ]] || exit 0

# exec commands
case "${power#* }" in
    "Suspend") systemctl suspend;;
    "Reboot") cliphist wipe && systemctl reboot;;
    "Shutdown") cliphist wipe && shutdown now;;
    "Logout") hyprctl dispatch exit;;
    "Lock Screen") hyprlock;;
    *) exit 1 ;;
esac
