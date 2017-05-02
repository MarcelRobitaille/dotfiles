#!/bin/zsh

while true; do
  echo "T  $(date +'%A, %b %e')   $(date +'%l:%M:%S %p')" > "$1"
  sleep 1s
done
