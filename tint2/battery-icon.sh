#!/bin/zsh

num_icons=6
lvl="$(cat /sys/class/power_supply/BAT1/capacity)"
stat="$(cat /sys/class/power_supply/BAT1/status |  tr "[:upper:]" "[:lower:]")"

if [[ "$stat" != "discharging" ]]; then
  stat="charging"
fi

((icon = lvl * num_icons / 101))

echo "$HOME/.config/tint2/icons/battery_${stat}_${icon}.svg"

