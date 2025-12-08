#! /usr/bin/env bash
# calculate menu height based on
# the number of elements in an array

MENU_LINE_HEIGHT=45;
MENU_MAX_LINES=10;

array=("$@");
if [[ "${#array[@]}" -gt "$MENU_MAX_LINES" ]]; then
    height=$(( "$MENU_MAX_LINES" * "$MENU_LINE_HEIGHT" ))
else
    height=$(( "${#array[@]}" * "$MENU_LINE_HEIGHT" ))
fi
echo "$height"
