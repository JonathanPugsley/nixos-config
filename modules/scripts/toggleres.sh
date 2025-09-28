#! /usr/bin/env bash

CONF_DIR="/home/jonny/.config/hypr/hyprland.conf"
MONITOR="DP-3"
RESOLUTION1=2560x1440
RESOLUTION2=3440x1440

CURRENT_RESOLUTION=$(grep "^monitor=$MONITOR" "$CONF_DIR" | cut -d ',' -f2 | cut -d '@' -f1)
echo "$CURRENT_RESOLUTION"
echo "Res1: $RESOLUTION1"
echo "Res2: $RESOLUTION2"

if [ $CURRENT_RESOLUTION == $RESOLUTION1 ]; then
  sed -i "s/$RESOLUTION1/$RESOLUTION2/" $CONF_DIR
  echo "Switched resolution to $RESOLUTION2 for monitor $MONITOR"
else
  sed -i "s/$RESOLUTION2/$RESOLUTION1/" $CONF_DIR
  echo "Switched resolution to $RESOLUTION1 for monitor $MONITOR"
fi


