#!/bin/bash

CONTACT_DIR="$HOME/Contacts/Contacts"

vdirsyncer discover
vdirsyncer sync

for f in ${CONTACT_DIR}/*.vcf; do
	echo
	echo $f
	DATA=$(cat "$f" |tr -d "\r\n"|sed -e 's/.*TYPE=//' -e 's/REV:.*//' -e 's/END:VCARD.*//')
	NAME=$(grep -a '^N\:;' $f|sed -e 's/.*://' -e 's/[;\r]//g')

	#if [ $(wc -c <<< $DATA) -lt 5 ];then #bashism
	if [ $(echo $DATA|wc -c) -lt 5 ];then
		echo "No images found in $f"
		exit 2
	fi
	EXT=${DATA%%:*}

	[ "$EXT" == 'BEGIN' ] && continue

	IMG=${DATA#*:}
	IMG=${IMG// /}

	[ -z "$NAME" ] && continue
	[ -z "${IMG}" ] && continue

	if ! echo $IMG | base64 -d > "/tmp/${NAME}.${EXT}"; then
		echo "Failed to decode ${NAME}.${EXT}"
		continue
	fi

	convert "/tmp/${NAME}.${EXT}" "${CONTACT_DIR}/${NAME}.png"

	rm "/tmp/${NAME}.${EXT}"
done
