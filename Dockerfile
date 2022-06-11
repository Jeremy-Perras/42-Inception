FROM alpine:3.15

COPY ./wordpress/ /var/www/
COPY ./archi.conf /etc/nginx/conf.d/.
