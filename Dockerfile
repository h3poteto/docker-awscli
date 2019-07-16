FROM python:3.7.4-alpine3.10

ENV AWS_VER 1.16.198

RUN set -x && \
    apk --no-cache update && \
    apk --no-cache add ca-certificates curl tar git openssl openssh && \
    pip --no-cache-dir install awscli==$AWS_VER && \
    rm -rf /var/cache/apk/* && \
    mkdir /work

ENV VER 18.09.7
RUN set -x && \
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz && \
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz && \
    mv /tmp/docker/* /usr/bin
