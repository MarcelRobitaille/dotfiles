#!/bin/bash

timestamp="$(date)"

OPTS=`getopt --options y --long yesterday --name 'so' -- "$@"`
eval set -- "$OPTS"

while true; do
	case "$1" in
		-y | --yesterday ) timestamp="$(date -d "1 day ago")"; shift ;;
		-- ) shift; break ;;
		* ) break ;;
	esac
done

echo $timestamp

shift $(($OPTIND - 1))

filename="$HOME/Nextcloud/journal/$(date -d "$timestamp" "+%-Y.%m.%d").md"

mkdir -p $(dirname $filename)

[ -f "$filename" ] || cat > "$filename" <<EOF
# $(date -d "$timestamp" "+%B %-d, %Y")
EOF

$EDITOR $filename
