FROM debian:buster

RUN apt-get update && \
	apt-get -y install mariadb-server mariadb-client && \
	mkdir -p /var/run/mysqld; mkdir -p /run/mysqld && \
	chown -R mysql:root /run/mysqld ; chown -R mysql:root /var/run/mysqld

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/script.sh .
CMD bash script.sh