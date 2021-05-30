#!/bin/bash
# list sink, set regex and find the current sink
sink_list=$(pacmd list-sinks | grep -e index:)
regex='.*\*.*([0-9]+).*'
[[ $sink_list =~ $regex ]]
Sink=${BASH_REMATCH[1]}
# mute attribute: yes or no
mute=$(pacmd list-sinks|grep -A 15 '* index'|awk '/muted:/{ print $2 }')

if [[ $mute == "yes" ]]
then
    pactl set-sink-mute $Sink toggle
    pactl set-sink-volume $Sink -10%
else
    pactl set-sink-volume $Sink -10%
fi

