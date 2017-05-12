#!/bin/zsh

DIRNAME="$(dirname $0)"

cd $DIRNAME

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
conky -c ./conky | zsh ./conky_parser.sh > "$PANEL_FIFO" &

while true; do
  echo '' > "$PANEL_FIFO"
  sleep 1s
done &

while true; do
  echo "N$(zsh ./scripts/network.sh)" > "$PANEL_FIFO"
  sleep 10s
done &

cat "$PANEL_FIFO" \
  | zsh fifo_parse_bottom.sh \
  | lemonbar -p -b -a 30 -g "x35" -f "$FONT" -f "$ICON_FONT" -u 4 | bash &

wait
