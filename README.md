# Jupyter with Python and R
## Instructions
* docker build -t cannin/jupyter-r .
* docker run -i -t cannin/jupyter-r /bin/bash
* docker run -p 8889:8888 cannin/jupyter-r
* docker run -p 8888:8888 -v DIR:/workspace cannin/jupyter-r