#!/bin/sh

# Stolen from https://github.com/CalinLeafshade/dots/blob/master/bin/bin/snippy.sh
# https://www.youtube.com/watch?v=PRgIxRl67bk

SNIPS=${HOME}/.dotfiles/snippets

FILE=`ls ${SNIPS} | /usr/bin/rofi -dmenu`

if [ -f ${SNIPS}/${FILE} ]; then
	DATA=$([ -x "${SNIPS}/${FILE}" ] && bash "${SNIPS}/${FILE}" || head --bytes=-1 ${SNIPS}/${FILE})
	printf "$DATA" | xsel -p -i
	printf "$DATA" | xsel -b -i
	xdotool key shift+Insert
fi
