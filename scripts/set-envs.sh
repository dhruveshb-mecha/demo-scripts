#!/bin/bash

# Set environment variables
export WAYLAND_DISPLAY=wayland-1
echo "Exported WAYLAND_DISPLAY=wayland-1"

# Set GNOME interface color scheme to 'prefer-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
echo "Set GNOME interface color scheme to 'prefer-dark'"

# Add more environment variables and settings below as needed

# Example:
# export ANOTHER_VARIABLE=value
# echo "Exported ANOTHER_VARIABLE=value"
