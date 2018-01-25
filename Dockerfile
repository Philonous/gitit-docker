FROM ubuntu:latest

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install \
      git \
      libgmp10 \
      libicu-dev \
      locales \
      mime-support \
      && \
    locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

COPY  dist /opt/gitit

# Override hard-coded data directories
ENV gitit_datadir=/opt/gitit
ENV filestore_datadir=/opt/gitit

# Disable idle GC to avoid constant CPU usage
ENV GHCRTS='-I0'

CMD ["/opt/gitit/bin/gitit", "-p", "80"]
