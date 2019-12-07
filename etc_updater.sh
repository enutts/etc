#!/usr/bin/env bash

# update base repo
cd $HOME/code/etc
git pull origin master

# check for suckless software and update if there
if [ $HOME/code/suck/ ]; then
	cd $HOME/code/suck
	if [ dwm/ ]; then
		cd dwm
		git clone origin master
		mv config.h config.bak.h
		cd ..
	fi
	if [ dmenu/ ]; then
		cd dwm
		unlink $HOME/code/etc/dmenu.h $HOME/code/suck/dmenu/config.h
		git clone origin master
		mv config.h config.bak.h
		cd ..
	fi
	if [ st/ ]; then
		cd dwm
		unlink $HOME/code/etc/st.h $HOME/code/suck/st/config.h
		git clone origin master
		mv config.h config.bak.h
		cd ..
	fi
fi
