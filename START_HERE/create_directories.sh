#!/bin/bash

# Step 1: Grab CDF Library and move the directory to /usr/lib/
sudo git clone https://github.com/heliophysicsPy/pyhc-docker-environment.git /usr/lib/pyhc-docker-environment && sudo mv /usr/lib/pyhc-docker-environment/docker/pyhc-environment/contents/cdf38_0-dist /usr/lib/

sudo mkdir /shared
sudo mkdir /shared/examples
sudo mkdir /shared/examples/PyHC
sudo mkdir /shared/examples/AI_ML
sudo mkdir /shared/examples/AIA_DONKI_DMLab
sudo mkdir python_libraries_dependencies
sudo mkdir custom_modules

sudo mkdir -p /shared/.sunpy
sudo mkdir -p /shared/heliopy/data
sudo mkdir -p /shared/Geospacelab/Data
sudo mkdir -p /shared/.spacepy/data

sudo chmod -R 777 /shared

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
curl -o /shared/examples/AI_ML/marathon-data.csv https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/marathon-data.csv
curl -o /shared/examples/AI_ML/pima-indians-diabetes.data.csv https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/pima-indians-diabetes.data.csv
curl -o /shared/examples/AI_ML/pytorch_torchvision_RNN_PT.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/pytorch_torchvision_RNN_PT.ipynb
curl -o /shared/examples/AI_ML/seaborn.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/seaborn.ipynb
curl -o /shared/examples/AI_ML/tensorflow_keras_classification.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/tensorflow_keras_classification.ipynb
curl -o /shared/examples/AI_ML/xgboost.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AI_ML/xgboost.ipynb

# SDO DONKI and DMLab Examples
curl -o /shared/examples/AIA_DONKI_DMLab/AIA_DONKI.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AIA_DONKI_DMLab/AIA_DONKI.ipynb
curl -o /shared/examples/AIA_DONKI_DMLab/DMLab.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AIA_DONKI_DMLab/DMLab.ipynb
curl -o /shared/examples/AIA_DONKI_DMLab/GSEP_DMLab.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AIA_DONKI_DMLab/GSEP_DMLab.ipynb
curl -o /shared/examples/AIA_DONKI_DMLab/TimeConversion.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AIA_DONKI_DMLab/TimeConversion.ipynb
curl -o /shared/examples/AIA_DONKI_DMLab/TimeZones.ipynb https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/examples/AIA_DONKI_DMLab/TimeZones.ipynb


#Pip Packages and Dependencies
curl -o python_libraries_dependencies/environment.yml https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/environment.yml
curl -o python_libraries_dependencies/requirements.txt https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/requirements.txt
curl -o python_libraries_dependencies/ml.yml https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/ml.yml
curl -o python_libraries_dependencies/custom_requirements.txt https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/libraries_dependencies/custom_requirements.txt

#Custom Modules
curl -o custom_modules/aiaImages.py https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/custom_modules/aiaImages.py
curl -o custom_modules/dmLab.py https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/custom_modules/dmLab.py
curl -o custom_modules/donkiData.py https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/custom_modules/donkiData.py

sudo curl -o /etc/profile.d/link_directories.sh https://raw.githubusercontent.com/indiajacksonphd/Helio-lite/main/START_HERE/link_directories.sh
sudo chmod +x /etc/profile.d/link_directories.sh
