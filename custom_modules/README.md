# Custom Modules

## Overview

The `custom_modules` folder contains Python scripts designed for handling space-weather related data. These scripts facilitate fetching, processing, and saving data from various sources like the Solar Dynamics Observatory (SDO) and other space weather data providers.

### aiaImages.py

#### Description:

This script is designed to interact with the  Joint Science Operations Center (JSOC) repository to fetch and display Atmospheric Imaging Assembly (AIA) images based on user selections. It includes functions for converting Coordinated Universal Time (UTC) to local time, saving images locally, and dynamically generating a UI for image selection using IPython widgets.

#### Key Features:

- Conversion between UTC and local time.
- Fetching AIA images from a given date and wavelength from the Stanford Solar Observatories Group's JSOC server.
- Saving selected images to a local directory structure.
- Utilizing IPython widgets to create an interactive selection menu for images.

### dmLab.py

#### Description:

A simple module for interfacing with Amazon Web Services (AWS) Simple Storage Service (S3) to fetch select GSU DMLab datasets from the `dmlab-datasets` bucket. It leverages `boto3`, Amazon's SDK for Python, to access public datasets stored in S3 without requiring explicit AWS credentials.

#### Key Features:

- Initialization of an S3 client to access a public bucket.
- Function to read a CSV file directly from S3 into a Pandas DataFrame.

### donkiData.py

#### Description:

This script is tailored for fetching and processing space weather data from NASA's DONKI (Database Of Notifications, Knowledge, Information) API. It provides functionalities for retrieving data about solar flares, solar energetic particles (SEP), and coronal mass ejections (CMEs), with options to save the fetched data locally in JSON format.

#### Key Features:

- Fetching space weather event data (solar flares, SEPs, CMEs) for specified date ranges.
- Saving fetched data to local files in a structured format.
- Presenting the fetched data in a formatted HTML layout for easy viewing.
- Allows for data filtering based on event type.

## Conclusion

These custom modules are essential tools for researchers and enthusiasts in the field of heliophysics and space weather. They provide streamlined access to critical data sources, enabling efficient data retrieval, visualization, and analysis workflows.
