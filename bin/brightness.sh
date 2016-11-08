#!/bin/zsh

function round_fives(){
  expr $(expr $(($1 + 4)) / 5) '*' 5
}

if [ "$1" = "up" ]; then
  DELTA="5"
else
  DELTA="-5"
fi

BRIGHTNESS=$(xbacklight -get)
BRIGHTNESS=${BRIGHTNESS%.*}
BRIGHTNESS=`round_fives $BRIGHTNESS`
BRIGHTNESS=$((BRIGHTNESS + DELTA))
if [ $BRIGHTNESS -gt 100 ]; then
  BRIGHTNESS=100
fi
if [ $BRIGHTNESS -lt 0 ]; then
  BRIGHTNESS=0
fi


xbacklight -set "${BRIGHTNESS}%"

PIDD="/tmp/brightness_notification_pid"

if [ ! -e "$PIDD" ] ; then
  touch "$PIDD"
fi

if [ ! -w "$PIDD" ] ; then
  echo cannot write to $PIDD
  exit 1
fi

icon="display-brightness-high-symbolic"

if [ $BRIGHTNESS -lt 25 ]; then
  icon="display-brightness-off-symbolic"
elif [ $BRIGHTNESS -lt 50 ]; then
  icon="display-brightness-low-symbolic"
elif [ $BRIGHTNESS -lt 75 ]; then
  icon="display-brightness-medium-symbolic"
fi

PID=$(<$PIDD)
if [ -z $PID ]; then
  notify-send "Brightness" --icon="$icon" -h int:value:$BRIGHTNESS -h string:synchronous:brightness -p > $PIDD
else
  notify-send "Brightness" --icon="$icon" -h int:value:$BRIGHTNESS -h string:synchronous:brightness -p -r $PID > $PIDD
fi
