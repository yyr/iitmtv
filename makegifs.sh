#!/bin/bash
# Created: Thursday, June 29 2017

# imd
imddir=/data/imd/
l10=`cd $imddir; ls -1t *jpg | head -10`

cd $imddir;
convert -delay 50 -loop 0 $l10 3Dglobe.gif

# wisc
wiscdir=/data/wisc/
l8=`cd $wiscdir; ls -1t *.jpg | head -8`

cd $wiscdir;
convert -delay 50 -loop 0 $l8 xxirm5bbm.gif
