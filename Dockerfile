FROM python:3.10-alpine

RUN apk add --update --no-cache \
    musl-dev \
    linux-headers \
    libffi-dev \
    openssl-dev \
    build-base

WORKDIR /app
COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


