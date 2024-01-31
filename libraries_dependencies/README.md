# Libraries and Dependencies

## Overview

The `libraries_dependencies` folder contains several configuration files defining dependencies for Python environments. These files are used with package managers like `pip` and `conda` to create isolated environments with specific packages installed. This setup is crucial for reproducible research, ensuring that all necessary libraries and their exact versions are documented and can be easily installed by others.

### custom_requirements.txt

#### Description:

A `pip` requirements file listing Python packages needed for the custom modules. This file is used with `pip install -r custom_requirements.txt` to install the listed packages.

#### Packages Included:
- `fsspec` and `s3fs` for interacting with various file systems including S3.
- `pyarrow`, `boto3` for data manipulation and AWS services access.
- `requests` for making HTTP requests.
- `ipywidgets`, `beautifulsoup4` for creating interactive UI elements in Jupyter notebooks and parsing HTML documents, respectively.
- Data manipulation and analysis libraries like `pandas`, `numpy`.
- `pillow` for image processing.
- `pytz` for timezone calculations.

### environment.yml

#### Description:

A `conda` environment file specifying a Python environment named `pyhc-all`. This environment is tailored for Python Heliophysics Community (PyHC) projects, including a specific Python version and compiler tools.

#### Key Components:
- Environment name: `pyhc-all`.
- Channels: `conda-forge` and `defaults` for package sourcing.
- Dependencies include `python=3.9.18`, compiler tools (`gfortran_linux-64`, `gcc_linux-64`, `gxx_linux-64`), and `pip`.

### ml.yml

#### Description:

Defines a `conda` environment named `ml_lite` focused on machine learning. It specifies Python and libraries commonly used in ML projects.

#### Key Components:
- Environment name: `ml_lite`.
- Dependencies include `python=3.7`, data manipulation libraries (`numpy`, `pandas`), ML libraries (`scikit-learn`, `keras`, `pytorch`, `tensorflow`, `xgboost`), and visualization tools (`matplotlib`, `seaborn`).

### requirements.txt

#### Description:

A comprehensive `pip` requirements file listing a wide array of Python packages. This file is extensive, covering libraries for data analysis, machine learning, heliophysics, space weather data processing, and visualization.

#### Highlighted Packages:
- Packages for heliophysics and space weather analysis like `aiapy`, `helioypy`, `sunpy`.
- Data manipulation and scientific computing libraries such as `numpy`, `scipy`, `pandas`.
- Visualization tools like `matplotlib`, `bokeh`, `plotly`.
- Machine learning libraries including `scikit-learn`, `tensorflow`.
- Various utilities for data fetching, processing, and analysis in heliophysics research.

## Conclusion

The configuration files in the `libraries_dependencies` folder are crucial for managing project-specific Python environments. They ensure that the necessary libraries and their versions are documented and can be consistently installed across different setups, aiding in reproducibility and collaborative development in scientific research projects.
