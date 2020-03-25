# Nutts Bash Configuration
# This config is a customized version of the default Pop!_OS config

# ye ole history shtuff
shopt -s histappend
HISTFILE=$HOME/.bash_history
HISTFILESIZE=2000

# windowsize stuff, might be outdated
shopt -s checkwinsize

# i want globstar
shopt -s globstar

# using lesspipe the ubuntu way
[ -x /usr/bin/lesspipe ] && eval "$( SHELL=/bin/sh lesspipe)"

# prompt... obviously
PS1="\n \[\e[34m\][ \[\e[36m\]\u : \h : \W \[\e[34m\]] \n \[\e[36m\]\$ \[\e[00m\]"

# useful exports
export EDITOR="nvim"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some quality of life
alias vim="nvim"
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -alF"
alias l="ls -CF"
alias suck="cd ~/suck/"
alias conf="cd ~/code/etc/"
alias rus="cd ~/code/rust/"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi


eval "$(starship init bash)"
