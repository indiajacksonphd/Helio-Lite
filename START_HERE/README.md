# START_HERE Folder Scripts Explanation

## Overview

The `START_HERE` folder contains several shell scripts designed to set up a scientific computing environment tailored for heliophysics research, leveraging an environment with Python libraries, Jupyter notebooks, and custom modules. This document explains each script and its role in the setup process.

### 1. `1_create_directories.sh`

#### Purpose:

Initializes the environment by cloning the Common Data Format (CDF) Library from PyHC, creating necessary directories for examples, Python environments, and libraries. It also downloads various Jupyter notebooks and data files related to Python Heliophysics Community (PyHC) examples, Artificial Intelligence/Machine Learning (AI/ML) examples,  Atmospheric Imaging Assembly (AIA), The Space Weather Database Of Notifications, Knowledge, Information (DONKI), and Georgia State University's Data Mining Lab (DMLab) examples, along with Pip package requirements and custom Python modules.

#### Key Steps:

- Clones the `pyhc-docker-environment/cdf38_0-dist` repository into `/usr/lib/`.
- Creates directories for storing examples, newly created Python environments, Python library dependencies, and custom modules.
- Downloads Jupyter notebooks and data files for PyHC, AI/ML, and AIA DONKI/DMLab examples.
- Downloads environment and requirements files for Python library dependencies.
- Downloads custom Python modules.

### 2. `2_1_create_full_environments.sh`

#### Purpose:

Automates the full setup of the computing environment by downloading and executing the `1_create_directories.sh` script, as well as scripts for creating AI/ML and PyHC Jupyter kernels.

#### Key Steps:

- Downloads and makes executable the `create_directories.sh`, `create_aiml_kernel.sh`, and `creating_pyhc_kernel.sh` scripts.
- Executes the aforementioned scripts to set up directories, download examples and dependencies, and create AI/ML and PyHC Jupyter kernels.
- Restarts the JupyterHub service to apply changes.

### 3. `jupyterHubBootstrap.py`

#### Purpose:

This Python script bootstraps the installation of The Littlest JupyterHub (TLJH), configuring the JupyterHub environment with minimal dependencies. It's designed to be run directly from a `curl` command.

#### Key Steps:

- Parses environment variables and command line flags to customize the installation.
- Installs or upgrades the TLJH installer using pip, based on the provided version or development flags.
- Optionally starts a progress page server for logging installation progress.

### 4. `link_directories.sh`

#### Purpose:

Ensures that symbolic links are created for the `examples` directory in the user's home directory, allowing for easy access to examples from within the JupyterHub environment.

#### Key Steps:

- Checks if the symbolic link for the `examples` directory exists in the user's home directory and creates it if it does not.
- Sets read, write, and execute permissions for all users on the `examples` directory.

## Conclusion

The scripts within the `START_HERE` folder are designed to facilitate the setup of a comprehensive scientific computing environment tailored for heliophysics research, including the installation of necessary Python libraries, the organization of educational and example content, and the configuration of JupyterHub.

