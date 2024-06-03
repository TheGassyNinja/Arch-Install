#!/bin/bash


if pgrep -x "waybar" > /dev/null
then
    pkill waybar
else
    waybar &
fi

notify-send "Waybar Toggled"
