all: createDir
	@sudo docker compose  -f ./srcs/docker-compose.yml up -d --build


createDir:
	@sudo mkdir -p /home/tdehne/data/mariadb
	@sudo mkdir -p /home/tdehne/data/wordpress
	@sudo chmod 777 /home/tdehne/data/wordpress
	@sudo chmod 777 /home/tdehne/data/mariadb

build: createDir
	@sudo docker compose  -f ./srcs/docker-compose.yml build

forceBuild: createDir
	@sudo docker compose  -f ./srcs/docker-compose.yml up --build -d

nginx:
	@sudo docker compose -f ./srcs/docker-compose.yml up nginx --build -d

mariadb: createDir
	@sudo docker compose -f ./srcs/docker-compose.yml up mariadb --build -d

nginxShell:
	@sudo docker exec -it nginx bash

mariadbShell:
	@sudo docker exec -it mariadb bash

wordpressShell:
	@sudo docker exec -it wordpress bash

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

start:
	@sudo docker compose -f ./srcs/docker-compose.yml start

clean:
	@sudo docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean: clean
	@sudo docker system prune -af
	@sudo rm -rf /home/tdehne/data/wordpress/*
	@sudo rm -rf /home/tdehne/data/mariadb/*

re: fclean all
