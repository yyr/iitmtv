#!/bin/bash
# Created: Thursday, June 15 2017

url_base="http://satellite.imd.gov.in/img/"
url="http://satellite.imd.gov.in/img/3Dasiasec_ir1.jpg"

cd /data/imd/
curl -o imd_insat3d-`date +%s`.jpg ${url}
