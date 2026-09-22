FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install -y git curl python3-pip ffmpeg

RUN pip3 install -U pip --break-system-packages

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm

RUN mkdir -p /app/
WORKDIR /app/

COPY . /app/

RUN pip3 install -U -r requirements.txt --break-system-packages

CMD ["python3", "-m", "MusicMan"]
