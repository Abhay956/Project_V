#!/bin/bash

# Update the package list and upgrade the installed packages
sudo apt-get update -y

# Install OpenJDK headless without recommended packages
sudo apt install -y --no-install-recommends openjdk-17-jdk-headless

# Add Swap Memory of 2GB
sudo swapon --show
free -h
df -h
sudo fallocate -l 2G /swapfile
ls -lh /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon --show
free -h
cat /proc/sys/vm/swappiness
sudo sysctl vm.swappiness=10
cat /proc/sys/vm/vfs_cache_pressure
sudo sysctl vm.vfs_cache_pressure=50

# Install essential packages
sudo apt-get install -y curl net-tools wget unzip tree make

# Install Docker
sudo apt-get install -y docker.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Start the Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Output Docker and Docker Compose versions
docker --version
docker-compose --version

echo "-----BEGIN OPENSSH PRIVATE KEY-----" >> /root/.ssh/authorized_keys
echo "-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
QyNTUxOQAAACDZtGGEZnmmwdULNpvway95XXf8dPyecAWJlKqluyOtEgAAAJhDU5HyQ1OR
8gAAAAtzc2gtZWQyNTUxOQAAACDZtGGEZnmmwdULNpvway95XXf8dPyecAWJlKqluyOtEg
AAAEBy23vPOIjX243LMRSYbLxl6gFxE0RSGjsPFD1yETaKpNm0YYRmeabB1Qs2m/BrL3ld
d/x0/J5wBYmUqqW7I60SAAAAFXJvb3RAaXAtMTcyLTMxLTQ5LTExMA==
-----END OPENSSH PRIVATE KEY-----" >> /root/.ssh/authorized_keys

# Edit sshd_config file
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Restart SSH service (adjust the command based on your system)
sudo systemctl restart ssh

# Clone the repository
sudo git clone https://github.com/Abhay956/Project_V.git

# Move to the project directory
cd Project_V

# Execute the following make command to update server IP in prometheus config file
sudo make all

# Run docker-compose up in detached mode
sudo docker-compose up -d
