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

CONF="$HOME/.config/polybar/T-2/config.ini"


    killall -q polybar
        sleep 2
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
    polybar -c $CONF full &
exit 0 