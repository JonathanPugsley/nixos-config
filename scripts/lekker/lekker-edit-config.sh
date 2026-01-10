#! /usr/bin/env bash
# open nixos config directory in nvim

CONFIG_DIR="$HOME/dev/nixos-config"
COMMAND="xdg-terminal-exec -e $SHELL -c \"cd $CONFIG_DIR && nvim\" "

lekker-launch-floating-window "$COMMAND"
