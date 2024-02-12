FROM debian:bullseye
#  removing the package lists avoid creating an extra layer just for the package lists
RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY ./tools/mariadb.sh /tmp

RUN mkdir -p /run/mysqld

RUN chown -R mysql:root /var/run/mysqld

RUN chown -R mysql:root /run/mysqld

RUN chmod 777 /tmp/mariadb.sh

ENTRYPOINT [ "/tmp/mariadb.sh" ]

CMD [ "mysqld_safe" ]
