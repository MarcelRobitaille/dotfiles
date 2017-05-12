input=$(wmctrl -d)

workspace() {
  echo "%{A:wmctrl -s $1:} %{A}"
}

workspace_empty="%{A:wmctrl -s \1:} %{A}"
workspace_current=" "

workspaces=$(wmctrl -d | awk '{ print $2$1 }' | tr -d '[\n]')

wmctrl -l | awk '{ print $2 }' |

while read -r window; do
  workspaces=${workspaces/-$window/$(workspace $window)}
done

echo "$workspaces" | sed -e "s/\*[0-9]/$workspace_current/g" -e "s/\-\([0-9]\)/$workspace_empty/g"
