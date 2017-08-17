#!/bin/zsh

# Hopefully this doesn't change...
MONITORS=($(bspc query -M))

while read -r line; do
  source "$HOME/.cache/wal/colors.sh"
  case $line in
    C*)
      CPU="${line#?}"
      ;;
    R*)
      RAM="${line#?}"
      ;;
    N*)
      NETWORK="%{U$color1}%{+u} ${line#?} %{-u}"
      ;;
  esac

  local -a WORKSPACES

  RESULT=""

  # Populate workspaces array with that monitor's workspaces
  for (( i=1; i<=$#MONITORS; i++)); do
    MONITOR=$MONITORS[i]
    WORKSPACES[i]=$(zsh scripts/workspace.sh $MONITOR)
  done

  # Start bar
  BAR="%{l}%{B$color0}%{-u} "

  for (( j=1; j<=$#WORKSPACES; j++)); do

    # Get colour corresponding to monitor's number
    COLOR=$(sed -n "$((j+1))p" < "$HOME/.cache/wal/colors")

    # Add monitor's workspaces to bar with coloured underline
    BAR+="%{U$COLOR}%{+u}${WORKSPACES[j]}%{-u} "
  done

  # Add network and conky to bar
  BAR+="%{F$color5}%{r}$NETWORK %{U$color2}%{+u}%{A:xfce4-taskmanager:} $CPU %{-u} %{U$color3}%{+u} $RAM %{A}%{-u}%{U-}"

  # Add a bar for each monitor
  for (( i=1; i<=$#MONITORS; i++)); do
    RESULT+="$BAR%{S+}"
  done

  echo "$RESULT"
done

