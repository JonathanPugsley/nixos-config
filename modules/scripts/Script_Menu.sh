#! /usr/bin/env bash
# wofi scripts menu

SCRIPT_DIR="$HOME/dev/nixos-config/modules/scripts"

mapfile -t AVAILABLE_SCRIPTS < <(
    find "$SCRIPT_DIR" -type f -executable -printf "%f\n" \
    | sort -d \
    | cut -d'.' -f1
)

SEL=$( printf "%s\n" ${AVAILABLE_SCRIPTS[@]} | wofi -dj -L ${#AVAILABLE_SCRIPTS[@]} ) || exit 0
$SEL || exit 1
exit 0
