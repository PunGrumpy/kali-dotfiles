# General
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias vim nvim
command -qv nvim && alias vim nvim

# EZA
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# Docker
if command -q docker && command -q dockercolorzie
    alias dps "docker ps | dockercolorize"
    alias dpsa "docker ps -a | dockercolorize"
    alias di "docker images | dockercolorize"
    alias dcps "docker compose ps | dockercolorize"
    alias dstats "docker stats --no-stream | dockercolorize"
end

# Kubernetes
if command -q kubectl
    if command -q kubecolor
        alias kubectl kubecolor
    end
    alias k kubectl
end

if command -q kubectx && command -q kubens
    alias kctx kubectx
    alias kns kubens
end

# Helm
if command -q helm
    alias h helm
end

# Terraform
if command -q terraform
    alias tf terraform
end

# Ansible
if command -q ansible
    alias a ansible
    alias ap ansible-playbook
end

# Python
if command -q python3 && command -q pip3
    alias python python3
    alias pip pip3
end

