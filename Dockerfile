FROM ubuntu:latest
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y -qq curl
RUN apt-get install -y -qq git
RUN apt-get install -y -qq python3
RUN apt-get install --reinstall -y python3
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN apt-get install -y -qq xvfb
RUN apt-get install -y -qq jq
RUN apt-get install -y -qq chromium-browser
RUN apt-get install -y -qq chromium-chromedriver
RUN apt-get install -y -qq firefox
# RUN apt-get install -y -qq libasound2
# RUN apt-get install -y -qq libatk-bridge2.0-0
# RUN apt-get install -y -qq libatk1.0-0
# RUN apt-get install -y -qq libatspi2.0-0
# RUN apt-get install -y -qq libcups2
# RUN apt-get install -y -qq libdbus-1-3
# RUN apt-get install -y -qq libgbm1
# RUN apt-get install -y -qq libgtk-3-0
# RUN apt-get install -y -qq libnspr4
# RUN apt-get install -y -qq libnss3
# RUN apt-get install -y -qq libxcomposite1
# RUN apt-get install -y -qq libxkbcommon0
# RUN apt-get install -y -qq libxrandr2
RUN apt-get install -y -qq xdg-utils
RUN apt-get install -y -qq ntpdate
RUN apt-get install -y -qq openssl

WORKDIR /app
COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
RUN webdrivermanager firefox --linkpath AUTO
ENV DISPLAY=:99
CMD ["Xvfb", ":99", "-ac"]
