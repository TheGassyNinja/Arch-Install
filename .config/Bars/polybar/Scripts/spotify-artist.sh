#!/bin/bash

# Get the current artist and track from Spotify
current_artist=$(playerctl metadata artist)

# Check if there is no artist output or output is "No Player ..."
if [[ -z "$current_artist" || "$current_artist" == "No playe*" ]]; then
    echo "Nada Tostada"
    else 
    echo -e "$current_artist"
fi


# Print the current artist and track
# Print the current artist and track with scrolling
#echo "$current_track"