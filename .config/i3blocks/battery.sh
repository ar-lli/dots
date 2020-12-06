#!/bin/bash

# grep battery info
batinfo=$(cat /sys/class/power_supply/BAT0/uevent)
firstregex='POWER_SUPPLY_CAPACITY=([0-9]+)'
secondregex='POWER_SUPPLY_STATUS=([A-Z][a-z]+)'
[[ $batinfo =~ $firstregex ]]
percbat=${BASH_REMATCH[1]}
[[ $batinfo =~ $secondregex ]]
statbat=${BASH_REMATCH[1]}

if [[ $statbat == "Charging" ]]
then
    echo " ⚡ $percbat% "
    echo " ⚡ $percbat% "
    echo "#A3BE8C"
    echo "#3B4252"
else
    if [[ 0 -lt $percbat && $percbat -le 10 ]]
    then
	#echo "   ■ "
	#echo "   ■ "
	echo "     "
	echo "     "
	echo "#BF616A"
	echo "#E5E9F0"
    elif [[ 10 -lt $percbat && $percbat -le 40 ]]
    then	
	#echo "   ■ ■ "
	#echo "   ■ ■ "
	echo "    "
	echo "    "
	echo "#D08770"
	echo "#E5E9F0"
    elif [[ 40 -lt $percbat && $percbat -le 60 ]]
    then	
	#echo " ■ ■ ■ "
	#echo " ■ ■ ■ "
	echo "   "
	echo "   "
	echo "#EBCB8B"
	echo "#3B4252"
    elif [[ 60 -lt $percbat && $percbat -le 80 ]]
    then	
	#echo " ■ ■ ■ ■ "
	#echo " ■ ■ ■ ■ "
	echo "   "
	echo "   "
	echo "#A3BE8C"
	echo "#3B4252"
    else
	#echo " ■ ■ ■ ■ ■ "
	#echo " ■ ■ ■ ■ ■ "
	echo "   "
	echo "   "
	echo "#A3BE8C"
	echo "#3B4252"
    fi
fi
