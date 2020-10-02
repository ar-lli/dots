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
    echo "#3B4252"
    echo "#A3BE8C"
else
    if [[ 0 -lt $percbat && $percbat -le 10 ]]
    then
	#echo "   ■ "
	#echo "   ■ "
	echo "     "
	echo "     "
	echo "#E5E9F0"
	echo "#BF616A"
    elif [[ 10 -lt $percbat && $percbat -le 40 ]]
    then	
	#echo "   ■ ■ "
	#echo "   ■ ■ "
	echo "    "
	echo "    "
	echo "#E5E9F0"
	echo "#D08770"
    elif [[ 40 -lt $percbat && $percbat -le 60 ]]
    then	
	#echo " ■ ■ ■ "
	#echo " ■ ■ ■ "
	echo "   "
	echo "   "
	echo "#3B4252"
	echo "#EBCB8B"
    elif [[ 60 -lt $percbat && $percbat -le 80 ]]
    then	
	#echo " ■ ■ ■ ■ "
	#echo " ■ ■ ■ ■ "
	echo "   "
	echo "   "
	echo "#3B4252"
	echo "#A3BE8C"
    else
	#echo " ■ ■ ■ ■ ■ "
	#echo " ■ ■ ■ ■ ■ "
	echo "   "
	echo "   "
	echo "#3B4252"
	echo "#A3BE8C"
    fi
fi
