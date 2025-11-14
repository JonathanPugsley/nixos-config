#! /usr/bin/env bash
# main wofi menu

OPTIONS=( " Screenshot" " Screen Record" " Colour Picker" )

screenshot() {
    SS_DIR="$HOME/Pictures/Screenshots"
    MODE=$( printf "%s\n" "Output" "Window" "Region" "Active" | wofi -djE -L 4 ) || exit 0
    hyprshot -m "${MODE,,}" -o "$SS_DIR"
}

screenrecord() {
    # Currently no app to screenrecord. Pretty much a placeholder
    notify-send "Currently Unavailable"
}

colourPicker() {
    COL=$( hyprpicker )
    [[ -n "$COL" ]] || exit 1
    wl-copy "$COL"
    notify-send "Colour Picker: $COL" "$COL copied to clipboard"
}

SEL=$( printf "%s\n" "${OPTIONS[@]}" | wofi -djE -L "${#OPTIONS[@]}" ) || exit 0
case "${SEL#* }" in
    "Screenshot") screenshot;;
    "Screen Record") screenrecord;;
    "Colour Picker") colourPicker;;
    *) exit 1;;
esac
