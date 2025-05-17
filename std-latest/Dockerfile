# Dockerfile for FramePack-eichi
FROM nvidia/cuda:12.6.0-devel-ubuntu22.04

# Set environment variables
ENV LANG C.UTF-8
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PATH=/root/.pub-cache/bin:$PATH

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    dos2unix \
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

# croc
RUN cd /usr/local/bin && rm -rf my-croc-linux-amd64.tar && wget https://github.com/my-homes/docker-03/blob/raw/docker-data/my-croc-linux-amd64.tar && tar xvf my-croc-linux-amd64.tar && rm -rf my-croc-linux-amd64.tar

# Upgrade pip and install build dependencies
RUN pip install --upgrade pip
RUN pip install packaging wheel setuptools ninja

# Install PyTorch with CUDA 12.6 support
RUN pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu126

# Install acceleration libraries one by one to better diagnose any issues
RUN pip install xformers==0.0.29.post3 --no-deps --index-url https://download.pytorch.org/whl/cu126 --no-cache-dir

# For ComfyUI
RUN pip install aiohttp

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
