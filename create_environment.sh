#!/bin/bash

# Pull in shell scripts
curl -o start_up.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/start_up.sh
curl -o add_miniconda.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/add_miniconda.sh
curl -o create_aiml_kernel.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/create_aiml_kernel.sh
curl -o creating_pyhc_kernel_2.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/creating_pyhc_kernel_2.sh

# Make shell scripts executable
chmod +x start_up.sh
chmod +x add_miniconda.sh
chmod +x create_aiml_kernel.sh
chmod +x creating_pyhc_kernel_2.sh

# Run shell scripts
./start_up.sh
./add_miniconda.sh
./create_aiml_kernel.sh
./creating_pyhc_kernel_2.sh

sudo chmod -R 777 /shared
# Print the completion message
echo "Congratulations, your setup is done! You can now logout and reboot your EC2 instance! When you log back in, open to terminal to finish up!"

# Reset Jupyter environment and restart EC2 instance
sudo systemctl restart jupyterhub.service
exit
