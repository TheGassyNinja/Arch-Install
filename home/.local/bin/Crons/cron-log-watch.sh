#!/bin/bash


inotifywait -m -e modify ~/.local/cronlog.txt |
while read -r directory event filename; do
    notify-send -u critical "Cron Log File modified"
done