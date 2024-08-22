#!/usr/bin/env bash

#    ____  ___ ____ _   _   ___ _   _ ____ _____  _    _     _     _____ ____
#   |  _ \|_ _/ ___| | | | |_ _| \ | / ___|_   _|/ \  | |   | |   | ____|  _ \
#   | |_) || | |   | |_| |  | ||  \| \___ \ | | / _ \ | |   | |   |  _| | |_) |
#   |  _ < | | |___|  _  |  | || |\  |___) || |/ ___ \| |___| |___| |___|  _ <
#   |_| \_|___\____|_| |_| |___|_| \_|____/ |_/_/   \_|_____|_____|_____|_| \_\
#
# Script to install kali's dotfiles
# Author: PunGrumpy

set -e

# Color definitions
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
BOLD="\033[1m"
RESET="\033[0m"

# URLs
declare -A URLS=(
    ["DOTFILE"]="https://github.com/PunGrumpy/kali-dotfiles.git"
    ["DOTFILE_SSH"]="git@github.com:PunGrumpy/kali-dotfiles.git"
    ["FISHER"]="https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish"
    ["FONT_HACK"]="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.tar.xz"
    ["FONT_NOTOSANS"]="https://fonts.google.com/download?family=Noto%20Sans"
    ["FONT_NOTOSANS_THAI"]="https://fonts.google.com/download?family=Noto%20Sans%20Thai"
    ["BREWFILE"]="https://raw.githubusercontent.com/PunGrumpy/kali-dotfiles/main/Brewfile"
)

DOTFILE_DIR="$HOME/.dotfiles"
DATE=$(date +"%A %d %B %Y (%H:%M:%S)")

# Helper functions
print_banner() {
    local text="$1"
    echo -e "\n${BOLD}${BLUE}==== $text ====${RESET}\n"
}

print_step() {
    local step="$1"
    echo -e "${YELLOW}$step${RESET}"
}

print_success() {
    local message="$1"
    echo -e "${GREEN}✔ $message${RESET}"
}

print_error() {
    local message="$1"
    echo -e "${RED}✖ $message${RESET}"
}

confirm() {
    local prompt="$1"
    local default="${2:-Y}"
    local options="Y/n"
    [[ $default == "N" ]] && options="y/N"
    
    while true; do
        read -rp "$prompt [$options] " yn
        case $yn in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
            "") [[ $default == "Y" ]] && return 0 || return 1 ;;
            *) echo -e "${RED}Please answer yes or no.${RESET}" ;;
        esac
    done
}

# ASCII Art functions
ascii_ghost() {
    echo -en "
                              ░░░░░░░░░░                          
                      ▒▒▒▒░░░░░░░░░░░░▒▒▒▒                    
                  ░░                ░░░░░░░░░░                
                ▒▒                      ░░░░░░▒▒              
              ░░░░                      ░░░░░░▓▓              
              ▓▓  ▒▒▓▓    ░░██▒▒          ░░░░░░▒▒            
              ▓▓  ██▓▓    ░░████▒▒        ░░░░░░▒▒            
        ░░░░  ▓▓  ▒▒▒▒      ▒▒▒▒▒▒        ░░░░░░▒▒            
      ▒▒                          ▒▒▒▒▒▒▒▒░░░░░░░░            
    ▓▓          ░░            ▒▒            ▒▒░░░░            
  ▓▓          ░░░░          ▒▒                ░░░░            
  ▒▒        ░░░░░░          ▒▒░░░░            ░░░░            
  ▒▒      ░░░░░░░░            ▒▒░░▒▒          ░░░░⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RED}PunGrumpy Dotfiles${RESET}            
      ▓▓░░░░▒▒░░░░    ░░        ▒▒░░░░          ░░▒▒          
          ▒▒▒▒░░░░    ░░      ░░░░▒▒░░▒▒    ░░  ░░▒▒          
            ▓▓░░░░    ░░      ░░░░░░▒▒▒▒    ░░  ░░▒▒          
            ▓▓░░░░    ░░      ░░░░░░░░▒▒    ░░░░░░░░▒▒        
            ▓▓░░░░    ░░        ░░░░░░░░░░    ░░░░░░▒▒        
            ▓▓░░░░    ░░░░      ░░░░░░░░░░    ░░░░░░░░░░      
              ▓▓░░░░  ░░░░      ░░░░░░░░░░░░    ░░░░░░▒▒      
              ▒▒▒▒░░░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░    ░░░░░░▒▒    
                ▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░    
                      ▒▒▒▒▒▒▒▒          ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\n\n"
}

banner() {
    local text="${1:?}"
    ascii_ghost
    printf ' %s [%s%s %s%s %s]%s\n\n' "${RED}" "${RESET}" "${YELLOW}" "${text}" "${RESET}" "${RED}" "${RESET}"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    print_error "This script must NOT be run as root"
    exit 1
fi

# Check if emoji is supported
if [[ $(locale charmap) != 'UTF-8' ]]; then
    print_error "Emoji is not supported in your system"
    exit 1
fi

# Welcome message
banner "👋 Welcome!"
echo -e "${BOLD}${CYAN}Date: $DATE${RESET}\n"
echo -e "This script will install and configure your Kali Linux rice."
echo -e "It will install necessary dependencies, clone dotfiles, and set up your environment."
echo -e "\n${BOLD}${RED}Note: You will be prompted for your password to install dependencies and make system changes.${RESET}\n"

confirm "Do you want to continue?" || exit 0

# Check internet connection
banner "🌐 Checking Internet Connection"
if ping -q -c 1 -W 1 google.com >/dev/null; then
    print_success "Internet connection available"
else
    print_error "No internet connection"
    exit 1
fi

# Install Homebrew
banner "🍺 Installing Homebrew"
if ! command -v brew >/dev/null; then
    print_step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Download Brewfile
banner "📥 Downloading Brewfile"
print_step "Downloading Brewfile..."
curl -fsSL "${URLS["BREWFILE"]}" -o "$HOME/Brewfile"
if [ $? -eq 0 ]; then
    print_success "Brewfile downloaded successfully"
else
    print_error "Failed to download Brewfile"
    exit 1
fi

# Install dependencies using downloaded Brewfile
banner "📦 Installing dependencies"
print_step "Installing dependencies from downloaded Brewfile..."
brew bundle --file="$HOME/Brewfile"
if [ $? -eq 0 ]; then
    print_success "Dependencies installed successfully"
else
    print_error "Failed to install dependencies"
    exit 1
fi

# Clean up downloaded Brewfile
rm "$HOME/Brewfile"

# Install Fisher and plugins
banner "🎣 Installing Fisher and plugins"
if ! command -v fisher >/dev/null; then
    print_step "Installing Fisher..."
    curl -sL "${URLS["FISHER"]}" | source && fisher install jorgebucaran/fisher
    print_success "Fisher installed"
else
    print_success "Fisher already installed"
fi

fisher_plugins=(
    "jethrokuan/z"
    "PatrickF1/fzf.fish"
    "nickeb96/puffer-fish"
    "laughedelic/pisces"
    "danhper/fish-ssh-agent"
    "IlanCosman/tide@v6"
)

for plugin in "${fisher_plugins[@]}"; do
    print_step "Installing $plugin..."
    fisher install $plugin
done

# Clone dotfiles
banner "📂 Cloning dotfiles"
if [[ -d $DOTFILE_DIR ]]; then
    if confirm "Dotfiles already exist. Do you want to delete and re-clone?"; then
        rm -rf $DOTFILE_DIR
    else
        print_success "Skipping dotfiles clone"
    fi
fi

if [[ ! -d $DOTFILE_DIR ]]; then
    print_step "Cloning dotfiles..."
    git clone "${URLS["DOTFILE_SSH"]}" "$DOTFILE_DIR" || git clone "${URLS["DOTFILE"]}" "$DOTFILE_DIR"
    print_success "Dotfiles cloned"
fi

# Backup existing configurations
banner "📦 Creating backup"
backup_dir="$HOME/.backup_dotfiles/$DATE"
mkdir -p "$backup_dir"
cp -R "$HOME/.config" "$HOME/.gitconfig" "$HOME/.gitignore" "$backup_dir"
print_success "Backup created at $backup_dir"

# Link dotfiles
banner "🔗 Linking dotfiles"
for file in $DOTFILE_DIR/.config $DOTFILE_DIR/.gitignore $DOTFILE_DIR/.gitconfig; do
    print_step "Linking $file..."
    ln -sf "$file" "$HOME/"
done

# Install fonts
banner "🔠 Installing fonts"
fonts_dir="$HOME/.local/share/fonts"
mkdir -p "$fonts_dir"

install_font() {
    local url="$1"
    local dest="$2"
    curl -L "$url" -o "$dest"
    tar -xf "$dest" -C "$fonts_dir"
    rm -rf "$dest"
}

install_font "${URLS["FONT_HACK"]}" "$fonts_dir/Hack.tar.xz"

print_step "Installing Noto Sans font..."
sudo mkdir -p "/usr/share/fonts/noto-sans"
sudo curl -L "${URLS["FONT_NOTOSANS"]}" -o "/usr/share/fonts/noto-sans.zip"
sudo unzip "/usr/share/fonts/noto-sans.zip" -d "/usr/share/fonts/noto-sans"
sudo rm -rf "/usr/share/fonts/noto-sans.zip"

print_step "Installing Noto Sans Thai font..."
sudo mkdir -p "/usr/share/fonts/noto-sans-thai"
sudo curl -L "${URLS["FONT_NOTOSANS_THAI"]}" -o "/usr/share/fonts/noto-sans-thai.zip"
sudo unzip "/usr/share/fonts/noto-sans-thai.zip" -d "/usr/share/fonts/noto-sans-thai"
sudo rm -rf "/usr/share/fonts/noto-sans-thai.zip"

print_success "Fonts installed"

# Set fish as default shell
banner "🐠 Setting fish as default shell"
if [[ "$SHELL" != "/home/linuxbrew/.linuxbrew/bin/fish" ]]; then
    print_step "Changing default shell to fish..."
    sudo chsh -s /home/linuxbrew/.linuxbrew/bin/fish $USER
    print_success "Default shell changed to fish"
else
    print_success "Fish is already the default shell"
fi

# Final message
banner "🎉 Installation Complete"
echo -e "${BOLD}${GREEN}Your rice has been installed successfully!${RESET}"
echo -e "\n${BOLD}${YELLOW}Please restart your computer to apply all changes.${RESET}"

if confirm "Do you want to restart now?"; then
    sudo reboot
else
    echo -e "\n${BOLD}${CYAN}Remember to restart your computer later to apply all changes.${RESET}"
fi

exit 0