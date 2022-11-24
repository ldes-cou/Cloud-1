
if [ ! -d /var/lib/mysql/${MYSQL_DB} ]; then
    mysqld&
    until mysqladmin ping;do
        sleep 2
    done
    mysql -u root -e "CREATE DATABASE $MYSQL_DB;"
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" 
    mysql -u root -e "GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';"
    mysql -e "DELETE FROM mysql.user WHERE user=''"
	mysql -e "DELETE FROM mysql.user WHERE user='root'"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin shutdown
else
    echo "mariadb already there"
fi
mysqld

#add if not exist + && 