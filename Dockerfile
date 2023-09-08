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
    # firefox \
    xvfb \
    jq

RUN pip3 install --upgrade pip

RUN apt-get update \
    && apt-get install -y xvfb wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
       libatspi2.0-0 libcups2 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 \
       libxcomposite1 libxkbcommon0 libxrandr2 xdg-utils ntpdate openssl

RUN apt-get install libxml2-dev libxslt-dev python3-dev -y

RUN curl -fsSL -o /tmp/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-114.0&os=linux64&lang=en-US"
RUN tar xvjf /tmp/firefox.tar.bz2 -C /opt/
RUN ln -s /opt/firefox/firefox /usr/bin/firefox
ENV FIREFOX_VERSION 114.0
RUN GECKODRIVER_VERSION=$(curl -sS https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")') && \
    GECKODRIVER_URL="https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VERSION}/geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz" && \
    curl -sSL "$GECKODRIVER_URL" | tar -xz -C /usr/local/bin


WORKDIR /app
COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
RUN webdrivermanager firefox --linkpath AUTO
# RUN webdrivermanager firefox --linkpath AUTO --firefox_version 0.32.2
