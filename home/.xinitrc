#!/bin/bash


export DOTS=$HOME/.homesick
export HOSTCLASS=${$(hostname)%%[.0-9]*}

# Host-specific xinit
[[ -f $DOTS/hosts/$HOSTCLASS/.xinitrc ]] && \
    source $DOTS/hosts/$HOSTCLASS/.xinitrc 

# Host-specific screen layout
[[ -f $DOTS/hosts/$HOSTCLASS/screenlayout.sh ]] && \
    $DOTS/hosts/$HOSTCLASS/screenlayout.sh 

# X Resources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[[ -f $DOTS/hosts/$HOSTCLASS/.Xresources ]] && \
    xrdb -merge -I$HOME $DOTS/hosts/$HOSTCLASS/.Xresources


# Gnome keyring
if [ -n "$DESKTOP_SESSION" ];then
    dbus-update-activation-environment --systemd DISPLAY
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# P4
export P4IGNORE=$HOME/.p4ignore

# Turn on mouse pad tap
synclient TapButton1=1 &

# hide mouse coursor when it isn't used
unclutter -root -visible &

# Run i3 Window Manager
exec i3
