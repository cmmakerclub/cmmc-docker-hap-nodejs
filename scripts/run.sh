#!/bin/bash

rm /var/run/dbus/pid
sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

dbus-daemon --system
avahi-daemon -D 

if [ -f /root/.initialized ];
then
   echo "starting.."
else
   touch /root/.initialized
   /root/npm-install
fi

cd /root/HAP-NodeJS/
DEBUG=* node BridgedCore.js


