# Waybar Toggle
# This script toggles the visibility of the Waybar panel.

# Check is Waybar is running and toggle it accordingly
if pgrep -x "waybar" > /dev/null
then
    pkill waybar
else
    waybar &
fi
# Notfiy the user of the change
notify-send "Waybar Toggled"
