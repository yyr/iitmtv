#!/usr/bin/env python

import time
from util import *

url_base="http://nwp.imd.gov.in/gfs/"
files = ["00hgfs_850wind.gif",
         "24hgfs_850wind.gif",
         "48hgfs_850wind.gif",
         "72hgfs_850wind.gif",
         "96hgfs_850wind.gif",
         "120hgfs_850wind.gif",
         "144hgfs_850wind.gif",
         "168hgfs_850wind.gif",
         "192hgfs_850wind.gif",
         "216hgfs_850wind.gif",
         "240hgfs_850wind.gif"]

data_dir = "/data/imd/gfs/"
log_file = "/var/log/imd_gfs.log"

def gfs_down(url_base, files, data_dir):
    for f in files:
        with cd(data_dir):
            get_image(url_base + f, f)

    with open(log_file, "ac") as logfile:
        logfile.write("gfs forecast data downloaded ")


    return

if __name__ == '__main__':
    gfs_down(url_base, files, data_dir)
