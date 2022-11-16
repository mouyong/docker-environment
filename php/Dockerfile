FROM php:8.0.3-cli

MAINTAINER Nick <me@xieying.vip>

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV LANGUAGE=C.UTF-8

RUN sed -i 's/deb.debian.org/mirrors.cloud.tencent.com/' /etc/apt/sources.list && \
sed -i 's/security.debian.org/mirrors.cloud.tencent.com/' /etc/apt/sources.list && \
sed -i 's/security-cdn.debian.org/mirrors.cloud.tencent.com/' /etc/apt/sources.list

# 安装基础依赖，基础工具
RUN apt-get update && apt-get upgrade -y &&  \
 pecl channel-update pecl.php.net && \
 apt-get install -yqq --no-install-recommends \
 libz-dev \
 libpq-dev \
 libjpeg-dev \
 libpng-dev \
 libfreetype6-dev \
 libssl-dev \
 wget \
 vim \
 supervisor \
 net-tools \
 curl \
 procps \
 python-dev \
 cron \
 git \
 zsh

# 复制php.ini文件，开启php扩展包
RUN docker-php-source extract

# 复制php.ini文件，开启php扩展包
RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

# 安装必备包
RUN docker-php-ext-install pdo_mysql bcmath opcache

# gd
RUN docker-php-ext-configure gd \
 --prefix=/usr \
 --with-jpeg \
 --with-freetype \
 && docker-php-ext-install gd

# zip
RUN apt-get install -y libzip-dev && \
  docker-php-ext-configure zip && \
  docker-php-ext-install zip && \
  php -m | grep -q 'zip'

# bz2
RUN apt-get -y install libbz2-dev && \
 docker-php-ext-install bz2

# redis
RUN printf "\n" | pecl install redis && \
 rm -rf /tmp/pear && \
 docker-php-ext-enable redis

# 安装swoole
RUN printf "\n" | pecl install -o -f swoole && \
 docker-php-ext-enable swoole

RUN printf "\n" | docker-php-ext-install pcntl

# 删除安装完的源码包
RUN docker-php-source delete && \
 rm -rf /var/lib/apt/lists/* && \
 rm -fr /var/www/html/*

# 初始化自定义启动脚本
COPY ./docker-run.sh /usr/local/bin/docker-run

# 修改容器启动命令
COPY ./docker-php-entrypoint.sh /usr/local/bin/docker-php-entrypoint

RUN chmod +x /usr/local/bin/docker-run /usr/local/bin/docker-php-entrypoint

RUN touch ~/.bash_aliases && \
  apt install -y zsh && \
  git clone https://ghproxy.com/https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
  sed -i 's/ZSH_THEME="robbyrussell"/#ZSH_THEME="robbyrussell"\nZSH_THEME="kafeitu"/' ~/.zshrc && \
  printf "\nemulate sh -c 'source ~/.bash_aliases'\n" | tee -a ~/.zprofile && \
  printf "\nemulate sh -c 'source ~/.profile'\n" | tee -a ~/.zprofile && \
  chown -R $(whoami):$(whoami) ~/.oh-my-zsh && \
  chown $(whoami):$(whoami) ~/.zshrc && \
  chown $(whoami):$(whoami) ~/.zprofile && \
  which zsh && chsh -s $(which zsh) $(whoami)

ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
 && composer --ansi --version --no-interaction

WORKDIR /var/www/html

# webman
EXPOSE 8787

# webman-gateway
EXPOSE 1236 7200
