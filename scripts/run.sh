#!/bin/bash

# sed -i "s/hostname: DEFAULT_MQTT_HOSTNAME/hostname: '$MQTT_HOST'/g" /home/www/main.bundle.js

rm -f /var/run/dbus/pid

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

# if [ -f /root/HAP-NodeJS/.initialized ];
# then
#    echo "starting.."
# else
#    echo "create .initialized"
#    touch /root/HAP-NodeJS/.initialized
#    /root/npm-install
# fi

dbus-daemon --system
avahi-daemon -D 

# cd /root/HAP-NodeJS/
# DEBUG=* node BridgedCore.js


while true
do
	echo "Press [CTRL+C] to stop.."
	sleep 1
done