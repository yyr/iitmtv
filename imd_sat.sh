#!/bin/bash
# Created: Thursday, June 15 2017

url_base="http://satellite.imd.gov.in/img/"
url="http://satellite.imd.gov.in/img/3Dasiasec_ir1.jpg"

cd /data/imd/
fn=imd_3Dasiasec_ir1-`date +%s`.jpg
curl -o ${fn} ${url}
ln -sf ${fn} imd_3Dasiasec_ir1-current.jpg
