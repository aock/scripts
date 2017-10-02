#!/bin/bash

dir=""
if [[ -z $1 ]] || [[ $1 == "right" ]]; then
    dir="--right-of"
elif [[ $1 == "top" ]]; then
    dir="--above"
elif [[ $1 == "down" ]]; then
    dir="--below"
elif [[ $1 == "left" ]]; then
    dir="--left-of"
fi

laptop="eDP-1-1"
vga="DP-1-1"
hdmi="HDMI-1-1"

if [[ dir != "" ]]; then
    if xrandr | grep -q "^$vga connected"; then
        xrandr_func="xrandr --output $vga --auto $dir $laptop"
        $xrandr_func
    elif xrandr | grep -q "^$hdmi connected"; then
        xrandr_func="xrandr --output $hdmi --auto $dir $laptop"
        $xrandr_func
    fi
else
    echo "wrong argument: $1"
    echo "allowed are: top, down, right, left"
fi
