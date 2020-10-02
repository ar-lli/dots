#!/usr/bin/env python3

import os
import re

myCmd1 = 'cmus-remote -Q | grep status'
myCmd2 = 'cmus-remote -Q | grep "tag title"'
myCmd3 = 'cmus-remote -Q | grep "tag artist"'

Status = os.popen(myCmd1).read()
TrackTitle = os.popen(myCmd2).read()
TrackArtist = os.popen(myCmd3).read()

if not Status :
    print("  cmus is not running ")
    print("  cmus is not running ")
    print("#3B4252")
    print("#E5E9F0")
else:
    Status = Status[7:-1]
    TrackTitle = TrackTitle[10:-1]
    TrackArtist = TrackArtist[11:-1]

    if Status == "stopped" :
        print("  cmus is stopped ")
        print("  cmus is stopped ")
        print("#3B4252")
        print("#E5E9F0")
    elif Status == "paused" :
        print("  : Song: %s, Artist: %s " % (TrackTitle, TrackArtist))
        print("  : Song: %s, Artist: %s " % (TrackTitle, TrackArtist))
        print("#3B4252")
        print("#E5E9F0")
    elif Status == "playing" :
        print("  : Song: %s, Artist: %s " % (TrackTitle, TrackArtist))
        print("  : Song: %s, Artist: %s " % (TrackTitle, TrackArtist))
        print("#3B4252")
        print("#E5E9F0")

