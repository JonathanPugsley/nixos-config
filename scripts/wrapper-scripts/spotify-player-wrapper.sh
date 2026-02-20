#! /usr/bin/env bash
# wrapper script for spotify_player
# Ensures a daemon is running when launching TUI

if ! pgrep -f "spotify_player --daemon" > /dev/null; then
    notify-send -a "spotify_player wrapper" "Starting spotify_player daemon..."
    spotify_player --daemon &
    sleep 1
fi

xdg-terminal-exec spotify_player
