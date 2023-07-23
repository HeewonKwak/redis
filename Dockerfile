From python:3.10

ENV PYTHONUNBUFFERED 1

ENV PYTHONPATH "${PYTHONPATH}:/app"

COPY . /app
WORKDIR /app

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install redis-server
RUN pip install fastapi "uvicorn[standard]" requests redis

EXPOSE 8000
CMD python main.py
