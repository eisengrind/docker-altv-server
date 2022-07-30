#!/bin/bash

echo "building image"
docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$HASH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD-$SHORT_HASH
