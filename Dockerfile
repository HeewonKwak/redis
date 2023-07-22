From python:3.10

ENV PYTHONUNBUFFERED 1

ENV PYTHONPATH "${PYTHONPATH}:/app"

COPY . /app
WORKDIR /app

RUN pip install fastapi "uvicorn[standard]" requests redis

CMD python main.py