#!/bin/sh
MYSQL_DATABASE="wordpress"
MYSQL_USER="lina"
MYSQL_PASSWORD="lina12"
MYSQL_ROOT_PASSWORD="lina1234"

# MariaDB Config
service mariadb start
sleep 5
if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then 
	echo "Database already exists"
else
    mysql -u root -e "CREATE DATABASE \`${MYSQL_DATABASE}\` ;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
    mysql -u root -e "GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;"
    mysql -u root -e "FLUSH PRIVILEGES;"
    echo "port = 3306" >> /etc/mysql/mariadb.conf.d/50-server.cnf
    sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
fi
service mariadb stop
exec "$@"
