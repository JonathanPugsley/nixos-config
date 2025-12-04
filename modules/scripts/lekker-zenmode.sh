#! /usr/bin/env bash
# manages focus/zen mode

read_mode() {
    if [[ "$MODE" == "zen" ]]; then
        echo "{\"alt\": \"zen\"}"
    else
        echo "{\"alt\": \"normal\"}"
    fi
}

toggle_mode() {
    if [[ "$MODE" == "zen" ]]; then
        echo "normal" > "/tmp/zenmode"
        echo "{\"alt\": \"normal\"}"
    else
        echo "zen" > "/tmp/zenmode"
        echo "{\"alt\": \"zen\"}"
    fi
}

[[ ! -f /tmp/zenmode ]] && echo "normal" > "/tmp/zenmode"
MODE=$(cat /tmp/zenmode)
case "$1" in
    "read") read_mode ;;
    "toggle") toggle_mode ;;
    *) exit 1 ;;
esac
