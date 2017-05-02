#!/bin/zsh

cd $(dirname $0)
source $(dirname $0)/config.sh

FONT="Source Code Pro:size=12"
ICON_FONT="MaterialIcons:size=14"
PANEL_FIFO="/tmp/panel_bottom_fifo"

if [ $(pgrep -cx bottom.sh) -gt 1 ] ; then
  printf "%s\n" "The bottom panel is already running." >&2
  exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc subscribe > "$PANEL_FIFO" &
while true; do
  echo '' > "$PANEL_FIFO"
  sleep 1s
done &

cat "$PANEL_FIFO" \
  | zsh fifo_parse_bottom.sh \
  | lemonbar -p -b -g "x35" -f "$FONT" -f "$ICON_FONT" -B "#242424" | bash &

wait
