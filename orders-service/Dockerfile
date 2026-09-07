FROM python:3.11-slim

LABEL maintainer="Antoinette <annette@gmail.com>"
LABEL version="1.0.0"
LABEL description="Simple Python app for Docker demonstration"

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8001

#CMD ["python", "main.py"]
# Replace your old CMD with this:
CMD ["python3", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001"]
