#! /usr/bin/env bash
# clipboard managing menu

ENTRIES=( "󰦨  History" "󰑌  Clear" )

clipboard_history() {
    readarray -t history < <( cliphist list )
    printf "%s\n" "${history[@]}" | lekker-launcher  -l "${#history[@]}" -p "History" -display-columns 2 | cliphist decode | wl-copy
}

clipboard_wipe() {
    cliphist wipe
    notify-send -a "lekker" "wl-clipboard" "clipboard cleared"
}

SEL=$( printf "%s\n" "${ENTRIES[@]}" | lekker-launcher -l "${#ENTRIES[@]}" -p "Clipboard") || exit 0
case "${SEL#*  }" in
    "History") clipboard_history;;
    "Clear") clipboard_wipe;;
    *) exit 1;;
esac
