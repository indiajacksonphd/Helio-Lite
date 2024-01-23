# Step 0: Initialize Conda (if not already done)
eval "$(conda shell.bash hook)"

# Step 1: create new environment in shared jupyterhub environment
sudo conda env create --prefix /opt/tljh/user/envs/ai-ml -f /shared/python_libraries_dependencies/ml.yml

# Step 2: Activate the environment
sudo conda activate /opt/tljh/user/envs/ai-ml

# Step 3: Make it into a kernel, save in tljh
sudo conda install ipykernel -y
sudo ipython kernel install --prefix /opt/tljh/user/ --name=ai-ml --display-name "AI-ML Packages"

# Step 7: Clean up and restart JupyterHub
conda deactivate
sudo systemctl restart jupyterhub.service
