#!/usr/bin/env bash

# Installer Script for my configs. This is just a start... it is pretty ineficient...
# Step two after getting this working and nailing my configs is to create 3 different installs
# Minimal/Server/Complete where different standard packages are installed for each one

cd ~

echo -e "\n INSTALLING REQUIRED PACKAGES \n"
# add support for starship
TO_INST=""
nvim -h  > /dev/null || $TO_INST+=" neovim"
curl -h > /dev/null || $TO_INST+=" curl"
fzf -h > /dev/null || $TO_INST+=" fzf"
tmux -V >  /dev/null || $TO_INST+=" tmux"
alacritty -h > /dev/null || $TO_INST+=" alacritty"
zsh --help > /dev/null || $TO_INST+=" zsh"


# create directory structure
# as elegant as they come... i hope
echo -e " SETTING UP DIRECTORY STRUCTURE  "
mkdir -p code .scripts
cd code/etc || mv etc code/
cd ~

ETC_SCR=$HOME/code/etc/scripts/
SCRIPTS=$HOME/.scripts

# Alacritty
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
    mkdir -p $HOME/.config/starship
    ln -s $HOME/code/etc/shell/starship.toml $HOME/.config/starship/starship.toml
fi


# Neovim
echo -e "\n CHECKING FOR NVIM CONFIGS \n"
if [ ! -e $HOME/.config/nvim/init.vim ]; then
    echo -e " -- SETTING UP NVIM --\n"
    mkdir -p $HOME/.config/nvim
    ln -s $HOME/code/etc/init.vim $HOME/.config/nvim/init.vim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi 


# Tmux
echo -e "\n CHECKING FOR TMUX CONFIG \n"
if [ ! -e $HOME/.tmux.conf ]; then
    echo -e " -- CONFIGURING tmux -- \n"
    ln -s $HOME/code/etc/terminal/tmux.conf $HOME/.tmux.conf
fi


# Zsh
echo -e "\n CHECKING FOR ZSH CONFIGS \n "
if [ ! -e $HOME/.zshenv ]; then
    echo -e " -- CONFIGURING ZSH -- \n"
    mkdir -p $HOME/.config/zsh
    ln -s $HOME/code/etc/shell/zshenv $HOME/.zshenv
    ln -s $HOME/code/etc/shell/zshrc $HOME/.config/zsh/.zshrc
    ln -s $HOME/code/etc/shell/zshcompdump $HOME/.config/zsh/.zshcompdump
fi


# install scripts 
echo -e "\n CHECKING SCRIPTS \n"
for F in $ETC_SCR/*; do
    if [ ! -e $ETC_SCR/F ]; then
        chmod 754 $F
    fi
    if [ ! -a $SCRIPTS/F ]; then 
        ln -s $ETC_SCR/F $SCRIPTS/F
    fi
done 


# install software
if [[ $TO_INST == "" ]]; then 
    echo -e "\n INSTALLING SOFTWARE \n"
    echo $TO_INST
    sudo apt update && sudo apt upgrade -y  
    sudo apt install $TO_INST -y 
fi


