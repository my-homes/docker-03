# Dockerfile for FramePack-eichi
#FROM nvidia/cuda:12.6.0-devel-ubuntu22.04
FROM nvidia/cuda:12.6.0-devel-ubuntu24.04

# Set environment variables
ENV LANG=C.UTF-8
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PATH=/root/.pub-cache/bin:$PATH

# Install python3.10
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.10
RUN apt-get install -y libpython3.10-dev

# Install pip3.10
RUN apt-get install -y --no-install-recommends curl
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Create symbolic links for Python
RUN ln -sf /usr/bin/python3.10 /usr/local/bin/python

# Upgrade pip and install build dependencies
RUN pip install --upgrade pip
RUN pip install packaging wheel setuptools ninja

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    lshw pciutils \
    dos2unix \
    file \
    nano \
    vim \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1 \
    build-essential \
    wget \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# croc
RUN cd /usr/local/bin && \
    rm -rf my-croc-linux-amd64.tar && \
    wget https://github.com/my-homes/docker-03/raw/main/docker-data/my-croc-linux-amd64.tar && \
    tar xvf my-croc-linux-amd64.tar && \
    rm -rf my-croc-linux-amd64.tar

# growth-check
RUN cd /usr/local/bin && \
    rm -rf growth-check.tar && \
    wget https://github.com/my-homes/docker-03/raw/main/docker-data/growth-check.tar && \
    tar xvf growth-check.tar && \
    rm -rf growth-check.tar

# Microsoft edit
RUN cd /usr/local/bin && \
    rm -rf edit-1.0.0-x86_64-linux-gnu.xz && \
    wget https://github.com/microsoft/edit/releases/download/v1.0.0/edit-1.0.0-x86_64-linux-gnu.xz && \
    xz -d edit-1.0.0-x86_64-linux-gnu.xz && \
    mv edit-1.0.0-x86_64-linux-gnu edit && \
    chmod 755 edit

# Install PyTorch with CUDA 12.6 support
RUN pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu126

# Install acceleration libraries one by one to better diagnose any issues
RUN pip install xformers==0.0.29.post3 --no-deps --index-url https://download.pytorch.org/whl/cu126 --no-cache-dir

# For ComfyUI
RUN pip install aiohttp

# TimeZone JST (Asia/Tokyo)
RUN apt-get update && apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# For FramePack
RUN cd /tmp && rm -rf requirements.txt && wget https://github.com/lllyasviel/FramePack/raw/main/requirements.txt && pip install -r requirements.txt && rm -rf requirements.txt

# ==================================================================
# JupyterLab
# ------------------------------------------------------------------

# Based on https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html#pip
RUN pip install  jupyterlab==3.6.5

# ==================================================================
# Node.js and Jupyter Notebook Extensions
# ------------------------------------------------------------------

RUN pip install jupyter_contrib_nbextensions==0.7.0 jupyterlab-git==0.43.0 && \
    jupyter contrib nbextension install --user

# ==================================================================
# Startup
# ------------------------------------------------------------------

EXPOSE 8888 6006

CMD jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True
