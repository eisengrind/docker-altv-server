#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3

docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH

docker build . -f ./dotnet.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-dotnet
docker tag $IMAGE:$BUILD-dotnet $IMAGE:$BRANCH-dotnet

docker build . -f ./nodejs.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-js
docker tag $IMAGE:$BUILD-js $IMAGE:$BRANCH-js

docker build . -f ./nodejs-dotnet.Dockerfile --build-arg BUILD=$BUILD-dotnet --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD-js-dotnet
docker tag $IMAGE:$BUILD-js-dotnet $IMAGE:$BRANCH-js-dotnet

# push it!

docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH

docker push $IMAGE:$BRANCH-dotnet
docker push $IMAGE:$BUILD-dotnet

docker push $IMAGE:$BUILD-js
docker push $IMAGE:$BRANCH-js

docker push $IMAGE:$BUILD-js-dotnet
docker push $IMAGE:$BRANCH-js-dotnet
