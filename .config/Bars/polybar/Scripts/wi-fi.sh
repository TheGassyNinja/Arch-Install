#!/bin/bash

# Wi-Fi connection script
# Connect to a Wi-Fi network using nmcli
# Dependencies: nmcli, wofi

interface="wlo1"

# Check for Wi-Fi connection and offer to disconnect
if nmcli device show | grep -q 'GENERAL.STATE: 100 (connected)'; then
    # Prompt the user to disconnect
    if wofi --show dmenu --prompt "Disconnect from Wi-Fi?" --yes "Yes" --no "No"; then
       sudo nmcli dev disconnect $interface
    else
        exit 1
    fi
fi


# List available Wi-Fi networks
networks=$(nmcli device wifi list | awk 'NR>1 {print $2}')

# Prompt the user to select a network
selected_network=$(echo "$networks" | wofi --dmenu)

# Check if a network was selected
if [[ -n "$selected_network" ]]; then
    # Prompt the user for the Wi-Fi password
PASSWORD=$(echo -e "" | wofi --dmenu --password --prompt "Enter Password")

# Check if password is entered
if [ -z "$PASSWORD" ]; then
    echo "No password entered. Exiting."
    exit 1
fi

    # Connect to the selected network
    nmcli dev wifi connect "$selected_network" password "$PASSWORD"
else
    echo "No network selected."
fi