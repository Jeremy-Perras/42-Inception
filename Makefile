include ./srcs/.env
export

NAME = inception
SRCS	:= ./srcs/docker-compose.yml
FLAGS	:= -d --build
all: fclean init re
$(NAME): all

init:
		sudo mkdir -p $(DATA_FOLDER)/$(WP_FOLDER)
		sudo mkdir -p $(DATA_FOLDER)/$(DB_FOLDER)

info:
	docker ps -as; \
	docker image ls; \
	docker volume ls
#https://stackoverflow.com/questions/2670130/make-how-to-continue-after-a-command-fails
clean:
	./srcs/requirements/tools/fclean.sh || true

clean_data:
	sudo rm -rf $(DATA_FOLDER)

fclean: clean clean_data
	docker system prune -fa

re:
	docker-compose -f $(SRCS) up $(FLAGS)
