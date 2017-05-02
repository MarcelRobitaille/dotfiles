#!/bin/sh

source $(dirname $0)/config.sh

while read -r line; do
  echo " $(zsh scripts/workspace.sh)%{c}$(zsh scripts/title.sh)"
done
