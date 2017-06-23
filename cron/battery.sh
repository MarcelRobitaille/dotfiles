#!/bin/sh

source ~/.oh-my-zsh/exports.sh

LVL=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)
REMAINING="$(acpi | awk '{ print $5 }')"

if [[ "$LVL" -lt 20 ]] && [[ "$STATUS" == "Discharging" ]]; then
  DISPLAY=:0 notify -w 480 --urgent "Low battery! $LVL% remaining ($REMAINING)."
fi

