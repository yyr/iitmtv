#!/usr/bin/env python

import os
import re
import time
import urllib

from contextlib import contextmanager

@contextmanager
def cd(newdir):
    prevdir = os.getcwd()
    os.chdir(os.path.expanduser(newdir))
    try:
        yield
    finally:
        os.chdir(prevdir)

def check_new(old_time, new_time):
    if old_time is None:
        return True
    elif old_time < new_time:
        return True
    else:
        return False

def get_time_from_dir_page(html_page, match_string):
    line = None
    for item in html_page.split("\n"):
        if match_string in item:
            line = item.strip()
    if line:
        t = re.search(">([0-9][0-9].* )<",line)
        tim = t.group(1).strip()
        return tim

def get_epo_from_dir_page(tim):
    pattern = '%d-%b-%Y %H:%M'
    epo_time = int(time.mktime(time.strptime(tim, pattern)))

    return epo_time

def get_page(local_file):
    if os.path.exists(local_file):
        fh = open(local_file, "rb")
        return fh.read()
    else:
        return None

def down_page(url_base,local_file):
    p = None
    status = None

    try:
        p, status = urllib.urlretrieve(url_base, local_file, None)
    except Exception, e:
        print(e)
        time.sleep(120)
        down_page(url_base, local_file)
    return(status)

def get_image(url, filename):
    try:
        f = open(filename, 'wb')
        f.write(urllib.urlopen(url).read())
        f.close()
    except Exception, e:
        print(e)
        time.sleep(120)
        get_image(url, filename)
    return


if __name__ == '__main__':
    pass
