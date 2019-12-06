#!/usr/bin/bash

# Nutts Bash Configuration

# ye ole history shtuff
shopt -s histappend
HISTFILE=1000
HISTFILESIZE=2000

# windowsize stuff, might be outdated
shopt -s checkwinsize

# i want globstar
shopt -s globstar

# using lesspipe the ubuntu way
[ -x /usr/bin/lesspipe ] && eval "$( SHELL=/bin/sh lesspipe)"

# prompt... obviously
PS1="\n \[\e[34m\][ \[\e[36m\]\W \[\e[34m\]]\[\e[36m\]\$ \[\e[00m\]"

# adding custom scripts directory
export PATH="${PATH}:$HOME/.scripts/"

# some quality of life
alias vim="nvim"
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -alF"
alias l="ls -CF"
alias suck="cd ~/suck/"
alias conf="cd ~/code/etc/"
alias rus="cd ~/code/rust/"
