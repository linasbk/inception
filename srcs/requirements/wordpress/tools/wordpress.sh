#!/bin/sh
# set -x

if [ -f /var/www/html/wp-config.php ]; then
    echo "wordpress already installed"
else
mkdir -p /var/www/html

cd /var/www/html


rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
#     sed -i "s/username_here/$MYSQL_USER/g" ./wp-config-sample.php
#     sed -i "s/password_here/$MYSQL_PASSWORD/g" ./wp-config-sample.php
#     sed -i "s/localhost/$MYSQL_HOSTNAME/g" ./wp-config-sample.php
#     sed -i "s/database_name_here/$MYSQL_DATABASE/g" ./wp-config-sample.php
# cp /var/www/html/wp-config-sample.php ./wp-config.php

wp core install --url="lsabik.42.fr"/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
fi
exec "$@"
