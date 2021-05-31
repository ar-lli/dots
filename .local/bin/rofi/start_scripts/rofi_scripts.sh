#!/bin/bash
ListCommand=$(cat $HOME/.rofi_scripts.txt | rofi -dmenu -p "scripts")
case $ListCommand in

	add_word)
		Command="rofi_$ListCommand.sh"
		bash $Command
		;;
	clipboard)
		Command="rofi_$ListCommand.sh"
		bash $Command
		;;

	download_tidy*)
		Command=$(echo $ListCommand | sed 's/ .*//')
		Flags=$(echo $ListCommand | sed "s/$Command //")
		regex='"(.+)" "(.+)"'
		[[ $Flags =~ $regex ]]
		folder="${BASH_REMATCH[1]}"
		url="${BASH_REMATCH[2]}"
		if [[ ${#BASH_REMATCH[@]} -eq 3 ]]
		then
			Command="rofi_$Command.sh"
			bash $Command "$folder" "$url"
		fi
		;;

	"genius_page l" | "genius_page -a")
		Command=$(echo $ListCommand | sed 's/ .*//')
		Flags=$(echo $ListCommand | sed "s/$Command //" | sed 's/-//')
		Command="rofi_$ListCommand.sh"
		bash "$Command" "$Flags"
		;;

	unicode_cheatsheet)
		Command="rofi_$ListCommand.sh"
		bash $Command
		;;

	vim_cheatsheet)
		Command="rofi_$ListCommand.sh"
		bash $Command
		;;
esac
