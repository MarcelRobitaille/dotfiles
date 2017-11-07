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

open_cmd="%{A:pavucontrol:}"
set_cmd="%{A3:pamixer --set-volume 20:}"
inc_cmd="%{A4:pamixer -i 5:}"
dec_cmd="%{A5:pamixer -d 5:}"

echo "$open_cmd$set_cmd$inc_cmd$dec_cmd$icon $level%{A}%{A}%{A}%{A}"
