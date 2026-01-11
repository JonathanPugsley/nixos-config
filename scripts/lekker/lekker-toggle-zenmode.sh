#! /usr/bin/env bash
# manage focus/zen mode

zen_mode() {
    # notification suppression
    makoctl mode -s zen

    # waybar status
    echo "zen" > "/tmp/zenmode"
    echo "{\"alt\": \"zen\"}"

    # window modifications
    hyprctl getoption general:gaps_in | sed -n 's/[^0-9 ]//gp' > /tmp/zen-gapsin
    hyprctl getoption general:gaps_out | sed -n 's/[^0-9 ]//gp' > /tmp/zen-gapsout
    hyprctl getoption animations:enabled | sed -n 's/[^0-9 ]//gp' > /tmp/zen-anims

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

    # window modifications
    gaps_in=$( cat /tmp/zen-gapsin )
    gaps_out=$( cat /tmp/zen-gapsout )
    anims=$( cat /tmp/zen-anims )

    hyprctl keyword windowrule"[opacity]":enable 1 > /dev/null
    hyprctl keyword general:gaps_in "$gaps_in" > /dev/null
    hyprctl keyword general:gaps_out "$gaps_out" > /dev/null
    hyprctl keyword animations:enabled "$anims" > /dev/null
}

toggle_mode() {
    if [[ "$MODE" == "zen" ]]; then
        normal_mode
    else
        zen_mode
    fi
}

[[ ! -f /tmp/zenmode ]] && echo "normal" > "/tmp/zenmode"
MODE=$( cat /tmp/zenmode )
case "$1" in
    "read") echo "{\"alt\": \"$MODE\"}" ;;
    "toggle") toggle_mode ;;
    *) exit 1 ;;
esac
