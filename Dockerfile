FROM alpine:3.4
MAINTAINER Kasper Kyllonen <nkapu@iki.fi>

RUN apk -U upgrade
RUN apk add \
    python \
    python-dev \
    py-asn1 \
    py-twisted \
    py-zope-interface \
    py-crypto \
    libffi-dev \
    py-cryptography \
    py-pip \
    py-six \
    py-cffi \
    py-idna \
    py-ipaddress \
    git && \
pip install enum34 && \
adduser -D -s /bin/sh kippo kippo && \
git clone -q https://github.com/micheloosterhof/cowrie /home/kippo && \
cd /home/kippo && \
mv cowrie.cfg.dist cowrie.cfg && \
chown -R kippo:kippo /home/kippo

EXPOSE 2222
USER kippo
WORKDIR /home/kippo
CMD ./start.sh
