#!/bin/bash

if [ ! -L "$HOME/shared" ] && [ -d "/shared" ]; then
    ln -s /shared "$HOME/shared"
fi

sudo chmod +x /etc/profile.d/create_shared_link.sh

sudo chmod +x /etc/profile.d/create_shared_link.sh

sudo chmod -R 777 /shared

But will this script execute everytime the user or admin login?

# Download the script using curl
sudo curl -o /etc/profile.d/create_shared_link.sh https://raw.githubusercontent.com/username/repository/branch/create_shared_link.sh

# Make the script executable
sudo chmod +x /etc/profile.d/create_shared_link.sh

# Set the appropriate permissions on /shared
sudo chmod -R 775 /shared
