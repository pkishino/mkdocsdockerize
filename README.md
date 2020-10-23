
[![pipeline status](https://gitlab.com/pkishino/mkdocsdockerize/badges/main/pipeline.svg)](https://gitlab.com/pkishino/mkdocsdockerize/-/commits/main)
![Docker Stars](https://img.shields.io/docker/stars/pkishino/mkdocsdockerize.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/pkishino/mkdocsdockerize.svg)
![Docker Automated](https://img.shields.io/docker/cloud/automated/pkishino/mkdocsdockerize.svg)
![Docker Build](https://img.shields.io/docker/cloud/build/pkishino/mkdocsdockerize.svg)
![Docker Version](https://img.shields.io/docker/v/pkishino/mkdocsdockerize/latest.svg)

This project uses docker to encapsulate certain mkdocs behaviour
The docker images are available here: [pkishino/mkdocsdockerize](https://hub.docker.com/r/pkishino/mkdocsdockerize)

This docker image allows the use of mkdocs to build and serve a mkdocs prodject without requiring mkdocs to be installed.

Simple use:
For both produce and serve, docker requires the current project directory or folder were the compressed file is saved to be mounted as a volume
Below assumed that current directory is used

To build the current project folder and generate a .tar.gz including the project and the static site
``docker run -v $(pwd):/page --rm pkishino/mkdocsdockerize produce <optionally specify site folder name>| gzip -9 >test.tar.gz``

To serve the project
``docker run -p 8000:8000 -v $(pwd):/page --rm pkishino/mkdocsdockerize serve``

To serve a compressed project
``docker run -p 8000:8000 -v $(pwd):/page --rm pkishino/mkdocsdockerize serve <compressed-file-name>``


