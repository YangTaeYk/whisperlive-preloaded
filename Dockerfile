FROM ghcr.io/collabora/whisperlive-gpu:latest
RUN pip install --no-cache-dir whisperlive
ENTRYPOINT ["whisperlive"]
CMD ["--port","9090","--backend","faster-whisper","--max_clients","50","--max_connection_time","600","--model","openai/whisper-large-v3-turbo","--compute_type","auto"]
