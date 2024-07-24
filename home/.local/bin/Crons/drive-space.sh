#!/bin/bash

output="$HOME/.local/tmp/drive-space.txt"
# This script is used to check the disk space of the mounted drives
# and send a notification if the disk space is below a certain threshold.

# Get the disk space of the / partition
disk_space=$(df -h / | awk 'NR==2 {print $4}')
# Define the threshold for disk space
threshold="250G"

# Compare the disk space with the threshold
if [[ $disk_space < $threshold ]]; then
    echo "Disk space is below the threshold. Sending notification..."
    echo "$disk_space" | notify-send "Disk space is below the threshold. $disk_space left."
    # Add your notification logic here
else
    echo "Disk space is above the threshold."
    echo "$disk_space"
fi



# Get the disk space of the / partition
disk_space=$(df -h | grep "home" | awk '{print $4}')
# Define the threshold for disk space
threshold="950G"

# Compare the disk space with the threshold
if [[ $disk_space < $threshold ]]; then
    echo "Disk space is below the threshold. Sending notification..."
    echo "$disk_space" | notify-send "Disk space is below the threshold. $disk_space left."
    # Add your notification logic here
else
    echo "Disk space is above the threshold."
    echo "$disk_space"
fi

echo -e "Root: $(df -h / | sed -n '2p')" > $output
echo -e "Mnt(s): $(df -h | grep "home")" >> $output