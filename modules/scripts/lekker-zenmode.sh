#! /usr/bin/env bash
# manage focus/zen mode

zen_mode() {
    # notification suppression
    makoctl mode -s zen

    # waybar status
    echo "zen" > "/tmp/zenmode"
    echo "{\"alt\": \"zen\"}"

    # window changes (opacity, animations etc)
    # hyprctl getoption windowrule:term-opacity:enable false
    hyprctl keyword windowrule"[opacity]":enable 0 > /dev/null
    hyprctl keyword general:gaps_in 0 > /dev/null
    hyprctl keyword general:gaps_out 0 > /dev/null
    hyprctl keyword animations:enabled 0 > /dev/null
}

normal_mode() {
    # notification suppression
    makoctl mode -r zen

    # waybar status
    echo "normal" > "/tmp/zenmode"
    echo "{\"alt\": \"normal\"}"

    # window changes (opacity, animations etc)
    hyprctl keyword windowrule"[opacity]":enable 1 > /dev/null
    hyprctl keyword general:gaps_in 5 > /dev/null
    hyprctl keyword general:gaps_out 10 > /dev/null
    hyprctl keyword animations:enabled 1 > /dev/null
}

toggle_mode() {
    if [[ "$MODE" == "zen" ]]; then
        normal_mode
    else
        zen_mode
    fi
}

[[ ! -f /tmp/zenmode ]] && echo "normal" > "/tmp/zenmode"
MODE=$(cat /tmp/zenmode)
case "$1" in
    "read") echo "{\"alt\": \"$MODE\"}" ;;
    "toggle") toggle_mode ;;
    *) exit 1 ;;
esac
