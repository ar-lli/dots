#!/bin/bash
# ListCommand=$(find $HOME/.rofi_exe_scripts -type f -printf "%f\n" | sed 's/rofi_//g' | sed 's/.\{3\}$//' | rofi -no-show-match -dmenu -p "scripts")
ListCommand=$(cat $HOME/.rofi_scripts.txt | rofi -no-show-match -dmenu -p "scripts")
#
Command=$(echo $ListCommand | sed 's/ .*//')
# dash '-' è un carattere usato per far sì di non matchare comandi già presenti
Flags=$(echo $ListCommand | sed "s/$Command //" | sed 's/-//')
#
if [[ "$Command" == "$Flags" ]]
then
	Flags=""
fi
#
if [[ "$Command" != "" ]]
then 
	# exec "rofi_$Command.sh $Flags"
	bash "rofi_$Command.sh" "$Flags"
fi
