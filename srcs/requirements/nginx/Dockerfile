FROM debian:bullseye

ARG DOMAIN_NAME=${DOMAIN_NAME}

RUN apt update && apt install -y nginx openssl && rm /etc/nginx/sites-enabled/default && mkdir -p /usr/share/nginx/wordpress/ 
# && chown www-data:www-data /usr/share/nginx/html -R

 RUN openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
 	-keyout /etc/ssl/private/nginx.key \
 	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=tdehne.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d/wordpress.conf
RUN sed -i "s/DOMAIN_NAME/${DOMAIN_NAME}/" /etc/nginx/conf.d/wordpress.conf 

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
