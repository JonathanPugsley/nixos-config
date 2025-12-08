#! /usr/bin/env bash
# main wofi menu

ENTRIES=( "Apps" "Learn" "Capture" "Timer" "Style" "Scripts" "Config" "Nixpkgs" "About" "System" )

menu_height=$( lekker-menu-height "${ENTRIES[@]}" )
selection=$( printf "%s\n" "${ENTRIES[@]}" | wofi -dj -H "$menu_height" ) || exit 0
case "${selection}" in
    "Apps") wofi --show drun ;;
    "Learn") exit 0 ;;
    "Capture") lekker-capture ;;
    "Timer") lekker-timer menu ;;
    "Style") exit 0 ;;
    "Scripts") lekker-scripts ;;
    "Config") lekker-edit-config ;;
    "Nixpkgs") lekker-pkg-search ;;
    "About") lekker-about-info ;;
    "System") lekker-system-menu ;;
    *) exit 1 ;;
esac
