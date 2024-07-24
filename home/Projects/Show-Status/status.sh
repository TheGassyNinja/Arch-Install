#!/bin/bash
#gather info from ~/.local/tmp/inxi.txt 
# and echo it to terminal 
# inxi -Fxxxz > ~/.local/tmp/inxi.txt
# chmod +x ~/.local/bin/status.sh

inxi -Fxxxz > ~/.local/tmp/inxi.txt

source "${HOME}/.cache/wal/colors.sh"

data="$HOME/.local/tmp/inxi.txt"
current_artist=$(playerctl --player spotify_player metadata artist)
current_track=$(playerctl --player spotify_player metadata title)
current_art=$(playerctl --player spotify_player metadata | grep 'artUrl' | awk '{print $3}')
wget -q -O ~/.local/tmp/current-cover.jpg $current_art
cover="$HOME/.local/tmp/current-cover.jpg"
magick $cover -resize 200x200 $cover



hex_to_rgb() {
    local hex="$1"
    echo "$((16#${hex:1:2})) $((16#${hex:3:2})) $((16#${hex:5:2}))"
}

# Function to create ANSI escape codes from RGB values
rgb_to_ansi() {
    local r="$1"
    local g="$2"
    local b="$3"
    echo -e "\033[38;2;${r};${g};${b}m"
}

cl() {
    echo -ne "\033[1A"
    echo -ne "\r\033[K"
}

C1=$(rgb_to_ansi $(hex_to_rgb $color1))
C2=$(rgb_to_ansi $(hex_to_rgb $color2))
C3=$(rgb_to_ansi $(hex_to_rgb $color3))
C4=$(rgb_to_ansi $(hex_to_rgb $color4))
C5=$(rgb_to_ansi $(hex_to_rgb $color5))
C6=$(rgb_to_ansi $(hex_to_rgb $color6))
C7=$(rgb_to_ansi $(hex_to_rgb $color7))
C8=$(rgb_to_ansi $(hex_to_rgb $color8))

# Reset color
NC="\033[0m"
BLD="\033[1m"

clear
kitty +kitten icat --align left --place 20x20@16x1 "$cover"
echo -e "\033[10B"
echo -e "${C3}${BLD}           ┌─┤ ${C2} ${current_artist}${NC}"
echo -e "${C8}${BLD}        ${C3}  │"
echo -e "${C3}${BLD}           └────┤ ${C2} ${current_track}${NC}"

if [ -f $data ]; then
echo -e "\n\n"
echo -e "${BLD}${C2}            Machine:${NC}\n"
echo -e "${BLD}${C3}       System:${C7} $(grep -oP 'System: \K.*' $data | awk '{print $3 " " $4 " " $5}')   ${C3}Charge: ${C2}$(grep 'condition:' $data | awk '{print $6}')"
echo -e "${BLD}${C3}         CPU: ${C5}$(grep  'smt:' $data | awk '{print $5 " " $6 " " $7}')"
echo -e "${BLD}${C3}           Memory: ${C6}$(grep -oP 'Memory: \K.*' $data | awk '{print $2 " " $6 " " $10}')   ${C3}Processes: ${C7}$(grep -oP 'Processes: \K.*' $data | awk '{print $1}')"
echo -e "${BLD}${C3}             Storage: ${C1}$(grep -oP 'Local Storage: \K.*' $data | awk '{print $2 " " $3 " - Used: " $5 " " $6}') ${C2}$(grep -oP 'Local Storage: \K.*' $data | awk '{print $7}')"



echo -e "\n"
echo -e -n "       ${BLD}${C2} System Info:${NC}"
#echo -e -n "       ${BLD}${C2} System Info:${NC}" | fold -w1 | while IFS= read -r letter; do
#    echo -e -n "$letter"
#    sleep 0.05 
#done

echo -e "\n"
echo -e "${C3}${BLD}    ┌─┤${NC}"
echo -e "${C3}${BLD}    │${C1}    ───────  ${C1}${BLD} Distro:  ${NC} ${BLD}${C7}$(grep -oP 'Distro: \K.*' $data)${NC} ($(grep -oP 'Kernel: \K.*' $data | awk '{print $5}'))"
echo -e "${C3}${BLD}    │${C2}       ───────  ${C1}${BLD} Kernel: ${NC} ${BLD}${C4}$(grep -oP 'Kernel: \K.*' $data | awk '{print $1}')"
echo -e "${C3}${BLD}    │${C3}           ──────  ${C1}${BLD}Shell:${NC}    ${BLD}${C7}$(grep -oP 'Shell: \K.*' $data | awk '{print $2 " " $3}')"
echo -e "${C3}${BLD}    │${C4}               ─────  ${C1}${BLD} Packages:${NC} ${BLD}${C4}$(grep -oP 'pkgs: \K.*' $data | awk '{print $1}')"
echo -e "${C3}${BLD}    └────┤${NC}"

echo -e "\n\n"
echo -e "                ${BLD}${C1}󰚍 ${C2}󰚍 ${C3}󰚍 ${C4}󰚍 ${C5}󰚍 ${C6}󰚍 ${C7}󰚍 ${C8}󰚍 ${NC}"
echo -e "\n\n\n\n"
fi
