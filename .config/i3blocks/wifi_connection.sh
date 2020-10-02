#!/bin/bash
WF=$(iwconfig wlp3s0 | grep 'ESSID:' | awk '{print $4}' | sed 's/ESSID://g' | sed 's/"//g')

if [[ $WF == "off/any" ]]
then
    echo "  No wifi "
    echo "  No wifi "
    echo "#E5E9F0"
    echo "#BF616A"
else
    echo "   $WF "
    echo "   $WF "
    echo "#3B4252"
    echo "#A3BE8C"
fi

    

