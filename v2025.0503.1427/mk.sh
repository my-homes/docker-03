#! /usr/bin/env bash
set -uvx
set -e
docker builder prune --force
docker build -t mrjavavm/framepack-eichi:v2025.0503.1427 .
