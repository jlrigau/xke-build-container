all: compile build-image

compile:
	docker run --rm -v $(PWD):/click-count -w /click-count -v $(PWD)/.cache/repository:/root/.m2/repository maven:3 mvn clean package

build-image:
	docker build -t click-count .