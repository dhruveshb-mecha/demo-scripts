#!/bin/bash

# Ensure the script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo"
  exit 1
fi

# Set the directory where the files will be stored
TARGET_DIR="./immich-app"

# Create the directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Navigate to the directory
cd "$TARGET_DIR" || exit

# Download the docker-compose.yml file using curl
curl -L -o docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml

# Download the .env file and rename it using curl
curl -L -o .env https://github.com/immich-app/immich/releases/latest/download/example.env

# Print message to edit the .env file
echo "Please edit the .env file in $TARGET_DIR to configure your custom settings."

# Start the Docker containers
docker compose up -d

# Print completion message
echo "Immich application setup is complete. Containers are starting."
