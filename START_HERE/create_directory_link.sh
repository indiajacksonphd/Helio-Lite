#!/bin/bash

if [ ! -L "$HOME/shared" ] && [ -d "/shared" ]; then
    ln -s /shared "$HOME/shared"
fi

sudo chmod -R 777 /shared
