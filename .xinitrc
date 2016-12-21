# -*- grammar-ext: sh -*-

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

conky -c ~/.dotfiles/conky/system.conky&
conky -c ~/.dotfiles/conky/mpd.conky &
exec startxfce4
