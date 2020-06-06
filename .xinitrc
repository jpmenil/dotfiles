#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Start some nice programs

#xrandr --output eDP1 --mode 2560x1600 --dpi 227 &
slstatus &
xcompmgr -c &

# Start the window manager
exec ~/bin/startdwm
