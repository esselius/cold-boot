.DEFAULT_GOAL:=test
IMAGE:=cold-boot:dev

build:
	docker build -t=$(IMAGE) .

test: build
	docker run -it $(IMAGE) test

lint: build
	docker run -it $(IMAGE) rubocop
