# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

# This Dockerfile uses Docker Hardened Images (DHI) for enhanced security.
# For more information, see https://docs.docker.com/dhi/
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copy the requirements file into the container first
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# (Optional but recommended) Copy the rest of your application code
COPY . .

# Expose the port that the application listens on.
EXPOSE 8000

# Run the application.
CMD ["python3", "-m", "uvicorn", "app:app", "--host=0.0.0.0", "--port=8000"]