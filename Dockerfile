FROM debian:buster-slim

ENV TZ=Asia/Seoul
ENV LC_ALL=C.UTF-8

RUN apt-get update
RUN apt-get install -y nano git sudo mailutils

WORKDIR /
RUN git clone https://github.com/istandthon7/torrent_web_scraper.git
WORKDIR /torrent_web_scraper

VOLUME /torrent_web_scraper/config
VOLUME /torrent_web_scraper/transmission_script

RUN ./install.sh
COPY update-exim4.conf.conf /etc/exim4
COPY entrypoint.sh /usr/local/bin
RUN ln -s usr/local/bin/docker-entrypoint.sh /
ENTRYPOINT entrypoint.sh
