#!/bin/zsh

(keyboard get; cat /tmp/keybord.fifo) | while read line; do
  echo "$HOME/.config/tint2/icons/keyboard_$line.svg"
done

