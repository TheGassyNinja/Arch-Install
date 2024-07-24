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

CONF="$HOME/.config/polybar/T-1/config.ini"


    killall -q polybar
        sleep 2
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
    polybar -c $CONF l-1 & 
    echo $! > /tmp/polybar-l-1.pid
    sleep 0.25
    polybar -c $CONF l-2 &
    echo $! > /tmp/polybar-l-2.pid
    sleep 0.25
    polybar -c $CONF l-3 & 
    echo $! > /tmp/polybar-l-3.pid
    sleep 0.25
    polybar -c $CONF l-4 &
    echo $! > /tmp/polybar-l-4.pid
    sleep 0.25
    polybar -c $CONF center & 
    echo $! > /tmp/polybar-center.pid
    sleep 0.25
    polybar -c $CONF r-1 &
    echo $! > /tmp/polybar-r-1.pid  
    sleep 0.25
    polybar -c $CONF r-2 & 
    echo $! > /tmp/polybar-r-2.pid
    sleep 0.25
    polybar -c $CONF r-3 &
    echo $! > /tmp/polybar-r-3.pid
    sleep 0.25
    polybar -c $CONF r-4 & 
    echo $! > /tmp/polybar-r-4.pid
    polybar -c $CONF bottom &
    echo $! > /tmp/polybar-bottom.pid
sleep 3
$HOME/.config/polybar/T-1/extras-toggle.sh