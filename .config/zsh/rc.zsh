#    ________  ________  ___  ___  ________  ________     
#   |\_____  \|\   ____\|\  \|\  \|\   __  \|\   ____\    
#    \|___/  /\ \  \___|\ \  \\\  \ \  \|\  \ \  \___|    
#        /  / /\ \_____  \ \   __  \ \   _  _\ \  \       
#       /  /_/__\|____|\  \ \  \ \  \ \  \\  \\ \  \____  
#      |\________\____\_\  \ \__\ \__\ \__\\ _\\ \_______\
#       \|_______|\_________\|__|\|__|\|__|\|__|\|_______|
#                \|_________|                             

# LOAD CONFIGURATION FILES
[[ -f ~/.dotfiles/.config/zsh/aliases.zsh ]] && source ~/.dotfiles/.config/zsh/aliases.zsh
[[ -f ~/.dotfiles/.config/zsh/env.zsh ]] && source ~/.dotfiles/.config/zsh/env.zsh
[[ -f ~/.dotfiles/.config/zsh/functions.zsh ]] && source ~/.dotfiles/.config/zsh/functions.zsh
[[ -f ~/.dotfiles/.config/zsh/goto.zsh ]] && source ~/.dotfiles/.config/zsh/goto.zsh
[[ -f ~/.dotfiles/.config/zsh/history.zsh ]] && source ~/.dotfiles/.config/zsh/history.zsh
[[ -f ~/.dotfiles/.config/zsh/plugin.zsh ]] && source ~/.dotfiles/.config/zsh/plugin.zsh
[[ -f ~/.dotfiles/.config/zsh/starship.zsh ]] && source ~/.dotfiles/.config/zsh/starship.zsh
[[ -f ~/.dotfiles/.config/zsh/wsl.zsh ]] && source ~/.dotfiles/.config/zsh/wsl.zsh

# LOAD STARSHIP
eval "$(starship init zsh)"

# LOAD DIRENV
eval "$(direnv hook zsh)"