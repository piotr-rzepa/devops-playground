#!/bin/bash

echo "Adding Jenkins Debian Package key"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins apt repository"
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating apt"
sudo apt-get update -qq -y

echo "Installing Java JDK and JRE"
sudo apt-get -y install default-jre &> /dev/null
sudo apt-get -y install default-jdk &> /dev/null
java -version

echo "Installing Jenkins"
sudo apt-get -y install jenkins &> /dev/null

# Add jenkins to the docker group for permission to connect to docker socket and use docker commands
sudo usermod -a -G docker jenkins

echo "Starting Jenkins service"
sudo systemctl enable jenkins
sudo systemctl start jenkins

sleep 1m
sudo systemctl status jenkins
jenkins --version
JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo $JENKINSPWD
