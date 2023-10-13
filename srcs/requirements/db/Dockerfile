FROM debian:bullseye

RUN apt-get update -y && \
    apt install mariadb-server -y

ADD 50-server.cnf /etc/mysql/mariadb.conf.d

EXPOSE 3306
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["bash", "docker-entrypoint.sh"]
CMD ["mariadbd-safe"]