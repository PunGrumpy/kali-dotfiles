if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end