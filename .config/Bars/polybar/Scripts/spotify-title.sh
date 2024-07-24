#!/bin/bash

current_track=$(playerctl metadata title)

echo -e "$current_track"