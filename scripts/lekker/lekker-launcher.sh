#! /usr/bin/env bash
# launcher menu wrapper script

MAX_ROWS=14
display_columns=1
lines=1
prompt=""
placeholder=""
help_message="Usage: lekker-launcher [options]
\nOptions:
  -h,--help\t\t\t Display this help message

  -l,--lines [integer]\t\t Number of rows to display in rofi
  -p,--prompt [string]\t\t Prompt text for the menu
  -P,--placeholder [string]\t Entry box placeholder text
"

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -display-columns) display_columns="$2" && shift 2;;
        -l|--lines) lines="$2" && shift 2;;
        -p|--prompt) prompt="$2" && shift 2;;
        -P|--placeholder) placeholder="$2" && shift 2;;
        -h|--help) echo -e "$help_message" && exit 0;;
        *) echo "lekker-launcher: invalid option: $1" && echo -e "$help_message" && exit 1;;
    esac
done

[ "$lines" -lt 1 ] && lines=1
[ "$lines" -gt "$MAX_ROWS" ] && lines="$MAX_ROWS"

rofi -dmenu -i -window-title "lekker-menu" -l "$lines" -p "$prompt" -theme-str "#entry { placeholder: \"$placeholder\"; }" -display-columns "$display_columns"
