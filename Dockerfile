FROM ubuntu:latest
MAINTAINER Shawn Turple <shawn@turple.ca>

ENV DEVOP_USERNAME=devop
ENV DEVOP_PASSWORD=password

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    sudo software-properties-common \
    curl git unzip zip neovim tmux ca-certificates python3.6 libfuse2 fuse docker.io docker-compose openssh-client;

ADD ./.profile /tmp
ADD ./pcloud.deb /tmp
ADD ./.config/nvim/init.vim /tmp
ADD ./.tmux/tmux.conf /tmp
ADD ./docker-entrypoint.sh /usr/local/bin

RUN dpkg -i /tmp/pcloud.deb; \
    nvim -c ':PlugInstall' > /dev/null 2>&1 || true ; \
    chmod +x /usr/local/bin/docker-entrypoint.sh; \
    useradd -m ${DEVOP_USERNAME} --uid 10072 && echo "${DEVOP_USERNAME}:${DEVOP_PASSWORD}" | chpasswd && adduser ${DEVOP_USERNAME} sudo; \
    passwd -d ${DEVOP_USERNAME}; \
    chown -R ${DEVOP_USERNAME}:${DEVOP_USERNAME} /tmp && chmod -R 777 /tmp;
    #chage -d0 ${DEVOP_USERNAME};

USER ${DEVOP_USERNAME}
VOLUME /data
VOLUME /config

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/bash"]
