#! /usr/bin/env bash
# lekker managed volume control

case "$1" in
    "up") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
    "down") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    "mute") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    *) exit 1 ;;
esac

vol=$( wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/.*: //' )
if [[ "$vol" == *"[MUTED]" ]] || awk "BEGIN {exit !($vol == 0)}"; then
    icon=""
elif awk "BEGIN {exit !($vol < 0.5)}"; then
    icon=""
else
    icon=""
fi

lekker-osd "$icon" "$( awk -v v="$vol" 'BEGIN { printf("%g", v * 100) }' )%"
