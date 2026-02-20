#! /usr/bin/env bash
# display the colours in the currently selected theme

PALETTE_FILE="$HOME/.config/stylix/palette.json"

notify_msg() {
    local message=$1
    notify-send -a "lekker" "Lekker Show Palette" "$message"
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
echo "=== Base Colors ==="
echo

for key in $(jq -r 'keys[]' "$PALETTE_FILE" | grep '^base'); do
    value=$(jq -r --arg k "$key" '.[$k]' "$PALETTE_FILE")
    printf "%-7s #%-8s " "$key" "$value"

    # Print color preview block (truecolor terminals)
    printf "\e[48;2;%d;%d;%dm  \e[0m" \
        $((16#${value:0:2})) \
        $((16#${value:2:2})) \
        $((16#${value:4:2}))
    echo
done
echo
