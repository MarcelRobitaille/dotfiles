#!/bin/sh

while read -r line; do
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
      NETWORK="${line#?}"
      ;;
  esac
  source "$HOME/.cache/wal/colors.sh"
  BAR="%{l}%{B$color0 F$color5} $WORKSPACES%{c}$TITLE%{r}%{U$color1}%{+u} $NETWORK %{-u} %{U$color2}%{+u} $CPU %{-u} %{U$color3}%{+u} $RAM %{-u}%{U-}"
  echo "$BAR%{S+}$BAR"
done
