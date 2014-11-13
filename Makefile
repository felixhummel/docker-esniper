.PHONY: build debug

IMAGE_NAME := esniper

build:
	docker build -t $(IMAGE_NAME) .
debug:
	docker run -it --rm $(IMAGE_NAME) bash
