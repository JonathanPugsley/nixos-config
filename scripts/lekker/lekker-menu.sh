#! /usr/bin/env bash
# main lekker menu

ENTRIES=( "  Apps" "  Learn" "  Capture" "  Timer" "  Scripts" "  Config" "  Toggle" "  Nixpkgs" "  About" "  System" )

selection=$( printf "%s\n" "${ENTRIES[@]}" | lekker-launcher -l "${#ENTRIES[@]}" -p "Lekker" ) || exit 0
case "${selection#*  }" in
    "Apps") rofi -show drun ;;
    "Capture") lekker-menu-capture ;;
    "Timer") lekker-timer menu ;;
    "Config") lekker-edit-config ;;
    "Toggle") lekker-menu-toggle;;
    "Nixpkgs") lekker-pkg-search ;;
    "About") lekker-about-info ;;
    "System") lekker-system-menu ;;
    *) exit 1 ;;
esac
