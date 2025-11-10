FROM ghcr.io/collabora/whisperlive-gpu:latest

# 모델 사전 다운로드 (최초 실행 시 빠르게 기동)
RUN whisperlive --download-model openai/whisper-large-v3-turbo

ENTRYPOINT ["whisperlive"]
CMD ["--port", "9090", "--backend", "faster-whisper", "--max_clients", "50", "--max_connection_time", "600", "--model", "openai/whisper-large-v3-turbo", "--compute_type", "auto"]
