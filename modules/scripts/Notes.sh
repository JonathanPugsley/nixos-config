#! /usr/bin/env bash
# notes menu

NOTES_DIR="$HOME/notes"
PROMPT=" Create New Note"

# extract note files
readarray -t NOTES_FILES < <(
    find "$NOTES_DIR" -type f -printf '%T@ %P\n' \
    | sort -nr \
    | cut -d' ' -f2- \
    | sed 's/\.[^.]*$//'
)

LINES=$(( 12 < ${#NOTES_FILES[@]} ? 12 : ${#NOTES_FILES[@]} ))
[[ "${#NOTES_FILES[@]}" -eq 0 ]] && LINES=1

SELECTED_NOTE=$( printf "%s\n" "${NOTES_FILES[@]}" | wofi -d -L "$LINES" --prompt="$PROMPT" ) || exit 0
[[ -z "$SELECTED_NOTE" ]] && exit 1

setsid -f alacritty -e zsh -c " cd \"$NOTES_DIR\" && nvim \"$SELECTED_NOTE.md\" " > /dev/null 2>&1
