FROM nginx:alpine
COPY ./wordpress/ /var/www/
COPY ./archi.conf /etc/nginx/conf.d/.
