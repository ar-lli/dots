#!/bin/bash
# colors
white="#D8DEE9"
blue="#5E81AC"
background="#3B4252"
# date
date=$(date +%H)
date2=$(date "+%a %e %b %H:%M")
#
if [[ 6 -le $date && $date -lt 18 ]]
then
    echo  "   $date2 "
    echo  "   $date2 "
    echo $white
    echo $background
else
    echo  "   $date2 "
    echo  "   $date2 "
    echo $blue
    echo $background
fi

exit 0
