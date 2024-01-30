#!/bin/bash

# Pull in shell scripts
curl -o create_directories.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/START_HERE/1_create_directories.sh
curl -o create_aiml_kernel.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/kernel_creation/create_aiml_kernel.sh
curl -o creating_pyhc_kernel.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/kernel_creation/create_pyhc_kernel.sh

# Make shell scripts executable
chmod +x create_directories.sh
chmod +x create_aiml_kernel.sh
chmod +x creating_pyhc_kernel_2.sh

# Run shell scripts
./create_directories.sh
./create_aiml_kernel.sh
./creating_pyhc_kernel_2.sh

# sudo chmod -R 777 /shared

# Print the completion message
echo "Congratulations, your setup is done! You can now logout and reboot your EC2 instance! When you log back in, open to terminal to finish up!"

# Reset Jupyter environment and restart EC2 instance
sudo systemctl restart jupyterhub.service
