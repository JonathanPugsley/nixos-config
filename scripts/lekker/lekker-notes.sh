#! /usr/bin/env bash
# notes menu

NOTES_DIR="$HOME/notes"

# extract note files
readarray -t notes_files < <(
    find "$NOTES_DIR" -type f -printf '%T@ %P\n' \
    | sort -nr \
    | cut -d' ' -f2- \
    | sed 's/\.[^.]*$//'
)

# no notes
[[ "${#notes_files[@]}" -eq 0 ]] && notes_files=( "No Notes Found" )

# note selection
selected_note=$( printf "%s\n" "${notes_files[@]}" | lekker-launcher -l "${#notes_files[@]}" -p " " -P "New Note..." ) || exit 0
[[ -z "$selected_note" ]] && exit 1
[[ "$selected_note" == "No Notes Found" ]] && selected_note="untitled_note"

COMMAND="xdg-terminal-exec -e $SHELL -c 'cd \"$NOTES_DIR\" && nvim \"$selected_note.md\"'"
lekker-launch-floating-window "$COMMAND" -W 980
