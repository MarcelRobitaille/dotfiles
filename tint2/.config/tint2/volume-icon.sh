#!/bin/zsh

num_icons=4

if [[ $(pamixer --get-mute) == "true" ]]; then
  level='mute'
  icon='mute'
else
  level=$(pamixer --get-volume)

  ((icon = level * num_icons / 101))
  level="$level%"
fi

echo "$HOME/.config/tint2/icons/volume_$icon.svg"
echo "$level"

