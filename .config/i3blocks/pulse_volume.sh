#!/bin/bash
# colors
background="#3B4252"
green="#A3BE8C"
yellow="#EBCB8B"
red="#BF616A"
white="#D8DEE9"

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
    echo $white
    echo $background
else
    if [[ 0 -lt $volume && $volume -le 50 ]]
    then
	echo "  $volume% "
	echo "  $volume% "
	echo $yellow
	echo $background
    elif [[ 51 -lt $volume && $volume -le 100 ]]
    then
	echo "  $volume% "
	echo "  $volume% "
	echo $green
	echo $background
    else
	echo "  $volume% "
	echo "  $volume% "
	echo $red
	echo $background


    fi
fi
