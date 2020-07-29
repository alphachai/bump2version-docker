NAME=alphachai/bump2version:devel
DOCKER_FILE=Dockerfile

-include $(shell [ -e .build-harness ] || curl -sSL -o .build-harness "https://git.io/mintel-build-harness"; echo .build-harness)

.PHONY: init build shell clean test

init: bh/init

build:
	$(DOCKER) build -f $(DOCKER_FILE) -t $(NAME) .

test:
	$(DOCKER) run -it --rm --mount type=bind,src=$$(pwd),dst=/app $(NAME) --help

shell:
	$(DOCKER) run -it --rm --entrypoint sh $(NAME)

clean: bh/clean
