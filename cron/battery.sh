#!/bin/sh

LVL=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)
REMAINING="$(acpi | awk '{ print $5 }')"

if [[ "$LVL" -lt 200 ]] && [[ "$STATUS" == "Discharging" ]]; then
  notify -w 450 --urgent "Low battery!. $REMAINING remaining."
fi

