#!/usr/bin/env python3
# pass year & artist

import os
import sys
import re

Dir = os.getcwd() # Get path of current working directory
album = os.path.basename(Dir)   # Get the name of current working directory
songs = sorted(os.listdir(Dir)) # Get list of songs
year = sys.argv[1]  # Pass as argument the album's year
artist = sys.argv[2] # Pass as argument the album's artist
Album = '"{}"'.format(album)
Artist = '"{}"'.format(artist)
z = 1
for i in songs:
    r = re.search('- (.*).mp3', i)
    Title = r.group(1)
    Title = '"{}"'.format(Title)
    j = '"{}"'.format(i)
    w = '"{}"'.format(z)
    os.system("id3v2 -t " + Title + " -T " + w + " -a " + Artist + " -y " + year + " -A " + Album + " " + j )
    z = z + 1
