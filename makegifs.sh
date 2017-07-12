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

            # montage 00hgfs_850wind.gif    00hGFS1534rain.gif -tile 2x1 -geometry +0+0  00h_stiched.gif
            montage 24hgfs_850wind.gif    24hGFS1534rain.gif -tile 2x1 -geometry +0+0  24h_stiched.gif
            montage 48hgfs_850wind.gif    48hGFS1534rain.gif -tile 2x1 -geometry +0+0  48h_stiched.gif
            montage 72hgfs_850wind.gif    72hGFS1534rain.gif -tile 2x1 -geometry +0+0  72h_stiched.gif
            montage 96hgfs_850wind.gif    96hGFS1534rain.gif -tile 2x1 -geometry +0+0  96h_stiched.gif
            montage 120hgfs_850wind.gif  120hGFS1534rain.gif -tile 2x1 -geometry +0+0 120h_stiched.gif
            montage 144hgfs_850wind.gif  144hGFS1534rain.gif -tile 2x1 -geometry +0+0 144h_stiched.gif
            montage 168hgfs_850wind.gif  168hGFS1534rain.gif -tile 2x1 -geometry +0+0 168h_stiched.gif
            montage 192hgfs_850wind.gif  192hGFS1534rain.gif -tile 2x1 -geometry +0+0 192h_stiched.gif
            montage 216hgfs_850wind.gif  216hGFS1534rain.gif -tile 2x1 -geometry +0+0 216h_stiched.gif
            montage 240hgfs_850wind.gif  240hGFS1534rain.gif -tile 2x1 -geometry +0+0 240h_stiched.gif

            convert -delay 100 -loop 0 24h_stiched.gif 48h_stiched.gif 72h_stiched.gif \
                    96h_stiched.gif 120h_stiched.gif 144h_stiched.gif 168h_stiched.gif \
                    192h_stiched.gif 216h_stiched.gif 240h_stiched.gif rain.gif

            ;;
    esac
}

makegif wisc
makegif imd
makegif gfs
