#!/bin/zsh

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

echo "$icon"

