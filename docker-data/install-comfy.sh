#! /usr/bin/env bash
set -uvx
set -e

cd / && rm -rf cuda-keyring_*.deb

cd / && cp /docker-data/comfyui.ipynb .

cd /usr/local/bin && tar xvf /docker-data/my-croc-linux-amd64.tar
which croc

cd /tmp && rm -rf requirements.txt && wget https://raw.githubusercontent.com/comfyanonymous/ComfyUI/master/requirements.txt && pip install -r requirements.txt && rm -rf requirements.txt
pip install aiohttp
pip install comfyui-frontend-package

cd / && rm -rf ComfyUI
cd / && git clone https://github.com/comfyanonymous/ComfyUI
cd /ComfyUI && git log | head > git-log-head.txt
