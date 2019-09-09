#!/bin/sh

threshold=15

acpi -b | tail -1 | awk -F'[,:%]' '{print $2, $3}' | {
  read -r status capacity

  if [ "$status" = Discharging -a "$capacity" -lt $threshold ]; then
    logger "Attempting to send notification"
    export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

    /usr/bin/notify-send "Battery critical!" \
      "Battery critical. Plug in within 1 minute (before `date --date '+ 1 min' "+%-l:%M:%S"`) or computer will hibernate." \
      --icon battery-critical \
      --expire-time=60000

    sleep 60
  else
    exit
  fi
}

acpi -b | tail -1 | awk -F'[,:%]' '{print $2, $3}' | {
  read -r status capacity

  if [ "$status" = Discharging -a "$capacity" -lt $threshold ]; then
    logger "Critical battery threshold"
    sudo systemctl hibernate
  fi
}
