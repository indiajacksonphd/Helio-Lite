#!/bin/bash

# Step 1: Grab CDF Library and move the directory to /usr/lib/
sudo git clone https://github.com/heliophysicsPy/pyhc-docker-environment.git /usr/lib/pyhc-docker-environment && sudo mv /usr/lib/pyhc-docker-environment/docker/pyhc-environment/contents/cdf38_0-dist /usr/lib/

sudo mkdir /shared
sudo mkdir /shared/examples/PyHC
sudo mkdir /shared/examples/AI_ML
sudo mkdir /shared/newly_created_python_envs
sudo mkdir /shared/python_libraries_dependencies

sudo chmod -R 777 /shared

sudo mkdir -p /shared/.sunpy
sudo mkdir -p /shared/heliopy/data
sudo mkdir -p /shared/Geospacelab/Data
sudo mkdir -p /shared/.spacepy/data

#PyHC examples
curl -o /shared/examples/PyHC/coordinate_systems.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/coordinate_systems.ipynb
curl -o /shared/examples/PyHC/coordinates_demo.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/coordinates_demo.ipynb
curl -o /shared/examples/PyHC/import-test.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/import-test.ipynb
curl -o /shared/examples/PyHC/planet_locations.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/planet_locations.ipynb
curl -o /shared/examples/PyHC/pytplot_demo.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/pytplot_demo.ipynb
curl -o /shared/examples/PyHC/retrieve_compress.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/retrieve_compress.ipynb
curl -o /shared/examples/PyHC/units_demo.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/units_demo.ipynb
curl -o /shared/examples/PyHC/Combining_HPCA_and_EIS_energy_spectra.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/PyHC/Combining_HPCA_and_EIS_energy_spectra.ipynb

# AI_ML Examples
curl -o /shared/examples/AI_ML/04.14-Visualization-With-Seaborn.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/04.14-Visualization-With-Seaborn.ipynb

curl -o /shared/python_libraries_dependencies/environment.yml https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/environment.yml
curl -o /shared/python_libraries_dependencies/requirements.txt https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/requirements.txt
curl -o /shared/python_libraries_dependencies/ml.yml https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/ml.yml

sudo curl -o /etc/profile.d/create_shared_link.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/START_HERE/create_directory_link.sh
sudo chmod +x /etc/profile.d/create_shared_link.sh
