#!/usr/bin/env python

import os
import re
import time

def get_epo_from_dir_page(html_page,match_string):
    epo_time = 0
    line = None
    for item in page.split("\n"):
        if match_string in item:
            line = item.strip()
    if line:
        t = re.search(">([0-9][0-9].* )<",line)
        tim = t.group(1).strip()
        pattern = '%d-%b-%Y %H:%M'
        epo_time = int(time.mktime(time.strptime(tim, pattern)))
    return epo_time

def get_page(local_file):
    if os.path.exists(local_file):
        fh = open(local_file, "rb")
        return fh.read()
    else:
        return None

    # local_file = "tmp.html"
    # get_epo_from_dir_page(page,"3Dasiasec_ir1.jpg")

if __name__ == '__main__':
    pass
