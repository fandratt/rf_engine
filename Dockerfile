FROM alpine:latest

RUN apk add --no-cache \
    chromium \
    chromium-chromedriver \
    python3 \
    py3-pip \
    xvfb

RUN pip3 install --upgrade pip

ENV CHROME_DRIVER /usr/bin/chromedriver
ENV DISPLAY=:99

WORKDIR /app

COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
