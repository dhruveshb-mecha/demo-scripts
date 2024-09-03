#!/bin/bash

# Install font utility
echo "Installing font utilities..."
sudo apt-get update
sudo apt-get install -y fontconfig

# Download and install Space Grotesk fonts
echo "Installing Space Grotesk..."
mkdir -p ~/.local/share/fonts/SpaceGrotesk
cd ~/.local/share/fonts/SpaceGrotesk
curl -LO https://github.com/velvetyne/space-grotesk/raw/master/fonts/SpaceGrotesk-Regular.ttf
curl -LO https://github.com/velvetyne/space-grotesk/raw/master/fonts/SpaceGrotesk-Medium.ttf
curl -LO https://github.com/velvetyne/space-grotesk/raw/master/fonts/SpaceGrotesk-Bold.ttf

# Download and install Space Mono fonts
echo "Installing Space Mono..."
mkdir -p ~/.local/share/fonts/SpaceMono
cd ~/.local/share/fonts/SpaceMono
curl -LO https://github.com/googlefonts/spacemono/raw/main/fonts/SpaceMono-Regular.ttf
curl -LO https://github.com/googlefonts/spacemono/raw/main/fonts/SpaceMono-Bold.ttf
curl -LO https://github.com/googlefonts/spacemono/raw/main/fonts/SpaceMono-Italic.ttf
curl -LO https://github.com/googlefonts/spacemono/raw/main/fonts/SpaceMono-BoldItalic.ttf

# Update font cache
echo "Updating font cache..."
fc-cache -fv

echo "Fonts installed and Space Mono set as the default."
