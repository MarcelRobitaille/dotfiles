#!/bin/sh

# Subtract 5 hours to not be annoyed a few minutes past midnight to write
# "tomorrow's" journal entry
filename="$HOME/Nextcloud/journal/$(date --date '-5 hour' "+%-Y.%m.%d").md"

[ -f "$filename" ] && exit

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

/usr/bin/notify-send "Journal reminder" \
  "Journal reminder" \
  --icon dialog-information \
  --expire-time=5000
