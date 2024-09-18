set fish_greeting ""

set -gx TERM xterm-256color

set -l title (basename (pwd))
set -l title (string replace -r '^/Users/[^/]+/' '~/' $title)
set -l title (string replace -r '^/home/[^/]+/' '~/' $title)

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# Theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# OS
switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

# Aliases
source (dirname (status --current-filename))/config-aliases.fish

########### Source all the things ###########

# Cargo
set -gx PATH $HOME/.cargo/bin $PATH

# Node
set -gx PATH node_modules/.bin $PATH

# Pnpm
set -gx PNPM_HOME $HOME/.pnpm-global
set -gx PATH $PNPM_HOME $PATH

# Bun
set -gx PATH $HOME/.bun/bin $PATH

# Deno
set -gx PATH $HOME/.deno/bin $PATH

# Python
set -gx PATH $HOME/.local/bin $PATH

# Python 2
set -gx PATH $HOME/.local/bin/python2 $PATH

# Anaconda
set -gx PATH $HOME/.anaconda3/bin $PATH
if test -f $HOME/.anaconda3/bin/conda
    eval $HOME/.anaconda3/bin/conda "shell.fish" hook $argv | source
end

# Go
set -gx GOPATH $HOME/.go
set -gx PATH $GOPATH/bin $PATH

# PDTM
set -gx PDTM_HOME $HOME/.pdtm
set -gx PATH $PDTM_HOME/go/bin $PATH

# Starship
if command -qv starship &>/dev/null
    eval (starship init fish)
end

# Direnv
if command -qv direnv &>/dev/null
    eval (direnv hook fish)
end
