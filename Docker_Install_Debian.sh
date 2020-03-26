
# Installer les dépendances :

  apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common

# Importer la signature du dépôt à notre système

  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Ajouter le dépot :

  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

  apt update
  apt upgrade -y

# Installer Docker

  apt-get install docker-ce docker-ce-cli containerd.io -y

  systemctl status docker
  systemctl enable docker
