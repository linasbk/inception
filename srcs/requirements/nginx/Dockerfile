FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

# to fix the problem of no existing directory ssl
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/lsabik.crt \
    -keyout /etc/nginx/ssl/lsabik.key \
    -subj "/C=FR/ST=Morocco/L=Casablanca/O=1337 School/OU=1337/CN=lsabik.42.fr"

COPY ./conf/nginx.conf   /etc/nginx/conf.d


RUN mkdir -p /var/run/nginx

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]