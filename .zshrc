#    ________  ________  ___  ___     
#   |\_____  \|\   ____\|\  \|\  \    
#    \|___/  /\ \  \___|\ \  \\\  \   
#        /  / /\ \_____  \ \   __  \  
#       /  /_/__\|____|\  \ \  \ \  \ 
#      |\________\____\_\  \ \__\ \__\
#       \|_______|\_________\|__|\|__|
#                \|_________|         
#           ZSH CONFIGURATION FILE
#           By: PunGrumpy

##### ----- LOAD ZSH CONFIGURATION ----- #####
[ -f ~/.config/zsh/rc.zsh ] && source ~/.config/zsh/rc.zsh

##### ----- LOAD ZSH PLUGINS ----- #####
[ -f ~/.zsh_plugins.zsh ] && source ~/.zsh_plugins.zsh

##### ----- EXPORT ZSH VARIABLES ----- #####
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -d $HOME/.nvm ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"