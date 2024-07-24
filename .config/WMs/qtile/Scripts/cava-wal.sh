#!/bin/bash
set -x

cava_config="$HOME/.config/cava/config"
dunst_config="$HOME/.config/dunst/dunstrc"

# Get the bacground and foreground colors from wal
background=$(sed -n '1p' "$HOME/.cache/wal/colors")
foreground=$(sed -n '3p' "$HOME/.cache/wal/colors")
frame=$(sed -n '2p' "$HOME/.cache/wal/colors")

# Replace the background and foreground colors in the cava config file
sed -i "s/background = .*/background = '$background'/g" "$cava_config"
sed -i "s/foreground = .*/foreground = '$foreground'/g" "$cava_config"

# Replace the background and foreground colors in the dunst config file
sed -i "s/background = .*/background = \"$background\"/g" "$dunst_config"
sed -i "s/foreground = .*/foreground = \"$foreground\"/g" "$dunst_config"
sed -i "s/frame_color = .*/frame_color = \"$frame\"/g" "$dunst_config"
pkill dunst
sleep 0.25
notify-send "Dunst" "Config reloaded"
