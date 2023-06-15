#    ________  _________  ________  ________  ________  ___  ___  ___  ________   
#   |\   ____\|\___   ___\\   __  \|\   __  \|\   ____\|\  \|\  \|\  \|\   __  \  
#   \ \  \___|\|___ \  \_\ \  \|\  \ \  \|\  \ \  \___|\ \  \\\  \ \  \ \  \|\  \ 
#    \ \_____  \   \ \  \ \ \   __  \ \   _  _\ \_____  \ \   __  \ \  \ \   ____\
#     \|____|\  \   \ \  \ \ \  \ \  \ \  \\  \\|____|\  \ \  \ \  \ \  \ \  \___|
#       ____\_\  \   \ \__\ \ \__\ \__\ \__\\ _\ ____\_\  \ \__\ \__\ \__\ \__\   
#      |\_________\   \|__|  \|__|\|__|\|__|\|__|\_________\|__|\|__|\|__|\|__|   
#      \|_________|                             \|_________|                      

# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"

  # on mac os use the systemprofiler to determine the current model
  _device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *kali-rolling*)          ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *docker*)                ICON="";;
    *)                       ICON="";;
esac

case $_device in
    *MacBook*)     DEVICE="";;
    *mini*)        DEVICE="󰇄";;
    *)             DEVICE="󰆍"
esac

export STARSHIP_DISTRO="$ICON"
export STARSHIP_DEVICE="$DEVICE"