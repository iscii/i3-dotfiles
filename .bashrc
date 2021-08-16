#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# neofetch on shell start
# if ls /bin | grep neofetch > /dev/null;
# then
#   neofetch
# fi

# source complete_alias
. /usr/share/bash-complete-alias/complete_alias

# color ls by default
alias ls='ls --color=auto'
# primary prompt char
PS1='[\u@\h \W]\$ '

# set default editors
export VISUAL=vim
export EDITOR="$VISUAL"

# dotfiles repo config alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
complete -F _complete_alias config
