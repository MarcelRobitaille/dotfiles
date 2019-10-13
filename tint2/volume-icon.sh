#!/bin/zsh

num_icons=4

# Line output from `pactl subscribe` when volume actually changes
change_match="Event 'change' on sink"

# Kickstart loop by echoing magic string before subscribing
(echo "$change_match*"; pactl subscribe) | while read line; do

	# Prevent feedback loop of
	# Reading volume creates events in `pactl subscribe`
	# Without this check, processing events creates events creating a feedback
	# loop
	[ "$line" = "$change_match" ] || continue

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
