lvl="$(cat /sys/class/power_supply/BAT1/capacity)"
stat="$(cat /sys/class/power_supply/BAT1/status)"
remaining="$(acpi | awk '{ print $5 }')"
remaining="${remaining:0:5}"

if [[ $stat == "Charging" ]]; then
  icon=''
elif (($lvl > 20)); then
  icon=''
else
  icon=''
fi

if [ -n "$remaining" ]; then
  remaining=" ($remaining)"
fi

echo -e "$icon $lvl%$remaining"

