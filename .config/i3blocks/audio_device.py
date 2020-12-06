#!/usr/bin/env python3

import os
import re

myCmd = "pacmd list-sinks | awk '/index:/ {print $0}; /name:/ {print $0}; /device\.description/ {print $0}'"
List = os.popen(myCmd).read()
regex = '\*((.|\n)*)device\.description = \"(.+)\"'

output = re.search(regex, List).group(3)
string = "  %s "
if output == "Family 17h (Models 10h-1fh) HD Audio Controller Analog Stereo" :

     print ("   system audio ")
     print ("   system audio ")
     print ("#D08770")
     print ("#3B4252")
elif output == "AUSDOM ANC8" :
     print (f"  {output} ")
     print (f"  {output} ")
     print ("#B48EAD")
     print ("#3B4252")
elif output == "HD-Audio Generic Digital Stereo (HDMI)" :
     print ("   HDMI AUDIO")
     print ("   HDMI AUDIO")
     print ("#D08770")
     print ("#3B4252")
else :
     print ("   audio device")
     print ("   audio device")
     print ("#D08770")
     print ("#3B4252")
