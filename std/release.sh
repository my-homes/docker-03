#! /usr/bin/env bash
set -uvx
set -e
cname=javacommons/framepack-pro:v2025.0522.1308
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it $cname //bin/bash
