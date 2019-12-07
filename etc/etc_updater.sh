#!/usr/bin/env sh

# update my etc
cd $HOME/code/etc
git pull origin master

# if suckless is set up, update it
if [ $HOME/code/suck ]; then
	cd $HOME/code/suck
	if [ dwm/ ]; then
		cd dwm/
		unlink $HOME/code/etc/dwm.h $HOME/code/suck/dwm/config.h
		git pull origin master
		mv config.h config.bak.h
		ln -s $HOME/code/etc/dwm.h $HOME/code/suck/dwm/config.h
		cd ..
	fi
	if [ dmenu/ ]; then
		cd dmenu/
		unlink $HOME/code/etc/dmenu.h $HOME/code/suck/dmenu/config.h
		git pull origin master
		mv config.h config.bak.h
		ln -s $HOME/code/etc/dmenu.h $HOME/code/suck/dmenu/config.h
		cd ..
	fi
	if [ st/ ]; then
		cd st/
		unlink $HOME/code/etc/st.h $HOME/code/suck/dwm/st.h
		git pull origin master
		mv config.h config.bak.h
		ln -s $HOME/code/etc/st.h $HOME/code/suck/dwm/st.h
		cd ..
	fi
fi
