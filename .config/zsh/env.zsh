#    _______   ________   ___      ___ 
#   |\  ___ \ |\   ___  \|\  \    /  /|
#   \ \   __/|\ \  \\ \  \ \  \  /  / /
#    \ \  \_|/_\ \  \\ \  \ \  \/  / / 
#     \ \  \_|\ \ \  \\ \  \ \    / /  
#      \ \_______\ \__\\ \__\ \__/ /   
#       \|_______|\|__| \|__|\|__|/

# EDITOR
if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi
export KUBE_EDITOR="$EDITOR"

# HOMEBREW
if [[ -d /home/linuxbrew/.linuxbrew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -d /usr/local/Homebrew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# CARGO
[[ -d ~/.cargo ]] && export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# NVM DIRECTORY
export NVM_DIR="$HOME/.nvm"

# VAGRANT WSL CONFIG
export VAGRANT_DEFAULT_PROVIDER="hyperv"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# TERRAFORM
[[ -d ~/.terraform ]] && export PATH="$HOME/.terraform/bin:$PATH"
