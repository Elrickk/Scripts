! /bin/bash

#Installing The Nagios Plugins :

#Prerequisites :
#Make sure that you have the following packages installed :

apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext




#Install NRPE :

#Prerequisites :

#Make sure that you have the following packages installed.

apt-get update
apt-get install -y autoconf automake gcc libc6 libmcrypt-dev make libssl-dev wget



#Downloading the Source :


cd /tmp
wget --no-check-certificate -O nrpe.tar.gz https://github.com/NagiosEnterprises/nrpe/archive/nrpe-3.2.1.tar.gz
tar xzf nrpe.tar.gz


#Compile :

cd /tmp/nrpe-nrpe-3.2.1/
./configure --enable-command-args
make all

#Create User And Group :

make install-groups-users


#Install Binaries

make install


#Install Configuration Files

make install-config



#Update Services File

echo >> /etc/services
echo '# Nagios services' >> /etc/services
echo 'nrpe    5666/tcp' >> /etc/services


#Install Service / Daemon

make install-init


#Remove nrpe.cfg
rm /usr/local/nagios/etc/nrpe.cfg

#Remove Plugins
rm -r /usr/local/nagios/libexec


systemctl enable nrpe.service
systemctl start nrpe.service

