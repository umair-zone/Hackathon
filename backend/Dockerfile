FROM python:3.13-slim

# Install system dependencies and uv
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    libpq5 \
    && curl -sSf https://astral.sh/uv/install.sh | sh \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app

WORKDIR /app

# Install Python dependencies
COPY pyproject.toml .
RUN uv pip install --no-cache-dir -e .

# Copy application code
COPY . .

# Set up entrypoint
RUN chmod +x /app/django-entrypoint.sh
ENTRYPOINT ["/app/django-entrypoint.sh"]

# Run the application
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi:application"]