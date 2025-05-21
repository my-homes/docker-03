#! /usr/bin/env bash
set -uvx
set -e
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it javacommons/paperspace-std:v2025.0521.1647-JST //bin/bash
