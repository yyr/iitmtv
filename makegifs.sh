#!/bin/bash
# Created: Thursday, June 29 2017

# wisc
wiscdir=/data/wisc/
cd $wiscdir;
l8=`ls -1t *.jpg | head -8 | tac`

sleep 2
echo convert -delay 50 -loop 0 $l8 xxirm5bbm.gif
convert -delay 50 -loop 0 $l8 xxirm5bbm.gif

# imd
imddir=/data/imd/
cd $imddir;
l20=`ls -1t 3Dg*jpg | head -10| tac`

sleep 2
echo convert -delay 50 -loop 0 $l20 3Dglobe.gif
convert -delay 50 -loop 0 $l20 3Dglobe.gif

l20=`ls -1t 3DR*jpg | head -10| tac`
sleep 2
echo convert -delay 50 -loop 0 $l20 3DRhalfhr_olr.gif
convert -delay 50 -loop 0 $l20 3DRhalfhr_olr.gif
