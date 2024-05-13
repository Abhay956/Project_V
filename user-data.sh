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

echo "edit file /root/.ssh/authorized_keys"
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCOQYmRcWhfjuhM6T61oBOyVHG9cb2xFEwZyaNsIkrHF+Q3WtzLTVlrC8q1wl7tvDiwSbUYlMAVJ84WsfAlxldO1K03azWXxE7APn9f4iH3GQXFH/GH45kiZlvbqKQw+bdnZSqudQ4dqsohU3cCMy9x/2STG/DpjUgyh1+uw3enwWxKsIA2KpAE+UJnvdM+LSZ8hJ7oqUpIaJnwY/I97qiRRgJqbkMmTut3NCcdbMR65+b9itRnLXqi7YnD+BFRfpV+mBfhqomX7wUk2EVOs+N7QUkYig2HfutqpSv3eyYZ+s1/uJWQwdyPp/5/HoGkAMZ4MgmN9DjLxsNQpznvZJ8u/TuoewSmzgSeHmE13wGQccNzXBQkYTYiZQ0lSMgUWNU7Q9M2ZE1Ff6HzSB5OM/pbwY1s94SLmJ17PgSoN1ranEeNiz9qWC/0dKT4mBvPPjuOgWcHaTAlDlLMoE3GnkiatWheNrcs6NarztRnBLj2Z2QJ0OoKva0ZLOLDnTTP7/8= root@localhost.localdomain" >> /root/.ssh/authorized_keys

# Edit sshd_config file
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# Restart SSH service (adjust the command based on your system)
sudo systemctl restart ssh
