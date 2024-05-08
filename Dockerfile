FROM ubuntu:latest
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y -qq curl
RUN apt-get install -y -qq git
RUN apt-get install -y -qq python3
RUN apt-get install -y -qq python3-pip
RUN apt-get install -y -qq xvfb
RUN apt-get install -y -qq jq
RUN apt-get install -y -qq chromium-browser
RUN apt-get install -y -qq chromium-chromedriver
RUN apt-get install -y -qq firefox
# RUN apt-get install -y -qq --no-install-recommends libasound2
RUN apt-get install -y -qq --no-install-recommends libatk-bridge2.0-0
RUN apt-get install -y -qq --no-install-recommends libatk1.0-0
RUN apt-get install -y -qq --no-install-recommends libatspi2.0-0
RUN apt-get install -y -qq --no-install-recommends libcups2
RUN apt-get install -y -qq --no-install-recommends libdbus-1-3
RUN apt-get install -y -qq --no-install-recommends libgbm1
RUN apt-get install -y -qq --no-install-recommends libgtk-3-0
RUN apt-get install -y -qq --no-install-recommends libnspr4
RUN apt-get install -y -qq --no-install-recommends libnss3
RUN apt-get install -y -qq --no-install-recommends libxcomposite1
RUN apt-get install -y -qq --no-install-recommends libxkbcommon0
RUN apt-get install -y -qq --no-install-recommends libxrandr2
RUN apt-get install -y -qq --no-install-recommends xdg-utils
RUN apt-get install -y -qq --no-install-recommends ntpdate
RUN apt-get install -y -qq --no-install-recommends openssl

RUN pip3 install --upgrade pip
WORKDIR /app
COPY ./requirements.txt /app
RUN pip3 install -r requirements.txt
RUN webdrivermanager firefox --linkpath AUTO
ENV DISPLAY=:99
CMD ["Xvfb", ":99", "-ac"]
