#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

exec startx

export PATH="$HOME/.cargo/bin:$PATH"
