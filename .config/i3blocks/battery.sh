#!/bin/bash
# colors
background="#3B4252"
green="#A3BE8C"
yellow="#EBCB8B"
orange="#D08770"
red="#BF616A"
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
    echo $background
else
    if [[ 0 -lt $percbat && $percbat -le 10 ]]
    then
	#echo "   ■ "
	#echo "   ■ "
	echo "     "
	echo "     "
	echo $red
	echo $background
    elif [[ 10 -lt $percbat && $percbat -le 40 ]]
    then	
	#echo "   ■ ■ "
	#echo "   ■ ■ "
	echo "    "
	echo "    "
	echo $orange
	echo $background
    elif [[ 40 -lt $percbat && $percbat -le 60 ]]
    then	
	#echo " ■ ■ ■ "
	#echo " ■ ■ ■ "
	echo "   "
	echo "   "
	echo $yellow
	echo $background
    elif [[ 60 -lt $percbat && $percbat -le 80 ]]
    then	
	#echo " ■ ■ ■ ■ "
	#echo " ■ ■ ■ ■ "
	echo "   "
	echo "   "
	echo $green
	echo $background
    else
	#echo " ■ ■ ■ ■ ■ "
	#echo " ■ ■ ■ ■ ■ "
	echo "   "
	echo "   "
	echo $green
	echo $background
    fi
fi
