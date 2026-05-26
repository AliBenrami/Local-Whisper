# backend:

- python (fastapi)
  - to get user memos and send the transcriped version back to the client
- ollama
  - so we can run models like whisper (openai) and llama (meta) to transcribe and clean up transcriptions.

# docker

build (CUDA 12.8 / cu128 for RTX 50-series Blackwell GPUs)
docker build -t whisper-api ./backend

run
docker run --rm --gpus all \
 -p 8000:8000 \
 -v whisper-model-cache:/models \
 whisper-api

# frontend:

???

# project flow
