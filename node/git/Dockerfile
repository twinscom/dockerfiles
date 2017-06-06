FROM node:alpine

RUN apk add --no-cache git openssh-client \
    && mkdir -p ~/.ssh/ \
    && ssh-keyscan \
        github.com \
        gitlab.com \
        bitbucket.org \
        >> ~/.ssh/known_hosts
