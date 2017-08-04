#!/bin/sh

while read -r line; do
  source "$HOME/.cache/wal/colors.sh"
  case $line in
    C*)
      CPU="${line#?}"
      ;;
    R*)
      RAM="${line#?}"
      ;;
    N*)
      NETWORK="%{U$color1}%{+u} ${line#?} %{-u}"
      ;;
  esac

  function BAR {
    WORKSPACES=$(zsh scripts/workspace.sh $MONITOR)
    TITLE="$(zsh scripts/title.sh)"
    echo -n "%{l}%{B$color0 F$color5} $WORKSPACES%{c}$TITLE%{r}$NETWORK %{U$color2}%{+u}%{A:xfce4-taskmanager:} $CPU %{-u} %{U$color3}%{+u} $RAM %{A}%{-u}%{U-}"
  }

  result=""
  bspc query -M | while read -r MONITOR; do
    result+="$(BAR)%{S+}"
  done
  echo "$result"
done

