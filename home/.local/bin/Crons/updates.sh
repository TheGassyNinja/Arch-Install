#!/bin/bash
# Get Pacman updates and AUR updates package count in a grepable format
# and save it to a file
echo "Pacman: $(checkupdates | wc -l)" > ~/.local/tmp/updates.txt
echo "Last updated: $(date +'%T %m/%d')" >> ~/.local/tmp/updates.txt