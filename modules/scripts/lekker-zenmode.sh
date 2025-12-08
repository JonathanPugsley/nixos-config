#! /usr/bin/env bash
# manage focus/zen mode

toggle_mode() {
    if [[ "$MODE" == "zen" ]]; then
        makoctl mode -r zen
        echo "normal" > "/tmp/zenmode"
        echo "{\"alt\": \"normal\"}"
    else
        makoctl mode -s zen
        echo "zen" > "/tmp/zenmode"
        echo "{\"alt\": \"zen\"}"
    fi
}

[[ ! -f /tmp/zenmode ]] && echo "normal" > "/tmp/zenmode"
MODE=$(cat /tmp/zenmode)
case "$1" in
    "read") echo "{\"alt\": \"$MODE\"}" ;;
    "toggle") toggle_mode ;;
    *) exit 1 ;;
esac
