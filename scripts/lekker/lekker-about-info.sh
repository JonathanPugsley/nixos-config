#! /usr/bin/env bash
# display system information

COMMAND="xdg-terminal-exec -e $SHELL -c 'fastfetch; echo -n \"Press any key to exit... \" && read -sr -k 1 ; exit'"

lekker-launch-floating-window "$COMMAND" -W 980 -H 600
