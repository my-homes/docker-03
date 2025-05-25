#! /usr/bin/env bash
set -uvx
set -e
cname=javacommons/paperspace-std:v2025.0526.0000-JST
docker pull $cname
docker images
