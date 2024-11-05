#!/usr/bin/env python3
import subprocess
from datetime import datetime, time
import sys
start_time = time(21, 0)
end_time = time(7, 30)
def check_time():
    now = datetime.now().time()
    return start_time <= now or now <= end_time

if sys.argv[1] == "check_login": # add locky.py check_login || exit to your .zprofile 
    exit(check_time())
    
subprocess.run(["systemctl", sys.argv[1]]) # depends if you pass suspend or hibernate
if sys.argv[1] == "suspend":
    subprocess.run("swaylock")
while check_time():    
    subprocess.run(["systemctl", "hibernate"])
    
