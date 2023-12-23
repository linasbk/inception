FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

RUN apt install -y vim

COPY ./tools/mariadb.sh /tmp

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 777 /tmp/mariadb.sh

RUN mkdir -p /run/mysqld
RUN chown -R mysql:root /var/run/mysqld
RUN chown -R mysql:root /run/mysqld


EXPOSE 3306

ENTRYPOINT [ "/tmp/mariadb.sh" ]

CMD [ "mysqld", "--bind=0.0.0.0"]