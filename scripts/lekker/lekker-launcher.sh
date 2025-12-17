#! /usr/bin/env bash
# launcher menu wrapper script

MAX_ROWS=14

lines="${1:-$MAX_ROWS}"
prompt=$2
placeholder=$3
[ "$lines" -lt 1 ] && lines=1
[ "$lines" -gt "$MAX_ROWS" ] && lines="$MAX_ROWS"

rofi -dmenu -i -window-title "lekker-menu" -l "$lines" -p "$prompt" -theme-str "#entry { placeholder: \"$placeholder\"; }"
