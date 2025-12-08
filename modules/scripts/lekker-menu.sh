#! /usr/bin/env bash
# main wofi menu

ENTRIES=( "Apps" "Learn" "Capture" "Timer" "Style" "Scripts" "Config" "Nixpkgs" "About" "System" )
CONFIG_DIR="$HOME/dev/nixos-config"

SUB_MENU=$( printf "%s\n" "${ENTRIES[@]}" | wofi -dj -L ${#ENTRIES[@]} ) || exit 0
case "${SUB_MENU}" in
    "Apps") wofi --show drun ;;
    "Learn") exit 0 ;;
    "Capture") lekker-capture ;;
    "Timer") lekker-timer menu ;;
    "Style") exit 0 ;;
    "Scripts") lekker-scripts ;;
    "Config") setsid -f alacritty -e zsh -c "cd \"$CONFIG_DIR\" && nvim" > /dev/null 2>&1 ;;
    "Nixpkgs") lekker-pkg-search ;;
    "About") lekker-about-info ;;
    "System") lekker-system-menu ;;
    *) exit 1 ;;
esac
