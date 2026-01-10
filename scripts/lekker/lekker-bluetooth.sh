#! /usr/bin/env bash
# bluetooth manager

COMMAND="xdg-terminal-exec -e $SHELL -c bluetui"

lekker-launch-floating-window "$COMMAND"
