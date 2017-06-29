#!/usr/bin/env python

import time
from util import *

url_base="http://tropic.ssec.wisc.edu/real-time/indian/images/"
url="http://tropic.ssec.wisc.edu/real-time/indian/images/xxirm5bbm.jpg"
tmp_file="xxirm5bbm_index.html"

old_time = 0
data_dir = "/data/wisc/"

def wisc_down():
    remote_imgname = "xxirm5bbm.jpg"

    base = down_page(url_base, tmp_file)
    page = get_page(tmp_file)
    new_time = get_epo_from_dir_page(page,remote_imgname)

    t = time.strftime('%Y-%m-%d-%H:%M:%S')
    if check_new(old_time, new_time):
        print("%s: new image available" % t)
        globals()['old_time'] = new_time
        file_name="xxirm5bbm_%s.jpg" % t

        with cd(data_dir):
            get_image(url, file_name)

    else:
        print("%s: No new image available")

    return

if __name__ == '__main__':
    while True:
        wisc_down()
        time.sleep(7200)
