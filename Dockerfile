FROM alpine:3.7

LABEL maintainer="Innovate Tech <himalay@innovatetech.co>"

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/innovate-tech/aws-cli-docker" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV AWS_CLI_VERSION=1.15.77

RUN apk -v --update add groff less python py-pip zip && \
    pip install --upgrade awscli==$AWS_CLI_VERSION && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/* && \
    mkdir -p /root/.aws

WORKDIR /root
