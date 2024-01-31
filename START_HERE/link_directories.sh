#!/bin/bash

if [ ! -L "$HOME/examples" ] && [ -d "/examples" ]; then
    ln -s /examples "$HOME/examples"
fi

sudo chmod -R 777 /examples
