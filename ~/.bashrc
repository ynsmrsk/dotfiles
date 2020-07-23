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
# dont let the vi mode to break ctrl-l
bind -m vi-insert "\C-l":clear-screen
