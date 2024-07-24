#!/bin/bash
# wal-theme-select.sh
# A script to select a theme from a directory of themes using rofi
# and apply it using pywal
# Prompt the user to select a theme using rofi
selected_theme=$(echo -e "Dark Themes\nLight Themes\nRandom" | rofi -dmenu -p "Select a theme")

# Check the selected theme and apply it using pywal
case $selected_theme in
    "Dark Themes")
        # Code to apply dark theme using pywal
        directory="$HOME/.config/wal/colorschemes/dark"
        command="wal --theme"
        ;;
    "Light Themes")
        # Code to apply light theme using pywal
        directory="$HOME/.config/wal/colorschemes/light"
        command="wal -l --theme"
        ;;
    "Random")
        # Code to apply a random theme using pywal
        ;;
    *)
        echo "Invalid theme selection"
        ;;
esac
# Use rofi to list the .json themes in $directory (strip the .json when listing)
theme_files=$(ls $directory/*.json | xargs -n1 basename | sed 's/\.json$//')

# Prompt the user to select a theme using rofi
selected_theme=$(echo "$theme_files" | rofi -dmenu -p "Select a theme")

# Check if the selected theme is empty
if [ -z "$selected_theme" ]; then
    echo "No theme selected"
    exit 1
fi

# Apply the selected theme using pywal
theme_path="$directory/$selected_theme.json"
# Code to apply the theme using pywal

echo "Selected Directory: $directory" && echo "Selected Theme: $selected_theme" && echo "Theme Path: $theme_path"

$command $selected_theme && qtile cmd-obj -o root -f reload_config && $command $selected_theme


$HOME/.config/qtile/Scripts/cava-wal.sh


