#!/bin/zsh

DIRNAME=$(dirname $0)

cd "$DIRNAME"

source "$HOME/.dotfiles/config.sh"
FIFO="$PANEL_FIFO_PATH"

for pid in $(pgrep -f "$0"); do
  [ "$pid" -ne "$$" ] && kill "$pid"
done

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$FIFO" ] && rm "$FIFO"
mkfifo "$FIFO"


#
# Events
#

# Pulse audio
pactl subscribe | zsh scripts/pactl_parse.sh > "$FIFO" &

# MPD
mpc idleloop > "$FIFO" &

# System information
conky -c ./conky | zsh ./conky_parser.sh > "$FIFO" &

#
# Kickstarts
# Otherwise event-driven sections won't display anything until an event is triggered
#

# Kickstart volume
echo "V$(zsh ./scripts/volume.sh)" > "$FIFO" &

# Kickstart player
echo "p" > "$FIFO" &

# Kickstart backlight
echo "L" > "$FIFO" &


#
# Timers
#

# Time
while true; do
  echo "T" > "$FIFO"
  echo "K" > "$FIFO"
  sleep 1s
done &

# Battery
while true; do
  echo "B$(zsh ./scripts/battery.sh)" > "$FIFO"
  echo "L" > "$FIFO"
  sleep 10s
done &

# Network
while true; do
  echo "N$(zsh ./scripts/network.sh)" > "$FIFO"
  sleep 10s
done &

#
# Lemonbar
#

cat "$FIFO" \
  | zsh fifo_parser.sh \
  | lemonbar -n panel -p -a 36 -g "x$PANEL_HEIGHT" -f "$PANEL_FONT" -f "$PANEL_ICON_FONT0" -f "$PANEL_ICON_FONT1" -u 4 \
  | bash

wait

