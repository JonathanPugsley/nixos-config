#! /usr/bin/env bash
# symbols menu for icons and emojis

options=( "󰓠  Nerd Font Icons" "  Emojis" )
selection=$( printf "%s\n" "${options[@]}" | lekker-launcher -l "${#options[@]}" -p "Symbols" ) || exit 0
case "${selection#*  }" in
    "Nerd Font Icons") rofi -modi nerdy -show nerdy ;;
    "Emojis") rofi -modi emoji -show emoji ;;
    *) exit 1 ;;
esac
