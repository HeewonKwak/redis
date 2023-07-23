From python:3.10

ENV PYTHONUNBUFFERED 1

ENV PYTHONPATH "${PYTHONPATH}:/app"

COPY . /app
WORKDIR /app

RUN sudo apt-get update
RUN sudo apt-get upgrade
RUN sudo apt-get install redis-server
RUN pip install fastapi "uvicorn[standard]" requests redis

EXPOSE 8000
CMD python main.py
