FROM php:5.6-apache

LABEL Organization="qsnctf" Author="M0x1n <lqn@sierting.com>"


COPY files /tmp/

RUN sed -i 's/deb.debian.org/mirrors.nju.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.nju.edu.cn/g' /etc/apt/sources.list \
    && apt-get update -y; apt-get install -y net-tools wget; \
    # apt-get install -y vim net-tools htop wget; \
    # configure file
    mv /tmp/flag.sh /flag.sh \
    && mv /tmp/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint \
    && chmod +x /usr/local/bin/docker-php-entrypoint \
    && mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    # clear
    && rm -rf /tmp/*


WORKDIR /var/www/html

COPY www /var/www/html/

EXPOSE 80

