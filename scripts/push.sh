#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3

echo "build base image"
docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH

echo "build js image"
docker build . -f ./js.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-js
docker tag $IMAGE:$BUILD-js $IMAGE:$BRANCH-js

echo "build dotnet image"
docker build . -f ./dotnet.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-dotnet
docker tag $IMAGE:$BUILD-dotnet $IMAGE:$BRANCH-dotnet

echo "build js-dotnet image"
docker build . -f ./js-dotnet.Dockerfile --build-arg BUILD=$BUILD-dotnet --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-js-dotnet
docker tag $IMAGE:$BUILD-js-dotnet $IMAGE:$BRANCH-js-dotnet

# push it!

echo "push base image"
docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH

echo "push js image"
docker push $IMAGE:$BUILD-js
docker push $IMAGE:$BRANCH-js

echo "push dotnet image"
docker push $IMAGE:$BRANCH-dotnet
docker push $IMAGE:$BUILD-dotnet

echo "push js-dotnet image"
docker push $IMAGE:$BUILD-js-dotnet
docker push $IMAGE:$BRANCH-js-dotnet
