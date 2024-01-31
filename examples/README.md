# Examples

## Overview

The `examples` folder is structured to provide Jupyter notebook examples across various domains, such as solar imagery analysis, space weather events, data manipulation, artificial intelligence, machine learning, and heliophysics. These examples are organized into subfolders, each corresponding to a specific area of focus and designed to be compatible with customized Python environments created for these specific domains.

### Folder Structure

- `AIA_DONKI_DMLab`: Contains notebooks demonstrating how to use the `aiaImages.py` module for analyzing solar imagery data, notebooks for utilizing the `donkiData.py` module to access and analyze space weather event data, and includes examples for employing the `dmLab.py` module for data manipulation tasks.
- `AI_ML`: Houses notebooks focused on artificial intelligence and machine learning examples, requiring the `ai_ml` kernel.
- `PyHC`: Contains heliophysics examples, designed to work with the `pyhc` kernel.

### Environment Compatibility

- **AIA, DONKI, DMLab Modules**: These examples are available across all kernels. Dependencies required by these notebooks are specified in `custom_requirements.txt`, ensuring broad compatibility and accessibility.
- **AI and ML Examples**: Specifically available in the `ai_ml` kernel, these notebooks require dependencies listed in `ml.yml`. This setup provides a tailored environment for AI and ML projects, featuring libraries and tools essential for deep learning, data visualization, and statistical analysis.
- **Heliophysics Examples**: Designed for the `pyhc-all` kernel, these notebooks leverage dependencies from both `environment.yml` and `requirements.txt`. This configuration supports a wide range of scientific computing tasks, data analysis, and visualization pertinent to heliophysics research.

## Conclusion

The `examples` folder offers a comprehensive collection of Jupyter notebooks tailored to various scientific and research domains. By organizing examples according to the specific environment they are designed for, this setup facilitates easy access to relevant tools and libraries, ensuring an efficient and productive workflow for researchers, educators, and students alike.
