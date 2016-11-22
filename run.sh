#!/bin/bash

rm /var/run/dbus/pid
sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

dbus-daemon --system
avahi-daemon -D


ifconfig
cd /root/HAP-NodeJS/
DEBUG=* node BridgedCore.js

