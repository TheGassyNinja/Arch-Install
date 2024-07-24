#!/bin/bash

# Wi-Fi connection script
# Connect to a Wi-Fi network using nmcli
# Dependencies: nmcli, wofi

interface="wlo1"
networks=$(nmcli device wifi list | awk 'NR>1 {print $2}')
selected_network=$(echo "$networks" | wofi --dmenu)

if [[ -n "$selected_network" ]]; then
    # Prompt the user for the Wi-Fi password
PASSWORD=$(echo -e "" | wofi --dmenu --password --prompt "Enter Password")

if [ -z "$PASSWORD" ]; then
    echo "No password entered. Exiting."
    exit 1
fi
    nmcli dev wifi connect "$selected_network" password "$PASSWORD" && notify-send "Connected to $selected_network"
else
    echo "No network selected."
fi