all:
	@mkdir -p /home/$(USER)/data/wordpress
	@mkdir -p /home/$(USER)/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --build

clean:
	@docker compose -f srcs/docker-compose.yml down

fclean: clean
	- docker stop $(shell docker ps -qa)
	- docker rm $(shell docker ps -qa)
	- docker volume rm $(shell docker volume ls -q)
	- docker network rm $(shell docker network ls -q)


re: fclean all