FROM debian:latest

LABEL org.opencontainers.image.source=https://github.com/sambyeol/marp-devcontainer

USER root

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        chromium \
        curl \
        fonts-noto-cjk \
        fonts-noto-cjk-extra \
        fonts-noto-color-emoji \
        git \
        gpg \
        ssh-client \
        sudo \
        zsh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/list/*

ARG MARP_VERSION=latest
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/list/* \
    && npm install -g @marp-team/marp-cli@${MARP_VERSION}

ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-create-user.sh ${USERNAME} \
    && su ${USERNAME} -c /tmp/script-library/debian-oh-my-zsh.sh ${USE_OMZ} \
    && rm -rf /tmp/script-library

USER ${USERNAME}
ENV CHROME_PATH=/usr/bin/chromium

