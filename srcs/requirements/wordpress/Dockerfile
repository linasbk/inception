FROM debian:bullseye

RUN apt update  &&  apt install -y curl git wget unzip zip

RUN apt install -y php php-fpm php-mysql 

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --allow-root
# RUN wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --allow-root
COPY ./tools/wordpress.sh /tmp

RUN chmod 777 /tmp/wordpress.sh

RUN mkdir -p /run/php

ENTRYPOINT [ "/tmp/wordpress.sh" ]

CMD ["php-fpm7.4", "-F"]
