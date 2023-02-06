FROM alpine:latest

USER root

RUN apk add \
        ca-certificates \
        curl \
        git \
        gpg \
        npm \
        openssh-client \
        sudo \
        zsh

ARG MARP_VERSION=latest
RUN npm install -g @marp-team/marp-cli@${MARP_VERSION}

ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/alpine-*.sh /tmp/script-library/
RUN /tmp/script-library/alpine-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/alpine-oh-my-zsh.sh ${USE_OMZ} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
