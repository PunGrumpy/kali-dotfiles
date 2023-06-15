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
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts.git"
BSPC_URL="https://github.com/bnoordhuis/bspc.git"

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
printf '%s%sThis script will check if you have the %s%sKALI LINUX%s %s%sneccessary dependencies, and if not, it will install them. Then, it will clone the RICE in your HOME directory.\nAfter that, it will create a secure backup of your files, and then copy the new files to your computer.\n\nMy dotfiles DO NOT modify any of your system configurations.\nYou will be prompted for your root password to install missing dependencies and/or to switch to zsh shell if its not your default.\n\nThis script doesnt have the potential power to break your system, it only copies files from my repository to your HOME directory.%s\n\n' "${BOLD}" "${RED}" "${PURPLE}" "${BEEP}" "${RESET}" "${BOLD}" "${RED}" "${RESET}"

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

###### ----- Checking internet connection ----- ######
banner "🌐 Checking internet connection..."

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
    source /home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null
elif [[ -f "$HOME/.zshrc" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv) 2>/dev/null"
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

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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
    sudo source "$HOME/.cargo/env" 2>/dev/null
elif [[ -f "$HOME/.zshrc" ]]; then
    sudo eval "$("$HOME/.cargo/env")" 2>/dev/null
fi

sleep 2
clear

###### ----- Updating system ----- ######
banner "📦 Updating system..."

if [[ -x "$(command -v apt)" ]]; then
    sudo apt update && sudo apt upgrade -y
    sleep 1
elif [[ -x "$(command -v pacman)" ]]; then
    sudo pacman -Syu
    sleep 1
elif [[ -x "$(command -v dnf)" ]]; then
    sudo dnf update -y
    sleep 1
elif [[ -x "$(command -v zypper)" ]]; then
    sudo zypper update -y
    sleep 1
elif [[ -x "$(command -v yum)" ]]; then
    sudo yum update -y
    sleep 1
elif [[ -x "$(command -v brew)" ]]; then
    brew update && brew upgrade
    sleep 1
elif [[ -x "$(command -v cargo)" ]]; then
    cargo update
    sleep 1
else
    echo -e "${RED}✖️ System not updated${RESET}"
    sleep 1
fi

echo -e "${GREEN}✔️ System updated${RESET}"
sleep 2
clear

###### ----- Installing dependencies ----- ######
dependencies_apt=(curl wget zsh neofetch build-essential alacritty jq \
cmake libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev xclip pkg-config \
libgtk-3-dev librust-atk-dev meson libwayland-dev gobject-introspection libgirepository1.0-dev gtk-doc-tools valac libgtk-layer-shell-dev \
bspwm sxhkd polybar rofi picom feh dunst mpd ncmpcpp ranger \
libx11-dev libxft-dev libxinerama-dev \
libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev \
cmake-data python3-sphinx libcairo2-dev libxcb1-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev \
libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev)
dependencies_tap_brew=(pungrumpy/formulas)
dependencies_brew=(git gcc \
tmux neovim starship antibody docker \
peco exa dockercolorize \
python3 pyenv go node pnpm \
fzf fd bat hub)

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

###### ----- Installing black box ----- ######
banner "📦 Installing black box..."

if ! command -v blackbox >/dev/null; then
    flatpak install flathub com.raggesilver.BlackBox
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ black box installed${RESET}"
    else
        echo -e "${RED}✖️ black box not installed${RESET}"
    fi
    sleep 1
else
    echo -e "${GREEN}✔️ black box already installed${RESET}"
    sleep 1
fi

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

sleep 2
clear

###### ----- Remove old files ----- ######
banner "🗑️ Removing old files..."

if [[ -d "$HOME/.config" ]]; then
    echo -e "${YELLOW}⏳ Removing old .config...${RESET}"
    sudo rm -rf "$HOME/.config" && echo -e "${GREEN}✔️ .config removed${RESET}" || echo -e "${RED}✖️ .config not removed${RESET}"
    sleep 1
else
    echo -e "${GREEN}✔️ .config already removed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Clone dotfiles ----- ######
banner "📂 Cloning dotfiles..."

is_exist=0

if [[ -d "$HOME/.dotfiles" ]]; then
    echo -e "${GREEN}✔️ Dotfiles already cloned${RESET}"
    read -rp "⚠️ Do you want to delete the existing dotfiles? [Y/n] " yn
        case $yn in
            [Yy]* ) rm -rf "$HOME/.dotfiles" && echo -e "\n${GREEN}✔️ Dotfiles deleted${RESET}\n" && is_exist=1;;
            [Nn]* ) echo -e "\n${GREEN}✔️ Skipping...${RESET}\n" && is_exist=0;;
            * ) echo -e "\n${RED}⚠️ Please answer 'y' or 'n'.${RESET}\n";;
        esac
else
    echo -e "${RED}✖️ Dotfiles not cloned${RESET}"
    is_exist=1
fi

if [[ "$is_exist" -eq 1 ]]; then
    echo -e "${YELLOW}⏳ Cloning dotfiles...${RESET}"
    git clone "$DOTFILE_URL" "$HOME/.dotfiles"
    echo -e "${GREEN}✔️ Dotfiles cloned${RESET}"
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
            sleep 1
        fi
        sleep 1
    fi
}

banner "🔗 Linking files..."

DOTFILE_DIR="$HOME/.dotfiles"

echo -e "${BOLD}${YELLOW}Linking dotfiles...${RESET}\n"
if [[ -d "$HOME/.dotfiles" ]]; then
    for file in $DOTFILE_DIR/.config $DOTFILE_DIR/.zshrc $DOTFILE_DIR/.gitignore $DOTFILE_DIR/.gitconfig; do
            linking "$file" "$HOME"
            sleep 1
    done
else
    echo -e "${RED}✖️ Dotfiles not cloned${RESET}"
    exit 1
fi

sleep 2
clear

###### ----- Change window manager ----- ######
banner "🖥️ Changing window manager..."

read -rp "⚠️ Do you want to change your window manager? [Y/n] " yn
    case $yn in
        [Yy]* ) if [[ -f "$HOME/.dotfiles/.config/bspwm/bspwmrc" ]]; then
                    echo -e "${YELLOW}⏳ Changing window manager...${RESET}"
                    sudo update-alternatives --set x-window-manager /usr/bin/bspwm
                    echo -e "${GREEN}✔️ Window manager changed${RESET}"
                else
                    echo -e "${RED}✖️ .dotfiles/.config/bspwm/bspwmrc not found${RESET}"
                    exit 1
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

###### ----- Use antibody to install plugins ----- ######
banner "🔌 Installing antibody plugins..."

if [[ -f "$HOME/.dotfiles/.config/zsh/plugins.zsh" ]]; then
    echo -e "${YELLOW}⏳ Installing antibody plugins...${RESET}"
    antibody bundle < ~/.dotfiles/.config/zsh/plugins.zsh > ~/.zsh_plugins.zsh
    echo -e "${GREEN}✔️ Antibody plugins installed${RESET}"
    sleep 1
else
    echo -e "${RED}✖️ .dotfiles/.config/zsh/plugins.zsh not found${RESET}"
    sleep 1
    exit 1
fi

sleep 2
clear

###### ----- Enable MPD Service ----- ######
banner "🎵 Enabling MPD Service..."

mpd_conf="$HOME/.dotfiles/.config/mpd/mpd.conf"

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

if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
    echo -e "${YELLOW}⏳ Changing shell...${RESET}"
    chsh -s /usr/bin/zsh
    echo -e "${GREEN}✔️ Shell changed${RESET}"
    sleep 1
else
    echo -e "${GREEN}✔️ Shell already changed${RESET}"
    sleep 1
fi

sleep 2
clear

###### ----- Installing fonts ----- ######
banner "🔠 Installing fonts..."

if [[ -f "$HOME/.local/share/fonts/Hack Nerd Font Complete.ttf" ]]; then
    echo -e "${GREEN}✔️ Hack Nerd Font already installed${RESET}"
else
    if [[ -d "$HOME/.nerd-fonts" ]]; then
        echo -e "${GREEN}✔️ nerd-fonts already cloned${RESET}"
    else
        echo -e "${RED}✖️ nerd-fonts not cloned${RESET}"
        git clone "$NERD_FONT_URL" "$HOME/.nerd-fonts"
        exit 1
    fi
    cd "$HOME/.nerd-fonts"
    ./install.sh Hack
    ./install.sh JetBrainsMono
    ./install.sh MesloLGS
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✔️ Hack Nerd Font installed${RESET}"
    else
        echo -e "${RED}✖️ Hack Nerd Font not installed${RESET}"
    fi
fi

sleep 2
clear

###### ----- Using BSPWM ----- ######
banner "🖥️ Using BSPWM..."

if [[ -f "$HOME/.dotfiles/.config/bspwm/bspwmrc" ]]; then
    cd "$HOME/.dotfiles/.config/bspwm"
    chmod +x bspwmrc
    chmod +x scripts/*
    ./bspwmrc
    cd "$HOME"
    echo -e "${GREEN}✔️ Using BSPWM${RESET}"
    sleep 1
else
    echo -e "${RED}✖️ .dotfiles/.config/bspwm/bspwmrc not found${RESET}"
    sleep 1
    exit 1
fi

sleep 2
clear

###### ----- Thank you ----- ######
banner "👋 Thank you for using my script!"

printf '%s%sYour dotfiles have been installed.%s\n\n' "${BOLD}" "${GREEN}" "${RESET}"

printf '%s%sPlease restart your computer to apply all changes.%s\n\n' "${BOLD}" "${RED}" "${RESET}"

if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
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