#!/bin/zsh

num_icons=7
level="$(xbacklight | awk 'END { print int(($0 / 5) + 0.5) * 5 }')"

((icon = level * num_icons / 101))

echo "$HOME/.config/tint2/icons/brightness_$icon.svg"
echo "$level%"

