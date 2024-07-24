#!/bin/bash

# DESC: Get the current temperature from the weather file

# Path to the file containing the weather information
file_path="$HOME/.local/tmp/weather.txt"

# Read the content of the file
text=$(cat "$file_path")

# Extract the temperature using grep and awk
temperature=$(echo "$text" | grep -oP 'Temperature: \K[0-9]+')

# Output the temperature
echo $temperature
