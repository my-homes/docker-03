#!/bin/bash

    # Ubuntu 22.04 as base image
    #FROM paperspace/gradient-base:pt211-tf215-cudatk120-py311-20240202
    #RUN yes| unminimize

    # https://note.com/gentle_murre488/n/n607270034237
    # ・reForgeやForge用を立ち上げる用です。
    # ・python3.10です。
    # ・Pytorch 2.4.1+cuda12.4です。
    FROM shibashiba2/paperspace-gradient-base-pytorch241:v10

    # Set ENV variables
    ENV LANG C.UTF-8
    ENV SHELL=/bin/bash
    ENV DEBIAN_FRONTEND=noninteractive

    ENV APT_INSTALL="apt-get install -y --no-install-recommends"
    ENV PIP_INSTALL="python3 -m pip --no-cache-dir install --upgrade"
    ENV GIT_CLONE="git clone --depth 10"

# ==================================================================
# Startup
# ------------------------------------------------------------------

    EXPOSE 6006 8888 8889

    CMD jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True
