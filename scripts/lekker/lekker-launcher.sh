#! /usr/bin/env bash
# launcher menu wrapper script

# defaults
MAX_ROWS=14
display_columns=1
lines=1
prompt=""
placeholder=""
width=400

help_message="Usage: lekker-launcher [options]
\nOptions:
  -h,--help\t\t\t Display this help message

  -l,--lines [integer]\t\t Number of rows to display in rofi
  -p,--prompt [string]\t\t Prompt text for the menu
  -P,--placeholder [string]\t Entry box placeholder text
  -password \t Replace characters with \"*\"
  -w,--width [int]\t\t Width of menu
"

# parse args
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -display-columns) display_columns="$2" && shift 2 ;;
        -l|--lines) lines="$2" && shift 2 ;;
        -p|--prompt) prompt="$2" && shift 2 ;;
        -P|--placeholder) placeholder="$2" && shift 2 ;;
        -password) password="-password" && shift 1 ;;
        -w|--width) width="$2" && shift 2 ;;
        -h|--help) echo -e "$help_message" && exit 0 ;;
        *) echo "lekker-launcher: invalid option: $1" && echo -e "$help_message" && exit 1 ;;
    esac
done

# calc rows to display
[ "$lines" -lt 1 ] && lines=1
[ "$lines" -gt "$MAX_ROWS" ] && lines="$MAX_ROWS"

# launch menu
rofi -dmenu -i \
  -window-title "lekker-menu" \
  -l "$lines" \
  -p "$prompt" \
  -theme-str "#entry { placeholder: \"$placeholder\"; } window { width: $width; }" \
  -display-columns "$display_columns" \
  "$password"
