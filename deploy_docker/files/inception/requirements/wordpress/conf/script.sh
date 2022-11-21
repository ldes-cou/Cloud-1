#!/bin/sh

if [ ! -f /var/www/html/wp-config.php  ]; then
    until mysqladmin -h $WP_DB_HOST ping;do
        sleep 2
    done
    mkdir -p /var/www/html && cd /var/www/html/ && wp core download --allow-root \
    && wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASSWORD --dbhost=$WP_DB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root \
    && wp core install --url=ldes-cou.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root \
    && wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_PASSWORD --allow-root \
    && wp theme install $WP_THEME --activate --allow-root 
else
    echo "wordpress already there"
fi

echo "Launch php"
exec php-fpm7.3 -F -R