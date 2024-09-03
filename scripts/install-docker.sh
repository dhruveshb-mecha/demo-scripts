#!/bin/bash

# Update package list and install required packages
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Determine Debian version codename (e.g., 'bullseye', 'bookworm')
DEBIAN_CODENAME=$(lsb_release -cs 2>/dev/null || echo "bookworm")

# Handle derivative distros and specific cases
case "$DEBIAN_CODENAME" in
  kali-rolling|Apollo)
    DEBIAN_CODENAME="bookworm"
    ;;
esac

# Add the Docker repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $DEBIAN_CODENAME stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list to include Docker's repository
sudo apt-get update

# Install Docker Engine, Docker CLI, containerd, Docker Buildx, and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Verify installation
docker --version
docker compose version
