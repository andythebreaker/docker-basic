# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*
ADD root/.bashrc /root/.bashrc
ENV HOME /root
WORKDIR /root
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - 
RUN apt install gcc
RUN apt install python3
RUN apt install nodejs
RUN apt install tmux
COPY requirements.txt requirements.txt
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py --force-reinstall
RUN npm install -g pubhtmlhere
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 80 443 8080 8888 48489 8000
COPY . .
CMD ["/start.sh"]