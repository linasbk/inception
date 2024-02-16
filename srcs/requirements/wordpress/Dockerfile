FROM debian:bullseye

RUN apt update  &&  apt install -y curl git wget php php-fpm php-mysql 

COPY ./tools/wordpress.sh /tmp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

ENTRYPOINT [ "bash","/tmp/wordpress.sh" ]

CMD ["php-fpm7.4", "-F"]
