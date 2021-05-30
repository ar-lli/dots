#!/bin/bash
Command=$(find $HOME/.rofi_exe_scripts -type f -printf "%f\n" | sed 's/rofi_//g' | sed 's/.\{3\}$//' | rofi -dmenu -p "scripts")
if [[ "$Command" != "" ]]
then 
	exec "rofi_$Command.sh"
fi
echo "rofi_$Command.sh"
