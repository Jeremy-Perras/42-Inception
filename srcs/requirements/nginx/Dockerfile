# source : https://www.ibm.com/docs/en/ibm-mq/7.5?topic=certificates-distinguished-names
FROM debian:buster
LABEL maintainer="jperras@student.42mulhouse.fr"

RUN apt-get -yq update && \
	apt-get -yq upgrade && \
	apt-get install -yq nginx openssl

#set nginx config
ARG DOMAIN_NAME
ARG LOGIN
COPY ./conf/ssl.conf /etc/nginx/conf.d/ssl.conf
COPY ./tools/replace.sh /replace.sh
COPY ./tools/start.sh /start.sh
#set ARGS using env
RUN bash /replace.sh "DOMAIN_NAME" ${DOMAIN_NAME} /etc/nginx/conf.d/ssl.conf && \
	bash /replace.sh "LOGIN" ${LOGIN} /etc/nginx/conf.d/ssl.conf

# SSL configuration
RUN openssl req -new -newkey rsa:2048 -nodes \
     -out /etc/ssl/certs/$LOGIN.csr \
     -keyout /etc/ssl/private/$LOGIN.key \
     -subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=jperras.42.fr/UID=jperras"
RUN openssl x509 -req -in /etc/ssl/certs/$LOGIN.csr -signkey /etc/ssl/private/$LOGIN.key -out /etc/ssl/certs/$LOGIN.crt

EXPOSE	443

ENTRYPOINT ["bash", "/start.sh"]
