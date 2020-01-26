#!/bin/sh
#cppcheck  --force --std=c99 --language=c src/
make clean
rm -rf bin obj
make all
#fuser -k /dev/ttyACM0
avrdude -v -c arduino -P /dev/ttyUSB0 -p m328p -D -U flash:w:bin/firmware.elf
figlet "MCC19"
stty 57600 < /dev/ttyUSB0 && cat /dev/ttyUSB0
