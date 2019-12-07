#!/usr/bin/env sh

# Put in in case i start using login manager
# Source s most of the scripts i want to run when i start x
[ -f ~/.profile ] && . ~/.xprofile

# Background for desktop
feh --bg-scale /home/eric/code/etc/wallpaper.jpg

# Some defaults
export EDITOR=nvim

# Start dwm on login
exec dwm
