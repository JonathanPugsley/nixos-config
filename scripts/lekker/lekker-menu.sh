#! /usr/bin/env bash
# main lekker menu

ENTRIES=( "  Apps" "  Learn" "  Capture" "  Timer" "  Scripts" "  Config" "  Toggle" "  Nixpkgs" "  About" "  System" )

selection=$( printf "%s\n" "${ENTRIES[@]}" | lekker-launcher "${#ENTRIES[@]}" "Lekker" ) || exit 0
case "${selection#*  }" in
    "Apps") rofi -show drun ;;
    "Learn") exit 0 ;;
    "Capture") lekker-capture ;;
    "Timer") lekker-timer menu ;;
    "Scripts") lekker-scripts ;;
    "Config") lekker-edit-config ;;
    "Toggle") lekker-menu-toggle;;
    "Nixpkgs") lekker-pkg-search ;;
    "About") lekker-about-info ;;
    "System") lekker-system-menu ;;
    *) exit 1 ;;
esac
