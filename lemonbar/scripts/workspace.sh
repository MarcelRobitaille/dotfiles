#!/bin/zsh

format_workspace() {
  echo -n "%{A:wmctrl -s $1:} $(($1+1))$2 %{A}"
}

get_title() {
  if [[ -z "$1" ]]; then
    exit
  fi

  title="$(xprop -id $1 WM_CLASS | cut -d '"' -f 4)"

  # Lowercase window class
  title=${(L)title}

  case "$title" in
    "libreoffice-writer" )
      title="$(xprop -id $1 WM_NAME | cut -d '"' -f 2)"
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

