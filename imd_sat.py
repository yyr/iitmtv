#!/usr/bin/env python

import time
from util import *

url_base="http://satellite.imd.gov.in/img/"
url="http://satellite.imd.gov.in/img/3Dglobe_ir1.jpg"
tmp_file="3Dglobe_ir1_index.html"

old_time = 0
data_dir = "/data/imd/"
remote_imgname = "3Dglobe_ir1.jpg"
log_file = "/var/log/imd_sat.log"

def imd_down(url_base, url, tmp_file, data_dir, remote_imgname):
    global old_time, log_file

    base = down_page(url_base, tmp_file)
    page = get_page(tmp_file)
    time_stamp = get_time_from_dir_page(page,remote_imgname)
    new_time = get_epo_from_dir_page(time_stamp)

    t = time.strftime('%Y-%m-%d-%H:%M:%S')
    if check_new(old_time, new_time):
        old_time = new_time
        print("new image available")
        file_name="3Dglobe_ir1_%s.jpg" % new_time

        with cd(data_dir):
            get_image(url, file_name)
            with open(log_file, "ac") as logfile:
                logfile.write("{0} image is downloaded at {1} \n".format( time_stamp, t))

    else:
        print("%s: No new image is available" % t)

    return

if __name__ == '__main__':
    while True:
        imd_down(url_base, url, tmp_file, data_dir, remote_imgname)
        time.sleep(1200)
