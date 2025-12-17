#! /usr/bin/env bash
# package search with nix-search-tv

ns="nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse"
hyprctl dispatch exec "[float; center]" " alacritty -e zsh -c \"$ns\" "
