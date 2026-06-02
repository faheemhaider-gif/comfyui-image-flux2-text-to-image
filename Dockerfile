# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.4-base

# Install wget if missing
RUN apt-get update && apt-get install -y wget ca-certificates && rm -rf /var/lib/apt/lists/*

# Create model folders
RUN mkdir -p /comfyui/models/diffusion_models \
    /comfyui/models/loras \
    /comfyui/models/text_encoders \
    /comfyui/models/vae

# Flux 2 Dev diffusion model
RUN wget -O /comfyui/models/diffusion_models/flux2_dev_fp8mixed.safetensors \
    https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/diffusion_models/flux2_dev_fp8mixed.safetensors

# Flux 2 Turbo LoRA
RUN wget -O /comfyui/models/loras/Flux_2-Turbo-LoRA_comfyui.safetensors \
    https://huggingface.co/ByteZSzn/Flux.2-Turbo-ComfyUI/resolve/main/Flux_2-Turbo-LoRA_comfyui.safetensors

# Flux 2 text encoder
RUN wget -O /comfyui/models/text_encoders/mistral_3_small_flux2_bf16.safetensors \
    https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/text_encoders/mistral_3_small_flux2_bf16.safetensors

# Flux 2 VAE
RUN wget -O /comfyui/models/vae/full_encoder_small_decoder.safetensors \
    https://huggingface.co/black-forest-labs/FLUX.2-small-decoder/resolve/main/full_encoder_small_decoder.safetensors