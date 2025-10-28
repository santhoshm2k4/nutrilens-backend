# Use an official Python image
FROM python:3.11-slim

# Install system dependencies including Tesseract
RUN apt-get update && apt-get install -y tesseract-ocr && apt-get clean

# Set work directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Render port
ENV PORT=10000

# Start the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
