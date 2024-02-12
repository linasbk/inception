FROM debian:bullseye

RUN apt update  &&  apt install -y curl git wget unzip zip

RUN apt install -y php php-fpm php-mysql 

COPY ./tools/wordpress.sh /tmp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod 777 /tmp/wordpress.sh

# COPY conf/wp-config.php /var/www/html/wp-config.php
RUN mkdir -p /run/php

ENTRYPOINT [ "/tmp/wordpress.sh" ]

CMD ["php-fpm7.4", "-F"]
