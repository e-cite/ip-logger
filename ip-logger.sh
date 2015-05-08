#!/bin/bash
# A small script for periodic logging of public IP address or DNS records
#
# The MIT License (MIT)
# Copyright (c) 2015 Andreas Dolp <dev[at]andreas-dolp.de>
#
# Usage: See https://github.com/e-cite/ip-logger

### CONFIG ###
logfile="./ip.log" # File to log into
apiurl="https://api.ipify.org" # If defined, log public IP using this API
hostname="github.com" # If defined, log DNS records of this hostname
### END CONFIG ###

if [ ! $logfile ]; then
	echo "[ERR] ip-logger: No logfile defined!" 1>&2
	exit 1
fi

echo "== `date` `date +%s` ==" >> $logfile

# Get public IP using an API website
if [ $apiurl ]; then
	echo "Public IP: `curl -s $apiurl`" >> $logfile
fi

# Get DNS records
if [ $hostname ]; then
	echo "`host $hostname`" >> $logfile
fi

# Timecheck: Check time deviation
if [ "$1" = "timecheck" ]; then
        echo "`ntpdate -q pool.ntp.org | tail -n 1`" >> $logfile
fi

exit 0
