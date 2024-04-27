#!/usr/bin/env bash
#    ____  ___ ____ _   _   ___ _   _ ____ _____  _    _     _     _____ ____  
#   |  _ \|_ _/ ___| | | | |_ _| \ | / ___|_   _|/ \  | |   | |   | ____|  _ \ 
#   | |_) || | |   | |_| |  | ||  \| \___ \ | | / _ \ | |   | |   |  _| | |_) |
#   |  _ < | | |___|  _  |  | || |\  |___) || |/ ___ \| |___| |___| |___|  _ < 
#   |_| \_|___\____|_| |_| |___|_| \_|____/ |_/_/   \_|_____|_____|_____|_| \_\
#   Script to install kali's dotfiles
#   Author: PunGrumpy

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
BOLD=$(tput bold)
BEEP=$(tput blink)
RESET=$(tput sgr0)

DOTFILE_URL="https://github.com/PunGrumpy/kali-dotfiles.git"
DOTFILE_SSH_URL="git@github.com:PunGrumpy/kali-dotfiles.git"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts.git"
BSPC_URL="https://github.com/bnoordhuis/bspc.git"
PACKER_URL="https://github.com/wbthomason/packer.nvim.git"
FISHER_URL="https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish"
DOCKER_DESKTOP_URL="https://desktop.docker.com/linux/main/amd64/docker-desktop-4.20.1-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"

VSCOED_DEB_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
DISCORD_DEB_URL="https://discord.com/api/download?platform=linux&format=deb"
GOOGLECHROME_DEB_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

ORCHIS_THEME_URL="https://github.com/vinceliuice/Orchis-theme.git"
ORCHIS_THEME_SSH_URL="git@github.com:vinceliuice/Orchis-theme.git"
FIREFOX_THEME_URL="https://github.com/vinceliuice/WhiteSur-firefox-theme.git"
FIREFOX_THEME_SSH_URL="git@github.com:vinceliuice/WhiteSur-firefox-theme.git"
WHITESUR_ICONS_THEME_URL="https://github.com/vinceliuice/WhiteSur-icon-theme.git"
WHITESUR_ICONS_THEME_SSH_URL="git@github.com:vinceliuice/WhiteSur-icon-theme.git"
MACOS_MOUSE_URL="https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-Monterey.tar.gz"
GRUB_DEDSEC_THEME_URL="https://gitlab.com/VandalByte/dedsec-grub-theme.git"

FONT_HACK_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.tar.xz"
FONT_JETBRAINS_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.tar.xz"
FONT_AWESOME_URL="https://github.com/PunGrumpy/gh0stzk-dotfiles/raw/master/misc/fonts/FontAwesome6-Free-Solid.otf"
FONT_MATERIAL_DESIGN_URL="https://github.com/gh0stzk/dotfiles/raw/master/misc/fonts/MaterialDesignIconsDesktop.ttf"
FONT_NOTOSANS_URL="https://fonts.google.com/download?family=Noto%20Sans"
FONT_NOTOSANS_THAI_URL="https://fonts.google.com/download?family=Noto%20Sans%20Thai"

DOTFILE_DIR="$HOME/.dotfiles"

DATE=$(date +"%A %d %B %Y (%H:%M:%S)")

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

ascii_owl() {
    echo -en "
          ████████████                                        
        ██░░░░░░░░░░░░██                                      
      ██░░            ░░██                                    
    ██                  ░░██                                  
    ██████          ████░░██                                  
    ██    ██      ██    ░░██                                  
    ██      ░░██░░    ░░██                                    
    ██░░  ░░░░██░░░░████████                                  
      ██░░    ░░  ██        ██                                
        ██  ██  ██            ██                              
      ██░░██    ██░░░░          ██                            
        ██░░  ██  ██░░            ██                          
        ██░░██      ████░░░░  ░░░░░░██⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${RED}PunGrumpy Dotfiles${RESET}                        
          ██░░  ░░██    ██░░░░░░████                          
            ██▓▓██░░░░██  ██████                              
      ██████▓▓▓▓▓▓████░░    ██                                
      ████░░░░░░░░░░████░░░░░░██                              
      ██░░██░░░░░░██░░████████                                
      ██░░░░██▓▓██░░░░██                                      
      ██░░░░▓▓▓▓▓▓░░░░██                                      
      ██████████████████\n\n"
}

banner() {
    local text="${1:?}"
    local ascii_art_list=(ascii_ghost ascii_owl)
    local ascii_art="${ascii_art_list[$RANDOM % ${#ascii_art_list[@]}]}"
    
    ${ascii_art}
    printf ' %s [%s%s %s%s %s]%s\n\n' "${RED}" "${RESET}" "${YELLOW}" "${text}" "${RESET}" "${RED}" "${RESET}"
}

###### ----- Mustn't be root ----- ######
if [[ $EUID -eq 0 ]]; then
    echo -e "This script must ${RED}NOT${RESET} be run as root" 1>&2 && exit 1
    exit 1
fi

###### ----- Check if emoji is supported ----- ######
if [[ $(locale charmap) != 'UTF-8' ]]; then
    echo -e "${RED}Emoji is not supported in your system${RESET}"
    exit 1
fi

##############################################################################################################

###### ----- Welcome ----- ######
sleep 2
clear

banner "👋 Welcome!"
printf '%s%s%s\n\n' "${BOLD}" "${DATE}" "${RESET}"
printf '%s%sThis script will check if you have the %s%sKALI LINUX%s %s%sneccessary dependencies, and if not, it will install them. Then, it will clone the RICE in your HOME directory.\nAfter that, it will create a secure backup of your files, and then copy the new files to your computer.\n\nMy dotfiles DO NOT modify any of your system configurations.\nYou will be prompted for your root password to install missing dependencies and/or to switch to fish shell if its not your default.\n\nThis script doesnt have the potential power to break your system, it only copies files from my repository to your HOME directory.%s\n\n' "${BOLD}" "${RED}" "${PURPLE}" "${BEEP}" "${RESET}" "${BOLD}" "${RED}" "${RESET}"

while true; do
    read -rp "⚖️ Do you want to continue? [Y/n] " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) echo -e "\n${RED}📤 Exiting...${RESET}\n"; exit;;
            * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
        esac
done

while true; do
    read -rp "⚠️ Are you sure you RiceInstaller on $HOME/.RiceInstaller.sh? [Y/n] " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) echo -e "\n${RED}📤 Exiting...${RESET}\n"; exit;;
            * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
        esac
done

sleep2
clear

###### ----- Checking Working Directory ----- ######
banner "📂 Checking Working Directory..."

# this file must be in the $HOME directory
if [[ ! -f "$HOME/.RiceInstaller.sh" ]]; then
    echo -e "${RED}✖️ This file must be in the $HOME directory${RESET}"
    sleep 1
    exit 1
else
    echo -e "${GREEN}✔️ This file is in the $HOME directory${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Checking Internet Connection ----- ######
banner "🌐 Checking Internet Connection..."

if ping -q -c 1 -W 1 google.com >/dev/null; then
    echo -e "${GREEN}✔️ You are connected to the internet${RESET}"
    sleep 1
else
    echo -e "${RED}✖️ You are not connected to the internet${RESET}"
    sleep 1
    exit 1
fi

sleep 2
clear

###### ----- Installing Homebrew ----- ######
banner "🍺 Installing Homebrew..."

if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo -e "${GREEN}✔️ Homebrew installed${RESET}"
    sleep 1
else
    echo -e "${GREEN}✔️ Homebrew already installed${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.bash_profile" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv) 2>/dev/null"
elif [[ -f "$HOME/.zshrc" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv) 2>/dev/null"
elif [[ -f "$HOME/.config/fish/config.fish" ]]; then
    echo 'set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH' >> ~/.config/fish/config.fish
    eval (brew --env 2>/dev/null)
fi

sleep 2
clear

###### ----- Installing Flatpak ----- ######
banner "📦 Installing Flatpak..."

if ! command -v flatpak >/dev/null; then
    echo -e "${YELLOW}⏳ Installing Flatpak...${RESET}"
    sudo apt install flatpak -y
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Flatpak installed${RESET}"
    else
        echo -e "${RED}✖️ Flatpak not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Flatpak already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing Cargo ----- ######
banner "📦 Installing Cargo..."

if ! command -v cargo >/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo -e "${GREEN}✔️ Cargo installed${RESET}"
    sleep 1
else
    echo -e "${GREEN}✔️ Cargo already installed${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.bash_profile" ]]; then
    sudo eval "$("$HOME/.cargo/env")" 2>/dev/null
elif [[ -f "$HOME/.zshrc" ]]; then
    sudo eval "$("$HOME/.cargo/env")" 2>/dev/null
elif [[ -f "$HOME/.config/fish/config.fish" ]]; then
    sudo echo 'set -gx PATH $HOME/.cargo/bin $PATH' >> ~/.config/fish/config.fish
    sudo eval (cargo env 2>/dev/null)
fi

sleep 2
clear

###### ----- Updating system ----- ######
banner "📦 Updating system..."

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y &&
brew upgrade && brew cleanup &&
flatpak update -y &&
cargo update &&

echo -e "${GREEN}✔️ System updated${RESET}"
sleep 2
clear

###### ----- Installing dependencies ----- ######
dependencies_apt=(curl wget neofetch build-essential alacritty jq docker.io snapd docker-ce docker-ce-cli containerd.io uidmap \
cmake libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev xclip pkg-config \
libgtk-3-dev librust-atk-dev meson libwayland-dev gobject-introspection libgirepository1.0-dev gtk-doc-tools valac libgtk-layer-shell-dev \
feh dunst mpd ncmpcpp ranger playerctl papirus-icon-theme \
libx11-dev libxft-dev libxinerama-dev \
libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev \
cmake-data python3-sphinx libcairo2-dev libxcb1-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev \
libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev)
dependencies_apt_repo=(ppa:papirus/papirus)
dependencies_tap_brew=(pungrumpy/formulas spicetify/homebrew-tap oven-sh/bun)
dependencies_brew=(git gcc \
fish tmux neovim starship spiceify-cli \
peco exa dockercolorize \
python3 pyenv go node pnpm bun \
fzf fd bat hub)
dependencies_fisher=(jethrokuan/z PatrickF1/fzf.fish nickeb96/puffer-fish laughedelic/pisces danhper/fish-ssh-agent)


aptIsInstalled() {
    if apt list --installed 2>/dev/null | grep -q "^$1/"; then
        return 0
    else
        return 1
    fi
}

brewIsInstalled() {
    if brew list 2>/dev/null | grep -q "^$1\$"; then
        return 0
    else
        return 1
    fi
}

banner "📦 Installing dependencies..."

echo -e "${BOLD}${YELLOW}Installing missing dependencies using ${RED}apt${RESET}${BOLD}${YELLOW}...${RESET}\n"

for i in "${dependencies_apt_repo[@]}"; do
    if ! apt-cache policy | grep -q "$i"; then
        echo -e "${YELLOW}⏳ Adding $i...${RESET}"
        sudo add-apt-repository "$i"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $i added${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $i not added${RESET}"
            sleep 1
        fi
    else
        echo -e "${GREEN}✔️ $i already added${RESET}"
    fi
done

for i in "${dependencies_apt[@]}"; do
    if ! aptIsInstalled "$i"; then
        echo -e "${YELLOW}⏳ Installing $i...${RESET}"
        sudo apt install "$i" -y
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $i installed${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $i not installed${RESET}"
            sleep 1
        fi
    else
        echo -e "${GREEN}✔️ $i already installed${RESET}"
    fi
done

sleep 2
clear

banner "📦 Installing dependencies..."

echo -e "\n${BOLD}${YELLOW}Installing missing dependencies using ${RED}brew${RESET}${BOLD}${YELLOW}${RESET}\n"

for i in "${dependencies_tap_brew[@]}"; do
    if ! brew tap | grep -q "$i"; then
        echo -e "${YELLOW}⏳ Tapping $i...${RESET}"
        brew tap "$i"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $i tapped${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $i not tapped${RESET}"
            sleep 1
        fi
    else
        echo -e "${GREEN}✔️ $i already tapped${RESET}"
    fi
done

for i in "${dependencies_brew[@]}"; do
    if ! brewIsInstalled "$i"; then
        echo -e "${YELLOW}⏳ Installing $i...${RESET}"
        brew install "$i"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $i installed${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $i not installed${RESET}"
            sleep 1
        fi
    else
        echo -e "${GREEN}✔️ $i already installed${RESET}"
    fi
done

sleep 2
clear

###### ----- Setting up Snap ----- ######
banner "📦 Setting up Snap..."

if ! command -v snap >/dev/null; then
    echo -e "${YELLOW}⏳ Setting up Snap...${RESET}"
    sudo systemctl enable snapd
    sudo systemctl start snapd
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Snap setted up${RESET}"
    else
        echo -e "${RED}✖️ Snap not setted up${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Snap already setted up${RESET}"
    sleep 1
fi

###### ----- Installing Direnv ----- ######
banner "📦 Installing Direnv..."

if ! command -v direnv >/dev/null; then
    echo -e "${YELLOW}⏳ Installing Direnv...${RESET}"
    sudo curl -sfL https://direnv.net/install.sh | bash
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Direnv installed${RESET}"
    else
        echo -e "${RED}✖️ Direnv not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Direnv already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing BSPC ----- ######
banner "📦 Installing BSPC..."

if ! command -v bspc >/dev/null; then
    echo -e "${YELLOW}⏳ Installing BSPC...${RESET}"
    git clone "$BSPC_URL" "$HOME/.bspc"
    cd "$HOME/.bspc" || exit
    make
    sudo make install
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ BSPC installed${RESET}"
    else
        echo -e "${RED}✖️ BSPC not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ BSPC already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing Application with Flatpak ----- ######
banner "📦 Installing Application with Flatpak..."

flatpakIsInstalled() {
    if flatpak list 2>/dev/null | grep -q "^$1\$"; then
        return 0
    else
        return 1
    fi
}

flatpakRepoIsInstalled() {
    if flatpak remotes 2>/dev/null | grep -q "^$1\$"; then
        return 0
    else
        return 1
    fi
}

flatpakRepoAdd() {
    if ! flatpakRepoIsInstalled "$1"; then
        echo -e "${YELLOW}⏳ Adding $1...${RESET}"
        flatpak remote-add --if-not-exists "$1" "$2"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $1 added${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $1 not added${RESET}"
            sleep 1
        fi
    else
        echo -e "${GREEN}✔️ $1 already added${RESET}"
    fi
}

flatpakInstall() {
    if ! flatpakIsInstalled "$1"; then
        echo -e "${YELLOW}⏳ Installing $1...${RESET}"
        flatpak install "$1" -y
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $1 installed${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $1 not installed${RESET}"
            sleep 1
        fi
    else
        echo -e "${GREEN}✔️ $1 already installed${RESET}"
    fi
}

flatpakRun() {
    if flatpakIsInstalled "$1"; then
        echo -e "${YELLOW}⏳ Running $1...${RESET}"
        flatpak run "$1"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $1 running${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $1 not running${RESET}"
            sleep 1
        fi
    else
        echo -e "${RED}✖️ $1 not installed${RESET}"
    fi
}

flatpakRepoAdd flathub https://flathub.org/repo/flathub.flatpakrepo
flatpakInstall com.raggesilver.BlackBox
flatpakInstall com.spotify.Client

sleep 2

flatpakRun com.raggesilver.BlackBox
flatpakRun com.spotify.Client

sleep 2
clear

###### ----- Installing Application ----- ######

banner "📦 Installing Application..."

read -rp "⚠️ Do you want to install Visual Studio Code? [Y/n] " yn
    case $yn in
        [Yy]* ) wget $VSCOED_DEB_URL -O $HOME/Downloads/vscode.deb
                sudo dpkg -i $HOME/Downloads/vscode.deb
                rm -rf $HOME/Downloads/vscode.deb
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Visual Studio Code installed${RESET}"
                else
                    echo -e "${RED}✖️ Visual Studio Code not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

read -rp "⚠️ Do you want to install Discord? [Y/n] " yn
    case $yn in
        [Yy]* ) wget $DISCORD_DEB_URL -O $HOME/Downloads/discord.deb
                sudo dpkg -i $HOME/Downloads/discord.deb
                rm -rf $HOME/Downloads/discord.deb
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Discord installed${RESET}"
                else
                    echo -e "${RED}✖️ Discord not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

read -rp "⚠️ Do you want to install Google Chrome? [Y/n] " yn
    case $yn in
        [Yy]* ) wget $GOOGLECHROME_DEB_URL -O $HOME/Downloads/google-chrome.deb
                sudo dpkg -i $HOME/Downloads/google-chrome.deb
                rm -rf $HOME/Downloads/google-chrome.deb
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Google Chrome installed${RESET}"
                else
                    echo -e "${RED}✖️ Google Chrome not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

sleep 2
clear

###### ----- Installing Docker Desktop ----- ######
banner "📦 Installing Docker Desktop..."

read -rp "⚠️ Do you want to install Docker Desktop? [Y/n] " yn
    case $yn in
        [Yy]* ) curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
                echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list
                sudo systemctl start docker
                sudo usermod -aG docker $USER
                wget $DOCKER_DESKTOP_URL -O $HOME/Downloads/docker-desktop.deb
                sudo apt install $HOME/Downloads/docker-desktop.deb
                rm -rf $HOME/Downloads/docker-desktop.deb
                systemctl --user start docker-desktop
                systemctl --user enable docker-desktop
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Docker Desktop installed${RESET}"
                else
                    echo -e "${RED}✖️ Docker Desktop not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

###### ----- Installing XFCE4 Orchis Theme ----- ######
banner "🖼️ Installing XFCE4 Orchis Theme..."

read -rp "⚠️ Do you want to install XFCE4 Orchis Theme? [Y/n] " yn
    case $yn in
        [Yy]* ) git clone $ORCHIS_THEME_SSH_URL $HOME/.orchis-theme || git clone $ORCHIS_THEME_URL $HOME/.orchis-theme
                cd $HOME/.orchis-theme
                chmod +x ./install.sh
                ./install.sh --tweaks --tweaks macos --round 3
                sleep 3
                cd $HOME
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ XFCE4 Orchis Theme installed${RESET}"
                else
                    echo -e "${RED}✖️ XFCE4 Orchis Theme not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

sleep 2
clear

###### ----- Installing Firefox theme ----- ######
banner "🖼️ Installing Firefox theme..."

read -rp "⚠️ Do you want to install Firefox theme? [Y/n] " yn
    case $yn in
        [Yy]* ) git clone $FIREFOX_THEME_SSH_URL $HOME/.firefox-theme || git clone $FIREFOX_THEME_URL $HOME/.firefox-theme
                cd $HOME/.firefox-theme
                ./install.sh
                sleep 3
                cd $HOME
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Firefox theme installed${RESET}"
                else
                    echo -e "${RED}✖️ Firefox theme not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

sleep 2
clear

###### ----- Installing WhiteSur Icon Theme ----- ######
banner "🖼️ Installing WhiteSur Icon Theme..."

read -rp "⚠️ Do you want to install WhiteSur Icon Theme? [Y/n] " yn
    case $yn in
        [Yy]* ) git clone $WHITESUR_ICONS_THEME_SSH_URL $HOME/.whitesur-icons-theme || git clone $WHITESUR_ICONS_THEME_URL $HOME/.whitesur-icons-theme
                cd $HOME/.whitesur-icons-theme
                chmod +x ./install.sh
                ./install.sh
                sleep 3
                cd $HOME
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ WhiteSur Icon Theme installed${RESET}"
                else
                    echo -e "${RED}✖️ WhiteSur Icon Theme not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

sleep 2
clear

###### ----- Installing macOS Mouse Cursor ----- ######
banner "🖼️ Installing macOS Mouse Cursor..."

read -rp "⚠️ Do you want to install macOS Mouse Cursor? [Y/n] " yn
    case $yn in
        [Yy]* ) wget $MACOS_MOUSE_URL -O $HOME/Downloads/macos-mouse.tar.gz
                tar -xvf $HOME/Downloads/macos-mouse.tar.gz
                sudo mv $HOME/Downloads/macos-mouse /usr/share/icons
                rm -rf $HOME/.macos-mouse.tar.gz
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ macOS Mouse Cursor installed${RESET}"
                else
                    echo -e "${RED}✖️ macOS Mouse Cursor not installed${RESET}"
                fi
                sleep 1;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

###### ----- Installing Grub DedSec Theme ----- ######
banner "🖼️ Installing Grub DedSec Theme..."

read -rp "⚠️ Do you want to install Grub DedSec Theme? [Y/n] " yn
    case $yn in
        [Yy]* ) if ! [[ -d $HOME/.grub-themes/dedsec-grub-theme ]]; then
                    mkdir -p $HOME/.grub-themes
                    git clone $GRUB_DEDSEC_THEME_URL $HOME/.grub-themes/dedsec-grub-theme
                    cd $HOME/.grub-themes/dedsec-grub-theme
                    sudo python3 dedsec-theme.py --install
                    sleep 3
                    cd $HOME
                    if [ $? -eq 0 ]; then
                        echo -e "${GREEN}✔️ Grub DedSec Theme installed${RESET}"
                    else
                        echo -e "${RED}✖️ Grub DedSec Theme not installed${RESET}"
                    fi
                    sleep 1
                else
                    echo -e "${GREEN}✔️ Grub DedSec Theme already installed${RESET}"
                    sleep 1
                fi;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

###### ----- Installing commitizen ----- ######
banner "📦 Installing commitizen..."

if ! command -v cz >/dev/null; then
    echo -e "${YELLOW}⏳ Installing commitizen...${RESET}"
    npm install -g cz-emoji commitizen
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ commitizen installed${RESET}"
    else
        echo -e "${RED}✖️ commitizen not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ commitizen already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing Spicetify ----- ######
banner "🎶 Installing Spicetify..."

if -d $HOME/.config/spicetify; then
    echo -e "${YELLOW}⏳ Installing Spicetify...${RESET}"
    curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Spicetify installed${RESET}"
    else
        echo -e "${RED}✖️ Spicetify not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Spicetify already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing Packer ----- ######
banner "📦 Installing Packer..."

if ! -d "$HOME/.local/share/nvim/site/pack/packer"; then
    echo -e "${YELLOW}⏳ Installing Packer...${RESET}"
    git clone "$PACKER_URL" "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Packer installed${RESET}"
    else
        echo -e "${RED}✖️ Packer not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Packer already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Setting up Docker ----- ######
banner "🐋 Setting up Docker..."

if ! systemctl status docker >/dev/null; then
    echo -e "${YELLOW}⏳ Installing Docker...${RESET}"
    sudo groupadd docker
    sudo usermod -aG docker "$USER"
    newgrp docker
    sudo systemctl enable docker
    sudo systemctl start docker
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Docker running${RESET}"
    else
        echo -e "${RED}✖️ Docker not running${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Docker already running${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Setting up SSH for GitHub ----- ######
banner "🔑 Setting up SSH for GitHub..."

if [[ -d "$HOME/.ssh" ]]; then
    echo -e "${GREEN}✔️ .ssh folder already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating .ssh folder...${RESET}"
    mkdir -p "$HOME/.ssh"
    echo -e "${GREEN}✔️ .ssh folder created${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.ssh/id_ed25519_github" ]]; then
    echo -e "${GREEN}✔️ SSH key already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating SSH key...${RESET}"
    read -rp "✒️ Enter your email: " email
    read -rp "✒️ Enter your file name: " file_name
    ssh-keygen -t ed25519 -C "$email" -f "$HOME/.ssh/$file_name"
    echo -e "${GREEN}✔️ SSH key created${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.ssh/config" ]]; then
    echo -e "${GREEN}✔️ SSH config already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating SSH config...${RESET}"
    touch "$HOME/.ssh/config"
    echo -e "Host github.com\n\tHostName github.com\n\tUser git\n\tIdentityFile ~/.ssh/$file_name\n\tAddKeysToAgent yes" >> "$HOME/.ssh/config"
    echo -e "${GREEN}✔️ SSH config created${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.ssh/$file_name.pub" ]]; then
    echo -e "${GREEN}✔️ SSH public key already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating SSH public key...${RESET}"
    cat "$HOME/.ssh/$file_name.pub" | xclip -selection clipboard
    echo -e "${YELLOW}⚠️ SSH public key copied to clipboard (Don't forget to add it to your GitHub account)${RESET}"
    sleep 1
    echo -e "${GREEN}✔️ SSH public key created${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Clone dotfiles ----- ######
banner "📂 Cloning dotfiles..."

is_exist=0

if [[ -d $DOTFILE_DIR ]]; then
    echo -e "${GREEN}✔️ Dotfiles already cloned${RESET}"
    read -rp "⚠️ Do you want to delete the existing dotfiles? [Y/n] " yn
        case $yn in
            [Yy]* ) rm -rf $DOTFILE_DIR && echo -e "\n${GREEN}✔️ Dotfiles deleted${RESET}\n" && is_exist=1;;
            [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n" && is_exist=0;;
            * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
        esac
else
    echo -e "${RED}✖️ Dotfiles not cloned${RESET}"
    is_exist=1
fi

if [[ "$is_exist" -eq 1 ]]; then
    echo -e "${YELLOW}⏳ Cloning dotfiles...${RESET}"
    git clone "$DOTFILE_SSH_URL" $DOTFILE_DIR || git clone "$DOTFILE_URL" $DOTFILE_DIR
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Dotfiles cloned${RESET}"
        sleep 1
    else
        echo -e "${RED}✖️ Dotfiles not cloned${RESET}"
        sleep 1
    fi
fi

sleep 2
clear

###### ----- Edit GIT config ----- ######
banner "📝 Editing GIT config..."

is_git_config=0

read -rp "⚠️ Do you want to edit your GIT config? [Y/n] " yn
    case $yn in
        [Yy]* ) is_git_config=1;;
        [Nn]* ) is_git_config=0;;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

if [[ "$is_git_config" -eq 1 ]]; then
    read -rp "✒️ Enter your GIT username: " username && sed -i "2s/.*/\tuser = $username/" "$HOME/.gitconfig"
    read -rp "✒️ Enter your GIT name: " name && sed -i "4s/.*/\tname = $name/" "$HOME/.gitconfig"
    read -rp "✒️ Enter your GIT email: " email && sed -i "5s/.*/\temail = $email/" "$HOME/.gitconfig"
    read -rp "✒️ Enter your GIT author: " author && sed -i "7s/.*/\tauthor = $author/" "$HOME/.gitconfig"
else
    echo -e "\n${GREEN}✔️ Skipping...${RESET}\n"
fi

printf '\n%s%sYour GIT config has been updated.%s\n\n' "${BOLD}" "${GREEN}" "${RESET}"

sleep 2
clear

###### ----- Backup ----- ######
banner "📦 Creating backup..."

if [[ -d "$HOME/.backup_dotfiles" ]]; then
    echo -e "${GREEN}✔️ Backup folder already created${RESET}"
else
    echo -e "${YELLOW}⏳ Creating backup folder...${RESET}"
    mkdir -p "$HOME/.backup_dotfiles/$DATE"
    echo -e "${GREEN}✔️ Backup folder created${RESET}"
fi

cp -R "$HOME/.config" "$HOME/.backup_dotfiles/$DATE" && echo -e "${GREEN}✔️ .config copied${RESET}" || echo -e "${RED}✖️ .config not copied${RESET}"
cp -R "$HOME/.czrc" "$HOME/.backup_dotfiles/$DATE" && echo -e "${GREEN}✔️ .czrc copied${RESET}" || echo -e "${RED}✖️ .czrc not copied${RESET}"
cp -R "$HOME/.gitconfig" "$HOME/.backup_dotfiles/$DATE" && echo -e "${GREEN}✔️ .gitconfig copied${RESET}" || echo -e "${RED}✖️ .gitconfig not copied${RESET}"
cp -R "$HOME/.gitignore" "$HOME/.backup_dotfiles/$DATE" && echo -e "${GREEN}✔️ .gitignore copied${RESET}" || echo -e "${RED}✖️ .gitignore not copied${RESET}"
cp -R "$HOME/.docker" "$HOME/.backup_dotfiles/$DATE" && echo -e "${GREEN}✔️ .docker copied${RESET}" || echo -e "${RED}✖️ .docker not copied${RESET}"

sleep 2
clear

###### ----- Remove old files ----- ######
banner "🗑️ Removing old files..."

removing() {
    local file="${1:?}"

    if [[ -d "$file" ]]; then
        echo -e "${YELLOW}⏳ Removing old $file...${RESET}"
        sudo rm -rf "$file" && echo -e "${GREEN}✔️ $file removed${RESET}" || echo -e "${RED}✖️ $file not removed${RESET}"
        sleep 1
    else
        echo -e "${GREEN}✔️ $file already removed${RESET}"
        sleep 1
    fi
}

for file in $HOME/.config $HOME/.czrc $HOME/.gitconfig $HOME/.gitignore $HOME/.docker; do # $HOME/.zshrc
    if [[ -d "$file" ]]; then
        removing "$file"
    else
        echo -e "${GREEN}✔️ $file already removed${RESET}"
        sleep 1
    fi
done

sleep 2
clear

###### ----- Linking files ----- ######
linking() {
    local file="${1:?}"
    local dest="${2:?}"

    if [[ -f "$dest" ]]; then
        echo -e "${GREEN}✔️ $file already linked${RESET}"
        read -rp "⚠️ Do you want to delete the existing $file? [Y/n] " yn
        case $yn in
            [Yy]* ) rm -rf "$dest" ;;
            [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n" ;;
            * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n" ;;
        esac
    else
        echo -e "${YELLOW}⏳ Linking $file...${RESET}"
        sudo ln -sf "$file" "$dest"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✔️ $file linked${RESET}"
            sleep 1
        else
            echo -e "${RED}✖️ $file not linked${RESET}"
            echo -e "${YELLOW}⚠️ if error 'File exists' please delete the existing $file${RESET}"
            sleep 1
        fi
        sleep 1
    fi
}

banner "🔗 Linking files..."

for file in $DOTFILE_DIR/.config $DOTFILE_DIR/.gitignore $DOTFILE_DIR/.gitconfig $DOTFILE_DIR/.czrc; do # $DOTFILE_DIR/.zshrc
    if [[ "$file" == "$DOTFILE_DIR/.config/warp-terminal" ]]; then
        continue
    fi
    linking "$file" .
    sleep 1
done

sleep 2
clear

###### ----- Copying files ----- ######
banner "📂 Copying files..."

echo "Don't forget copy file from $DOTFILE_DIR/.config/blackbox/dullahan.json to Blackbox config (if you use flatpak $HOME/.var/app/com.raggesilver.BlackBox/data/blackbox/schemes/dullahan.json)"
sleep 3

echo "Don't forget copy file from $DOTFILE_DIR/.config/warp-terminal to Warp Terminal config (if you use default Warp Terminal $HOME/.local/share/warp-terminal)"
sleep 3

read -rp "🖼️ Do you want to copy wallpaper to /usr/share/backgrounds/grumpy? [Y/n] " yn
    case $yn in
        [Yy]* ) if ! [[ -d "/usr/share/backgrounds/grumpy" ]]; then
                    echo -e "${YELLOW}⏳ Creating /usr/share/backgrounds/grumpy...${RESET}"
                    sudo mkdir -p "/usr/share/backgrounds/grumpy"
                    echo -e "${GREEN}✔️ /usr/share/backgrounds/grumpy created${RESET}"
                    sleep 1
                else
                    echo -e "${GREEN}✔️ /usr/share/backgrounds/grumpy already created${RESET}"
                    sleep 1
                fi
                sudo cp -R $DOTFILE_DIR/.github/wallpaper/* /usr/share/backgrounds/grumpy
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Wallpaper copied${RESET}"
                else
                    echo -e "${RED}✖️ Wallpaper not copied${RESET}"
                fi;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

read -rp "🖼️ Do you want to copy themes to /usr/share/themes? [Y/n] " yn
    case $yn in
        [Yy]* ) sudo cp -R $HOME/.themes/* /usr/share/themes/
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Themes copied${RESET}"
                else
                    echo -e "${RED}✖️ Themes not copied${RESET}"
                fi;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

read -rp "🖼️ Do you want to copy icons to /usr/share/icons? [Y/n] " yn
    case $yn in
        [Yy]* ) sudo cp -R $HOME/.local/share/icons/* /usr/share/icons/
                if [ $? -eq 0 ]; then
                    echo -e "${GREEN}✔️ Icons copied${RESET}"
                else
                    echo -e "${RED}✖️ Icons not copied${RESET}"
                fi;;
        [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n";;
        * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
    esac

sleep 2
clear

###### ----- Setting up docker config ----- ######
banner "🐳 Setting up docker config..."

if [[ -d "$HOME/.docker" ]]; then
    echo -e "${GREEN}✔️ .docker folder already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating .docker folder...${RESET}"
    mkdir -p "$HOME/.docker"
    echo -e "${GREEN}✔️ .docker folder created${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.docker/config.json" ]]; then
    echo -e "${GREEN}✔️ .docker/config.json already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating .docker/config.json...${RESET}"
    touch "$HOME/.docker/config.json"
    echo -e "${GREEN}✔️ .docker/config.json created${RESET}"
    sleep 1
fi

if [[ -f "$HOME/.docker/config.json" ]]; then
    echo -e "${YELLOW}⏳ Adding docker config...${RESET}"
    echo -e "{\n\t\"psFormat\": \"table {{.ID}}\\\\t{{.Names}}\\\\t{{.Image}}\\\\t{{.RunningFor}}\\\\t{{.Status}}\"\n}" > "$HOME/.docker/config.json"
    echo -e "${GREEN}✔️ Docker config added${RESET}"
    sleep 1
else
    echo -e "${RED}✖️ .docker/config.json not found${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Enable MPD Service ----- ######
banner "🎵 Enabling MPD Service..."

mpd_conf="$DOTFILE_DIR/.config/mpd/mpd.conf"

if [[ -f $mpd_conf ]]; then
    echo -e "${YELLOW}⏳ Enabling MPD Service...${RESET}"
    systemctl --user enable mpd.service && systemctl --user start mpd.service
    echo -e "${GREEN}✔️ MPD Service enabled${RESET}"
    sleep 1
else
    echo -e "${RED}✖️ $mpd_conf not found${RESET}"
    sleep 1
    exit 1
fi

sleep 2
clear

###### ----- Change shell ----- ######
banner "🔀 Changing shell..."

if [[ "$SHELL" != "/home/linuxbrew/.linuxbrew/bin/fish" ]]; then
    echo -e "${YELLOW}⏳ Changing shell...${RESET}"
    chsh -s /home/linuxbrew/.linuxbrew/bin/fish
    echo -e "${GREEN}✔️ Shell changed${RESET}"
    $SHELL -l
    sleep 1
else
    echo -e "${GREEN}✔️ Shell already changed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing Fisher ----- ######
banner "📦 Installing Fisher..."

if ! command -v fisher >/dev/null; then
    echo -e "${YELLOW}⏳ Installing Fisher...${RESET}"
    curl -sL $FISHER_URL | source && fisher install jorgebucaran/fisher
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Fisher installed${RESET}"
    else
        echo -e "${RED}✖️ Fisher not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ Fisher already installed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Use fisher install plugin ----- ######
banner "🔌 Installing fisher plugins..."

for plugin in $dependencies_fisher; do
    echo -e "${YELLOW}⏳ Installing $plugin...${RESET}"
    fisher install $plugin
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ $plugin installed${RESET}"
    else
        echo -e "${RED}✖️ $plugin not installed${RESET}"
    fi
    sleep 1
done

sleep 2
clear

###### ----- Installing fonts ----- ######
banner "🔠 Installing fonts..."

if [[ -d "$HOME/.local/share/fonts" ]]; then
    echo -e "${GREEN}✔️ Fonts folder already created${RESET}"
    sleep 1
else
    echo -e "${YELLOW}⏳ Creating fonts folder...${RESET}"
    mkdir -p "$HOME/.local/share/fonts"
    echo -e "${GREEN}✔️ Fonts folder created${RESET}"
    sleep 1
fi

echo -e "${YELLOW}⏳ Installing Hack font...${RESET}"
curl -L "$FONT_HACK_URL" -o "$HOME/.local/share/fonts/Hack.tar.xz"
tar -xf "$HOME/.local/share/fonts/Hack.tar.xz" -C "$HOME/.local/share/fonts"
rm -rf "$HOME/.local/share/fonts/Hack.tar.xz"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ Hack font installed${RESET}"
else
    echo -e "${RED}✖️ Hack font not installed${RESET}"
fi

echo -e "${YELLOW}⏳ Installing JetBrains Mono font...${RESET}"
curl -L "$FONT_JETBRAINS_URL" -o "$HOME/.local/share/fonts/JetBrainsMono.tar.xz"
tar -xf "$HOME/.local/share/fonts/JetBrainsMono.tar.xz" -C "$HOME/.local/share/fonts"
rm -rf "$HOME/.local/share/fonts/JetBrainsMono.tar.xz"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ JetBrains Mono font installed${RESET}"
else
    echo -e "${RED}✖️ JetBrains Mono font not installed${RESET}"
fi

echo -e "${YELLOW}⏳ Installing Font Awesome font...${RESET}"
curl -L "$FONT_AWESOME_URL" -o "$HOME/.local/share/fonts/FontAwesome6-Free-Solid.otf"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ Font Awesome font installed${RESET}"
else
    echo -e "${RED}✖️ Font Awesome font not installed${RESET}"
fi

echo -e "${YELLOW}⏳ Installing Material Design Icons font...${RESET}"
curl -L "$FONT_MATERIAL_DESIGN_URL" -o "$HOME/.local/share/fonts/MaterialDesignIconsDesktop.ttf"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ Material Design Icons font installed${RESET}"
else
    echo -e "${RED}✖️ Material Design Icons font not installed${RESET}"
fi

echo -e "${YELLOW}⏳ Installing Hack NF Compatible font...${RESET}"
if [ ! -d "/usr/share/fonts/HackNFCompatiple" ]; then
    sudo mkdir -p "/usr/share/fonts/HackNFCompatiple"
fi
sudo cp -r "$DOTFILE_DIR/fonts/HackNFCompatiple/*" "/usr/share/fonts/HackNFCompatiple"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ Hack NF Compatible font installed${RESET}"
else
    echo -e "${RED}✖️ Hack NF Compatible font not installed${RESET}"
fi

echo -e "${YELLOW}⏳ Installing Noto sans font...${RESET}"
if [ ! -d "/usr/share/fonts/noto-sans" ]; then
    sudo mkdir -p "/usr/share/fonts/noto-sans"
fi
sudo curl -L "$FONT_NOTO_SANS_URL" -o "/usr/share/fonts/noto-sans.zip"
sudo unzip "/usr/share/fonts/noto-sans.zip" -d "/usr/share/fonts/noto-sans"
sudo rm -rf "/usr/share/fonts/noto-sans.zip"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ Noto sans font installed${RESET}"
else
    echo -e "${RED}✖️ Noto sans font not installed${RESET}"
fi

echo -e "${YELLOW}⏳ Installing Noto sans thai font...${RESET}"
if [ ! -d "/usr/share/fonts/noto-sans-thai" ]; then
    sudo mkdir -p "/usr/share/fonts/noto-sans-thai"
fi
sudo curl -L "$FONT_NOTO_SANS_THAI_URL" -o "/usr/share/fonts/noto-sans-thai.zip"
sudo unzip "/usr/share/fonts/noto-sans-thai.zip" -d "/usr/share/fonts/noto-sans-thai"
sudo rm -rf "/usr/share/fonts/noto-sans-thai.zip"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✔️ Noto sans thai font installed${RESET}"
else
    echo -e "${RED}✖️ Noto sans thai font not installed${RESET}"
fi

sleep 2
clear

###### ----- Thank you ----- ######
banner "👋 Thank you for using my script!"

printf '%s%sYour dotfiles have been installed.%s\n\n' "${BOLD}" "${GREEN}" "${RESET}"

printf '%s%sPlease restart your computer to apply all changes.%s\n\n' "${BOLD}" "${RED}" "${RESET}"

if [[ "$SHELL" != "/home/linuxbrew/.linuxbrew/bin/fish" ]]; then
    printf '%s%sPlease restart your terminal to apply the new shell.%s\n\n' "${BOLD}" "${RED}" "${RESET}"
fi

sleep 4
clear

###### ----- Restart ----- ######
banner "🔄 Restarting..."

while true; do
    read -rp "⚠️ Do you want to restart now? [Y/n] " yn
        case $yn in
            [Yy]* ) echo -e "\n${GREEN}✔️ Restarting...${RESET}\n" && sudo reboot && break;;
            [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n" && break;;
            * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
        esac
done

sleep 2
clear

###### ----- Logout ----- ######
banner "🚪 Logging out..."

if [[ "$is_restart" -eq 0 ]]; then
    while true; do
        read -rp "⚠️ Do you want to logout now? [Y/n] " yn
            case $yn in
                [Yy]* ) echo -e "\n${GREEN}✔️ Logging out...${RESET}\n" && sudo pkill -KILL -u "$USER" && break;;
                [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n" && break;;
                * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
            esac
    done
fi

sleep 2
clear

exit 0

##############################################################################################################
