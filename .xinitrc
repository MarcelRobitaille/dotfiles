# -*- grammar-ext: sh -*-

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

NODE_ENV=production forever start ~/code/apollo/server.js &
conky -c ~/.dotfiles/conky/mpd.conky &
conky -c ~/.dotfiles/conky/system.conky &
compton -b --config ~/.dotfiles/compton/compton.conf &
dunst &
exec startxfce4
