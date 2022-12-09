FROM python:3.11.1-slim-buster

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN rm requirements*.txt