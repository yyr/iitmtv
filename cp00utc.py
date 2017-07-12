#!/usr/bin/env python
import os
import re
import datetime
import time
from util import *

data_dir = "/data/wisc/"

with cd(data_dir):
    files = [f for f in os.listdir('.') if re.match(r'.*[0-9]+.*\.jpg', f)]
    for f in files:
        t = re.findall(r'\d+', f)
        # print(f + " " + t[1])
        timestamp = datetime.datetime.fromtimestamp(float(t[1])).time()
        start = datetime.time(0, 01)
        end = datetime.time(1, 20)
        if (start <= timestamp <= end):
            from shutil import copyfile
            print(f  + " will be renamed " + 'xxirm5bbm_%s.jpg' %
                  time.strftime('UTC_%Y-%m-%d_%H:%M:%S', time.localtime(float(t[1]))))

            copyfile(f, 'xxirm5bbm_%s.jpg' %
                     time.strftime('UTC_%Y-%m-%d_%H:%M:%S', time.localtime(float(t[1]))))
