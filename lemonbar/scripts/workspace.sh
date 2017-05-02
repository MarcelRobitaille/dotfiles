input=$(wmctrl -d)

source $(dirname $0)/../config.sh

workspaces=$(wmctrl -d | awk '{ print $2$1 }' | tr -d '[\n]')

echo -e "$workspaces" | sed -e "s/\*[0-9]/$WORKSPACE_CURRENT/g" -e "s/\-\([0-9]\)/$WORKSPACE/g"
