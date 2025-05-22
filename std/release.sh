#! /usr/bin/env bash
set -uvx
set -e
version=v2025.0522.1308
cname=javacommons/framepack-pro:$version
docker pull $cname
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it $cname //bin/bash
