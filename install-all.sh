#!/bin/bash

# Define the directory containing your scripts
SCRIPT_DIR="$(dirname "$0")"

# Install fonts
echo "Installing fonts..."
sudo bash "$SCRIPT_DIR/install-font.sh"

# Install Zsh
echo "Installing Zsh..."
sudo bash "$SCRIPT_DIR/install-zsh.sh"

# Install Alacritty
echo "Installing Alacritty..."
sudo bash "$SCRIPT_DIR/install-alacritty.sh"

# Install Flatpak
echo "Installing Flatpak..."
sudo bash "$SCRIPT_DIR/install-flapak.sh"

echo "All installations complete. You may now install additional packages manually if needed."
