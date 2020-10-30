# ls
alias ll='ls -l'
alias la='ls -a'
alias l='ls -CF'
alias lal='ls -al'

# basic
alias cp='cp -i'      # confirm before overwriting something
alias df='df -h'      # human-readable sizes
alias free='free -m'  # show sizes in MB

# programs
alias v='nvim'

# ~/
alias vp='nvim ~/.profile'
alias vx='nvim ~/.xinitrc'
alias vb='nvim ~/.bashrc'

# configs
alias vv='nvim ~/.config/nvim/init.vim'
alias vc='nvim ~/.config/picom/picom.conf'
alias vk='nvim ~/.config/kitty/kitty.conf'
alias vba='nvim ~/.config/bash_aliases/.bash_aliases'
alias vi3='nvim ~/.config/i3/config'
alias vis='nvim ~/.config/i3status/config'

# projects
alias vg='nvim ~/Documents/Projects/GitHub/'

alias vgo='nvim ~/Documents/Projects/GitHub/osmanthewho'
alias rungo='cd ~/Documents/Projects/GitHub/osmanthewho && yarn dev'
