#! /usr/bin/env bash
# notes menu

NOTES_DIR="$HOME/notes"

# extract note files
mapfile -t NOTES_FILES < <(
    find "$NOTES_DIR" -type f -printf '%T@ %P\n' \
    | sort -nr \
    | cut -d' ' -f2- \
    | sed 's/\.[^.]*$//'
)

NOTES_FILES="${NOTES_FILES:- Create New}"
LINES=$(( 12 < ${#NOTES_FILES[@]} ? 12 : ${#NOTES_FILES[@]} ))

SELECTED_NOTE=$(printf "%s\n" "${NOTES_FILES[@]}" | wofi -d -L $LINES) || exit 0
if [[ "$SELECTED_NOTE" == " Create New" ]]; then
    SELECTED_NOTE="untitled"
fi

# setsid -f alacritty -e cd "$NOTES_DIR" && nvim "$SELECTED_NOTE" >/dev/null 2>&1
setsid -f alacritty -e zsh -c "cd \"$NOTES_DIR\" && nvim \"$SELECTED_NOTE.md\"">/dev/null 2>&1
