#!/bin/bash

# Maximize "fake-maximized" windows
# Fake maximized windows are those that fill the screen but are floating.
# They are very annoying because clicking near their edges sometimes leads
# to resizing.

THRESHOLD=15
WINDOW_DECORATION_HEIGHT=34
WINDOW_DECORATION_HEIGHT=70
PANEL_HEIGHT=34

function _close() {
	difference=$(($1 - $2))
	abs=${difference#-}
	[ $abs -lt $THRESHOLD ]
}

function _run() {
	# Fail if already maximized
	xprop -id $activewindow | \
		grep -c '_NET_WM_STATE(ATOM) = .*_NET_WM_STATE_MAXIMIZED_VERT, _NET_WM_STATE_MAXIMIZED_HORZ' > /dev/null \
		&& exit

	read -r x y width height <<< $(xdotool getwindowgeometry $activewindow | \
		tr '\n' ' ' | \
		sed 's/Window [0-9]\+   Position: \([0-9]\+\),\([0-9]\+\) (screen: [0-9])   Geometry: \([0-9]\+\)x\([0-9]\+\) /\1 \2 \3 \4\n/')

	y=$(($y-$WINDOW_DECORATION_HEIGHT))
	height=$(($height+$WINDOW_DECORATION_HEIGHT))

	# echo "x: $x y: $y width: $width height: $height"

	xrandr -q | grep " connected" | \
		sed 's/.*\ connected\ \(primary\ \|\)\s*\([0-9]\+\)x\([0-9]\+\)+\([0-9]\+\)+\([0-9]\+\).*/\2 \3 \4 \5/' | \
		while read -r monitor_width monitor_height monitor_x monitor_y; do

		# echo "$monitor_width $monitor_height $monitor_x $monitor_y"

		if _close $x $monitor_x && \
			_close $y $monitor_y && \
			_close $width $monitor_width && \
			_close $height $monitor_height; then

			# Set width and height of window to 50% 50%
			# Otherwise, unmaximizing it manually will make it get picked up by the
			# script and maximized again
			xdotool windowsize $activewindow $(($monitor_width/2)) $(($monitor_height/2))

			# Maximize the window
			wmctrl -ir $activewindow -b add,maximized_vert,maximized_horz
		fi
	done
}

xev -root -event structure -event substructure | while read line; do
	read -r line
	read -r line

	activewindow=$(xdotool getactivewindow)

	jobs -p | while read -r id; do kill $id >/dev/null 2>&1; done

	(sleep .2; _run) &
done
