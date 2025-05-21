#! /usr/bin/env bash
set -uvx
set -e
docker builder prune --force
docker build -t javacommons/paperspace-std:v2025.0522.0720-JST .
