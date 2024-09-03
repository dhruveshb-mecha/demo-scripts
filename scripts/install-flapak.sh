#!/bin/bash

# Update package list and install Flatpak
echo "Installing Flatpak..."
sudo apt update && sudo apt install -y flatpak

# Install the GNOME Software Flatpak plugin
echo "Installing GNOME Software Flatpak plugin..."
sudo apt install -y gnome-software-plugin-flatpak

# Add the Flathub repository
echo "Adding the Flathub repository..."
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Restart the system
echo "Setup complete. Restart your system..."

