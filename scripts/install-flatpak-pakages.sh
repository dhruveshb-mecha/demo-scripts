#!/bin/bash

# List of Flatpak packages to install
flatpak_install_packages=(
    "org.gnome.Calendar"
    "org.gnome.Snapshot"
    "org.gnome.Calculator"
    "org.gnome.clocks"
    "org.gnome.Epiphany"
    "com.vixalien.sticky"
    "org.gnome.TextEditor"
    "io.bassi.Amberol"
    "io.github.celluloid_player.Celluloid"
)

# List of Flatpak packages to uninstall
flatpak_uninstall_packages=(
    "org.gnome.Maps"
    "org.gnome.Todo"
)

# Function to install a Flatpak package
install_flatpak_package() {
    local package=$1
    if flatpak list --app | grep -q "$package"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        sudo flatpak install -y flathub "$package"
    fi
}

# Function to uninstall a Flatpak package
uninstall_flatpak_package() {
    local package=$1
    if flatpak list --app | grep -q "$package"; then
        echo "Uninstalling $package..."
        sudo flatpak uninstall -y "$package"
    else
        echo "$package is not installed. Skipping..."
    fi
}

# Default to 'install' if no parameter is provided
action="${1:-install}"

# Install or uninstall based on the parameter
if [ "$action" == "install" ]; then
    for package in "${flatpak_install_packages[@]}"; do
        install_flatpak_package "$package"
    done
elif [ "$action" == "uninstall" ]; then
    for package in "${flatpak_uninstall_packages[@]}"; do
        uninstall_flatpak_package "$package"
    done
else
    echo "Invalid option. Usage: $0 {install|uninstall}"
    exit 1
fi

echo "Operation $action completed for the specified Flatpak packages."
