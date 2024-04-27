FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/lsabik.key \
    -out /etc/nginx/ssl/lsabik.crt -sha256 -days 365 -nodes \
    -subj "/C=MA/ST=Casablanca/L=Casablanca/O=1337/OU=1337/CN=lsabik.42.fr"

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]
