<h1 align="center"><code>⚙️</code> <strong>Kali Linux's Dotfiles</strong></h1>

<div align="center">
  <img src="./.github/asset/banner.gif" height="300" alt="OS: Kali Linux">
</div>

## `📖` About

I use Kali Purple Linux with two sessions: **XFCE** and **BSPWM**. I primarily use BSPWM for my daily activities and XFCE specifically for pentesting. I utilize the same set of dotfiles for both sessions to maintain consistency and streamline my workflow.

This repository contains my personal dotfiles for Kali Linux. It contains my configuration for the following tools:

| Tool                                                                            | Description                                                                              |
| ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| [bspwm](https://github.com/baskerville/bspwm)                                   | A tiling window manager based on binary space partitioning.                              |
| [xfce](https://www.xfce.org/)                                                   | A lightweight desktop environment for UNIX-like operating systems.                       |
| [Zsh](https://www.zsh.org/)                                                     | A shell designed for interactive use, although it is also a powerful scripting language. |
| [Alacritty](https://alacritty.org/)                                             | A cross-platform, GPU-accelerated terminal emulator.                                     |
| [Neovim](https://neovim.io/)                                                    | A hyperextensible Vim-based text editor.                                                 |
| [Neofetch](https://github.com/dylanaraps/neofetch)                              | A command-line system information tool written in bash 3.2+.                             |
| [Ranger](https://github.com/ranger/ranger)                                      | A console file manager with VI key bindings.                                             |
| [mpd](https://www.musicpd.org/) & [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) | A flexible, powerful, server-side application for playing music.                         |
| [Polybar](https://polybar.github.io/)                                           | A fast and easy-to-use tool for creating status bars.                                    |
| [Picom](https://github.com/yshui/picom)                                         | A lightweight compositor for X11.                                                        |
| [Rofi](https://github.com/davatorium/rofi)                                      | A window switcher, application launcher and dmenu replacement.                           |
| [Homebrew](https://brew.sh/)                                                    | A package manager for macOS.                                                             |
| [DockerColorize](https://github.com/PunGrumpy/dockercolorize)                   | A tool to colorize docker output.                                                        |

> **Note**: I have wallpaper on **[.github/wallpaper](./.github/wallpaper/)** and **[.config/bspwm/rices/xcad/wallpaper](./.config/bspwm/rices/xcad/wallpaper/)** directory. You can use it if you want. (In further update, I will add more wallpaper)

## `📦` Installation

> **Warning**: Don't AFK while installing this dotfiles. You might miss some important prompts. I recommend you to read the script first before running it. You can also install the dotfiles manually by copying the files to their respective directories. I recommend you to use the script instead. It's easier and faster.

### `📥` Prerequisites

```bash
curl https://raw.githubusercontent.com/PunGrumpy/kali-dotfiles/main/RiceInstaller.sh -o $HOME/.RiceInstaller.sh
```

### `📥` Installation

```bash
chmod +x $HOME/.RiceInstaller.sh
```

### `📥` Usage

```bash
$HOME/.RiceInstaller.sh
```

## `🚀` Features (For BSPWM)

- [x] **Wallpaper changer**: `super + alt + w` to change wallpaper.
- [x] **Random wallpaper**: `super + alt + r` to change wallpaper randomly.
- [x] **Hide and Show Polybar**: `super + h` to hide and show polybar and `super + u` to unhide and show polybar modules.
- [ ] **Theme changer**: `super + alt + space` to change theme.

## `📖` References

For BSPWM script and config files, I used [gh0stzk-dotfiles](https://github.com/gh0stzk/dotfiles) as a reference.
