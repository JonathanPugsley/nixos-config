#! /usr/bin/env bash
# wofi power menu

POWER_OPTIONS=(Suspend Reboot Shutdown Logout Lock Screen)

OPTION=$(echo "${POWER_OPTIONS[@]}" | tr ' ' '\n' | wofi --dmenu --prompt="Power Menu")
if [ -z "$OPTION" ]; then
    echo "No option selected, exiting..."
    exit 1
fi

CONFIRM=$(printf "Yes, $OPTION\nCancel" | wofi --dmenu --prompt="Confirm")
if [[ -z "$CONFIRM" || "$CONFIRM" == "Cancel" ]]; then
    echo "Not confirmed, exiting..."
    exit 1
fi

echo "you selected: $CHOICE, $CONFIRM"
