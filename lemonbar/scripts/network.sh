SSID="$(iwgetid -r)"

if [ -n "$SSID" ]; then
  ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && ICON="" || ICON=""
else
  ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && ICON="" && SSID="wired" || ICON="" && SSID="disconnected"
fi

echo "%{A:wicd-gtk &:}$ICON $SSID%{A}"
