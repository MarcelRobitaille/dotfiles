#!/bin/sh

while read -r line; do
  source "$HOME/.cache/wal/colors.sh"
  case $line in
    W*)
      WORKSPACES="$(zsh scripts/workspace.sh)"
      TITLE="$(zsh scripts/title.sh)"
      ;;
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
  BAR="%{l}%{B$color0 F$color5} $WORKSPACES%{c}$TITLE%{r}$NETWORK %{U$color2}%{+u}%{A:xfce4-taskmanager:} $CPU %{-u} %{U$color3}%{+u} $RAM %{A}%{-u}%{U-}"
  echo "$BAR%{S+}$BAR"
done
