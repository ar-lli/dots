#!/bin/bash
brightness=$(echo "($(xbacklight -get ) + 0.5)/1" | bc)

if [[ 0 -le $brightness && $brightness -le 30 ]]
then
    echo "  $brightness% "
    echo "  $brightness% "
    echo "#E5E9F0"
    echo "#5E81AC"
elif [[ 30 -lt $brightness && $brightness -le 50 ]]
then
    echo "  $brightness% "
    echo "  $brightness% "
    echo "#3B4252"
    echo "#88C0D0"
else
    echo "  $brightness% "
    echo "  $brightness% "
    echo "#3B4252"
    echo "#D8DEE9"
fi
