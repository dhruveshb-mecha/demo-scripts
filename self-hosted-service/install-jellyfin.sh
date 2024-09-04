#!/bin/bash

# Update and upgrade the system
echo "Updating the system..."
sudo apt update && sudo apt upgrade -y

# Install required packages for Jellyfin installation
echo "Installing required packages..."
sudo apt install software-properties-common apt-transport-https ca-certificates curl -y

# Import Jellyfin GPG key
echo "Importing Jellyfin GPG key..."
curl -fsSL https://repo.jellyfin.org/debian/jellyfin_team.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/jellyfin.gpg

# Add Jellyfin repository (Stable version)
echo "Adding Jellyfin repository..."
echo "deb [arch=$( dpkg --print-architecture ) signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/jellyfin.list

# Update package lists after adding Jellyfin repository
echo "Updating package lists..."
sudo apt update

# Install Jellyfin and its components
echo "Installing Jellyfin Media Server..."
sudo apt install jellyfin jellyfin-ffmpeg5 jellyfin-server jellyfin-web -y

# Check the status of the Jellyfin service
echo "Checking Jellyfin service status..."
systemctl status jellyfin

# Enable Jellyfin service to start on boot
echo "Enabling Jellyfin to start on boot..."
sudo systemctl enable jellyfin

echo "Jellyfin installation completed successfully!"
