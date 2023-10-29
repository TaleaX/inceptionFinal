all: createDir
	@sudo docker-compose  -f ./srcs/docker-compose.yml up -d


createDir:
	@sudo mkdir -p /home/talea/data/mariadb
	@sudo mkdir -p /home/talea/data/wordpress
	@sudo chmod 777 /home/talea/data/wordpress
	@sudo chmod 777 /home/talea/data/mariadb

build: createDir
	@sudo docker-compose  -f ./srcs/docker-compose.yml build

forceBuild: createDir
	@sudo docker-compose  -f ./srcs/docker-compose.yml up --build -d

nginxShell:
	@sudo docker exec -it nginx bash

mariadbShell:
	@sudo docker exec -it mariadb bash

wordpressShell:
	@sudo docker exec -it wordpress bash

stop:
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

start:
	@sudo docker-compose -f ./srcs/docker-compose.yml start

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes

fclean: clean
	@sudo docker system prune -af
	@sudo rm -rf /home/talea/data/wordpress/*
	@sudo rm -rf /home/talea/data/mariadb/*

re: fclean all