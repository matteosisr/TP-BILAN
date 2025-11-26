#!/bin/bash

echo "=== Mise a jour du systeme ==="
apt update && apt upgrade -y

echo "=== Installation des dependances necessaires ==="
apt install ca-certificates curl gnupg lsb-release dpkg -y

echo "=== Ajout du depot Docker ==="
wget https://download.docker.com/linux/debian | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "=== Mise a jour de la liste des paquets ==="
apt update -y

echo "=== Installation de Docker + Docker-compose ==="
apt install docker docker-compose -y

echo "=== Activation et demarrage de Docker ==="
systemctl enable docker
systemctl start docker

echo "=== Verification de l'installation ==="
docker --version
docker compose version

echo "=== Installation terminee ! ==="
