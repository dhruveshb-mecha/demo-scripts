#!/bin/bash

# Update and upgrade the system
echo "Updating the system..."
sudo apt update && sudo apt upgrade -y

# Download and run the Jellyfin installation script
echo "Installing Jellyfin Media Server..."
curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# Verify the integrity of the Jellyfin installation script
echo "Verifying the integrity of the Jellyfin installation script..."
diff <(curl -s https://repo.jellyfin.org/install-debuntu.sh -o install-debuntu.sh; sha256sum install-debuntu.sh) <(curl -s https://repo.jellyfin.org/install-debuntu.sh.sha256sum)