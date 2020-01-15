#!/bin/bash

filename="$HOME/Nextcloud/journal/$(date "+%-Y.%m.%d").md"

mkdir -p $(dirname $filename)

[ -f "$filename" ] || cat > "$filename" <<EOF
# $(date "+%B %-d, %Y")
EOF

$EDITOR $filename
