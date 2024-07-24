#!/bin/bash

# Get the current RAM usage percentage
ram_usage=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')

# Check if RAM usage is greater than or equal to 99%
if (( $(echo "$ram_usage >= 98" | bc -l) )); then
    # Kill Firefox process
    pkill firefox && notify-send -u critical "Firefox killed due to high RAM usage"
fi