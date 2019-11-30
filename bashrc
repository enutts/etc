#!/usr/bin/bash

# Nutts Bash Configuration

# prompt... obviously
PS1=" \[\e[34m\][ \[\e[36m\]\W \[\e[34m\]]\[\e[36m\]\$ \[\e[00m\]"

# adding custom scripts directory
export PATH="${PATH}:/home/eric/.scripts/"

# adding rust bin directory
export PATH="${PATH}:/home/eric/.cargo/bin"

# creating gopath
export GOPATH="/home/eric/code/go"

# some quality of life
alias vim="nvim"
alias ls="ls --color=auto"
alias suck="cd ~/suck/"
alias conf="cd ~/code/etc/"
alias rus="cd ~/code/rust/"
# alias ls="lsd"
