# Helio-lite
AWS Open Source Software for Heliophysics community

# Helio-Lite Setup Guide

Helio-Lite is a streamlined version of HelioCloud, designed for heliophysics researchers working in smaller groups. It leverages the AWS ecosystem to provide a cost-effective, scalable solution for data sharing and computation. This guide outlines the steps to set up Helio-Lite on AWS.

## Prerequisites

- An AWS account
- Basic familiarity with AWS services, especially EC2
- SSH client installed on your computer

## Step 1: Create an AWS Account

1. Go to the [AWS homepage](https://aws.amazon.com/) and sign up.
2. Enter your email address, billing information, and select your preferred AWS region.

## Step 2: Create an EC2 Instance

1. Navigate to the EC2 dashboard and click "Launch Instance".
2. **Name**: Assign a meaningful name to your instance.
3. **Operating System**: Select Ubuntu.
4. **Instance Type**: Choose `c5.4xlarge`.
5. **Key Pair**: Create a new key pair for SSH access. Download and save the `.pem` file securely.
6. **Network Settings**:
   - Create a new security group or select an existing one.
   - Configure rules to allow SSH, HTTP, and HTTPS traffic from the internet.
7. **Configure Storage**: Choose Elastic Block Storage (EBS) with at least 500 GiB.
8. **Advanced Details**: In the user data section, enter the following script:

```bash
#!/bin/bash
sudo apt update && sudo apt upgrade -y
curl https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/START_HERE/jupyterHubBootstrap.py | sudo python3 - --admin admin1
```
## Step 3: Add an Elastic IP Address

1. In the EC2 dashboard, select **Elastic IPs** from the left menu.
2. Click **Allocate new address** and follow the prompts to allocate a new Elastic IP.
3. Once allocated, select **Actions** and choose **Associate address**.
    - For **Resource type**, choose **Instance**.
    - For **Instance**, select your previously created instance.
    - **Private IP**: (optional) Specify if needed.
    - Check **Allow this Elastic IP to be reassociated** if you plan to reuse it.
4. Click **Associate** to link the Elastic IP with your instance.


## Step 4: Explore Your EC2 Instance

- With your instance selected in the EC2 dashboard, take some time to explore the various tabs and settings available. Understanding your instance's configuration and available options is crucial for effective management and troubleshooting.

## Step 5: Create the Helio-Lite Environment

1. Access your EC2 instance using the Elastic IP address through SSH or the AWS Management Console.
2. Log in with the initial admin account (`admin1`) created during the setup process.
3. Open a terminal within your admin JupyterLab environment to execute the setup scripts.

### Initialize Conda Enviroment

```bash
conda init bash
exit
```
Open the terminal again and make sure that conda is activated:

```bash
conda env list
```
You should see:

<img width="375" alt="base" src="https://github.com/indiajacksonphd/Helio-lite/assets/110256537/c0c13cc6-0c83-4642-8d74-27c7419fdce1">


# Creating Jupyter Kernels for AI/ML and PyHC Projects

This guide details the process of setting up dedicated Jupyter kernels for AI/ML and PyHC projects on a JupyterHub server. These steps assume you have administrative access to the server and the necessary permissions to install software.

## Creating Directories

Let's pull in the script to create our directories, activate it, then run it. After you run the command, check to make sure that all of your directories have been created and all of your scripts and examples have downloaded in their respective folders.

```bash
curl -o create_directories.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/START_HERE/1_create_directories.sh

chmod +x create_directories.sh

sudo ./create_directories.sh

sudo systemctl restart jupyterhub.service
exit
```

## Creating the AI/ML Kernel

### Step 1: Create a New Environment

Create a new conda environment that is accessible to all JupyterHub users.

```bash
conda deactivate # if you are in another environment environment, deactivate first
sudo conda env create --prefix /opt/tljh/user/envs/ai-ml -f python_libraries_dependencies/ml.yml
```

### Step 2: Activate the Environment

Activate the newly created environment.
```bash
conda activate /opt/tljh/user/envs/ai-ml
```

### Step 3: Install Additional Packages

Copy custom Python modules into the environment directory and install additional requirements.

```bash
sudo cp custom_modules/aiaImages.py /opt/tljh/user/envs/ai-ml/lib/python3.7
sudo cp custom_modules/donkiData.py /opt/tljh/user/envs/ai-ml/lib/python3.7
sudo cp custom_modules/dmLab.py /opt/tljh/user/envs/ai-ml/lib/python3.7
sudo pip install torch
sudo pip install --upgrade ipywidgets
sudo pip install --upgrade Pillow

sudo pip install --use-pep517 --retries 5 --no-cache-dir -r python_libraries_dependencies/custom_requirements.txt
```

### Step 4: Register the Kernel

Install ipykernel and register the environment as a Jupyter kernel.

```bash
sudo conda install ipykernel -y
sudo ipython kernel install --prefix /opt/tljh/user/ --name=ai-ml --display-name "AI-ML Packages"
```

### Step 5: Restart JupyterHub

Deactivate the conda environment and restart the JupyterHub service to make the new kernel available.

```bash
conda deactivate
sudo systemctl restart jupyterhub.service
exit
```
## Creating the PyHC Kernel

### Step 1: Create a New Environment
Set up a new conda environment for PyHC projects.

```bash
conda deactivate # if you are in another environment environment, deactivate first
sudo conda env create --prefix /opt/tljh/user/envs/pyhc-all -f python_libraries_dependencies/environment.yml
```

### Step 2: Activate the Environment
Activate the PyHC environment.

```bash
conda activate /opt/tljh/user/envs/pyhc-all
```

### Step 3: Install System and Python Packages
Install necessary system packages and Python libraries.

```bash
sudo apt-get install -y gcc g++ gfortran ncurses-dev build-essential cmake
```

**YOU MAY BE PROMPTED TO REBOOT AFTER THE APT-GET INSTALLATION. ONCE YOU RESTART THE EC2 INSTANCE, ACTIVATE YOUR ENVIRONMENT AGAIN**

```bash
sudo pip install --no-cache-dir numpy==1.24.3
sudo pip install --use-pep517 --retries 5 --no-cache-dir -r python_libraries_dependencies/requirements.txt
sudo pip install --no-cache-dir spacepy --no-build-isolation
sudo pip install --use-pep517 --retries 5 --no-cache-dir -r python_libraries_dependencies/custom_requirements.txt
sudo pip install --no-cache-dir pytplot==1.7.28
sudo pip install --no-cache-dir pytplot-mpl-temp
sudo pip install --no-cache-dir pyspedas
sudo pip install --upgrade ipywidgets
sudo pip install --upgrade Pillow
```

### Step 4: Copy Custom Modules and Register the Kernel
Copy custom Python modules and make the environment available as a Jupyter kernel.

```bash
sudo cp custom_modules/aiaImages.py /opt/tljh/user/envs/pyhc-all/lib/python3.9
sudo cp custom_modules/donkiData.py /opt/tljh/user/envs/pyhc-all/lib/python3.9
sudo cp custom_modules/dmLab.py /opt/tljh/user/envs/pyhc-all/lib/python3.9

sudo conda install ipykernel -y
sudo ipython kernel install --prefix /opt/tljh/user/ --name=pyhc-all --display-name "PyHC All Packages"
```

### Step 5: Restart JupyterHub
Finally, deactivate the environment and restart the JupyterHub service.

```bash
conda deactivate
sudo systemctl restart jupyterhub.service
exit
```

4. Verify the Installation**

    After completing the setup, it's important to verify that everything is installed correctly and operational. Use the following commands to check the Jupyter kernels and Conda environments:

    ```bash
    jupyter kernelspec list
    conda env list

    conda activate ai-ml
    conda list
    conda deactivate

    conda activate pyhc-all
    conda list
    conda deactivate
    ```

    These commands will list the available Jupyter kernels and Conda environments, ensuring that your Helio-Lite environment is correctly set up and ready for use.

5. Log Out and Restart Your EC2 Instance**

    To ensure all changes are applied and the system is running smoothly, it's a good practice to log out of your current session and restart your EC2 instance. This can be done through the AWS Management Console. Navigate to your instance, select the **Actions** menu, and choose **Instance State > Restart**. 

## Conclusion

You have now successfully set up Helio-Lite on AWS, creating a scalable and collaborative environment for heliophysics research projects. This setup provides a foundation for data sharing, extensive computing resources, and the flexibility to customize the environment according to your specific project needs. For further customization and to add more users or administrators, refer to the AWS and JupyterHub documentation.

Congratulations on your Helio-Lite environment, and happy researching!


