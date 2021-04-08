FROM python

WORKDIR /app

ADD . /app

RUN mkdir ~/.pip && mv pip.conf ~/.pip/ \
    && mkdir ~/.proxychains && mv proxychains.conf ~/.proxychains/

RUN sh -c /app/changesource.sh

# RUN pip install shadowsocks && sed -i 's/libcrypto.EVP_CIPHER_CTX_cleanup/libcrypto.EVP_CIPHER_CTX_reset/' /venv/lib/python3.8/site-packages/shadowsocks/crypto/openssl.py

# RUN apt update && apt-get install -y proxychains 
