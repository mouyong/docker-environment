#!/usr/bin/env sh

set -x

# Change application source from deb.debian.org to aliyun source
sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
sed -i 's/security-cdn.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list
