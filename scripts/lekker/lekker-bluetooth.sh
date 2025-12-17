#! /usr/bin/env bash
# bluetooth manager

hyprctl dispatch exec "[float; center]" " alacritty -e zsh -c \"bluetui\" " > /dev/null 2>&1
