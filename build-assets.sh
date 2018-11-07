#!/bin/bash

# Location of DHCP lease file to monitor
DHCP_LEASES=/etc/pihole/dhcp.leases

#
# Full name of the Asset file to build
# The file format is a CSV file without header
# <MAC_address>,<DHCP Client name>
#
ASSETS=/home/pi/Documents/raw_assets.csv

# Make sure the file exists
touch ${ASSETS}

# Initial grep to get rid of non timestamped entries
grep "^[0-9]* " ${DHCP_LEASES} |\
sort -f -t \  -u -k2,2  | \
cut --delimiter=\  --fields=2,4 --output-delimiter=\, | \
sort -f -t \, -u -k1,1 ${ASSETS} - -o ${ASSETS}
