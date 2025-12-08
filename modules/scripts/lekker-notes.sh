#! /usr/bin/env bash
# notes menu

NOTES_DIR="$HOME/notes"
PROMPT=" New Note"
EMPTY_TEXT="No Notes Found"

# extract note files
readarray -t notes_files < <(
    find "$NOTES_DIR" -type f -printf '%T@ %P\n' \
    | sort -nr \
    | cut -d' ' -f2- \
    | sed 's/\.[^.]*$//'
)

# no notes
[[ "${#notes_files[@]}" -eq 0 ]] && notes_files=( "$EMPTY_TEXT" )

# note selection
menu_height=$( lekker-menu-height "${notes_files[@]}" )
selected_note=$( printf "%s\n" "${notes_files[@]}" | wofi -d -H "$menu_height" -p "$PROMPT" ) || exit 0
[[ -z "$selected_note" ]] && exit 1
[[ "$selected_note" == "$EMPTY_TEXT" ]] && selected_note="untitled_note"

setsid -f alacritty -e zsh -c " cd \"$NOTES_DIR\" && nvim \"$selected_note.md\" " > /dev/null 2>&1
