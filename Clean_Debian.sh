#! /bin/bash

apt-get clean -y
apt-get autoclean -y
echo "Nettoyage du cache des paquets installés"

apt-get autoremove --purge -y
echo "Nettoyage des paquets inutiles et leurs fichiers de conf"

rm -Rf /tmp/*
echo "/tmp vidé"

rm -Rf ~/.local/share/Trash/*
rm -Rf /root/.local/share/Trash/*
echo "Corbeilles vidées"

rm -Rf ~/.thumbnails
echo "Nettoyage des thumbnails"

echo "Fin du clean !"
