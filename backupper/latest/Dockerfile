FROM alpine

apk add --no-cache logrotate

COPY back-up.sh /

CMD ["crond", "-f"]
