FROM ghcr.io/collabora/whisperlive-gpu:latest

ENTRYPOINT ["whisperlive"]
CMD ["--download-model", "openai/whisper-large-v3-turbo", "--port", "9090", "--backend", "faster-whisper", "--max_clients", "50", "--max_connection_time", "600", "--model", "openai/whisper-large-v3-turbo", "--compute_type", "auto"]
