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
RUN adduser -D -s /bin/sh kippo kippo && \
    git clone -q https://github.com/ouspg/cowrie /home/kippo && \
    cd /home/kippo && \
    mv cowrie.cfg.dist cowrie.cfg && \
    chown -R kippo:kippo /home/kippo

EXPOSE 2222
USER kippo
WORKDIR /home/kippo
CMD ./start.sh
