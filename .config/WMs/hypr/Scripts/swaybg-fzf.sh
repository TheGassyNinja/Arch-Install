#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Sun Oct 29 2023 - 18:41
#  Last Mod: Thu Jan 11 2024 - 19:00
#  Config:
#  Depends:
#  Note:
#
#!/bin/bash

# Wallpaper directory
wallpaper_dir="$HOME/Wallpapers"


# Retrieve list of wallpapers
wallpapers=$(find "$wallpaper_dir" -type f -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif")

# Use FZF to select a wallpaper
selected_wallpaper=$(echo "$wallpapers" | fzf --prompt="Select a wallpaper: ")

# Set the selected wallpaper using feh
killall swaybg && swaybg -i "$selected_wallpaper" &

