#! /usr/bin/env bash
set -uvx
set -e
cname=javacommons/paperspace-std:v2025.0522.0600-JST
docker pull $cname
docker images
