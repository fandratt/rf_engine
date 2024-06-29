FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install --no-install-recommends -y -qq \
    build-essential \
    libffi-dev \
    libssl-dev \
    python3-dev \
    curl \
    git \
    python3 \
    python3-pip \
    xvfb \
    jq \
    chromium-browser \
    chromium-chromedriver \
    firefox \
    openssl \
    libxss1 libappindicator1 libindicator7 \
    && apt-get clean \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
&& apt-get install -y nodejs \
&& npm install -g npm@latest

RUN npm install -g appium

RUN pip3 install --upgrade pip
WORKDIR /app
COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
RUN webdrivermanager firefox chrome --linkpath AUTO
ENV DISPLAY=:99
CMD ["Xvfb", ":99", "-ac"]