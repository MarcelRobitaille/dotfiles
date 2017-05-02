CUTOFF=70

TITLE="$(xdotool getactivewindow getwindowname)"
if [[ ${#TITLE} -gt $CUTOFF ]]; then
  echo "${TITLE:0:$CUTOFF}..."
else
  echo "$TITLE"
fi
