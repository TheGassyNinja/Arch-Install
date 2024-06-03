#!/bin/sh
# _____ _           ____                     _   _ _        _       
#|_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#  | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#  | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#  |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                      |___/             |__/       
#  Spawned: Mon Jan 23 2023 - 14:28
#  Last Mod: Wed Feb 08 2023 - 13:44
#  Script:
#  Depends:
#  Note: Run for cron access to Dbus
#  
#


touch $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

exit 0

# Add to script
##export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus export DISPLAY=:0;
#if [ -r "$HOME/.dbus/Xdbus" ]; then
#  . "$HOME/.dbus/Xdbus"
#fi
#
#notify-send "testing"
