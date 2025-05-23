#! /usr/bin/env bash
set -uvx
set -e

cd / && rm -rf cuda-keyring_*.deb

cd / && cp /docker-data/*.ipynb .

cd /usr/local/bin && tar xvf /docker-data/fp.tar
which f0
which e0
which f1
which e1
which oichi
which loop
which studio
which my-dart
which lic
which unlic

cd /usr/local/bin && tar xvf /docker-data/my-croc-linux-amd64.tar
which croc

cd / && rm -rf stable-diffusion-webui
cd / && git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd /stable-diffusion-webui && git log | head > git-log-head.txt

cd / && rm -rf stable-diffusion-webui-reForge
cd / && git clone https://github.com/Panchovix/stable-diffusion-webui-reForge
cd /stable-diffusion-webui-reForge && git log | head > git-log-head.txt

cd / && rm -rf ComfyUI
cd / && git clone https://github.com/comfyanonymous/ComfyUI
cd /ComfyUI && git log | head > git-log-head.txt

cd / && rm -rf FramePack FramePack-eichi
cd / && git clone https://github.com/lllyasviel/FramePack
cd /FramePack && rm -rf .git && pip install -r requirements.txt
cd / && git clone https://github.com/git-ai-code/FramePack-eichi
cd /FramePack-eichi && cp -r webui/* /FramePack/
cd / && rm -rf FramePack-eichi
dos2unix /docker-data/prompt_presets.json
mkdir -p /FramePack/presets
cd /FramePack/presets && cp /docker-data/prompt_presets.json .
cd /FramePack && mkdir -p lora
cd /FramePack/lora && cat /docker-data/bouncing_breasts_hunyuan.safetensors-* > bouncing_breasts_hunyuan.safetensors
cd /FramePack/lora && cat /docker-data/hagikora_FramePack_oneframe_V3.safetensors-* > hagikora_FramePack_oneframe_V3.safetensors
cd /FramePack/lora && cat /docker-data/AnimeShots.safetensors-* > AnimeShots.safetensors
#cd /FramePack/lora && cat /docker-data/hyvideo_FastVideo_LoRA-fp8.safetensors-* > hyvideo_FastVideo_LoRA-fp8.safetensors
cd /

cd / && rm -rf FramePackLoop
cd / && git clone https://github.com/red-polo/FramePackLoop
cd /FramePackLoop && rm -rf .git

cd / && rm -rf FramePack-Studio
cd / && git clone https://github.com/colinurbs/FramePack-Studio
cd /FramePack-Studio && rm -rf .git
cd /FramePack-Studio && rm -rf loras && ln -s /FramePack/lora loras

dart pub global activate dt
dart pub global activate specgen

cd /usr/local/bin
specgen
