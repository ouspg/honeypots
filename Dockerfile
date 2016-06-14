FROM alpine:3.3
MAINTAINER Kasper Kyllonen <nkapu@iki.fi>

RUN \
  apk update && \
  apk upgrade -U -a && \
  apk add && \
    git \
    openssl \
    python-dev \
    py-openssl \
    py-asn1 \
    py-twisted \
RUN useradd -d /kippo -s /bin/bash -m kippo -g sudo
RUN clone -q https://github.com/micheloosterhof/cowrie /kippo-app
RUN mv /kippo-app/kippo.cfg.dist /kippo-app/kippo.cfg
RUN chown kippo /kippo-app -R

EXPOSE 2222
USER kippo
WORKDIR /kippo-app
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "--pidfile=kippo.pid"]
