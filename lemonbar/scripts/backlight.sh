level="$(xbacklight | awk 'END { print int(($0 / 5) + 0.5) * 5 }')"

if (( $level <= 14 )); then
  icon=''
elif (( $level <= 28 )); then
  icon=''
elif (( $level <= 42 )); then
  icon=''
elif (( $level <= 56 )); then
  icon=''
elif (( $level <= 70 )); then
  icon=''
elif (( $level <= 84 )); then
  icon=''
else
  icon=''
fi

echo "%{A4:xbacklight -inc 5 && echo L > /tmp/panel_top_fifo:}%{A5:xbacklight -dec 5 && echo L > /tmp/panel_top_fifo:}$icon $level%%{A}%{A}"
