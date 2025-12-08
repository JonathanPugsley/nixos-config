#! /usr/bin/env bash
# screen capture lekker menu

SS_DIR="$HOME/Pictures/Screenshots"
OPTIONS=( " Screenshot" " Screen Record" " Colour Picker" )

screenshot() {
    ss_options=( "Output" "Window" "Region" "Active" )
    ss_menu_height=$( lekker-menu-height "${ss_options[@]}" )
    ss_mode=$( printf "%s\n" "${ss_options[@]}" | wofi -djE -H "$ss_menu_height" ) || exit 0
    hyprshot -m "${ss_mode,,}" -o "$SS_DIR"
}

screenrecord() {
    # Currently no app to screenrecord. Pretty much a placeholder
    notify-send "Currently Unavailable" ":("
}

colourPicker() {
    colour=$( hyprpicker )
    [[ -n "$colour" ]] || exit 1
    wl-copy "$colour"
    notify-send "Colour Picker: $colour" "$colour copied to clipboard"
}

MENU_HEIGHT=$( lekker-menu-height "${OPTIONS[@]}" )
SEL=$( printf "%s\n" "${OPTIONS[@]}" | wofi -djE -H "$MENU_HEIGHT" ) || exit 0
case "${SEL#* }" in
    "Screenshot") screenshot;;
    "Screen Record") screenrecord;;
    "Colour Picker") colourPicker;;
    *) exit 1;;
esac
