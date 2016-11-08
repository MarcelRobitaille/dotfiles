#!/bin/zsh

function round_fives(){
  expr $(expr $(($1 + 4)) / 5) '*' 5
}

if [ "$1" = "up" ]; then
  DELTA="5"
else
  DELTA="-5"
fi

VOLUME=$(amixer get Master |grep % |awk '{print $5}'|sed 's/[^0-9]//g'|head -n 1)
VOLUME=${VOLUME%.*}
VOLUME=`round_fives $VOLUME`
VOLUME=$((VOLUME + DELTA))

amixer set Master "$VOLUME%" > /dev/null

PIDD="/tmp/volume_notification_pid"

if [ ! -e "$PIDD" ] ; then
  touch "$PIDD"
fi

if [ ! -w "$PIDD" ] ; then
  echo cannot write to $PIDD
  exit 1
fi

icon="audio-volume-high-symbolic"

if [ $VOLUME -lt 33 ]; then
  icon="audio-volume-low-symbolic"
elif [ $VOLUME -lt 66 ]; then
  icon="audio-volume-medium-symbolic"
fi

PID=$(<$PIDD)
if [ -z $PID ]; then
  notify-send "Volume" --icon="$icon" -h int:value:$VOLUME -h string:synchronous:volume -p > $PIDD
else
  notify-send "Volume" --icon="$icon" -h int:value:$VOLUME -h string:synchronous:volume -p -r $PID > $PIDD
fi
