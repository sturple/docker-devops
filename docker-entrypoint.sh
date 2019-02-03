#!/bin/bash
set -e
PASSWORD=${DEVOP_PASSWORD-password}
echo >&2 "${DEVOP_USERNAME} ${PASSWORD}"
if [ "$DEVOP_USERNAME" != "devop" ]; then
    echo >&2 "Creating new user. ${DEVOP_USERNAME}"
    sudo useradd \
    --create-home \
    --groups docker,devop \
    --shell /bin/bash \
    --uid ${DEVOP_USERID-1000} \
    ${DEVOP_USERNAME}
    sudo passwd -d ${DEVOP_USERNAME};
fi

sudo chown ${DEVOP_USERNAME}:${DEVOP_USERNAME} /data /config

sudo -u ${DEVOP_USERNAME} echo >&2 "Who am I : $(whoami)  ${DEVOP_USERNAME}"
# getting latest vim plugin
sudo -u ${DEVOP_USERNAME} curl -fLo /home/${DEVOP_USERNAME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
#setting up directories
sudo -u ${DEVOP_USERNAME} mkdir -p /home/${DEVOP_USERNAME}/.config/nvim;
sudo -u ${DEVOP_USERNAME} mkdir -p /home/${DEVOP_USERNAME}/.tmux/;
sudo chown -R ${DEVOP_USERNAME}:${DEVOP_USERNAME} /home/${DEVOP_USERNAME}
#setting up configurations
export XDG_CONFIG_HOME=/home/${DEVOP_USERNAME}/.config;
sudo -u ${DEVOP_USERNAME} cp /tmp/init.vim /home/${DEVOP_USERNAME}/.config/nvim/
sudo -u ${DEVOP_USERNAME} cp /tmp/tmux.conf /home/${DEVOP_USERNAME}/.tmux/
sudo -u ${DEVOP_USERNAME} ln -s /home/${DEVOP_USERNAME}/.tmux/tmux.conf /home/${DEVOP_USERNAME}/.tmux.conf;

sudo -u ${DEVOP_USERNAME} chmod 666 /home/${DEVOP_USERNAME}/.profile
#Updating profiles aliases and other stuff
cat /tmp/.profile >> /home/${DEVOP_USERNAME}/.profile && source /home/${DEVOP_USERNAME}/.profile
rm /tmp/*
sudo su - ${DEVOP_USERNAME}

exec "$@"
