#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3

HASH=$(echo "$BRANCH-$BUILD-$(date)" | sha1sum)
SHORT_HASH=$($HASH | cut -c1-8)

echo "build image"
docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$HASH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD-$SHORT_HASH

# push it!

echo "push base image"
docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH
docker push $IMAGE:$BRANCH-$BUILD
docker push $IMAGE:$HASH
docker push $IMAGE:$BRANCH-$BUILD-$SHORT_HASH
