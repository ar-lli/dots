#!/bin/bash
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
    echo "#E5E9F0"
    echo "#3B4252"
elif [[ $status_player == "Paused" ]]
then
    echo "  : $info_player "
    echo "  : $info_player_short "
    echo "#E5E9F0"
    echo "#3B4252"
elif [[ $status_player == "Stopped" ]]
then
    echo "  : player stopped "
    echo "  : player stopped " 
    echo "#E5E9F0"
    echo "#3B4252"
else
    echo "  : no player found "
    echo "  : no player found "
    echo "#E5E9F0"
    echo "#3B4252"
fi
