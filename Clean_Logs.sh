#! /bin/bash

sudo find / -name '*.log' | awk '{print "echo -n > "$1}' | sudo sh



   echo "" > /var/log/syslog
   echo "" > /var/log/messages
   echo "" > /var/log/debug
   echo "" > /var/log/btmp



echo "Purge des logs terminée"
