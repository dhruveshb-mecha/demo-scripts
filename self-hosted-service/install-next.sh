#!/bin/bash

# Check if the Nextcloud image is already pulled
if [[ "$(docker images -q nextcloud:latest 2> /dev/null)" == "" ]]; then
  echo "Pulling Nextcloud image..."
  sudo docker pull nextcloud
else
  echo "Nextcloud image already exists."
fi

# Run the Nextcloud container
echo "Running Nextcloud container..."
sudo docker run -d -p 8080:80 nextcloud

echo "Nextcloud container is now running on port 8080."
