# syntax=docker/dockerfile:1
ARG PYTHON_VERSION=3.12

# Builder & Tester (Môi trường kiểm thử)
FROM python:${PYTHON_VERSION}-slim AS tester

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Copy requirements và công cụ test (pytest)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt pytest

# Copy toàn bộ mã nguồn để test
COPY . .

# THỰC THI TEST
RUN python3 -m pytest -v

# Production 

FROM python:${PYTHON_VERSION}-slim AS production
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]