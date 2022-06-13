# https://wiki.alpinelinux.org/wiki/MariaDB

FROM alpine:3.14

# Update package list and upgrade out-dated packages
RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client
RUN mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld

# Copy scripts
COPY ./scripts/entrypoint.sh /

# Start initialization script
# [,] exec form for perfs
# ENTRYPOINT because CMD can be overrided, and we don't want it. Well, entrypoint can too, but less easily
ENTRYPOINT ["sh", "/entrypoint.sh"]
