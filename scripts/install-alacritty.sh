#!/bin/bash

# Install Alacritty
echo "Installing Alacritty..."
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get update
sudo apt-get install -y alacritty

# Check if Alacritty was installed successfully
if command -v alacritty >/dev/null 2>&1; then
    echo "Alacritty installed successfully!"
else
    echo "Error: Alacritty installation failed."
    exit 1
fi

# Check if Space Mono font is installed
echo "Checking for Space Mono font..."
if fc-list | grep -i "Space Mono" >/dev/null 2>&1; then
    echo "Space Mono font is already installed."
else
    echo "Space Mono font not found. Installing..."
    sudo apt-get install -y fonts-firacode  # Alternative: FiraCode (widely used monospace font)
    
    # Optionally, you can download and install Space Mono manually
    wget https://github.com/googlefonts/SpaceMono/raw/main/fonts/ttf/SpaceMono-Regular.ttf -O /tmp/SpaceMono-Regular.ttf
    mkdir -p ~/.local/share/fonts
    mv /tmp/SpaceMono-Regular.ttf ~/.local/share/fonts/
    fc-cache -fv
    echo "Space Mono font installed."
fi

# Create the Alacritty config directory
echo "Creating Alacritty configuration directory..."
mkdir -p ~/.config/alacritty

# Create the Alacritty config file with ayu_dark theme
echo "Creating Alacritty configuration file..."
cat << 'EOF' > ~/.config/alacritty/alacritty.yml
# Alacritty Configuration

# Import the ayu_dark theme
colors:
  primary:
    background: "#0A0E14"
    foreground: "#B3B1AD"
  normal:
    black: "#01060E"
    red: "#EA6C73"
    green: "#91B362"
    yellow: "#F9AF4F"
    blue: "#53BDFA"
    magenta: "#FAE994"
    cyan: "#90E1C6"
    white: "#C7C7C7"
  bright:
    black: "#686868"
    red: "#F07178"
    green: "#C2D94C"
    yellow: "#FFB454"
    blue: "#59C2FF"
    magenta: "#FFEE99"
    cyan: "#95E6CB"
    white: "#FFFFFF"

# Shell
shell:
  program: /bin/zsh

# Window settings
decorations: none
startup_mode: Maximized
title: "Terminal"
dynamic_title: true

# Font settings
font:
  normal:
    family: "Space Mono"
    style: "Regular"
EOF

# Verify that the configuration file was created
if [ -f ~/.config/alacritty/alacritty.yml ]; then
    echo "Alacritty configuration file created successfully!"
else
    echo "Error: Failed to create Alacritty configuration file."
    exit 1
fi

echo "Alacritty installation and theme configuration complete."
