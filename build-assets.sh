#!/bin/bash

DHCP_LEASES=/etc/pihole/dhcp.leases

ASSETS=/home/pi/Documents/raw_assets.csv
touch ${ASSETS}

grep "^[0-9]* " ${DHCP_LEASES} |\
sort -f -t \  -u -k2,2  | \
cut --delimiter=\  --fields=2,4 --output-delimiter=\, | \
sort -f -t \, -u -k1,1 ${ASSETS} - -o ${ASSETS}
