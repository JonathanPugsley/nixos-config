#! /usr/bin/env bash
# bluetui in a floating window

hyprctl dispatch exec "[float; center]" " alacritty -e zsh -c \"bluetui\" "
exit 0
