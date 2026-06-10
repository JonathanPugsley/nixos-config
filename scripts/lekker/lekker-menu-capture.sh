#! /usr/bin/env bash
# screen capture lekker menu

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
OPTIONS=( "  Screenshot" "  Screen Record" "  Colour Picker" "  Theme Palette" )

screenshot() {
    ss_options=( "󰍹  Output" "  Window" "󰗆  Region")
    ss_mode=$( printf "%s\n" "${ss_options[@]}" | lekker-launcher -l "${#ss_options[@]}" -p "Screenshot" ) || exit 0
    ss_mode=${ss_mode#*  }
    save_mode=$( printf "󰈟  Save to File\n󰱖  Save to Clipboard" | lekker-launcher -l 2 -p "Saving" ) || exit 0
    [[ "$save_mode" == "󰈟  Save to File" ]] && hyprshot -m "${ss_mode,,}" -o "$SCREENSHOT_DIR"
    [[ "$save_mode" == "󰱖  Save to Clipboard" ]] && hyprshot -m "${ss_mode,,}" --clipboard-only
}

screenRecord() {
    # currently no app to screen record
    notify-send -a "lekker" "Screen Recording" "Currently Unavailable :("
}

colourPicker() {
    sleep 0.4
    colour=$( hyprpicker -a )
    [[ -n "$colour" ]] || exit 1
    notify-send -a "lekker" "Colour Picker: $colour" "$colour copied to clipboard"
}

themePalette() {
    local command
    command="xdg-terminal-exec -e $SHELL -c 'palette; exit'"
    lekker-launch-floating-window "$command" -W 600 -H 600
}

# check for storage directory
if [[ ! -d "$SCREENSHOT_DIR" ]]; then
    notify-send -a "lekker" "Lekker Capture" "Creating $SCREENSHOT_DIR for screenshots"
    mkdir -p "$SCREENSHOT_DIR"
fi

# menu
SEL=$( printf "%s\n" "${OPTIONS[@]}" | lekker-launcher -l "${#OPTIONS[@]}" -p "Capture" ) || exit 0
case "${SEL#*  }" in
    "Screenshot") screenshot ;;
    "Screen Record") screenRecord ;;
    "Colour Picker") colourPicker ;;
    "Theme Palette") themePalette ;;
    *) exit 1 ;;
esac
