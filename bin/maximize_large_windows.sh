#!/bin/zsh

# Maximize "fake-maximized" windows
# Fake maximized windows are those that fill the screen but are floating.
# They are very annoying because clicking near their edges sometimes leads
# to resizing.

xev -root -event structure -event substructure | while read line; do
	read -r line
	read -r line

	activewindow=$(xdotool getactivewindow)

	xprop -id $activewindow | \
		grep -c '_NET_WM_STATE(ATOM) = .*_NET_WM_STATE_MAXIMIZED_VERT, _NET_WM_STATE_MAXIMIZED_HORZ' > /dev/null \
		&& continue

	xdotool getwindowgeometry $activewindow | \
		tr '\n' ' ' | \
		sed 's/Window [0-9]\+   Position: \([0-9]\+\),\([0-9]\+\) (screen: [0-9])   Geometry: \([0-9]\+\)x\([0-9]\+\) /\1 \2 \3 \4\n/' | \
		read -r x y width height

	if (( x < 4 )) && (( y > 62 )) && (( y < 70 )) && (( width > 1916 )) && (( width < 1924 )) && (( height > 1008 )) && (( height < 1016 )); then

		# Set width and height of window to 50% 50%
		# Otherwise, unmaximizing it manually will make it get picked up by the
		# script and maximized again
		xdotool windowsize $activewindow 50% 50%

		# Maximize the window
		wmctrl -ir $activewindow -b add,maximized_vert,maximized_horz
	fi
done
