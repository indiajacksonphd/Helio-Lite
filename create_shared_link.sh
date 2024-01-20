#!/bin/bash

if [ ! -L "$HOME/shared" ] && [ -d "/shared" ]; then
    ln -s /shared "$HOME/shared"
fi

sudo chmod +x /etc/profile.d/create_shared_link.sh

sudo chmod +x /etc/profile.d/create_shared_link.sh

sudo chmod -R 777 /shared
