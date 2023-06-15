#    ________  ________  _________  ________     
#   |\   ____\|\   __  \|\___   ___\\   __  \    
#   \ \  \___|\ \  \|\  \|___ \  \_\ \  \|\  \   
#    \ \  \  __\ \  \\\  \   \ \  \ \ \  \\\  \  
#     \ \  \|\  \ \  \\\  \   \ \  \ \ \  \\\  \ 
#      \ \_______\ \_______\   \ \__\ \ \_______\
#       \|_______|\|_______|    \|__|  \|_______|

# ZSH COMPLETION
autoload -Uz compinit
compinit

# BASH COMPLETION
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
[ -f $(brew --prefix)/etc/bash_completion.d/goto.sh ] && source $(brew --prefix)/etc/bash_completion.d/goto.sh