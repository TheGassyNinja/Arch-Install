#!/bin/bash
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi
# Initialize variable to store previous volume level
prev_volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}')

# Function to monitor volume changes
monitor_volume() {
    while true; do
        # Get current volume level
        current_volume=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}')
        
        # Compare current volume with previous volume
        if [ "$current_volume" != "$prev_volume" ]; then
            # Display notification using notify-send
            notify-send "Volume changed" "New volume: $current_volume"
            
            # Update previous volume
            prev_volume="$current_volume"
        fi
        
        # Sleep for 1 second before checking again
        sleep 1
    done
}

# Call monitor_volume function
monitor_volume

