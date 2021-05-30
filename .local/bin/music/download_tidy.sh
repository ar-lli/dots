#!/bin/bash
#
bar="#"
# regex per ottenere informazioni canzone
regex1='"title":"(.*)","author_name"'
# regex per ottenere informazioni nome canzone scaricata
regex2='Destination: (.*)'
#
# ottieni lista url canzoni di una playlist youtube
ListUrl=( $(youtube-dl --get-id ${1} -i) )
# scorri lista url
for i in "${!ListUrl[@]}";
do
	# url completo canzone
	SongUrl="https://www.youtube.com/watch?v=${ListUrl[$i]}"
	# url info canzone
	InfoUrl="https://www.youtube.com/oembed?url=${SongUrl}&format=json"
	# ottieni info canzone 
	SongInfo=$(echo -e $(curl -s $InfoUrl))
	[[ $SongInfo =~ $regex1 ]]
	# titolo definitivo canzone da scaricare
	SongTitle="$((i+1)) - ${BASH_REMATCH[1]}.mp3"
	SongFile=$(youtube-dl -x --audio-format mp3 "${SongUrl}" | grep "ffmpeg")
	[[ $SongFile =~ $regex2 ]]
	# nome file canzone da rinominare
	SongTempName="${BASH_REMATCH[1]}"
	# rinomina canzone
	mv "${SongTempName}" "${SongTitle}"
	echo -ne "${bar} "
done
echo -e '\nEND'
