#!/usr/bin/env bash

# $USER
# Configure Directory Structure
cd ~

echo "\n CHECKING DIRECTORY STRUCTURE \n"
if [ $HOME/code/ ]; then
    mv etc code
else
    mkdir code
    mv etc code
fi

# check for suckless repos
echo "\n CHECKING FOR SUCKLESS STUFF \n"
if [ $HOME/code/suck ]; then
	cd $HOME/code/suck
	if [ ! -d dwm/ ]; then 
		git clone https://git.suckless.org/dwm
	fi
	if [ ! -d st/ ]; then 
		git clone https://git.suckless.org/st
	fi
	if [ ! -d dmenu/ ]; then 
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
echo "\n CHECKING FOR BASH BUSINESS \n"
ln -s $HOME/code/etc/bashrc $HOME/.bashrc

# checks to see if links already exist before retrying
echo "\n CHECKING SETTING UP SUCKLESS SUCKLESS CONFIGS \n"
if [ ! -f $SUCKDIR/dwm/config.h ]; then
	echo " SET UP DWM CONFIG \n"
	ln -s $HOME/code/etc/dwm.h $HOME/code/suck/dwm/config.h
fi
if [ ! -f $SUCKDIR/dmenu/config.h ]; then
	echo " SET UP DMENU CONFIG \n"
	ln -s $HOME/code/etc/dmenu.h $HOME/code/suck/dmenu/config.h
fi
if [ ! -f $SUCKDIR/st/config.h ]; then
	echo " SET UP ST CONFIG \n"
	ln -s $HOME/code/etc/st.h $HOME/code/suck/st/config.h
fi

echo "\n CHECKING TO SEE IF NEOVIM IS SET UP \n"
if [ ! -d $HOME/.config/nvim ]; then
	echo "\n SETTING UP NVIM LINK IN XDG_CONFIG_HOME \n"
	mkdir -p $HOME/.config/nvim
	ln -s $HOME/code/etc/editor/init.vim $HOME/.config/nvim/init.vim
else
	if [ ! -f $HOME/.config/nvim/init.vim ]; then
		echo "\n SETTING UP NVIM LINK IN XDG_CONFIG_HOME \n"
		ln -s $HOME/code/etc/editor/init.vim $HOME/.config/nvim/init.vim
	fi
fi

# for scripts
# later this will be managed by file_manager.py
# ln -s /home/$USER/code/etc/scripts/se.sh /home/$USER/.scripts/se
# ln -s /home/$USER/code/etc/scripts/dwmbar.sh /home/$USER/.scripts/dwmbar
# ln -s /home/$USER/code/etc/scripts/codes.sh /home/$USER/.scripts/codes
# ln -s /home/$USER/code/etc/scripts/htops.sh /home/$USER/.scripts/htops
# ln -s /home/$USER/code/etc/scripts/pwrs.sh /home/$USER/.scripts/pwrs
