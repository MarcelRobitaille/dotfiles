#!/bin/zsh

num_icons=4

# Line output from `pactl subscribe` when volume actually changes
change_match="Event 'change' on sink"

# Kickstart loop by echoing magic string before subscribing
(echo "$change_match"; pactl subscribe) |
	grep --line-buffered "$change_match" |
	while read line; do

		if [[ $(pamixer --get-mute) == "true" ]]; then
			level='mute'
			icon='mute'
		else
			level=$(pamixer --get-volume)

			((icon = level * num_icons / 101))
			level="$level%"
		fi

		echo "$HOME/.config/tint2/icons/volume_$icon.svg"
		echo "$level"
	done
