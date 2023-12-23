#!bin/bash

MYSQL_ROOT_PASSWORD="root"
MYSQL_ADMIN_USER="admin"
MYSQL_ADMIN_PASSWORD="admin"

# MariaDB Config
service mariadb start
sleep 5

mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER '${MYSQL_ADMIN_USER}'@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ADMIN_USER}'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

exec "$@"