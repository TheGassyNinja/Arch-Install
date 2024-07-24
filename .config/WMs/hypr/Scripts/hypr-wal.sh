#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       

#!/bin/bash
wallpaper_dir="$HOME/Wallpapers"

wallpapers=$(find "$wallpaper_dir" -type f -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif")

selected_wallpaper=$(echo "$wallpapers" | wofi --dmenu --prompt="Select a wallpaper: ")

if pgrep -x "swaybg" > /dev/null; then
    pkill -x swaybg
fi

swaybg -i "$selected_wallpaper" &
wal -i "$selected_wallpaper" -n -q &

