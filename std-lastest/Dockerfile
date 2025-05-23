# Dockerfile for FramePack-eichi
FROM nvidia/cuda:12.6.0-devel-ubuntu22.04

# Set environment variables
ENV LANG=C.UTF-8
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PATH=/root/.pub-cache/bin:$PATH

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    lshw pciutils \
    dos2unix \
    file \
    vim \
    git \
    python3.10 \
    python3.10-dev \
    python3-pip \
    python3-venv \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1 \
    build-essential \
    wget \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create symbolic links for Python
RUN ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

# Build nano
RUN apt-get update && \
    apt-get install -y build-essential libncurses5-dev && \
    cd /root && \
    rm -rf nano-* && \
    wget https://www.nano-editor.org/dist/latest/nano-8.4.tar.xz && \
    tar -xvf nano-8.4.tar.xz && \
    cd nano-8.4 && \
    ./configure && \
    make && \
    make install && \
    cd /root && \
    rm -rf nano-*

# Install dart
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' &&  \
    sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_testing.list > /etc/apt/sources.list.d/dart_testing.list' && \
    sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list' && \
    apt-get update && \
    apt-get -t stable install dart

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

# Upgrade pip and install build dependencies
RUN pip install --upgrade pip
RUN pip install packaging wheel setuptools ninja

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
