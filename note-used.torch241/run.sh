#! /usr/bin/env bash
set -uvx
set -e
docker run -v `cygpath -w ~/docker/docker-data`:/docker-data -it javacommons/paperspace-gradient-base-pytorch241:v10-dos2unix //bin/bash
