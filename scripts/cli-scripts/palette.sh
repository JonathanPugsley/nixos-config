#!/usr/bin/env bash
# Select a colour from the current Stylix palette and copy it to the clipboard.

PALETTE_FILE="$HOME/.config/stylix/palette.json"

notify_msg() {
    local message=$1
    notify-send -a "lekker" "Lekker Palette" "$message"
}

colour_block() {
    local hex=${1#\#}   # remove leading '#'

    # validate hex format
    [[ $hex =~ ^[0-9A-Fa-f]{6}$ ]] || return 1

    local r=$((16#${hex:0:2}))
    local g=$((16#${hex:2:2}))
    local b=$((16#${hex:4:2}))

    printf "\e[48;2;%d;%d;%dm  \e[0m" "$r" "$g" "$b"
}

if [ ! -f "$PALETTE_FILE" ]; then
    notify_msg "Palette file '$PALETTE_FILE' not found"
    exit 1
fi

echo "=== Theme Information ==="
echo
echo "Scheme : $(jq -r '.scheme' "$PALETTE_FILE")"
echo "Author : $(jq -r '.author' "$PALETTE_FILE")"
echo

# fetch colour scheme
entries=()
while read -r base; do
    hex=$(jq -r --arg k "$base" '.[$k]' "$PALETTE_FILE")
    entries+=("$(printf "%-7s #%-8s %s" "$base" "$hex" "$(colour_block "$hex")")")
done < <(jq -r 'keys[]' "$PALETTE_FILE" | grep '^base')

# select colour
selected_colour=$(printf '%s\n' "${entries[@]}" |
    gum choose --header "Select Colour:" --no-strip-ansi --height="16"
)
[ -z "$selected_colour" ] && exit 0
base=$(awk '{print $1}' <<< "$selected_colour")
hex=$(awk '{print $2}' <<< "$selected_colour")

# select format
selected_format=$(printf '%s\n' "base code : $base" "hex code  : $hex" |
    gum choose --header "Select Format: $(colour_block "$hex")" --no-strip-ansi
)
[ -z "$selected_format" ] && exit 0
[[ "$selected_format" == base* ]] && result="$base"
[[ "$selected_format" == hex* ]] && result="$hex"

printf '%s' "$result" | wl-copy
notify_msg "Copied $result to clipboard"
