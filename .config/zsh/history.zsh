#    ___  ___  ___  ________  _________  ________  ________      ___    ___ 
#   |\  \|\  \|\  \|\   ____\|\___   ___\\   __  \|\   __  \    |\  \  /  /|
#   \ \  \\\  \ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \|\  \   \ \  \/  / /
#    \ \   __  \ \  \ \_____  \   \ \  \ \ \  \\\  \ \   _  _\   \ \    / / 
#     \ \  \ \  \ \  \|____|\  \   \ \  \ \ \  \\\  \ \  \\  \|   \/  /  /  
#      \ \__\ \__\ \__\____\_\  \   \ \__\ \ \_______\ \__\\ _\ __/  / /    
#       \|__|\|__|\|__|\_________\   \|__|  \|_______|\|__|\|__|\___/ /     
#                     \|_________|                             \|___|/

# HISTORY COMMAND CONFIGURATION
HISTSIZE=5000                 # How many lines of history to keep in memory
HISTFILE=~/.zsh_history       # Where to save history to disk
SAVEHIST=5000                 # Number of history entries to save to disk
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data