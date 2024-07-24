#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Thu Jan 19 2023 - 04:27
#  Last Mod: Wed Feb 01 2023 - 02:49
#  Config: Polybar (Launcher)
#  Depends:
#  Note:
#
	## polybar -c $CONF (call bar) & \

#!/usr/bin/env sh
#    echo $! > /tmp/polybar-l-2.pid
#    echo $! > /tmp/polybar-l-4.pid
#    echo $! > /tmp/polybar-r-1.pid  
#    echo $! > /tmp/polybar-r-3.pid
# Get the PIDs from the files
pid_l_2=$(cat /tmp/polybar-l-2.pid)
pid_l_4=$(cat /tmp/polybar-l-4.pid)
pid_r_1=$(cat /tmp/polybar-r-1.pid)
pid_r_3=$(cat /tmp/polybar-r-3.pid)

# Use poly-msg to toggle/show/hide the polybar instances
polybar-msg -p $pid_l_2 cmd toggle
polybar-msg -p $pid_l_4 cmd toggle
polybar-msg -p $pid_r_1 cmd toggle
polybar-msg -p $pid_r_3 cmd toggle

