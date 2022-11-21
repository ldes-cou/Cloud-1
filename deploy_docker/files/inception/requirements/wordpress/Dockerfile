FROM debian:buster

#install php.fpm
RUN apt-get update && apt-get install -y php7.3-fpm php7.3-common php7.3-mysql curl mariadb-client && mkdir -p /run/php

#install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN chmod +x wp-cli.phar \
    && cp wp-cli.phar /usr/local/bin/wp
    
#install wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY conf/script.sh .

CMD ./script.sh
