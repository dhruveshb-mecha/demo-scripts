# Quick Installation Guide

## Overview

This repository contains a master installation script (`install-all.sh`) and additional scripts for installing various tools.

## Installation Steps

1. **Open Terminal** and navigate to the repository directory:

   ```bash
   cd /path/to/your/repository
   

2. Make the Master Script Executable:

   ```bash
   chmod +x install-all.sh  
   
3. Run the Master Installation Script:   
    ```bash
    sudo ./install-all.sh
    
## Post-Reboot Installation

### After rebooting your system, run the following scripts to complete the installation:
1. Install Flatpak Packages:
    ```bash
    sudo bash scripts/install-flatpak-packages.sh

2. Install Docker:
    ```bash
    sudo bash scripts/install-docker.sh
   
   
   
   
   
