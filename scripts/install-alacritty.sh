#!/bin/bash

# Install Alacritty
echo "Installing Alacritty..."
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get update
sudo apt-get install -y alacritty

# this works on newer versions of alacritty that support the new TOML format

: '

# Clone the Alacritty theme repository
echo "Cloning Alacritty theme repository..."
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# Set up Alacritty configuration to import the desired theme
echo "Configuring Alacritty with the ayu_dark theme..."

'

mkdir -p ~/.config/alacritty

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

echo "Alacritty installation and theme configuration complete."

