#!/bin/bash

# Mise à jour des paquets
sudo apt-get update

# Installation make cmd
sudo apt-get install make

# Installation des dépendances nécessaires pour Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Ajout de la clé GPG officielle de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajout du référentiel Docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour des paquets après ajout du référentiel
sudo apt-get update

# Installation de Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Démarrage du service Docker et activation au démarrage
sudo systemctl start docker
sudo systemctl enable docker

# Installation de Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

usermod -aG docker vagrant


