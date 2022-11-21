#image created from
FROM debian:buster 

RUN apt-get update && apt-get install -y nginx openssl

#ssl protocol
RUN mkdir /etc/nginx/ssl/ \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"

# RUN chmod -R g+w /var/www/html && chown -R www-data:www-data /var/www/html
#redirect logs to stdout
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
    
#use the nginx conf instead of the default
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#launch nginx
CMD ["nginx", "-g", "daemon off;"]
