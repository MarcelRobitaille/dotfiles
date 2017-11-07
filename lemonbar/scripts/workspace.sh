#!/bin/zsh

format_workspace() {
  id=$1
  title="$2"

  # Add 1 to workspace because number keys are 1-indexed
  index=$(($1+1))

  # Title will have a leading space if it is not empty
  echo -n "%{A:wmctrl -s $id:} $index$title %{A}"
}

get_title() {

  # Exit function if id empty (means no node was found)
  [[ -z "$1" ]] && exit

  title="$(xprop -id $1 WM_CLASS | cut -d '"' -f 4)"

  # Lowercase window class
  title=${(L)title}

  case "$title" in
    "libreoffice-writer" )
      title="$(xprop -id $1 WM_NAME | cut -d '"' -f 2)"
      ;;
    "evince" )
      title="$(xdotool getwindowname $1)"
      ;;
  esac

  echo " $title" | trunc 20
}

local -a workspaces
workspaces=($(bspc query -m "$1" -D --names))

for (( i=1; i<=$#workspaces; i++ )); do
  workspace=$workspaces[i]

  biggest_node=$(bspc query -d $workspace -N biggest)
  title=$(get_title $biggest_node)

  # Check if it's the current desktop
  if [[ $workspace == $(bspc query -D -d --names) ]]; then
    # Invert colours on current desktop
    echo -n "%{R}$(format_workspace $workspace $title)%{R}"
    continue
  fi

  format_workspace $workspace $title
done

