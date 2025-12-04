#! /usr/bin/env bash
# main wofi menu

ENTRIES=( "Apps" "Learn" "Capture" "Timer" "Style" "Scripts" "Config" "Nixpkgs" "About" "System" )
CONFIG_DIR="$HOME/dev/nixos-config"
ABOUT=( "alacritty -e zsh -c 'fastfetch; echo -n \"Press any key to exit... \" && read -sr -k 1 ; exit'" )

SUB_MENU=$( printf "%s\n" "${ENTRIES[@]}" | wofi -dj -L ${#ENTRIES[@]} ) || exit 0
case "${SUB_MENU}" in
    "Apps") wofi ;;
    "Learn") exit 0 ;;
    "Capture") lekker-capture ;;
    "Timer") lekker-timer ;;
    "Style") exit 0 ;;
    "Scripts") lekker-scripts ;;
    "Config") setsid -f alacritty -e zsh -c "cd \"$CONFIG_DIR\" && nvim" > /dev/null 2>&1 ;;
    "Nixpkgs") lekker-pkg-search ;;
    "About") hyprctl dispatch exec "[float; center; size 980 600]" "${ABOUT[0]}" > /dev/null 2>&1 ;;
    "System") lekker-system-menu ;;
    *) exit 1 ;;
esac
