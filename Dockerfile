FROM ghcr.io/collabora/whisperlive-gpu:latest

# 모델 파일 사전 다운로드 (빌드 시 CPU, 런타임에 GPU 변환)
RUN python3 -c "\
from faster_whisper import WhisperModel, download_model; \
print('Downloading model: large-v3-turbo...'); \
download_model('large-v3-turbo'); \
print('Model files downloaded successfully. Will be converted to GPU format at runtime.')"

# Python으로 직접 실행
ENTRYPOINT ["python3", "/app/run_server.py"]
CMD ["--port", "9090", "--backend", "faster_whisper", "--max_clients", "50", "--max_connection_time", "600"]