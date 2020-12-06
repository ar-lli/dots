#!/bin/bash

VolumeInfo=$(pacmd list-sinks | grep -e index:)
regex='.*\*.*([0-9]+).*'
[[ $VolumeInfo =~ $regex ]]
Sink=${BASH_REMATCH[1]}

# if [[ $Sink == 0 ]]
# then
#     volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $Sink + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
# else
#     volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $Sink )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
# fi

volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $Sink + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

mute=$(pacmd list-sinks|grep -A 15 '* index'|awk '/muted:/{ print $2 }')

if [[ $mute == "yes" ]]
then
    echo "  mute "
    echo "  mute "
    echo "#E5E9F0"
    echo "#3B4252"
else
    if [[ 0 -lt $volume && $volume -le 50 ]]
    then
	echo "  $volume% "
	echo "  $volume% "
	echo "#EBCB8B"
	echo "#3B4252"
    elif [[ 51 -lt $volume && $volume -le 100 ]]
    then
	echo "  $volume% "
	echo "  $volume% "
	echo "#A3BE8C"
	echo "#3B4252"
    else
	echo "  $volume% "
	echo "  $volume% "
	echo "#BF616A"
	echo "#3B4252"


    fi
fi
