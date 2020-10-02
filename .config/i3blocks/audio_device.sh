#!/bin/bash

deviceinfo=$(pacmd list-sinks | awk '/index:/ {print $0}; /name:/ {print $0}; /device\.description/ {print $0}')
regex='\*((.|\n)*)device\.description = \"(.+)\"'
[[ $deviceinfo =~ $regex ]]
devicename=${BASH_REMATCH[2]}

if [[ $devicename == "Built-in Audio Analog Stereo" ]]
then
    echo "   system audio "
    echo "   system audio "
    echo "#3B4252"
    echo "#EBCB8B"
else
    echo "   $devicename "
    echo "   $devicename "
    echo "#3B4252"
    echo "#88C0D0"
fi
