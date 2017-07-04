#!/usr/bin/env python

import time
from util import *

url_base="http://tropic.ssec.wisc.edu/real-time/indian/images/"
url="http://tropic.ssec.wisc.edu/real-time/indian/images/xxirm5bbm.jpg"
tmp_file="xxirm5bbm_index.html"

old_time = 0
data_dir = "/data/wisc/"
remote_imgname = "xxirm5bbm.jpg"
log_file = "/var/log/wisc.log"

def wisc_down(url_base, url, tmp_file, data_dir, remote_imgname):
    global old_time, log_file

    base = down_page(url_base, tmp_file)
    page = get_page(tmp_file)
    time_stamp = get_time_from_dir_page(page,remote_imgname)
    new_time = get_epo_from_dir_page(time_stamp)

    t = time.strftime('%Y-%m-%d-%H:%M:%S')
    if check_new(old_time, new_time):
        old_time = new_time
        print("%s: new image available" % t)
        file_name="xxirm5bbm_%s.jpg" % t

        with cd(data_dir):
            get_image(url, file_name)
            with open(log_file, "ac") as logfile:
                logfile.write("%s image is downloaded" % time_stamp)

    else:
        print("%s: No new image is available" % t)


if __name__ == '__main__':
    while True:
        wisc_down(url_base,url,tmp_file, data_dir, remote_imgname)
        time.sleep(7200)
