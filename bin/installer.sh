#!/usr/bin/env bash

# Installer Script for my configs. This is just a start... it is pretty ineficient...
# Step two after getting this working and nailing my configs is to create 3 different installs
# Minimal/Server/Complete where different standard packages are installed for each one

cd ~

echo -e "\n INSTALLING REQUIRED PACKAGES \n"
sudo apt update && sudo apt upgrade -y 
# add support for ion-shell, starship
sudo add-apt-repository ppa:mmstick76/ion-shell
sudo apt install neovim curl fzf tmux alacritty ion


# create directory structure
# as elegant as they come... i hope
echo -e " SETTING UP DIRECTORY STRUCTURE  "
mkdir -p code
mkdir -p .scripts
cd code/etc || mv etc code/
cd ~


# Alacritty
echo -e "\n CHECKING FOR ALACRITTY \n"
if [ ! -e /usr/bin/alacritty ]; then
    echo -e " -- INSTALLING ALACRITTY -- \n"
    sudo apt install alacritty -y
fi
echo -e "\n CHECKING FOR ALACRITTY CONFIGS \n"
if [ ! -e $HOME/.config/alacritty/alacritty.yml ]; then
    echo -e " -- CONFIGURING ALACRITTY -- \n"
    mkdir -p $HOME/.config/alacritty
    ln -s $HOME/code/etc/terminal/alacritty.yml $HOME/.config/alacritty/alacritty.yml
fi


# Starship
echo -e "\n CHECKING FOR STARSHIP \n"
if [ ! -e /usr/local/bin/starship ]; then
    echo -e " -- INSTALLING STARSHIP -- \n"
    curl -fsSL https://starship.rs/install.sh | bash
fi
echo -e "\n CHECKING FOR STARSHIP CONFIGS \n"
if [ ! -e $HOME/.config/starship/starship.toml ]; then
    echo -e " -- CONFIGURING STARSHIP -- \n"
    ln -s $HOME/code/etc/starship.toml $HOME/.config/starship/starship.toml
fi


# Fish
echo -e "\n CHECKING FOR FISH \n"
if [ ! -e /usr/bin/fish ]; then
    echo -e " -- INSTALLING STARSHIP -- \n"
    sudo apt install fish -y 
fi
echo -e "\n CHECKING FOR FISH CONFIGS \n"
if [ ! -e $HOME/.config/fish/config.fish ]; then
    echo -e " -- CONFIGURING FISH -- \n"
    ln -s $HOME/code/etc/config.fish $HOME/.config/fish/config.fish
fi


# Ion
echo -e "\n CHECKING FOR ION \n"
if [ ! -e /usr/bin/fish ]; then
    echo -e " -- INSTALLING ION -- \n"
    sudo add-apt-repository ppa:mmstick76/ion-shell
    sudo apt install ion-shell -y 
fi
echo -e "\n CHECKING FOR ION \n"
if [ ! -e $HOME/.config/ion/initrc ]; then
    echo -e " -- SETTING UP ION -- \n"
    ln -s $HOME/code/etc/initrc $HOME/.config/ion/initrc
fi


# Neovim
echo -e "\n CHECKING FOR NEOVIM \n"
if [ ! -e /usr/bin/nvim ]; then
    echo -e "-- INSTALLING NEOVIM --\n" 
    sudo apt install -y neovim
fi
echo -e "\n CHECKING FOR NVIM CONFIGS \n"
if [ ! -e $HOME/.config/nvim/init.vim ]; then
    echo -e " -- SETTING UP NVIM --\n"
    mkdir -p $HOME/.config/nvim
    ln -s $HOME/code/etc/init.vim $HOME/.config/nvim/init.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 
