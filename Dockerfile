FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends p7zip-full \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY VeX-FINAL-ULTIMATE-READY-COMPRESSED.zip /tmp/vex.zip
RUN 7z x -y /tmp/vex.zip -o/app >/dev/null \
    && rm -f /tmp/vex.zip \
    && test -f /app/VeX.py

RUN pip install --no-cache-dir -r /app/requirements.txt

CMD ["python", "/app/VeX.py"]
