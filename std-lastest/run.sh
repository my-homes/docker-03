#! /usr/bin/env bash
set -uvx
set -e
cname=javacommons/paperspace-std:v2025.0523.2310-JST
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it $cname //bin/bash
