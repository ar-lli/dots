#!/bin/bash
selected=$(cat "/home/arianna/.clipboard.txt" | rofi -dmenu -l 10 -p clipboard:)
if [[ "$selected" != "" ]]
then
	if ! grep -q "$selected" "/home/arianna/.clipboard.txt"; 
	then 
		echo $selected >> "/home/arianna/.clipboard.txt"
	else
		echo -n $selected | xclip -selection clipboard
	fi
fi

