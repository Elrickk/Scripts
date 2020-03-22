
#! /bin/bash

# MAJ
  apt update -y
  apt full-upgrade -y

# INSTALL APACHE2
  apt install -y apache2 libapache2-mod-php
  systemctl enable apache2

# Activer la réécriture d'url
  a2enmod rewrite
# Activer la compression
  a2enmod deflate
# Controler et modifier les headers
  a2enmod headers

  systemctl restart apache2

# INSTALL PHP
  apt install -y php php-cli

# Installer les modules les plus courants
  apt install -y php-{curl,gd,intl,memcache,xml,zip,mbstring,json}

# Pour interagir avec SQL
  apt install -y php-mysql

  systemctl restart apache2

# INSTALL MariaDB
  apt install -y mariadb-server
  mysql_secure_installation

# Connexion à la Base de données
  mysql -u root -p

# On créé ensuite un utilisateur avec tous les droits pour ne pas utiliser root
# CREATE USER 'elrick'@'localhost' IDENTIFIED BY 'mdp';
#  GRANT ALL PRIVILEGES ON *.* TO 'elrick'@'localhost' WITH GRANT OPTION;
#  FLUSH PRIVILEGES;

  exit

  systemctl enable mariadb


# Le serveur LAMP est installé !
