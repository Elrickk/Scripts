#! /bin/bash

cd /tmp

# Telecharger depuis le site officiel
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -zxvf  phpMyAdmin-5.0.2-all-languages.tar.gz

# Déplacez le dossier PhpMyAdmin dans votre répertoire de lecteur racine Apache.
mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

# Donnez à l'utilisateur www-data le contrôle total sur le répertoire PhpMyAdmin et ses fichiers.
chown www-data.www-data /var/www/html/phpmyadmin/* -R
