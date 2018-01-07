#!/bin/sh
echo Building click-count-build

docker build -t click-count-build . -f Dockerfile.build

rm ./target
docker create --name click-count-build click-count-build
docker cp click-count-build:/click-count/target .
docker rm -f click-count-build

echo Building click-count

docker build -t click-count .
