#! /usr/bin/env bash
set -uvx
set -e
version=v1.9.4.0
cname=javacommons/framepack-pro:$version
docker pull $cname
docker run -v `cygpath -w ~/_/docker/docker-data`:/docker-data -it $cname //bin/bash
