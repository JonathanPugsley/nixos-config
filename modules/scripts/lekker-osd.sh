#! /usr/bin/env bash
# on screen display for lekker

makoctl dismiss -g
notify-send -a lekker-osd "$1" "$2"
