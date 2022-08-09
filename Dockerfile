FROM ttbb/base

WORKDIR /opt/sh

ARG TARGETARCH

RUN echo "start" && \ 
wget https://github.com/thanos-io/thanos/releases/download/v0.27.0/thanos-0.27.0.linux-$TARGETARCH.tar.gz && \
mkdir -p /opt/sh/thanos && \
tar -xf thanos-0.27.0.linux-$TARGETARCH.tar.gz -C /opt/sh/thanos --strip-components 1 && \
rm -rf /opt/sh/thanos-0.27.0.linux-$TARGETARCH.tar.gz && \
ln -s /opt/sh/thanos /usr/bin/thanos && \
echo "end"

ENV THANOS_HOME /opt/sh/thanos

WORKDIR /opt/sh/thanos
