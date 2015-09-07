.DEFAULT_GOAL:=test
IMAGE:=cold-boot:dev

Gemfile.lock: Gemfile
	docker run --rm -v $(CURDIR):/app ruby:2.2 bundle package --all --gemfile /app/Gemfile

build: Gemfile.lock
	docker build -t=$(IMAGE) .

test: build
	docker run -it $(IMAGE) test
