#! /usr/bin/env bash
# launch floating window

# default width and height factor
WIDTH_FACTOR=0.5
HEIGHT_FACTOR=0.7

HELP_MESSAGE="Usage: lekker-launch-floating-window [command] [options]
\nCommand:
  Enter a command to run inside of the launched terminal window.
\nOptions:
  -h,--help\t\t\t Display this help message

  -w,--width-factor [float]\t\t Factor of the screen width to set the window width to
  -W,--width [float]\t\t\t Width in pixels to set the window width to
  -h,--height-factor [float]\t\t Factor of the screen height to set the window height to
  -H,--height [float]\t\t\t Height in pixels to set the window height to
"

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  echo -e "$HELP_MESSAGE"
  exit 0
fi
[[ "$#" -eq 0 ]] && echo "lekker-launch-floating-window: not enough arguments." && exit 1
[[ "$1" == -* ]] && echo -e "lekker-launch-floating-window: command not recognised: $1" && exit 1

COMMAND=$1 && shift 1

# fetch screen resolution, and calculate default window size
readarray -t RESOLUTION < <( hyprctl monitors -j | jq -r '.[0].width, .[0].height, .[0].scale' )
WINDOW_WIDTH=$(awk "BEGIN {print ${RESOLUTION[0]} * ( $WIDTH_FACTOR / ${RESOLUTION[2]} )}")
WINDOW_HEIGHT=$(awk "BEGIN {print ${RESOLUTION[1]} * ( $HEIGHT_FACTOR / ${RESOLUTION[2]} )}")

echo "$WINDOW_WIDTH"
echo "$WINDOW_HEIGHT"

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -w|--width-factor) WINDOW_WIDTH=$(awk "BEGIN {print ${RESOLUTION[0]} * $2}") && shift 2;;
        -W|--width) WINDOW_WIDTH="$2" && shift 2;;
        -h|--height-factor) WINDOW_HEIGHT=$(awk "BEGIN {print ${RESOLUTION[1]} * $2}") && shift 2;;
        -H|--height) WINDOW_HEIGHT="$2" && shift 2;;
        *) echo "lekker-launch-floating-window: invalid option: $1" && echo -e "$HELP_MESSAGE" && exit 1;;
    esac
done

hyprctl dispatch exec "[float; center; size $WINDOW_WIDTH $WINDOW_HEIGHT]" "$COMMAND" > /dev/null 2>&1
