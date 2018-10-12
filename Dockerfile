FROM debian:stretch

RUN apt-get update && apt-get install -y mariadb-server rsync vim 

RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/log/mysql
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY galera.cnf /etc/mysql/conf.d/galera.cnf

EXPOSE 3306 4444 4567/udp 4567 4568

VOLUME /var/lib/mysql

RUN service mysql stop
CMD mysqld_safe --wsrep-new-cluster
