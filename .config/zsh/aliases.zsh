#    ________  ___       ___  ________  ________  _______   ________      
#   |\   __  \|\  \     |\  \|\   __  \|\   ____\|\  ___ \ |\   ____\     
#   \ \  \|\  \ \  \    \ \  \ \  \|\  \ \  \___|\ \   __/|\ \  \___|_    
#    \ \   __  \ \  \    \ \  \ \   __  \ \_____  \ \  \_|/_\ \_____  \   
#     \ \  \ \  \ \  \____\ \  \ \  \ \  \|____|\  \ \  \_|\ \|____|\  \  
#      \ \__\ \__\ \_______\ \__\ \__\ \__\____\_\  \ \_______\____\_\  \ 
#       \|__|\|__|\|_______|\|__|\|__|\|__|\_________\|_______|\_________\
#                                         \|_________|        \|_________|

# ALIAS PROGRAMS
alias k="kubectl"
alias h="helm"
alias tf="terraform"
alias a="ansible"
alias ap="ansible-playbook"
alias dt="datree"

# ALIAS COMMANDS
alias ls="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"
alias lla='ls -la'
alias l='ls -CF'

alias python="python3"
alias pip="pip3"
alias vim="nvim"
alias g="git"
alias gt="goto"
alias grep='grep --color'

alias dps="docker ps | dockercolorize"
alias di="docker images | dockercolorize"
alias dpsa="docker ps -a | dockercolorize"
alias dcps="docker compose ps | dockercolorize"

alias dlogs="docker logs --tail 100 --follow --timestamps --details"
alias dwipe="docker system prune -a --volumes --force"
alias dclean="docker system prune --force"

# ALIAS XDG
[[ -n $WSL_DISTRO_NAME ]] && alias open="xdg-open"
