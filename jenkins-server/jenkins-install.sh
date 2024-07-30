#!/bin/bash

# Mise à jour du système
sudo apt update -y
sudo apt upgrade -y

# Téléchargez et installez OpenJDK 17
sudo apt install -y openjdk-17-jdk

# Vérifiez l'installation de Java
java -version
javac -version

# Ajoutez le dépôt Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Installez Jenkins
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Installation de Git
sudo apt install -y git

# Installation de Terraform
sudo apt install -y gnupg software-properties-common
wget -O - https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com focal main"
sudo apt update -y
sudo apt install -y terraform

# Installation de kubectl
sudo curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Vérifiez l'installation de kubectl
kubectl version --client
