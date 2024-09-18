# General
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim; and alias vim nvim

# EZA
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# Docker
if command -q docker
    if command -q dockercolorize
        alias dps "docker ps | dockercolorize"
        alias dpsa "docker ps -a | dockercolorize"
        alias di "docker images | dockercolorize"
        alias dcps "docker compose ps | dockercolorize"
        alias dstats "docker stats --no-stream | dockercolorize"
    end
end

# Kubernetes
if command -q kubectl
    command -q kubecolor; and alias kubectl kubecolor
    alias k kubectl
end

if command -q kubectx; and command -q kubens
    alias kctx kubectx
    alias kns kubens
end

# Helm
command -q helm; and alias h helm

# Terraform
command -q terraform; and alias tf terraform

# Ansible
if command -q ansible
    alias a ansible
    alias ap ansible-playbook
end

# Python
if command -q python3; and command -q pip3
    alias python python3
    alias pip pip3
end
