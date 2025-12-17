#! /usr/bin/env bash
# open nixos config directory in nvim

CONFIG_DIR="$HOME/dev/nixos-config"

setsid -f alacritty -e zsh -c "cd \"$CONFIG_DIR\" && nvim" > /dev/null 2>&1
