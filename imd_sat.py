#!/usr/bin/env python

url_base="http://satellite.imd.gov.in/img/"
url="http://satellite.imd.gov.in/img/3Dasiasec_ir1.jpg"

old_time = 0
import time

def check_new(new_time):
    if old_time is None:
        return True
    elif old_time < new_time:
        return True
    else:
        return False


def imd_down():
    import urllib
    t = time.strftime('%Y-%m-%d-%H:%M:%S')
    new_time = time.time()
    if check_new(new_time):
        file_name="3Dasiasec_%s.jpg" % t
        p, status = urllib.urlretrieve(url_base,"tmp.html",None)
        # globals()['old_time'] = new_time
        return(status)

if __name__ == '__main__':
    while True:
        imd_down()
        time.sleep(50)
