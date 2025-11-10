FROM ghcr.io/collabora/whisperlive-gpu:latest
# (선택) 모델 미리 받아 캐시 워밍업 — 실패해도 빌드 계속
RUN python3 /app/run_server.py --download-model openai/whisper-large-v3-turbo || true
# ENTRYPOINT/CMD 건드리지 않음