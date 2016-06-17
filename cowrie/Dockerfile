FROM alpine:latest
MAINTAINER Kasper Kyllonen <nkapu@iki.fi>

RUN apk -U upgrade && \
    apk add \
      python \
      py-asn1 \
      py-twisted \
      py-zope-interface \
      libffi-dev \
      py-cryptography \
      py-pip \
      py-six \
      py-cffi \
      py-idna \
      py-ipaddress \
      git && \
    pip install enum34
RUN adduser -D -s /bin/sh cowrie cowrie && \
    su - cowrie -c "git clone -q https://github.com/ouspg/cowrie && \
                    cd cowrie && cp cowrie.cfg.dist cowrie.cfg"

EXPOSE 2222
USER cowrie
WORKDIR /home/cowrie/cowrie
CMD env XARGS=--nodaemon ./start.sh
