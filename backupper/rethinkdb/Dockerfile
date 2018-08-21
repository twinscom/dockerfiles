FROM python:alpine

RUN pip install --no-cache-dir rethinkdb

COPY *.sh /

WORKDIR /

CMD ["/run.sh"]
