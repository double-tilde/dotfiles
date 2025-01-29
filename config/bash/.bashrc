#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
export PS1="\[$(tput setaf 32)\]\u\[$(tput setaf 15)\]@\[$(tput setaf 202)\]\h \[$(tput setaf 15)\]\w \[$(tput sgr0)\]$ "
