#!/usr/bin/env sh
# _____ _           ____                     _   _ _        _       
#|_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#  | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#  | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#  |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                      |___/             |__/       
#  Spawned: Mon Jan 23 2023 - 14:31
#  Last Mod: Mon Jan 23 2023 - 14:41
#  Script:
#  Depends:
#  Note:
#
#export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus export DISPLAY=:0;
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

notify-send "testing"
