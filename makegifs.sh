#!/bin/bash
# Created: Thursday, June 29 2017

# imd
imddir=/data/imd/
l10=`cd $imddir; ls -1t | head -10`

cd $imddir;
convert -delay 50 -loop 0 $l10 3Dglobe.gif

# wisc
wiscdir=/data/wisc
l8=`cd $imddir; ls -1t | head -8`
convert -delay 50 -loop 0 $l8 3Dglobe.gif

