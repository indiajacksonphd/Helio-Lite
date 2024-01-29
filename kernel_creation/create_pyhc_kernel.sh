# Step 0: Initialize Conda (if not already done)
eval "$(conda shell.bash hook)"

# Step 1: create new environment in shared miniconda
sudo conda env create --prefix /opt/tljh/user/envs/pyhc-all -f /shared/python_libraries_dependencies/environment.yml

# Step 2: Activate the environment
sudo conda activate /opt/tljh/user/envs/pyhc-all

# Step 3: Fill it up with all packages
sudo apt-get install -y gcc g++ gfortran ncurses-dev build-essential cmake

sudo pip install --no-cache-dir numpy==1.24.3
sudo pip install --no-cache-dir spacepy --no-build-isolation
sudo pip install --use-pep517 --retries 5 --no-cache-dir -r /shared/python_libraries_dependencies/requirements.txt
sudo pip install --use-pep517 --retries 5 --no-cache-dir -r /shared/python_libraries_dependencies/custom_requirements.txt
sudo pip install --no-cache-dir pytplot==1.7.28
sudo pip install --no-cache-dir pytplot-mpl-temp
sudo pip install --no-cache-dir pyspedas

# Step 4: Copy your Python modules to the environment directory
cp aiaImage.py /opt/tljh/user/envs/pyhc-all
cp donkiData.py /opt/tljh/user/envs/pyhc-all
cp dmLab.py /opt/tljh/user/envs/pyhc-all

# Step 4: Make it into a kernel, save in tljh
sudo conda install ipykernel -y
sudo ipython kernel install --prefix /opt/tljh/user/ --name=pyhc-all --display-name "PyHC All Packages"

# Step 7: Clean up and restart JupyterHub
conda deactivate
sudo systemctl restart jupyterhub.service
