#!/usr/bin/env bash

cd ~

echo -e "\n INSTALLING REQUIRED PACKAGES \n"
sudo apt update && sudo apt upgrade -y 
# add support for ion-shell, starship
sudo apt install neovim curl git fzf tmux kitty fonts-firacode

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

echo -e "\n CHECKING FOR KITTY \n"
if [ ! -f $HOME/.config/kitty/kitty.conf ]; then
    echo -e " -- SETTING UP KITTY -- \n"
    ln -s $HOME/code/etc/kitty.conf $HOME/.config/kitty/kitty.conf
fi

echo -e "\n CHECK FOR STARSHIP \n"
if [ ! -f $HOME/.config/starship/starship.toml ]; then
    echo -e " -- SETTING UP STARSHIP -- \n"
    echo eval "$(starship init bash)" >> $HOME/.bashrc
    ln -s $HOME/code/etc/starship.toml $HOME/.config/starship/starship.toml
fi

echo -e "\n CHECKING FOR ION \n"
if [ ! -f $HOME/.config/ion/initrc ]; then
    echo -e " -- SETTING UP ION -- \n"
    ln -s $HOME/code/etc/initrc $HOME/.config/ion/initrc
fi

echo -e "\n CHECKING TO SEE IF NEOVIM IS SET UP \n"
if [ ! -d $HOME/.config/nvim ]; then
	echo -e " -- SETTING UP NVIM LINK IN XDG_CONFIG_HOME -- \n"
	mkdir -p $HOME/.config/nvim
	# this whole section is super ugly... i need to revisit this
	ln -s $HOME/code/etc/init.viml$HOME/.config/nvim/init.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	if [ ! -f $HOME/.config/nvim/init.vim ]; then
		echo -e " -- SETTING UP NVIM LINK IN XDG_CONFIG_HOME -- \n"
		ln -s $HOME/code/etc/init.vim $HOME/.config/nvim/init.vim
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
fi

# add configs for ion, starship and kitty
# eval eval $(/usr/local/bin/starship init ion --print-full-init)
# export $PATH=$PATH:\$HOME\.cargo\bin
