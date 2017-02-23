#!/bin/bash

WS=$(expr $(($(xdotool get_desktop) + 1)))

case $1 in
  right)
    WS=$(expr $(expr $(xdotool get_desktop) + 1) % 4)
    ;;
  left)
    WS=$(expr $(expr $(xdotool get_desktop) + 3) % 4)
    ;;
esac

case $WS in
  0)
    ICON="top-left"
    ;;
  1)
    ICON="right-top"
    ;;
  2)
    ICON="left-bottom"
    ;;
  3)
    ICON="right-bottom"
    ;;
esac

ICON="workspace-switcher-$ICON"

xdotool set_desktop $WS

read ID < /tmp/workspaceNotificationId

if [ -z "${ID// }" ]; then
  ID=$(notify-send -p -t 1000 -i "$ICON" "<b>Workspace:</b>\n$WS")
else
  ID=$(notify-send -p -t 1000 -i "$ICON" "<b>Workspace:</b>\n$WS" -r $ID)
fi
echo $ID > /tmp/workspaceNotificationId
