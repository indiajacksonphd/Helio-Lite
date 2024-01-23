#!/bin/bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda
rm Miniconda3-latest-Linux-x86_64.sh
sudo systemctl restart jupyterhub.service

sudo curl -o /etc/profile.d/miniconda.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/share_miniconda.sh
