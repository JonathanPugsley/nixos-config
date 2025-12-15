#! /usr/bin/env bash
# screen capture lekker menu

SS_DIR="$HOME/Pictures/Screenshots"
OPTIONS=( " Screenshot" " Screen Record" " Colour Picker" )

screenshot() {
    ss_options=( "Output" "Window" "Region" "Active" )
    ss_mode=$( printf "%s\n" "${ss_options[@]}" | lekker-launcher "${#ss_options[@]}" "Screenshot" ) || exit 0
    hyprshot -m "${ss_mode,,}" -o "$SS_DIR" -s
    sleep 0.4
    file=$(find "$SS_DIR" -type f -exec stat --format="%Y %n" {} \; | sort -n | tail -n 1 | cut -d' ' -f2-)
    notify-send -i "$file" -a "lekker" "Screenshot Saved" "$SS_DIR"
}

screenrecord() {
    # currently no app to screenrecord
    notify-send -a "lekker" "Screenrecording" "Currently Unavailable :("
}

colourPicker() {
    colour=$( hyprpicker )
    [[ -n "$colour" ]] || exit 1
    wl-copy "$colour"
    notify-send -a "lekker" "Colour Picker: $colour" "$colour copied to clipboard"
}

# check for storage directory
if [[ ! -d "$SS_DIR" ]]; then
    notify-send -a "lekker" "Lekker Capture" "Creating $SS_DIR for screenshots"
    mkdir -p "$SS_DIR"
fi

# menu
SEL=$( printf "%s\n" "${OPTIONS[@]}" | lekker-launcher "${#OPTIONS[@]}" "Capture" ) || exit 0
case "${SEL#* }" in
    "Screenshot") screenshot;;
    "Screen Record") screenrecord;;
    "Colour Picker") colourPicker;;
    *) exit 1;;
esac
