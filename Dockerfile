FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    xvfb \
    jq \
    chromium-browser \
    chromium-chromedriver \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    ntpdate \
    openssl

RUN pip3 install --upgrade pip
WORKDIR /app
COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
ENV DISPLAY=:99
CMD ["Xvfb", ":99", "-ac"]
