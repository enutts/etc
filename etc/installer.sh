#!/usr/bin/env bash

# $USER
# Configure Directory Structure
cd ~

if [ $HOME/code/ ]; then
    mv -t code etc
else
    mkdir code
    mv -t code etc
fi

mkdir -p Documents/dox
mkdir Documents/data
mkdir .scripts

# important directories
SCRIPTDIR=$HOME/.scripts/
CODEDIR=$HOME/code/
ETCDIR=$HOME/code/etc/
DOXDIR=$HOME/Documents/dox/
DATADIR=$HOME/Documents/data/

# backup files that will be replaced
mv .bashrc -> .bashrc_bak

# create symbolic links for important static files
ln -s /home/$USER/code/etc/bashrc /home/$USER/.bashrc

# for scripts
ln -s /home/$USER/code/etc/scripts/se.sh /home/$USER/.scripts/se
ln -s /home/$USER/code/etc/scripts/dwmbar.sh /home/$USER/.scripts/dwmbar
ln -s /home/$USER/code/etc/scripts/codes.sh /home/$USER/.scripts/codes
ln -s /home/$USER/code/etc/scripts/htops.sh /home/$USER/.scripts/htops
ln -s /home/$USER/code/etc/scripts/pwrs.sh /home/$USER/.scripts/pwrs
