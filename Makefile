all: up

up:
	@mkdir -p /home/ccheyrou/inception_data/mariadb
	@mkdir -p /home/ccheyrou/inception_data/wordpress
	@sudo docker-compose -f srcs/docker-compose.yml up --build

clean: stop
	sudo docker system prune -a -f --volumes

clear: clean
	sudo docker volume rm wordpress mariadb

stop:
	sudo docker-compose -f srcs/docker-compose.yml down

re: clean all

show:
	sudo docker ps
	sudo docker volume ls -q
	sudo docker container ls -q

logs:
	sudo docker logs wordpress
	sudo docker logs mariadb
	sudo docker logs nginx

.PHONY: up clean stop re clear show logs