FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/mariadb.sh /tmp

HEALTHCHECK --interval=5s --timeout=30s --start-period=5s --retries=15 CMD [ "mysqladmin", "ping", "-h", "localhost" ]

ENTRYPOINT [ "bash", "/tmp/mariadb.sh" ]

CMD [ "mariadbd" ]
