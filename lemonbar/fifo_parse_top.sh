#!/bin/sh

source $(dirname $0)/config.sh

while read -r line; do
  case $line in
    T*)
      TIME="${line#?}"
      ;;
  esac

  echo "$POWER%{r}$TIME "
done
