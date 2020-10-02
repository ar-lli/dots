#!/bin/bash
date=$(date +%H)
date2=$(date "+%a %e %b %H:%M")
if [[ 6 -le $date2 && $date2 -lt 18 ]]
then
    echo  "   $date2 "
    echo  "   $date2 "
    echo "#D8DEE9"
    echo "#E5E9F0"
else
    echo  "   $date2 "
    echo  "   $date2 "
    echo "#D8DEE9"
    echo "#5E81AC"
fi

exit 0
