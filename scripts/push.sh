#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3

echo "build image"
docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD

# push it!

echo "push base image"
docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH
docker push $IMAGE:$BRANCH-$BUILD
