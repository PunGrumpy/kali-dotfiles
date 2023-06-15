#!/usr/bin/env bash
#	 __   __                      __      ____                         
#	/\ \ /\ \                    /\ \    /\  _`\   __                  
#	\ `\`\/'/'    ___     __     \_\ \   \ \ \L\ \/\_\    ___     __   
#	 `\/ > <     /'___\ /'__`\   /'_` \   \ \ ,  /\/\ \  /'___\ /'__`\ 
#	    \/'/\`\ /\ \__//\ \L\.\_/\ \L\ \   \ \ \\ \\ \ \/\ \__//\  __/ 
#	    /\_\\ \_\ \____\ \__/.\_\ \___,_\   \ \_\ \_\ \_\ \____\ \____\
#	    \/_/ \/_/\/____/\/__/\/_/\/__,_ /    \/_/\/ /\/_/\/____/\/____/
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Xcad
set_bspwm_config() {
		bspc config border_width 3
		bspc config top_padding 48
		bspc config bottom_padding 2
		bspc config normal_border_color "#121212"
		bspc config active_border_color "#2883FF"
		bspc config focused_border_color "#2883FF"
		bspc config presel_feedback_color "#BA5AFF"
		bspc config left_padding 2
		bspc config right_padding 2
		bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
    cat "$HOME"/.dotfiles/.config/bspwm/rices/xcad/colors.yml > "$HOME"/.config/alacritty/colors.yml
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = false; shadow = false; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 0/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"95:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"95:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
    sed -i "$HOME"/.config/bspwm/dunstrc \
        -e "s/transparency = .*/transparency = 8/g" \
        -e "s/frame_color = .*/frame_color = \"#1B1B1B\"/g" \
        -e "s/separator_color = .*/separator_color = \"#2883FF\"/g" \
        -e "s/font = .*/font = Hack Nerd Font 9/g" \
        -e "s/foreground='.*'/foreground='#2883FF'/g"

    sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
    cat "$HOME"/.dotfiles/.config/bspwm/rices/xcad/dunstrc >> "$HOME"/.config/bspwm/dunstrc
}

# Launch the bar
launch_bars() {
	polybar -q xcad-bar -c ${RICE_DIR}/config.ini &
	polybar -q xcad-bar2 -c ${RICE_DIR}/config.ini &
	polybar -q xcad-bar3 -c ${RICE_DIR}/config.ini &
}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars