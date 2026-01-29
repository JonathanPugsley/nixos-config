#! /usr/bin/env bash
# hardware and connectivity menu

OPTIONS=( "  Audio" "  Bluetooth" "󰖩  Network" "󰍹  Monitors" "󱐋  Power Profiles" )

SEL=$( printf "%s\n" "${OPTIONS[@]}" | lekker-launcher -l "${#OPTIONS[@]}" -p "Lekker" ) || exit 0
case "${SEL#*  }" in
    "Audio") lekker-menu-audio ;;
    "Bluetooth") lekker-launch-bluetooth ;;
    "Network") lekker-menu-wifi ;;
    "Monitors") lekker-toggle-resolution ;;
    "Power Profiles") exit 0 ;;
    *) exit 1 ;;
esac
