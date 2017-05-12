#!/bin/sh
DIRNAME="$(dirname $0)"

while read -r line; do
  source "$HOME/.cache/wal/colors.sh"
  case $line in
    T*)
      TIME="  $(date +'%A, %b %e' | sed -E 's/[[:space:]]+/ /g')  $(date +'%l:%M:%S %p' | xargs) "
      PLAYER=" $(zsh $DIRNAME/scripts/player.sh)"
      ;;
    B*)
      BATTERY="${line#?}"
      ;;
    L*)
      BACKLIGHT="$(zsh ./scripts/backlight.sh)"
      ;;
    V*)
      VOLUME="$(zsh $DIRNAME/scripts/volume.sh)"
      ;;
    K*)
      LAYOUT="$(zsh ./scripts/layout.sh)"
      ;;
    p*)
      SONG="$(zsh $DIRNAME/scripts/current_song.sh)"
      PLAYER=" $(zsh $DIRNAME/scripts/player.sh)"
      ;;
  esac

  LEFT="%{l}%{B$color5 F$color0 U$color0}%{+u}%{A:oblogout:}    %{A}%{-u}%{B$color0 F$color5}$PLAYER"
  CENTRE="%{c}$SONG"
  RIGHT="%{r}%{U$color1}%{+o} $LAYOUT %{-o} %{U$color3}%{+o} $VOLUME %{-o} %{U$color2}%{+o} $BACKLIGHT %{-o} %{U$color3}%{+o} $BATTERY %{-o} %{B$color5 F$color0 U$color0}%{+u}$TIME%{-u}%{B$color0 F$color5}"

  echo "$LEFT$CENTRE$RIGHT%{S+}$LEFT$CENTRE$RIGHT"
done
