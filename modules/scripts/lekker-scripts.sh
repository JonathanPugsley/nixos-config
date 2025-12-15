#! /usr/bin/env bash
# scripts menu

SCRIPT_DIR="$HOME/dev/nixos-config/modules/scripts"

readarray -t available_scripts < <(
    find "$SCRIPT_DIR" -type f -executable -printf "%f\n" \
    | sort -d \
    | cut -d'.' -f1
)

SEL=$( printf "%s\n" "${available_scripts[@]}" | lekker-launcher "${#available_scripts[@]}" "Scripts" ) || exit 0
"$SEL" || exit 1
