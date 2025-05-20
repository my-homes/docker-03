#! /usr/bin/env bash
set -uvx
set -e
docker builder prune --force
docker build -t javacommons/paperspace-std:v2025.0520.2147-JST .
