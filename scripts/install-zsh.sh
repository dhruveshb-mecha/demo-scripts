#!/bin/bash

# Install Zsh
echo "Installing Zsh..."
sudo apt-get update
sudo apt-get install -y zsh

# Apply your custom Zsh configuration
echo "Applying custom Zsh configuration..."
ZSH_CUSTOM_CONFIG="${HOME}/.zshrc"

# Create a backup of the existing .zshrc if it exists
if [ -f "$ZSH_CUSTOM_CONFIG" ]; then
    mv "$ZSH_CUSTOM_CONFIG" "${ZSH_CUSTOM_CONFIG}.backup"
    echo "Backup of existing .zshrc saved as .zshrc.backup"
fi

# Add your custom Zsh configuration here
cat << 'EOF' > "$ZSH_CUSTOM_CONFIG"
# Your custom Zsh configuration

# Example custom prompt
PROMPT='%F{green}%n%f@%F{blue}%m%f %F{yellow}%~%f %# '

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Enable history search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Load any additional scripts or functions here
# source ~/path/to/your/custom/functions.sh

# Add any additional customizations here
EOF

# Change the default shell to Zsh
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

echo "Installation complete! Please restart your terminal or run 'zsh' to start using Zsh."
