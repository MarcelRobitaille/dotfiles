workspace_populated() {
  echo -n "%{A:wmctrl -s $1:} %{A}"
}

workspace_empty() {
echo -n "%{A:wmctrl -s $1:} %{A}"
}

workspace_current() {
  echo -n " "
}

local -a workspaces
workspaces=($(bspc query -m "$1" -D --names))

local -a populated
populated=($(wmctrl -l | awk '{ print $2 }'))

for (( i=1; i<=$#workspaces; i++ )); do
  workspace=$workspaces[i]

  # Check if it's the current desktop
  if [[ $workspace == $(bspc query -D -d --names) ]]; then
    workspace_current
    continue
  fi

  # Check if populated
  if [[ ${populated[(r)$workspace]} == $workspace ]]; then
    workspace_populated $workspace
    continue
  fi

  # Empty and not selected
  workspace_empty $workspace
done

