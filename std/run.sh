#! /usr/bin/env bash
set -uvx
set -e
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it javacommons/paperspace-std:v2025.0517.1811 //bin/bash
