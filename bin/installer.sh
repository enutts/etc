#!/usr/bin/env bash

# "important directories"
SCRIPTDIR=$HOME/.scripts/
CODEDIR=$HOME/code/
ETCDIR=$HOME/code/etc/
BADDIR=$HOME/code/bad/

cd ~

echo -e "\n INSTALLING REQUIRED PACKAGES \n"
sudo apt update && sudo apt upgrade -y 
sudo apt install neovim curl git fzf 

# create directory structure
echo -e "\n CHECKING DIRECTORY STRUCTURE \n"
if [ -d $HOME/code/ ]; then
    if [ ! -d $HOME/code/etc/ ]; then
        mv -t code etc
    fi
else
    mkdir code
    mv -t etc code
fi

if [ ! -d $HOME/.scripts/ ]; then
    echo -e " -- CREATING .scripts/ -- \n"
    mkdir $HOME/.scripts
fi

echo -e "\n CHECKING FOR BASH BUSINESS \n"
if [ ! -f $HOME/.bashrc_bak ]; then
    echo -e " -- SETTING UP BASHRC -- \n"
    mv $HOME/.bashrc $HOME/.bashrc_bak
    ln -s $HOME/code/etc/bashrc $HOME/.bashrc
fi

echo -e "\n CHECKING TO SEE IF NEOVIM IS SET UP \n"
if [ ! -d $HOME/.config/nvim ]; then
	echo -e " -- SETTING UP NVIM LINK IN XDG_CONFIG_HOME -- \n"
	mkdir -p $HOME/.config/nvim
	ln -s $HOME/code/etc/editor/init.viml$HOME/.config/nvim/init.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	if [ ! -f $HOME/.config/nvim/init.vim ]; then
		echo -e " -- SETTING UP NVIM LINK IN XDG_CONFIG_HOME -- \n"
		ln -s $HOME/code/etc/editor/init.vim $HOME/.config/nvim/init.vim
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
fi
