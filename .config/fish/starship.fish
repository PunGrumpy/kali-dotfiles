# Initialize variables
set -g _distro ""
set -g _device ""
set -g ICON ""
set -g DEVICE ""

switch (uname)
    case "Darwin"
        set -g _distro "macos"
        set -g _device (system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')
    case "Linux"
        if test -f $LFILE
            set -g _distro (awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
        end
        if lscpu | grep -i 'model name' | grep -q 'Mobile'
            set -g _device "Laptop"
        else
            set -g _device "PC"
        end
    case "*"
        set -g _distro ""
end

switch $_distro
    case "*kali*"
        set -g ICON "ﴣ "
    case "*arch*"
        set -g ICON " "
    case "*debian*"
        set -g ICON " "
    case "*raspbian*"
        set -g ICON " "
    case "*ubuntu*"
        set -g ICON " "
    case "*elementary*"
        set -g ICON " "
    case "*fedora*"
        set -g ICON " "
    case "*coreos*"
        set -g ICON " "
    case "*gentoo*"
        set -g ICON " "
    case "*mageia*"
        set -g ICON " "
    case "*centos*"
        set -g ICON " "
    case "*opensuse*" "*tumbleweed*"
        set -g ICON " "
    case "*sabayon*"
        set -g ICON " "
    case "*slackware*"
        set -g ICON " "
    case "*linuxmint*"
        set -g ICON " "
    case "*alpine*"
        set -g ICON " "
    case "*aosc*"
        set -g ICON " "
    case "*nixos*"
        set -g ICON " "
    case "*devuan*"
        set -g ICON " "
    case "*manjaro*"
        set -g ICON " "
    case "*rhel*"
        set -g ICON " "
    case "*macos*"
        set -g ICON " "
    case "*docker*"
        set -g ICON " "
    case "*"
        set -g ICON " "
end

switch $_device
    case "*MacBook*" "*Macmini*" "*MacPro*" "*iMac*" "*Laptop*"
        set -g DEVICE " "
    case "*mini*" "*NUC*" "*PC*"
        set -g DEVICE "󰇄 "
    case "*"
        set -g DEVICE "󱓇 "
end

# Export the variables
set -x STARSHIP_DISTRO "$ICON"
set -x STARSHIP_DEVICE "$DEVICE"
