#!/bin/bash
# Created: Thursday, June 29 2017

function makegif()
{
    case $1 in
        wisc )
            # wisc
            wiscdir=/data/wisc/
            cd $wiscdir;

            sleep 2
            echo convert -delay 100 -loop 0 $l16 xxirm5bbm.gif
            convert -delay 100 -loop 0 *UTC* xxirm5bbm.gif
            ;;
        imd )
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
            ;;

        gfs )
            gfsdir=/data/imd/gfs/
            cd $gfsdir
            echo convert -delay 100 -loop 0 00hgfs_850wind.gif 24hgfs_850wind.gif 48hgfs_850wind.gif\
                 72hgfs_850wind.gif 96hgfs_850wind.gif 120hgfs_850wind.gif 144hgfs_850wind.gif\
                 168hgfs_850wind.gif 192hgfs_850wind.gif 216hgfs_850wind.gif 240hgfs_850wind.gif\
                 850wind.gif

            convert -delay 100 -loop 0 00hgfs_850wind.gif 24hgfs_850wind.gif 48hgfs_850wind.gif\
                    72hgfs_850wind.gif 96hgfs_850wind.gif 120hgfs_850wind.gif 144hgfs_850wind.gif\
                    168hgfs_850wind.gif 192hgfs_850wind.gif 216hgfs_850wind.gif 240hgfs_850wind.gif\
                    850wind.gif


            echo convert -delay 100 -loop 0 00hGFS1534rain.gif 24hGFS1534rain.gif 48hGFS1534rain.gif\
                 72hGFS1534rain.gif 96hGFS1534rain.gif 120hGFS1534rain.gif 144hGFS1534rain.gif\
                 168hGFS1534rain.gif 192hGFS1534rain.gif 216hGFS1534rain.gif 240hGFS1534rain.gif\
                 rain.gif

            convert -delay 100 -loop 0 00hGFS1534rain.gif 24hGFS1534rain.gif 48hGFS1534rain.gif\
                    72hGFS1534rain.gif 96hGFS1534rain.gif 120hGFS1534rain.gif 144hGFS1534rain.gif\
                    168hGFS1534rain.gif 192hGFS1534rain.gif 216hGFS1534rain.gif 240hGFS1534rain.gif\
                    rain.gif
            ;;
    esac
}

makegif wisc
makegif imd
makegif gfs
