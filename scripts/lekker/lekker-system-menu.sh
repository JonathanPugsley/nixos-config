#! /usr/bin/env bash
# power menu

OPTIONS=( "  Lock Screen" "  Logout" "󰒲  Suspend" "  Reboot" "  Shutdown")

# validate selection
match=0
power=$( printf "%s\n" "${OPTIONS[@]}" | lekker-launcher "${#OPTIONS[@]}" "Power" ) || exit 0
for element in "${OPTIONS[@]}"; do
    [[ "$element" == "$power" ]] && match=1
done
[[ "$match" -eq 1 ]] || exit 1

# confirm menu
confirm=$( printf "%s\n" "Yes, $power" "Cancel" | lekker-launcher "2" "" "Are you sure?" ) || exit 0
[[ "$confirm" == "Yes, $power" ]] || exit 0

# exec commands
case "${power#*  }" in
    "Lock Screen") hyprlock;;
    "Logout") hyprctl dispatch exit;;
    "Suspend") systemctl suspend;;
    "Reboot") cliphist wipe && systemctl reboot;;
    "Shutdown") cliphist wipe && shutdown now;;
    *) exit 1 ;;
esac
