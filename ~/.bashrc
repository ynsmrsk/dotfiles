#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Alias definitions.
if [ -f ~/.config/bash_aliases/.bash_aliases ]; then
    . ~/.config/bash_aliases/.bash_aliases
fi

# enable vi mode
 set -o vi
# vi mode breaks c-l so:
bind -m vi-insert "\C-l":clear-screen

shopt -s autocd

export EDITOR="nvim"
export FILE="vifm"
export BROWSER="chromium"
export TERMINAL="alacritty"
