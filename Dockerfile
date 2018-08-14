FROM alpine:3.7

LABEL maintainer="Raju Dawadi <rajudawadinp@gmail.com>"

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/dwdraju/kubectl-docker" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV AWS_CLI_VERSION=1.15.77
ENV S3CMD_VERSION=2.0.2

RUN apk -v --update add groff less python py-pip && \
    pip install --upgrade awscli==$AWS_CLI_VERSION s3cmd==$S3CMD_VERSION && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/* && \
    mkdir -p /root/.aws

WORKDIR /root
