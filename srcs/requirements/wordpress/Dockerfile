FROM debian:bullseye

# ARG DB_NAME=${DB_NAME}
# ARG DB_USER=${DB_USER}
# ARG DB_PASSWORD=${DB_PASSWORD}
# ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}
# ARG WP_TITLE=${WP_TITLE}
# ARG WP_ADMIN_USER=${WP_ADMIN_USER}
# ARG WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
# ARG WP_ADMIN_MAIL=${WP_ADMIN_MAIL}

RUN apt update && apt install -y php7.4 php7.4-fpm php7.4-mysql wget unzip mariadb-client

RUN wget https://wordpress.org/latest.zip && mkdir -p /usr/share/nginx && unzip latest.zip -d /usr/share/nginx/ && chown www-data:www-data /usr/share/nginx/wordpress/ -R

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php
EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./conf/config.sh /conf/config.sh

RUN chmod +x /conf/config.sh && chmod +x /usr/share/nginx/wordpress
CMD ["bash", "./conf/config.sh"]