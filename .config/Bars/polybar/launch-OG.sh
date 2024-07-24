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
#!/usr/bin/env sh

CONF="$HOME/.config/polybar/Poly-OG/config.ini"


    killall -q polybar
        wait 2
while pgrep -x polybar >/dev/null; do sleep 1; done
	polybar -c $CONF first & \
    polybar -c $CONF second & \
    polybar -c $CONF Volume & \
    polybar -c $CONF Mpris &
        echo "done"
