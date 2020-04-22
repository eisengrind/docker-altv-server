#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3

docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH

docker build . -f ./dotnet.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-dotnet
docker tag $IMAGE:$BUILD-dotnet $IMAGE:$BRANCH-dotnet

docker build . -f ./nodejs.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-nodejs
docker tag $IMAGE:$BUILD-nodejs $IMAGE:$BRANCH-nodejs

docker build . -f ./nodejs-dotnet.Dockerfile --build-arg BUILD=$BUILD-dotnet --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-nodejs-dotnet
docker tag $IMAGE:$BUILD-nodejs-dotnet $IMAGE:$BRANCH-nodejs-dotnet

docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH

docker push $IMAGE:$BRANCH-dotnet
docker push $IMAGE:$BUILD-dotnet

docker push $IMAGE:$BUILD-nodejs
docker push $IMAGE:$BRANCH-nodejs

docker push $IMAGE:$BUILD-nodejs-dotnet
docker push $IMAGE:$BRANCH-nodejs-dotnet
