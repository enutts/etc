#!/usr/bin/env bash

# $USER
# Configure Directory Structure
cd ~

echo -e "\n CHECKING DIRECTORY STRUCTURE \n"
if [ -d $HOME/code/ ]; then
    if [ ! -d $HOME/code/etc/ ]; then
        mv -t code etc
    fi
else
    mkdir code
    mv etc code
fi

echo -e "\n CHECKING FOR SUCKLESS STUFF \n"
if [ $HOME/code/suck ]; then
	cd $HOME/code/suck
	if [ ! -d dwm/ ]; then 
        echo -e " -- DOWNLOADING DWM -- \n"
		git clone https://git.suckless.org/dwm
	fi
	if [ ! -d st/ ]; then 
        echo -e " -- DOWNLOADING ST -- \n"
		git clone https://git.suckless.org/st
	fi
	if [ ! -d dmenu/ ]; then 
        echo -e " -- DOWNLOADING DMENU -- \n"
		git clone https://git.suckless.org/dmenu
	fi
	cd $HOME
else
	mkdir $HOME/code/suck/
	cd $HOME/code/suck/
    echo -e " -- DOWNLOADING DWM -- \n"
	git clone https://git.suckless.org/dwm
    echo -e " -- DOWNLOADING ST -- \n"
	git clone https://git.suckless.org/st
    echo -e " -- DOWNLOADING DMENU -- \n"
	git clone https://git.suckless.org/dmenu
	cd $HOME
fi

echo -e "\n CHECKING DIRECTORIES \n"
if [ ! -d $HOME/Documents/dox/ ]; then
    echo -e " -- CREATING DOX/ -- \n"
    mkdir -p Documents/dox/
fi
if [ ! -d $HOME/Documents/data/ ]; then
    echo -e " -- CREATING DATA/ -- \n"
    mkdir Documents/data/
fi
if [ ! -d $HOME/.scripts/ ]; then
    echo -e " -- CREATING .scripts/ -- \n"
    mkdir $HOME/.scripts
fi

# "important directories"
SCRIPTDIR=$HOME/.scripts/
CODEDIR=$HOME/code/
ETCDIR=$HOME/code/etc/
SUCKDIR=$CODEDIR/suck
DOXDIR=$HOME/Documents/dox/
DATADIR=$HOME/Documents/data/

echo -e "\n CHECKING FOR BASH BUSINESS \n"
if [ ! -f $HOME/.bashrc ]; then
    echo " -- SET UP BASHRC -- \n"
    ln -s $HOME/code/etc/bashrc $HOME/.bashrc
fi

echo -e "\n CHECKING FOR X STUFF \n"
if [ ! -f $HOME/.xprofile ]; then
    echo -e "\n -- SETTING UP XPROFILE -- \n"
    ln -s $HOME/code/etc/xprofile $HOME/.xprofile
fi
if [ ! -f $HOME/.xinitrc ]; then
    echo -e "\n -- SETTING UP XINITRC -- \n"
    ln -s $HOME/code/etc/xinitrc $HOME/.xinitrc
fi

echo -e "\n CHECKING SETTING UP SUCKLESS SUCKLESS CONFIGS \n"
if [ ! -f $SUCKDIR/dwm/config.h ]; then
	echo -e " -- SET UP DWM CONFIG -- \n"
	ln -s $HOME/code/etc/dwm.h $HOME/code/suck/dwm/config.h
fi
if [ ! -f $SUCKDIR/dmenu/config.h ]; then
	echo -e " -- SET UP DMENU CONFIG -- \n"
	ln -s $HOME/code/etc/dmenu.h $HOME/code/suck/dmenu/config.h
fi
if [ ! -f $SUCKDIR/st/config.h ]; then
	echo -e " -- SET UP ST CONFIG -- \n"
	ln -s $HOME/code/etc/st.h $HOME/code/suck/st/config.h
fi

echo -e "\n CHECKING TO SEE IF NEOVIM IS SET UP \n"
if [ ! -d $HOME/.config/nvim ]; then
	echo -e " -- SET UP NVIM LINK IN XDG_CONFIG_HOME -- \n"
	mkdir -p $HOME/.config/nvim
	ln -s $HOME/code/etc/editor/init.vim $HOME/.config/nvim/init.vim
else
	if [ ! -f $HOME/.config/nvim/init.vim ]; then
		echo -e " -- SET UP NVIM LINK IN XDG_CONFIG_HOME -- \n"
		ln -s $HOME/code/etc/editor/init.vim $HOME/.config/nvim/init.vim
	fi
fi

# maybe write something for tmux
