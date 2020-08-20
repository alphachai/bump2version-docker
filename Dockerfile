FROM python:3-alpine

LABEL maintainer="Charlie Mathews <charlie@charliemathews.com>"

WORKDIR /app

RUN apk --update add git less openssh gnupg ca-certificates wget && \
    pip install --no-cache-dir bump2version && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    adduser -D -s /bin/sh -g "git user" git-user

USER git-user

ENTRYPOINT ["/usr/local/bin/bump2version"]
CMD []
