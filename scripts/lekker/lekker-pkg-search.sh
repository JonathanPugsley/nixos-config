#! /usr/bin/env bash
# package search with nix-search-tv

NS="nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse"
COMMAND="xdg-terminal-exec -e $SHELL -c \"$NS\""

lekker-launch-floating-window "$COMMAND"
