FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt from the subdirectory
COPY docker-learning/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

# Copy the actual Django project into /app
COPY docker-learning/ /app/

# Collect static files
RUN python manage.py collectstatic --noinput

EXPOSE 81

CMD ["python", "manage.py", "runserver", "0.0.0.0:81"]
