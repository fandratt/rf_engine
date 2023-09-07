FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get update && apt-get update --fix-missing && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    libpq-dev \
    unzip \
    wget \
    firefox \
    xvfb \
    jq

RUN pip3 install --upgrade pip

RUN apt-get update \
    && apt-get install -y xvfb wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
       libatspi2.0-0 libcups2 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 \
       libxcomposite1 libxkbcommon0 libxrandr2 xdg-utils ntpdate openssl

RUN apt-get install libxml2-dev libxslt-dev python3-dev -y

WORKDIR /app
# COPY ./requirements.txt /app
# RUN pip3 install -r requirements.txt
# RUN webdrivermanager firefox --linkpath AUTO
