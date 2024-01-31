# Kernel Creation

## Overview

The `kernel_creation` folder contains shell scripts for setting up specialized Python environments as Jupyter kernels within a JupyterHub installation. These scripts facilitate the creation of isolated environments for Artificial Intelligence/Machine Learning (AI/ML) and Python Heliophysics Community (PyHC) projects, ensuring that users have access to the necessary libraries and tools.

### create_aiml_kernel.sh

#### Purpose:

Sets up a new conda environment tailored for AI/ML projects, installs custom modules and dependencies, and registers the environment as a Jupyter kernel.

#### Key Steps:

1. Initializes Conda to ensure the Conda commands work correctly within the script.
2. Creates a new Conda environment named `ai-ml` using the `ml.yml` file, which specifies the Python version and libraries relevant to AI/ML projects.
3. Activates the newly created environment.
4. Copies custom Python modules (`aiaImage.py`, `donkiData.py`, `dmLab.py`) to the environment directory.
5. Installs additional Python libraries listed in `custom_requirements.txt` using `pip`.
6. Installs the `ipykernel` package and registers the environment as a Jupyter kernel named "AI-ML Packages".
7. Restarts the JupyterHub service to apply changes.

### create_pyhc_kernel.sh

#### Purpose:

Creates a new Conda environment designed for PyHC projects, installs a comprehensive set of scientific computing and data analysis libraries, and registers this environment as a Jupyter kernel.

#### Key Steps:

1. Initializes Conda to enable Conda command functionality within the script.
2. Creates a new Conda environment named `pyhc-all` based on the `environment.yml` file, which outlines dependencies specific to PyHC projects, including Python version, compiler tools, and foundational scientific packages.
3. Activates the `pyhc-all` environment.
4. Installs system packages (`gcc`, `g++`, `gfortran`, etc.) and Python packages (`numpy`, `spacepy`, etc.), including specific versions and additional packages listed in `requirements.txt` and `custom_requirements.txt`.
5. Copies custom Python modules (`aiaImage.py`, `donkiData.py`, `dmLab.py`) to the environment directory.
6. Installs `ipykernel` and registers the environment as a Jupyter kernel named "PyHC All Packages".
7. Restarts the JupyterHub service to ensure the new kernel is available to users.

## Conclusion

These scripts automate the process of creating, configuring, and registering Python environments as Jupyter kernels in a shared JupyterHub setup. They ensure that users have access to consistent, pre-configured environments for AI/ML and PyHC projects, facilitating reproducible research and collaborative development.
