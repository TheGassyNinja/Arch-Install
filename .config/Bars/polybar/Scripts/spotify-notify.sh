#!/bin/bash
current_track=$(playerctl metadata title)
notify-send "$current_track"