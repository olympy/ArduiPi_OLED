#!/bin/bash
# autogen.sh
#----------------------------------------------------------
# Copyright(C) 2015 Lorenzo Delana, License under MIT
#
#   https://github.com/devel0/ArduiPi_SSD1306
#
# Summary : adapt code to be bananapi compatible, in short
#           - set i2c-2 device port
#           - adjust CCFLAGS for the library and examples
#
# UR6LKW 2025-09-01 :
#   - Orange PI Zero 3 support (/dev/i2c-3 port, CFLAGS)

BD=`dirname $0`
BASEDIR=`realpath $BD`

echo "Specify your platform:"
echo "  1. RaspberryPI"
echo "  2. BananaPI"
echo "  3. OrangePI Zero3"

read -n 1 c
echo

if [ "$c" == "1" ]; then
	echo "Setting for RaspberryPI"
	HW="RaspberryPI"
elif [ "$c" == "2" ]; then
	echo "Setting for BananaPI"
	HW="BananaPI"
elif [ "$c" == "3" ]; then
	echo "Setting for OrangePI Zero3"
	HW="OPIZ3"
else
	echo "Invalid argument given."
	HW="RaspberryPI" # fallback to raspi
	exit
fi

echo "Ensure libi2c-dev packages"
apt-get install libi2c-dev

echo $HW > $BASEDIR/hwplatform

echo "run make to build"

