#!/bin/sh

sudo make install
killall slstatus
exec slstatus &
