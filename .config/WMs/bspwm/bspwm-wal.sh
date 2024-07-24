#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       

#!/bin/bash
set -x

wallpaper_dir="$HOME/Wallpapers"

wallpapers=$(find "$wallpaper_dir" -type f -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" | xargs -I{} basename {})


selected_wallpaper=$(echo "$wallpapers" | rofi -dmenu -p "Select a wallpaper: ")


wal -i "$wallpaper_dir/$selected_wallpaper" -n -q &
feh --bg-scale "$wallpaper_dir/$selected_wallpaper" &

