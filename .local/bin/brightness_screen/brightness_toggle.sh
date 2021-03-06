#!/bin/zsh
brightness=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)

if [[ $brightness -eq '1.0' ]] 
then
    xrandr --output eDP --brightness '0.7'
elif [[ $brightness -eq '0.7' ]] 
then
    xrandr --output eDP --brightness '0.5'
else
    xrandr --output eDP --brightness '1.0'
fi

