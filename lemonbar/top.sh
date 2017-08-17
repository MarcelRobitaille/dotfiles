#!/bin/zsh

DIRNAME=$(dirname $0)

cd "$DIRNAME"

source "./config"

PANEL_FIFO="/tmp/panel_top_fifo"

if [ $(pgrep -cx top.sh) -gt 1 ] ; then
  printf "%s\n" "The top panel is already running." >&2
  exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"


#
# Events
#

# Pulse audio
pactl subscribe | zsh scripts/pactl_parse.sh > "$PANEL_FIFO" &

# MPD
mpc idleloop > "$PANEL_FIFO" &


#
# Kickstarts
# Otherwise event-driven sections won't display anything until an event is triggered
#

# Kickstart volume
echo "V$(zsh ./scripts/volume.sh)" > "$PANEL_FIFO" &

# Kickstart player
echo "p" > "$PANEL_FIFO" &

# Kickstart backlight
echo "L" > "$PANEL_FIFO" &


#
# Timers
#

# Time
while true; do
  echo "T" > "$PANEL_FIFO"
  echo "K" > "$PANEL_FIFO"
  sleep 1s
done &

# Battery
while true; do
  echo "B$(zsh ./scripts/battery.sh)" > "$PANEL_FIFO"
  echo "L" > "$PANEL_FIFO"
  sleep 10s
done &


#
# Lemonbar
#

cat "$PANEL_FIFO" \
  | zsh fifo_parse_top.sh \
  | lemonbar -p -a 26 -g "x45" -f "$FONT" -f "$ICON_FONT" -u 4 | bash &

wait

