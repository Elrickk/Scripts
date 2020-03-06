#! /bin/bash

apt install ntp -y

cd /etc

rm ntp.conf

cp /tmp/ntp.conf /etc/

systemctl restart ntp
systemctl enable ntp
