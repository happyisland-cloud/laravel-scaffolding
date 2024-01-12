FROM mariadb:10.6.10

MAINTAINER Maurizio Brioschi <info@mauriziobrioschi.com>

ENV TZ=CET

COPY my.cnf /etc/my.cnf

ADD  docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/
