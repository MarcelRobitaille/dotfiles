SSID="$(iwgetid -r)"

ICON=""

# If connected to network
if $(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null); then

  # If no SSID, assume connection is wired
  if [ -z "$SSID" ]; then
    ICON="" && SSID="wired"
  fi

# If not connected
else

  # Show disconnected icon
  ICON=""

  # If no SSID, just say disconnected
  [ -z "$SSID" ] && SSID="disconnected"
fi

echo "%{A:wicd-gtk &:}$ICON $SSID%{A}"

