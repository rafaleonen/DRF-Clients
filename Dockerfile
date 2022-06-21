FROM python:3.7.4

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Create app directory
RUN mkdir -p /usr/app
WORKDIR /usr/app

# Installing dependecies
COPY requirements.txt /usr/app
RUN python -m pip install -r requirements.txt

# Copying source files
COPY . /usr/app

EXPOSE 8000

# CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "setup.wsgi.application"]

CMD gunicorn setup.wsgi:application --bind 0.0.0.0:$PORT