#!/usr/bin/env python

import time
from util import *

url_base="http://satellite.imd.gov.in/img/"
url="http://satellite.imd.gov.in/img/3Dasiasec_ir1.jpg"
tmp_file="imd_3Dasiasec_ir1_index.html"

old_time = 0

def imd_down():
    remote_imgname = "3Dasiasec_ir1.jpg"

    base = down_page(url_base, tmp_file)
    page = get_page(tmp_file)
    new_time = get_epo_from_dir_page(page,remote_imgname)

    if check_new(old_time, new_time):
        print("new image available")
        globals()['old_time'] = new_time
        t = time.strftime('%Y-%m-%d-%H:%M:%S')
        file_name="3Dasiasec_%s.jpg" % t
        get_image(url, file_name)

    else:
        print("No new image available")

    return


if __name__ == '__main__':
    while True:
        imd_down()
        time.sleep(20)
