FROM	alpine:3.13

RUN		apk update
RUN		apk add --no-cache --quiet --update nginx
RUN		apk add --no-cache --quiet --update openssl

RUN		mkdir -p /etc/nginx/ssl
# SUBJ opts: https://www.ibm.com/docs/en/ibm-mq/7.5?topic=certificates-distinguished-names
#RUN 	openssl req -x509 -nodes \
#	-out /etc/nginx/ssl/jperras.42.fr.crt \
#	-keyout /etc/nginx/ssl/jperras.42.fr.key \
#	-subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=jperras.42.fr/UID=jperras"

RUN 	mkdir -p /var/run/nginx
#COPY	nginx.conf /etc/nginx/conf.d/default.conf

RUN		ln -sf /dev/stdout /var/log/nginx/access.log \
			&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE	443

CMD	[ "nginx", "-g", "daemon off;" ]
