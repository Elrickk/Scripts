#! /bin/bash

# Télécharger la derniere version :
cd /tmp
wget http://wordpress.org/latest.zip

# Décompression de l'archive dans /var/www/html
apt-get install unzip
unzip latest.zip -d /var/www/html  
cd /var/www/html 
rm index.html 
cp -R wordpress/* ./  
rm -Rf wordpress

# Gestion des droits :
cd /var/www/
chown -R www-data:www-data  *
find . -type d -exec chmod 0755 {} \;
find . -type f -exec chmod 0644 {} \;
