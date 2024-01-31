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
# curl https://raw.githubusercontent.com/jupyterhub/the-littlest-jupyterhub/master/bootstrap/bootstrap.py | sudo python3 - --admin admin1
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

### Option A: Automatic Setup

Execute the following commands to automatically set up the Helio-Lite environment:

```bash
curl -o create_environment.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/create_environment.sh
chmod +x create_environment.sh
./create_environment.sh
sudo systemctl restart jupyterhub.service
exit
```

### Option B: Manual Setup

Execute the following commands to manually set up the Helio-Lite environment:

```bash
curl -o create_directories.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/START_HERE/1_create_directories.sh
curl -o create_aiml_kernel.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/kernel_creation/create_aiml_kernel.sh
curl -o creating_pyhc_kernel.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/kernel_creation/create_pyhc_kernel.sh

chmod +x create_directories.sh create_aiml_kernel.sh creating_pyhc_kernel.sh

sudo ./create_directories.sh
sudo ./create_aiml_kernel.sh
sudo ./creating_pyhc_kernel.sh

sudo systemctl restart jupyterhub.service
exit
```
4. Verify the Installation**

    After completing the setup, it's important to verify that everything is installed correctly and operational. Use the following commands to check the Jupyter kernels and Conda environments:

    ```bash
    jupyter kernelspec list
    conda env list
    ```

    These commands will list the available Jupyter kernels and Conda environments, ensuring that your Helio-Lite environment is correctly set up and ready for use.

5. Log Out and Restart Your EC2 Instance**

    To ensure all changes are applied and the system is running smoothly, it's a good practice to log out of your current session and restart your EC2 instance. This can be done through the AWS Management Console. Navigate to your instance, select the **Actions** menu, and choose **Instance State > Restart**. 

## Conclusion

You have now successfully set up Helio-Lite on AWS, creating a scalable and collaborative environment for heliophysics research projects. This setup provides a foundation for data sharing, extensive computing resources, and the flexibility to customize the environment according to your specific project needs. For further customization and to add more users or administrators, refer to the AWS and JupyterHub documentation.

Congratulations on your Helio-Lite environment, and happy researching!


