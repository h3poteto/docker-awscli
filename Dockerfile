FROM alpine:3.4

RUN set -x && \
    apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less curl tar && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/* && \
    mkdir /work

ENV VER 17.03.0-ce
RUN set -x && \
    curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-${VER}.tgz && \
    tar -xz -C /tmp -f /tmp/docker-${VER}.tgz && \
    mv /tmp/docker/* /usr/bin
