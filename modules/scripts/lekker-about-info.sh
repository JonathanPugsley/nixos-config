#! /usr/bin/env bash
# display system information

ABOUT=( "alacritty -e zsh -c 'fastfetch; echo -n \"Press any key to exit... \" && read -sr -k 1 ; exit'" )
hyprctl dispatch exec "[float; center; size 980 600]" "${ABOUT[0]}" > /dev/null 2>&1
