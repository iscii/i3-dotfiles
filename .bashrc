#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# neofetch on shell start
if ls /bin | grep neofetch > /dev/null;
then
  neofetch
fi

# source complete_alias
. /usr/share/bash-complete-alias/complete_alias

# dunno what this is
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# dotfiles repo config alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
complete -F _complete_alias config
