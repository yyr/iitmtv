#!/usr/bin/env python

import time
from util import *
import datetime

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
        file_name="xxirm5bbm_%s.jpg" % new_time

        with cd(data_dir):
            get_image(url, file_name)
            with open(log_file, "ac") as logfile:
                logfile.write(
                    "{0} image is downloaded at {1}, out name {2} \n".format(
                        time_stamp, t, file_name))

            timestamp = datetime.datetime.fromtimestamp(new_time).time()
            start = datetime.time(0, 01)
            end = datetime.time(1, 20)
            if (start <= timestamp <= end):
                print("Yes rename")
            else:
                print("No rename")
            if (start <= timestamp <= end):
                from shutil import copyfile
                copyfile(file_name, 'xxirm5bbm_%s.jpg' %
                         time.strftime('UTC_%Y-%m-%d_%H:%M:%S', time.localtime(new_time)))

    else:
        print("%s: No new image is available" % t)


if __name__ == '__main__':
    while True:
        wisc_down(url_base,url,tmp_file, data_dir, remote_imgname)
        time.sleep(7200)
