FROM resin/raspberrypi-node

MAINTAINER Nat Weerawan<nat@cmmc.io> 
RUN apt-get update

##################################################
# Install tools                                  #
##################################################

RUN apt-get install -y curl wget git apt-transport-https python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev net-tools 

RUN alias ll='ls -alG'

RUN apt-get install -y avahi-daemon avahi-utils 

USER root

RUN mkdir -p /var/run/dbus

EXPOSE 5353 51826 


WORKDIR /root

RUN git clone https://github.com/KhaosT/HAP-NodeJS.git 

WORKDIR /root/HAP-NodeJS 
RUN npm install

ADD run.sh /root/run.sh 

CMD ["/root/run.sh"]
