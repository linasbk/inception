all:
	@mkdir -p /home/$(USER)/data/wordpress
	@mkdir -p /home/$(USER)/data/mariadb
	@docker compose -f srcs/docker-compose.yml up --build

clean:

	@docker compose -f srcs/docker-compose.yml down

fclean: clean
	@rm -rf /home/lsabik/data/wordpress
	@rm -rf /home/lsabik/data/mariadb
	@docker system prune -af --volumes


re: fclean all