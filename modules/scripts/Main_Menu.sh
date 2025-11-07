#! /usr/bin/env bash
# main wofi menu

ENTRIES=( "Apps" "Learn" "Capture" "Timer" "Style" "Scripts" "Config" "Nixpkgs" "About" "System" )

SUB_MENU=$( printf "%s\n" "${ENTRIES[@]}" | wofi -dj -L ${#ENTRIES[@]} ) || exit 0
case "${SUB_MENU}" in
    "Apps") wofi -j ;;
    "Learn") exit 0 ;;
    "Capture") Capture_Menu ;;
    "Timer") Timer ;;
    "Style") exit 0 ;;
    "Scripts") Script_Menu ;;
    "Config") setsid -f alacritty -e zsh -c "cd \"$CONFIG_DIR\" && nvim" > /dev/null 2>&1 ;;
    "Nixpkgs") exit 0 ;;
    "About") setsid -f alacritty -e zsh -c "fastfetch; exec zsh" > /dev/null 2>&1 ;;
    "System") System_Menu ;;
    *) exit 1 ;;
esac
