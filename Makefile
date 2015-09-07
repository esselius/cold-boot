.DEFAULT_GOAL:=test
IMAGE:=cold-boot:dev
TEST_FILES:=$(wildcard test/*_test.rb)

build:
	docker build -t=$(IMAGE) .

test: build
	docker run -it $(IMAGE) ruby -I/usr/src/app $(foreach file,$(TEST_FILES),-r$(file)) -e exit

lint: build
	docker run -it $(IMAGE) rubocop
