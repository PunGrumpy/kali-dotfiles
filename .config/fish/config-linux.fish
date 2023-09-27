if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end
