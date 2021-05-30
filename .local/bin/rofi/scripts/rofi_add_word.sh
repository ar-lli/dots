#!/bin/bash
word=$(cat "/home/arianna/.words.txt" | rofi -dmenu -l 10 -p "new word:")
if [[ "$word" != "" ]]
then
	if ! grep -q "$word" "/home/arianna/.words.txt"; 
	then 
		echo $word >> "/home/arianna/.words.txt"
	fi
fi

