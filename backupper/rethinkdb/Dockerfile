FROM rethinkdb:latest

LABEL maintainer="ArmiT <armit@twinscom.ru>"

ENV RETHINKDB_PACKAGE_VERSION 2.3.0.post6

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CF9BDC6F03D1F02B \
    && apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends python-pip cron logrotate \
    && pip install "rethinkdb==$RETHINKDB_PACKAGE_VERSION" \
    && rm -rf /var/lib/apt/lists/*

COPY *.sh /

WORKDIR /

CMD ["/run.sh"]
