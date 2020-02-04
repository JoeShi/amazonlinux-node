FROM amazonlinux:2018.03

ENV NODE_VERSION=12.14.1
ENV NVM_DIR=/root/.nvm

WORKDIR /root

RUN yum -y update \
    && yum -y install wget gcc make zip \
    && yum clean all \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION \
    && curl -o- https://bootstrap.pypa.io/get-pip.py | python \
    && pip install awscli

ENV NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
