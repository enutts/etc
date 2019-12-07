#!/usr/bin/env bash

# $USER
# Configure Directory Structure
cd ~

if [ $HOME/code/ ]; then
    mv etc code
else
    mkdir code
    mv etc code
fi

# check for suckless repos
if [ $HOME/code/suck ]; then
	cd $HOME/code/suck
	if [ ! dwm/ ]; then 
		git clone https://git.suckless.org/dwm
	fi
	if [ ! st/ ]; then 
		git clone https://git.suckless.org/st
	fi
	if [ ! dmenu/ ]; then 
		git clone https://git.suckless.org/dmenu
	fi
	cd $HOME
else
	mkdir $HOME/code/suck/
	cd $HOME/code/suck/
	git clone https://git.suckless.org/dwm
	git clone https://git.suckless.org/st
	git clone https://git.suckless.org/dmenu
	cd $HOME
fi

mkdir -p Documents/dox/
mkdir Documents/data/
mkdir .scripts

# important directories
SCRIPTDIR=$HOME/.scripts/
CODEDIR=$HOME/code/
ETCDIR=$HOME/code/etc/
SUCKDIR=$CODEDIR/suck
DOXDIR=$HOME/Documents/dox/
DATADIR=$HOME/Documents/data/

# create symbolic links for important static files
ln -s $HOME/code/etc/bashrc $HOME/.bashrc
ln -s $HOME/code/etc/dwm.h $HOME/code/suck/dwm/config.h
ln -s $HOME/code/etc/dmenu.h $HOME/code/suck/dmenu/config.h
ln -s $HOME/code/etc/st.h $HOME/code/suck/st/config.h

# for scripts
# later this will be managed by file_manager.py
ln -s /home/$USER/code/etc/scripts/se.sh /home/$USER/.scripts/se
ln -s /home/$USER/code/etc/scripts/dwmbar.sh /home/$USER/.scripts/dwmbar
ln -s /home/$USER/code/etc/scripts/codes.sh /home/$USER/.scripts/codes
ln -s /home/$USER/code/etc/scripts/htops.sh /home/$USER/.scripts/htops
ln -s /home/$USER/code/etc/scripts/pwrs.sh /home/$USER/.scripts/pwrs
