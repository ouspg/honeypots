FROM alpine:latest
MAINTAINER Kasper Kyllonen <nkapu@iki.fi>

RUN apk --no-cache upgrade && \
    apk --no-cache add \
      python \
      py-asn1 \
      py-twisted \
      py-zope-interface \
      libffi-dev \
      py-cryptography \
      py-pip \
      openssl \
      tar \
      py-six \
      py-cffi \
      py-idna \
      py-ipaddress \
      py-openssl &&\
    pip install enum34 && \
    pip install service-identity
RUN adduser -D -s /bin/sh cowrie cowrie && \
    cd /home/cowrie && \
    su - cowrie -c "wget https://github.com/micheloosterhof/cowrie/archive/master.tar.gz -O - | tar -xz --strip=1 && \
    cp cowrie.cfg.dist cowrie.cfg"

EXPOSE 2222
USER cowrie
WORKDIR /home/cowrie
CMD env XARGS=--nodaemon ./start.sh
