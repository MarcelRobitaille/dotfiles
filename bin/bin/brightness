#!/bin/zsh

function round_fives(){
  expr $(expr $(($1 + 4)) / 5) '*' 5
}

if [ "$1" = "up" ]; then
  DELTA="5"
else
  DELTA="-5"
fi

brightness=$(xbacklight -get)
brightness=${brightness%.*}
brightness=`round_fives $brightness`
brightness=$((brightness + DELTA))
if [ $brightness -gt 100 ]; then
  brightness=100
fi
if [ $brightness -lt 0 ]; then
  brightness=0
fi


xbacklight -set "${brightness}%"

PIDD="/tmp/brightness_notification_pid"

if [ ! -e "$PIDD" ] ; then
  touch "$PIDD"
fi

if [ ! -w "$PIDD" ] ; then
  echo cannot write to $PIDD
  exit 1
fi

icon="display-brightness-high-symbolic"

if [ $brightness -lt 25 ]; then
  icon="display-brightness-off-symbolic"
elif [ $brightness -lt 50 ]; then
  icon="display-brightness-low-symbolic"
elif [ $brightness -lt 75 ]; then
  icon="display-brightness-medium-symbolic"
fi

PID=$(<$PIDD)
if [[ $PID =~ '^[0-9]+$' ]]; then
  PID=$(notify-send -p -t 1000 -i $icon "<b>Brightness:</b>\n$brightness %" -r $PID)
else
  PID=$(notify-send -p -t 1000 -i $icon "<b>Brightness:</b>\n$brightness %")
fi
echo $PID > $PIDD
