#!/bin/sh
DIRNAME="$(dirname $0)"
declare -a colours
source "$HOME/.dotfiles/config.sh"
source "$WAL_SCRIPT"
source "$WAL_COLOURS_ARRAY"

while read -r line; do

  case $line in
    T*)
      TIME="%{A:calendar -s 0:}  $(date +'%A, %b %-d')  $(date +'%l:%M:%S %p') %{A}"
      PLAYER=" $($DIRNAME/scripts/player.sh)"
      ;;
    B*)
      BATTERY="${line#?}"
      ;;
    L*)
      BACKLIGHT="$($DIRNAME/scripts/backlight.sh)"
      ;;
    V*)
      VOLUME="$($DIRNAME/scripts/volume.sh)"
      ;;
    K*)
      LAYOUT="$($DIRNAME/scripts/layout.sh)"
      ;;
    p*)
      SONG="$($DIRNAME/scripts/current_song.sh)"
      PLAYER=" $($DIRNAME/scripts/player.sh)"
      ;;
    C*)
      CPU="${line#?}"
      ;;
    R*)
      RAM="${line#?}"
      ;;
    N*)
      NETWORK="${line#?}"
      ;;
    W*)
      source "$WAL_SCRIPT"
      source "$WAL_COLOURS_ARRAY"
      ;;
  esac

  LEFT="%{l}%{B$color5 F$color0 U$color0}%{+u}%{A:oblogout:}    %{A}%{-u}%{B$color0 F$color5} "
  RIGHT="%{r}"

  declare -a sections_left
  declare -a sections_right

  sections_left=(
    "$CPU"
    "$RAM"
    "$NETWORK"
  )
  sections_right=(
    "$LAYOUT"
    "$VOLUME"
    "$BACKLIGHT"
    "$BATTERY"
  )

  for ((i=1; i<=$#sections_left; i++)); do
    LEFT+="%{U${colours[i+1]}}%{+o} ${sections_left[i]} %{-o} "
  done

  for ((i=1; i<=$#sections_right; i++)); do
    RIGHT+="%{U${colours[i+1]}}%{+o} ${sections_right[i]} %{-o} "
  done

  RIGHT+="%{B$color5 F$color0 U$color0}%{+u}$TIME%{-u}%{B$color0 F$color5}"

  output=""

  for ((i=0; i<`xrandr -d :0 -q | grep ' connected' | wc -l`; i++)); do
    monitors_output="$LEFT$RIGHT%{S+}"
    monitors_output=${monitors_output/MONITOR_NUM/$i}
    output+="$monitors_output"
  done

  echo "$output"
done

