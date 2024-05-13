FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y -qq curl
RUN apt-get install -y -qq git
RUN apt-get install -y -qq python3
RUN apt-get install -y python3-pip
RUN apt-get install -y -qq xvfb
RUN apt-get install -y -qq jq
RUN apt-get install -y -qq chromium-browser
RUN apt-get install -y -qq chromium-chromedriver
RUN apt-get install -y -qq firefox
RUN apt-get install -y -qq openssl

RUN pip3 install --upgrade pip
WORKDIR /app
COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
RUN webdrivermanager firefox --linkpath AUTO
ENV DISPLAY=:99
CMD ["Xvfb", ":99", "-ac"]
