all:
	@sudo mkdir -p /home/tdehne/data/mariadb
	@sudo mkdir -p /home/tdehne/data/wordpress
	@sudo docker-compose ./srcs/docker-compose.yml up -d

fclean:
	@sudo docker-compose ./srcs/docker-compose.yml stop
	@sudo docker system prune -af
	@sudo rm -rf /home/tdehne/data/wordpress/*
	@sudo rm -rf /home/tdehne/data/mariadb/*

re: fclean all