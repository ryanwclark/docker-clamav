FROM ryanwclark/alpine:edge
LABEL maintainer="Ryan Clark (github.com/ryanwclark)"

### Disable Features From Base Image
ENV ENABLE_SMTP=FALSE

### Install Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .clamv-run-deps \
              clamav \
              clamav-libunrar \
              && \
    \
### Cleanup
    rm -rf /etc/logrotate.d/* && \
    rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 3310

### Add Files
ADD install /
