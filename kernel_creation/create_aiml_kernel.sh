# Step 0: Initialize Conda (if not already done)
eval "$(conda shell.bash hook)"

# Step 1: create new environment in shared JupyterHub so that all admin and users can access it
sudo conda env create --prefix /opt/tljh/user/envs/ai-ml -f /python_libraries_dependencies/ml.yml

# Step 2: Activate the environment
sudo conda activate /opt/tljh/user/envs/ai-ml

# Step 4: Copy your Python modules to the environment directory
cp ~/shared/custom_modules/aiaImage.py /opt/tljh/user/envs/ai-ml
cp ~/shared/custom_modules/donkiData.py /opt/tljh/user/envs/ai-ml
cp ~/shared/custom_modules/dmLab.py /opt/tljh/user/envs/ai-ml

sudo pip install --use-pep517 --retries 5 --no-cache-dir -r /python_libraries_dependencies/custom_requirements.txt

# Step 3: Make it into a kernel, save in JupyterHub so that all admin and users can access it
sudo conda install ipykernel -y
sudo ipython kernel install --prefix /opt/tljh/user/ --name=ai-ml --display-name "AI-ML Packages"

# Step 7: Clean up and restart JupyterHub
conda deactivate
sudo systemctl restart jupyterhub.service
