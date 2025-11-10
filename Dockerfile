FROM ghcr.io/collabora/whisperlive-gpu:latest

# 모델 사전 다운로드 (faster-whisper 방식)
RUN python3 -c "\
from faster_whisper import WhisperModel; \
print('Downloading model: large-v3-turbo...'); \
model = WhisperModel('large-v3-turbo', device='cpu', compute_type='int8'); \
print('Model downloaded successfully')"

# Python으로 직접 실행
ENTRYPOINT ["python3", "/app/run_server.py"]
CMD ["--port", "9090", "--backend", "faster_whisper", "--max_clients", "50", "--max_connection_time", "600"]