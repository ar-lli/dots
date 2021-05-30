#!/bin/bash
# l = lyrics
# a = album
#
title=$(cmus-remote -Q | grep title)
artist=$(cmus-remote -Q | grep artist)
album=$(cmus-remote -Q | grep album)
#
regex_t='tag title (.*)'
[[ $title =~ $regex_t ]]
title=$(echo ${BASH_REMATCH[1]} | sed 's/ /-/g')
title=$(echo $title | sed -e 's/\(.*\)/\L\1/')
title=$(echo $title | sed "s/'//g")
title=$(echo $title | sed 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/')
#
regex_ar='tag artist (.*)'
[[ $artist =~ $regex_ar ]]
artist=$(echo ${BASH_REMATCH[1]} | sed 's/ /-/g')
artist=$(echo $artist | sed -e 's/\(.*\)/\L\1/')
artist=$(echo $artist | sed "s/'//g")
artist=$(echo $artist | sed 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/')
#
regex_al='tag album (.*)'
[[ $album =~ $regex_al ]]
album=$(echo ${BASH_REMATCH[1]} | sed 's/ /-/g')
album=$(echo $album | sed -e 's/\(.*\)/\L\1/')
album=$(echo $album | sed "s/'//g")
album=$(echo $album | sed 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/')
#
case $1 in

	l)
		title=$(echo $title | sed -e 's/([^()]*)//g')
		dash=$(echo -n $title | tail -c 1)
		if [ "$dash" = "-" ];
		then
			title=$(echo $title | sed 's/.$//')
		fi
		echo $title
		url="https://genius.com/${artist}-${title}-lyrics"
		xdg-open $url
	;;
	a)
		url="https://genius.com/albums/${artist}/${album}"
		xdg-open $url
	;;
esac
