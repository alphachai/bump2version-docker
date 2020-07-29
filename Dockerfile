FROM python:3-alpine
WORKDIR /app
RUN pip install bump2version
ENTRYPOINT ["/usr/local/bin/bump2version"]
CMD []
