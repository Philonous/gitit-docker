# @IMAGE gitit-baseimage
# @VERSION 20180124-01

From ubuntu:xenial

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install \
      libgmp10 \
      libicu-dev \
      locales \
      netcat \
       && \
    locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
