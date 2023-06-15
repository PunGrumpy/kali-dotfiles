#!/usr/bin/env bash
#  ╦ ╦╦╔╦╗╔═╗  ╔╗ ╔═╗╦═╗
#  ╠═╣║ ║║║╣   ╠╩╗╠═╣╠╦╝
#  ╩ ╩╩═╩╝╚═╝  ╚═╝╩ ╩╩╚═
#	Simple script to hide/show polybar
#   Author: z0mbi3
#	url: https://github.com/gh0stzk

function hide() {
	
case "${RICETHEME}" in
    xcad)
        polybar-msg cmd hide | bspc config top_padding 2
        ;;
    *)
        echo "Error: Something fails dud.."
        ;;
esac
	
}

function unhide() {
	
case "${RICETHEME}" in
	xcad)
		polybar-msg cmd show | bspc config top_padding 48
		;;
	*)
		echo "Error: Something fails dud.."
		;;
esac

}

case $1 in
	-h | --hide | hide)
		hide
		exit;;
	-u | --unhide | unhide)
		unhide
		exit;;
	*) # Invalid option
		echo "Error: Invalid option"
		exit;;
esac
