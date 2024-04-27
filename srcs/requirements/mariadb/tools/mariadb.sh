#!/bin/sh

sed -i "s|# port = 3306|port = 3306|1" /etc/mysql/mariadb.cnf
sed -i "s/127.0.0.1/0.0.0.0/1" /etc/mysql/mariadb.conf.d/50-server.cnf


service mariadb start
    mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"
    mariadb -e "CREATE DATABASE \`${MYSQL_DATABASE}\` ;"
    mariadb -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
    mariadb -e "GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
    mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop
exec "$@"
