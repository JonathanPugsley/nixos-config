#! /usr/bin/env bash
# lekker managed volume control

case "$1" in
    "up") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ ;;
    "down") wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    "mute") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    *) exit 1 ;;
esac

VOL=$( wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/.*: //' )
if [[ "$VOL" == *"[MUTED]" ]] || awk "BEGIN {exit !($VOL == 0)}"; then
    ICON=""
elif awk "BEGIN {exit !($VOL < 0.5)}"; then
    echo "VOLUME < 0.5"
    ICON=""
else
    echo "VOLUME > 0.5"
    ICON=""
fi

lekker-osd "$ICON" "$( awk -v v="$VOL" 'BEGIN { printf("%g", v * 100) }' )%"
