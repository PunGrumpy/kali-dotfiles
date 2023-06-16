#!/usr/bin/env bash
#  ╔═╗╔═╗╔═╗╔═╗  ╦  ╔═╗╦ ╦╔╗╔╔═╗╦ ╦╔═╗╦═╗
#  ╠═╣╠═╝╠═╝╚═╗  ║  ╠═╣║ ║║║║║  ╠═╣║╣ ╠╦╝
#  ╩ ╩╩  ╩  ╚═╝  ╩═╝╩ ╩╚═╝╝╚╝╚═╝╩ ╩╚═╝╩╚═
#	Script to control apps launcher
#   Author: z0mbi3
#	url: https://github.com/gh0stzk

# From here you can control your favorite applications for all themes.

case "$1" in
  --menu)
    rofi -show drun \
		 -theme $HOME/.config/bspwm/rices/${RICETHEME}/launcher.rasi;;

  --rice)
    bash RiceSelector.sh;;

  --terminal)
    alacritty;;

  --floating)
    alacritty --class FloaTerm,Alacritty \
					-o window.dimensions.lines=22 \
					window.dimensions.columns=90;;

  --update)
    alacritty --hold --class FloaTerm,Alacritty \
					-o window.dimensions.lines=22 \
					   window.dimensions.columns=90 \
					-e Updates --update-system;;

  --checkupdates)
	alacritty --hold --class Updating,Alacritty \
					-o window.dimensions.lines=22 \
					   window.dimensions.columns=47 \
					-e bash Updates.sh --print-updates;;

  --ranger)
    alacritty --class FloaTerm,Alacritty \
					-o window.dimensions.lines=14 \
					   window.dimensions.columns=90 \
					-e ranger;;

  --nvim)
    alacritty -e nvim;;

  --music)
    alacritty --class FloaTerm,Alacritty \
					-o window.dimensions.lines=18 \
					   window.dimensions.columns=67 \
					-e ncmpcpp;;

  --fetch)
    alacritty --hold --class FloaTerm,Alacritty \
					-o window.dimensions.lines=26 \
					   window.dimensions.columns=40 \
					-e ~/.local/bin/sysfetch;;

  #Apps
  --filemanager)
	thunar;;

  --browser)
	firefox;;

  --editor)
	geany;;

  --telegram)
	telegram;;

  --whats)
	whatsapp-nativefier --disable-gpu;;

  --soundcontrol)
    pavucontrol;;

  *)
    echo "Opción no válida";;
esac
