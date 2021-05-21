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

xrandr --output eDP-1 --dpi 271 &
slstatus &
#picom &

# Start the window manager
exec ~/bin/startdwm
