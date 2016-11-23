#!/bin/bash

rm /var/run/dbus/pid

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

if [ -f /root/HAP-NodeJS/.initialized ];
then
   echo "starting.."
else
   echo "create .initialized"
   touch /root/HAP-NodeJS/.initialized
   /root/npm-install
fi

dbus-daemon --system
avahi-daemon -D 

cd /root/HAP-NodeJS/
DEBUG=* node BridgedCore.js


