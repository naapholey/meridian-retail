FROM python:3.11-slim

#metadata for the image
LABEL maintainer="ANTOINETTE <annett@gmail.com>"
LABEL version=1.0.0
LABEL description="Simple Python app for Docker demonstration"

#environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

#set the working directory for the application in the container
WORKDIR /app

#copy requirements.txt to the working directory
COPY requirements.txt ./

#install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

#copy rest of the app code to the working directory
COPY . .

#EXPOSE THE PORT THAT THE APPLICATION WILL RUN ON
EXPOSE 8000

#command to run the application
CMD ["python3", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]