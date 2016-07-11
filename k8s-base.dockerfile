FROM ubuntu:xenial

## Build parameters
ARG repo_branch=nightly

## Customizable parameters
ENV REPO_URL "http://apt.tcpcloud.eu/$repo_branch/"
ENV REPO_COMPONENTS "main security extra tcp"

## Common
ENV DEBIAN_FRONTEND noninteractive
ADD files/service /usr/sbin/service
RUN chmod +x /usr/sbin/service

RUN apt-get update
RUN apt-get install -y wget

RUN echo "deb [arch=amd64] ${REPO_URL} xenial ${REPO_COMPONENTS}" > /etc/apt/sources.list
RUN wget -O - http://apt.tcpcloud.eu/public.gpg | apt-key add -
RUN apt-get update
