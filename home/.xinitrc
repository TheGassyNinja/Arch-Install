#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset s off -dpms
xrandr --output eDP-1 --off --output HDMI-1 --auto --primary

if pgrep mpd > /dev/null; then
	pkill mpd && mpd &
      else
	mpd &
fi

if pgrep easyeffects > /dev/null; then
       pkill easyeffects && easyeffects --gapplication-service & 
     else
	  easyeffects --gapplication-service &
fi


#if pgrep picom > /dev/null; then 
#	pkill picom && sleep 1 && picom &
#      else
#	 picom & 
#fi  

~/.fehbg &

touch $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus

systemctl --user import-environment DISPLAY XAUTHORITY

if which dbus-update-activation-environment >/dev/null 2>&1; then
        dbus-update-activation-environment DISPLAY XAUTHORITY
fi

playerctld daemon

# Startx:

exec qtile start
#exec spectrwm
#exec awesome
#exec bspwm
#exec dwm
#exec sway
