if [[ $(pamixer --get-mute) == "true" ]]; then
  level="mute"
  icon=''
else
  level=$(pamixer --get-volume)

  if [ $level = 0 ]; then
    icon=''
  elif [ $level -lt 33 ]; then
    icon=''
  elif [ $level -lt 66 ]; then
    icon=''
  else
    icon=''
  fi

  level="$level%"
fi

echo "%{A:pavucontrol:}%{A4:pamixer -i 5:}%{A5:pamixer -d 5:}$icon $level%{A}%{A}%{A}"
