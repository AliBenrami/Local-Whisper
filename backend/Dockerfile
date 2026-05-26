# RTX 50-series (Blackwell, sm_120) needs CUDA 12.8+ PyTorch wheels (cu128), not cu124.
FROM nvidia/cuda:12.8.1-cudnn-runtime-ubuntu22.04

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV HF_HOME=/models/huggingface
ENV TRANSFORMERS_CACHE=/models/huggingface
ENV HF_HUB_CACHE=/models/huggingface

# System packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# PyTorch stable 2.7+ cu128 includes sm_120 (Blackwell) kernels.
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

# Install app deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY app ./app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "1"]