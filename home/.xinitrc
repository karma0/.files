#!/bin/bash


export DOTS=$HOME/.homesick
export HOSTCLASS=${$(hostname)%%[.0-9]*}

# X Resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f ~/$DOTS/hosts/$HOSTCLASS/.Xresources ]] && \
    xrdb -merge -I$HOME ~/$DOTS/hosts/$HOSTCLASS/.Xresources


# Gnome keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi


# Turn on mouse pad tap
synclient TapButton1=1 &


# Set keyboard layout
xkbcomp -w 0 ~/.xkbmap $DISPLAY
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap


# Run i3 Window Manager
exec i3
