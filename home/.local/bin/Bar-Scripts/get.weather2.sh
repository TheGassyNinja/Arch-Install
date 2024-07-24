#!/bin/bash

# DESC: Get the current conditions from the weather file

# Path to the file containing the weather information
file_path="$HOME/.local/tmp/weather.txt"
touch $HOME/.local/tmp/weather-icons.txt

# Read the content of the file
text=$(cat "$file_path")

# Extract the conditions using grep and awk
conditions=$(echo "$text" | grep -oP 'Conditions: \K.*')

# Determine the icon based on the conditions
if [[ $conditions == "clear sky" ]]; then
    icon="󰖙"
elif [[ $conditions == "scattered clouds" ]]; then
    icon="󰖐"
elif [[ $conditions == "broken clouds" ]]; then
    icon="󰖐"
elif [[ $conditions == "few clouds" ]]; then
    icon="󰖑"
elif [[ $conditions == "overcast clouds" ]]; then
    icon=""
elif [[ $conditions == "light rain" ]]; then
    icon=""
elif [[ $conditions == "moderate rain" ]]; then
    icon=""
elif [[ $conditions == "thunderstorm" ]]; then
    icon=""
else
    icon="❓"
    echo "$conditions" >> $HOME/.local/tmp/weather-icons.txt
    notify-send -u critical "Unknown weather condition" "$conditions"
fi

# Output the icon

# Output the conditions
# echo "$icon  $conditions"
echo "$icon"