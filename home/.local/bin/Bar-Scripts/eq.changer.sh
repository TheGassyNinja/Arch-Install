#!/bin/bash

# Change the equalizer preset of easyeffects using wofi

list=$(ls ~/.config/easyeffects/output/ | sed 's/.json//g')
# selected_preset=$(echo "$list" | rofi -dmenu -i -p "Select a preset" -width 300 -lines 10)
selected_preset=$(echo "$list" | wofi --dmenu --insensitive --width 300 --lines 10 --prompt "Select a preset")

if [[ -z "$selected_preset" ]]; then
    exit 0
fi

# Set the selected preset in easyeffects
easyeffects --load-preset "$selected_preset"

echo "Current: $selected_preset" > ~/.local/tmp/eq-preset.txt
notify-send "Preset: $selected_preset"
 