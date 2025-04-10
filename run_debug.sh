#!/bin/sh
bochs -f bochsrc.txt -q &
sleep 1
kill -INT $!
wait
