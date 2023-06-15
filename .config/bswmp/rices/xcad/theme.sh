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
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: Hack Nerd Font/g" \
		-e "s/size: .*/size: 10/g"

		cat > "$HOME"/.config/alacritty/colors.yml <<- _EOF_
				# Colors Xcad Rice
				colors:
					primary:
						background: '#1B1B1B'
						foreground: '#F1F1F1'

					normal:
						black: '#121212'
						red: '#A52AFF'
						green: '#7129FF'
						yellow: '#3D2AFF'
						blue: '#2B4FFF'
						magenta: '#2883FF'
						cyan: '#28B9FF'
						white: '#F1F1F1'

					bright:
						black: '#666666'
						red: '#BA5AFF'
						green: '#905AFF'
						yellow: '#685AFF'
						blue: '#5C78FF'
						magenta: '#5EA2FF'
						cyan: '#5AC8FF'
						white: '#FFFFFF'

					cursor:
						cursor: '#FFFFFF'
						text: '#1B1B1B'
_EOF_
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
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#2883FF'/g"

		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#1B1B1B"
				foreground = "#F1F1F1"

				[urgency_normal]
				timeout = 6
				background = "#1B1B1B"
				foreground = "#F1F1F1"

				[urgency_critical]
				timeout = 0
				background = "#1B1B1B"
				foreground = "#F1F1F1"
_EOF_
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