#! /usr/bin/env bash
set -uvx
set -e
docker pull nvidia/cuda:12.6.0-devel-ubuntu22.04
docker images
