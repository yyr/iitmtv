#!/bin/bash
# Created: Friday, June 16 2017

# xxirm5bbm.jpg
# http://tropic.ssec.wisc.edu/real-time/indian/images/
# http://tropic.ssec.wisc.edu/real-time/indian/images/

fn="xxirm5bbm.jpg"
url="http://tropic.ssec.wisc.edu/real-time/indian/images/${fn}"

cd /data/wisc/
fn=wisc_xxirm5bbm-`date +%s`.jpg
curl -o ${fn} ${url}
ln -sf ${fn} wisc_xxirm5bbm-current.jpg
