FROM debian:bullseye

EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN apt update && apt install -y mariadb-server

COPY conf/setup.sh /conf/setup.sh
RUN bash ./conf/setup.sh

CMD ["mariadbd"]