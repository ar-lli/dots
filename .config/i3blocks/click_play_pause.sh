#!/bin/bash
status_player=$(playerctl --player playerctld status)

if [[ $status_player == "Playing" ]] || [[ $status_player == "Paused" ]]
then
    playerctl --player playerctld play-pause
fi
