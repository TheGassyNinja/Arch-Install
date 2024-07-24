#!/bin/bash
current_artist=$(playerctl --player spotify_player metadata artist)
current_track=$(playerctl --player spotify_player metadata title)
current_art=$(playerctl --player spotify_player metadata | grep 'artUrl' | awk '{print $3}')

# wget -q -O ~/.local/tmp/current-cover.jpg $current_art
cover="$HOME/.local/tmp/current-cover.jpg"
# magick $cover -resize 100x100 $cover

clear
kitty +kitten icat --place 12x12@0x0 "$cover"
echo -e "\033[6B"
echo -e "${C3}${BLD} ┌─┤  ${current_artist}${NC}"
echo -e "${C3}${BLD} │"
echo -e "${C3}${BLD} └────┤  ${current_track}${NC}"