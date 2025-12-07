#!/usr/bin/env bash
# lekker managed volume control

delta=5 # change % for volume
action=$1

get_volume() {
    VOL=$( wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/.*: //' )
    echo "$VOL"
    PERCENTAGE=$( awk -v v="$VOL" 'BEGIN { printf("%g", v * 100) }' )
    if [[ "$VOL" == *"[MUTED]" ]]; then
        ICON=""
        BODY="muted"
    elif awk "BEGIN {exit !($VOL == 0)}" ; then
        ICON=""
        BODY="$PERCENTAGE%"
    elif awk "BEGIN {exit !($VOL < 0.5)}"; then
        ICON=""
        BODY="$PERCENTAGE%"
    else
        ICON=""
        BODY="$PERCENTAGE%"
    fi
}

case "$action" in
    "up")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$delta"%+;
        ;;
    "down")
        wpctl set-volume @DEFAULT_AUDIO_SINK@ "$delta"%-
        ;;
    "mute")
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    *) exit 1 ;;
esac

get_volume
lekker-osd "$ICON" "$BODY"
