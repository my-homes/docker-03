#! /usr/bin/env bash
set -uvx
set -e
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it javacommons/paperspace-gradient-base-pytorch251_py310:v1.1-dos2unix //bin/bash
