#!/usr/bin/env python3

import os
import re

# colors
background="#3B4252"
orange="#D08770"
purple="#B48EAD"
#
myCmd = "pacmd list-sinks | awk '/index:/ {print $0}; /name:/ {print $0}; /device\.description/ {print $0}'"
List = os.popen(myCmd).read()
regex = '\*((.|\n)*)device\.description = \"(.+)\"'
#
output = re.search(regex, List).group(3)
string = "  %s "
if output == "Family 17h (Models 10h-1fh) HD Audio Controller Analog Stereo" :

     print ("   system audio ")
     print ("   system audio ")
     print (orange)
     print (background)
elif output == "AUSDOM ANC8" :
     print (f"  {output} ")
     print (f"  {output} ")
     print (purple)
     print (background)
elif output == "Bose Mini II SoundLink" :
     print (f"  {output} ")
     print (f"  Bose Mini II ")
     print (purple)
     print (background)
elif output == "HD-Audio Generic Digital Stereo (HDMI)" :
     print ("   HDMI AUDIO ")
     print ("   HDMI AUDIO ")
     print (orange)
     print (background)
else :
     print ("   audio device ")
     print ("   audio device ")
     print (orange)
     print (background)
