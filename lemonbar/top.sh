#!/bin/zsh

cd $(dirname $0)
source $(dirname $0)/config.sh

FONT="Source Code Pro:size=12"
ICON_FONT="MaterialIcons:size=14"
PANEL_FIFO="/tmp/panel_top_fifo"

if [ $(pgrep -cx top.sh) -gt 1 ] ; then
  printf "%s\n" "The top panel is already running." >&2
  exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc subscribe > "$PANEL_FIFO" &

cat "$PANEL_FIFO" \
  | zsh fifo_parse_top.sh \
  | lemonbar -p -g "x45" -f "$FONT" -f "$ICON_FONT" | bash &

zsh scripts/time.sh "$PANEL_FIFO" &
wait
