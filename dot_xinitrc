#!/bin/sh

if test -z "$XDG_RUNTIME_DIR"; then
    export XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
fi

eval "$(dbus-launch --sh-syntax --exit-with-session)"

export GTK_THEME="Catppuccin-Latte-Standard-Green-Light"

xrandr --output HDMI-A-0 --mode 1920x1080 --refresh 74.97 --primary \
    --output DisplayPort-2 --mode 1920x1080 --refresh 60.00 \
    --right-of HDMI-A-0 --rotate left \
&& feh --bg-center "${HOME}/Pictures/260248-furude-rika-1700x1200.jpg" \
    --bg-fill "${HOME}/Pictures/260248-furude-rika-1700x1200.jpg"

picom -b --backend glx --blur-background

gentoo-pipewire-launcher &

fcitx5 &

redshift &

emacs --daemon &

exec cwm
