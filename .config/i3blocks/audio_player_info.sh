#!/bin/bash
# colors
background="#3B4252"
white="#D8DEE9"

# player status: Playing, Paused, Stopped
status_player=$(playerctl --player playerctld status)
# player info: title, artist, album
info_player=$(playerctl --player playerctld metadata --format "{{ title }} - {{ album }} - {{ artist }}")
info_player_short=$(playerctl --player playerctld metadata --format "{{ title }}")
# player name
# player=$(playerctl metadata --format "{{ playerName }}")
if [[ $status_player == "Playing" ]]
then
    echo "  : $info_player "
    echo "  : $info_player_short "
    echo $white
    echo $background
elif [[ $status_player == "Paused" ]]
then
    echo "  : $info_player "
    echo "  : $info_player_short "
    echo $white
    echo $background
elif [[ $status_player == "Stopped" ]]
then
    echo "  : player stopped "
    echo "  : player stopped " 
    echo $white
    echo $background
else
    echo "  : no player found "
    echo "  : no player found "
    echo $white
    echo $background
fi
