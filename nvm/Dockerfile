FROM ubuntu

WORKDIR /app

ADD . /app

RUN sh -c /app/changesource.sh

RUN apt-get update -y && apt-get install -y \
  curl \
  vim

# 安装 nvm
ARG NVM_VERSION=v0.38.0
ENV NVM_VERSION=$NVM_VERSION
RUN cat install.sh | bash 

# 安装 node、npm
RUN . ~/.bashrc && \
  nvm install node && \
  npm config set registry https://registry.npm.taobao.org && \
  npm config set sass-binary-site https://npm.taobao.org/mirrors/node-sass && \
  npm install -g npm@7.8.0 && \
  npm install -g mirror-config-china && \
  npm install -g yarn && \
  yarn config set registry https://registry.npm.taobao.org && \
  yarn config set sass-binary-site https://npm.taobao.org/mirrors/node-sass && \
  yarn global add @tarojs/cli

