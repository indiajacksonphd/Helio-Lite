#!/bin/bash

# Step 1: Move the directory to /usr/lib/
sudo git clone https://github.com/heliophysicsPy/pyhc-docker-environment.git /usr/lib/pyhc-docker-environment && sudo mv /usr/lib/pyhc-docker-environment/docker/pyhc-environment/contents/cdf38_0-dist /usr/lib/

# Step 2: Set environment variables
# export CDF_BASE="/usr/lib/cdf38_0-dist"
# export CDF_LIB="$CDF_BASE/lib"
# CDF_BASE = /usr/lib/cdf38_0-dist
# CDF_LIB = $CDF_BASE/lib


sudo mkdir /shared
sudo mkdir /shared/examples
sudo mkdir /shared/newly_created_python_envs
sudo mkdir /shared/python_libraries_dependencies

sudo chmod -R 777 /shared

sudo mkdir -p /shared/.sunpy
sudo mkdir -p /shared/heliopy/data
sudo mkdir -p /shared/Geospacelab/Data
sudo mkdir -p /shared/.spacepy/data

# sudo chmod -R 755 /opt/.sunpy
# sudo chmod -R 755 /opt/heliopy/data
# sudo chmod -R 755 /opt/Geospacelab/Data
# sudo chmod -R 755 /opt/.spacepy/data

curl -o /shared/examples/coordinate_systems.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/coordinate_systems.ipynb
curl -o /shared/examples/coordinates_demo.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/coordinates_demo.ipynb
curl -o /shared/examples/import-test.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/import-test.ipynb
curl -o /shared/examples/planet_locations.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/planet_locations.ipynb
curl -o /shared/examples/pytplot_demo.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/pytplot_demo.ipynb
curl -o /shared/examples/retrieve_compress.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/retrieve_compress.ipynb
curl -o /shared/examples/units_demo.ipynb https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/units_demo.ipynb
curl -o /shared/examples/Combining_HPCA_and_EIS_energy_spectra.ipynb https://raw.githubusercontent.com/spedas/mms-examples/master/advanced/Combining_HPCA_and_EIS_energy_spectra.ipynb


curl -o /shared/python_libraries_dependencies/environment.yml https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/environment.yml
curl -o /shared/python_libraries_dependencies/requirements.txt https://raw.githubusercontent.com/heliophysicsPy/pyhc-docker-environment/main/docker/pyhc-gallery/contents/requirements.txt

sudo curl -o /etc/profile.d/create_shared_link.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/create_shared_link.sh
sudo chmod +x /etc/profile.d/create_shared_link.sh
