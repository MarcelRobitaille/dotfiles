#!/bin/zsh

function round_fives(){
  expr $(expr $(($1 + 2)) / 5) '*' 5
}

if [ "$1" = "up" ]; then
  DELTA="5"
else
  DELTA="-5"
fi

volume=$(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]%')
volume=${volume%.*}
volume=`round_fives $volume`
volume=$((volume + DELTA))
if [ $volume -gt 100 ]; then
  volume=100
fi
if [ $volume -lt 0 ]; then
  volume=0
fi

amixer set Master "$volume%" > /dev/null

PIDD="/tmp/volume_notification_pid"

if [ ! -e "$PIDD" ] ; then
  touch "$PIDD"
fi

if [ ! -w "$PIDD" ] ; then
  echo cannot write to $PIDD
  exit 1
fi

icon="off"

if [ "$volume" -gt "66" ]; then
  icon="high"
elif [ "$volume" -gt "33" ]; then
  icon="medium"
elif [ "$volume" -gt "0" ]; then
  icon="low"
elif [ "$volume" -eq "0" ]; then
  icon="muted"
fi

icon="audio-volume-$icon"

PID=$(<$PIDD)
if [[ $PID =~ '^[0-9]+$' ]]; then
  PID=$(notify-send -p -t 1000 -i $icon "<b>Volume:</b>\n$volume %" -r $PID)
else
  PID=$(notify-send -p -t 1000 -i $icon "<b>Volume:</b>\n$volume %")
fi
echo $PID > $PIDD
