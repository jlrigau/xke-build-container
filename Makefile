all: compile build-image

compile:
	docker run --rm -v $(PWD):/click-count -w /click-count maven:3 mvn clean package

build-image:
	docker build -t click-count .