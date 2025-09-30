FROM python:3.12-slim

WORKDIR /jewelry-inventory

# Install dependencies
COPY jewelry-inventory/python/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY jewelry-inventory/python/ .

# Run tests
RUN pytest

# Run the main application
CMD ["python", "main.py"]
