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
     print ("#3B4252")
     print ("#D08770")
else:
     print (f"  {output} ")
     print (f"  {output} ")
     print ("#3B4252")
     print ("#88C0D0")

