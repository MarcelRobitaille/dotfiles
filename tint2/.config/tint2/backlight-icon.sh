#!/bin/zsh

source "$HOME/.dotfiles/config.sh"

level="$(xbacklight | awk 'END { print int(($0 / 5) + 0.5) * 5 }')"

if (( $level <= 14 )); then
  icon=''
elif (( $level <= 28 )); then
  icon=''
elif (( $level <= 42 )); then
  icon=''
elif (( $level <= 56 )); then
  icon=''
elif (( $level <= 70 )); then
  icon=''
elif (( $level <= 84 )); then
  icon=''
else
  icon=''
fi

set_cmd="%{A3:xbacklight -set 100; echo L > $PANEL_FIFO_PATH:}"
inc_cmd="%{A4:xbacklight -inc 5; echo L > $PANEL_FIFO_PATH:}"
dec_cmd="%{A5:xbacklight -dec 5; echo L > $PANEL_FIFO_PATH:}"

echo "$icon"

