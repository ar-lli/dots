#!/bin/bash
word=$(cat "/home/arianna/.words.txt" | rofi -dmenu -l 10)
if [[ "$word" != "" ]]
then
	if ! grep -q "$word" "/home/arianna/.words.txt"; 
	then 
		echo $word >> "/home/arianna/.words.txt"
	fi
fi

