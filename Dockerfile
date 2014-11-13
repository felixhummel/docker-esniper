FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
ADD sources.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get build-dep -y --no-install-recommends \
      esniper

RUN apt-get install \
    wget \
    openssl \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /tmp
RUN wget -O esniper-2-31-0.tgz 'http://downloads.sourceforge.net/project/esniper/esniper/2.31.0/esniper-2-31-0.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fesniper%2Ffiles%2Fesniper%2F2.31.0%2F&ts=1412703539&use_mirror=cznic'
RUN tar xzf esniper-2-31-0.tgz && rm esniper-2-31-0.tgz
WORKDIR /tmp/esniper-2-31-0
RUN ./configure
RUN make
RUN make install

WORKDIR /mnt
