FROM debian:bullseye

EXPOSE 3306

RUN apt update && apt install -y mariadb-server

COPY conf/setup.sh /conf/setup.sh
RUN bash ./conf/setup.sh

CMD ["mariadbd", "--bind-address=0.0.0.0"]