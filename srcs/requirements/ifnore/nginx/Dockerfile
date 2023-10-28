FROM debian:bullseye

RUN apt update && apt install -y nginx openssl && rm /etc/nginx/sites-enabled/default && chown www-data:www-data /usr/share/nginx/html -R
RUN apt update && apt install -y mariadb-server
RUN apt update && apt install -y php7.4 php7.4-fpm wget unzip php7.4-mysql mariadb-client


RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=tdehne.42.fr"

COPY ./setupDB.sh /conf/setupDB.sh
RUN bash ./conf/setupDB.sh

COPY ./conf/nginx.conf /etc/nginx/conf.d/wordpress.conf

EXPOSE 4242

#wordpress
RUN wget https://wordpress.org/latest.zip && unzip latest.zip -d /usr/share/nginx/ && chown www-data:www-data /usr/share/nginx/wordpress/ -R

COPY ./conf/wp-config.php /usr/share/nginx/wordpress

CMD ["nginx", "-g", "daemon off;"]
