FROM python:alpine

RUN pip install --no-cache-dir rethinkdb

RUN apk add --no-cache logrotate

COPY *.sh /

WORKDIR /

CMD ["/run.sh"]
