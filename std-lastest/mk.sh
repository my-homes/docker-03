#! /usr/bin/env bash
set -uvx
set -e
cname=javacommons/paperspace-std:v2025.0524.0020-JST
docker builder prune --force
docker build -t $cname .
