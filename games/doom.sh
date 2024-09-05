#!/bin/bash

# Install Chocolate Doom
echo "Installing Chocolate Doom..."
sudo apt install chocolate-doom -y

# Navigate to /usr/games directory
echo "Navigating to /usr/games directory..."
cd /usr/games

# Download the DOOM1.WAD file
echo "Downloading the DOOM1.WAD file..."
sudo wget http://www.doomworld.com/3ddownloads/ports/shareware_doom_iwad.zip

# Unzip the WAD file
echo "Unzipping the DOOM1.WAD file..."
sudo unzip shareware_doom_iwad.zip

# Configure Doom
echo "Launching Chocolate Doom setup..."
chocolate-doom-setup

echo "Doom installation and setup completed!"
