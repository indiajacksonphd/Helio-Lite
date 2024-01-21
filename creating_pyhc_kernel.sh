#!/bin/bash
# Step 0: Initialize Conda (if not already done)
eval "$(conda shell.bash hook)"
# Step 1: Add environment.yaml
conda env create -f /shared/python_libraries_dependencies/environment.yml

# Step 2: Activate the environment
conda activate pyhc-all

sudo apt-get install -y gcc g++ gfortran ncurses-dev build-essential cmake

# Step 3: Add requirements.txt
pip install --no-cache-dir numpy==1.24.3
pip install --no-cache-dir spacepy --no-build-isolation
# pip install -r ~/shared/python_libraries_dependencies/requirements.txt
pip install --use-pep517 --retries 5 --no-cache-dir -r /shared/python_libraries_dependencies/requirements.txt
# pip install --no-cache-dir git+https://github.com/nasa/Kamodo.git
pip install --no-cache-dir pytplot==1.7.28
pip install --no-cache-dir pytplot-mpl-temp
pip install --no-cache-dir pyspedas

# git clone https://github.com/lkilcommons/ssj_auroral_boundary.git
# python ssj_auroral_boundary/setup.py install
# cd ssj_auroral_boundary
# python setup.py install

# Step 4: Add environment.yml to shared library directory
conda env export > /shared/newly_created_python_envs/pyhcAll.yml

# Step 5: Create the environment in the shared JupyterHub environment
sudo conda env create --prefix /opt/tljh/user/envs/pyhc-all --file /shared/newly_created_python_envs/pyhcAll.yml

# Step 6: Make it into a kernel
conda install ipykernel -y
ipython kernel install --user --name=pyhc-all --display-name "PyHC All Packages"

# Step 7: Clean up and restart JupyterHub
conda deactivate
sudo systemctl restart jupyterhub.service
