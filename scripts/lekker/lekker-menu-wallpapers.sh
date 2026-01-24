#! /usr/bin/env bash
# wallpaper switching script

CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
WALLPAPER_PATH="$HOME/Pictures/wallpapers"

# find available wallpaper themes
readarray -t schemes < <(
  find "$WALLPAPER_PATH" \
    -mindepth 1 -maxdepth 1 \
    -type d \
    ! -name '.*' \
    -printf '%f\n' \
  | sort
)
[[ "${#schemes[@]}" -eq 0 ]] && schemes=( "No Wallpaper Schemes Found" )
selected_scheme=$( printf "%s\n" "${schemes[@]}" | lekker-launcher -l "${#schemes[@]}" -p "Theme" ) || exit 0
[[ "$selected_scheme" == "No Wallpaper Schemes Found" ]] && exit 0

# find available wallpapers
readarray -t wallpapers < <(
  find "$WALLPAPER_PATH/$selected_scheme" \
    -type f \
    \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) \
    ! -name '.*' \
    -printf '%f\n' \
  | sort
)
[[ "${#wallpapers[@]}" -eq 0 ]] && wallpapers=( "No Wallpapers Found" )
selected_wallpaper=$( printf "%s\n" "${wallpapers[@]}" | lekker-launcher -l "${#wallpapers[@]}" -p "󰈟 " -P "New wallpaper..." ) || exit 0
[[ "$selected_wallpaper" == "No Wallpapers Found" ]] && exit 0
selected_wallpaper="$WALLPAPER_PATH/$selected_scheme/$selected_wallpaper"
sed -i "s|^\(preload=\).*|\1$selected_wallpaper|" "$CONFIG_FILE"
sed -i "s|^\(wallpaper=\).*|\1,$selected_wallpaper|" "$CONFIG_FILE"

pkill hyprpaper
systemctl --user start hyprpaper
