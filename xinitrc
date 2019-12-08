#!/usr/bin/env sh

# Put in in case i start using login manager
# Source s most of the scripts i want to run when i start x
[ -f ~/.profile ] && . ~/.xprofile

# Background for desktop
if [ ! -f $HOME/.wallpaper ]; then
    feh --bg-scale $HOME/code/etc/wallpaper.jpg
else
    feh --bh-scale $HOME/.wallpaper
fi 

# Some defaults
export EDITOR=nvim

# Start dwm on login
exec dwm
