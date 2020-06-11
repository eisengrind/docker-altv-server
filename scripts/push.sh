#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3
jsModuleBuild=$4
csharpModuleBuild=$5

docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH

docker build . -f ./dotnet.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD.dotnet
docker tag $IMAGE:$BUILD.dotnet $IMAGE:$BRANCH.dotnet
docker tag $IMAGE:$BUILD.dotnet $IMAGE:$BUILD.dotnet-$csharpModuleBuild
docker tag $IMAGE:$BRANCH.dotnet $IMAGE:$BRANCH.dotnet-$csharpModuleBuild

docker build . -f ./nodejs.Dockerfile --build-arg BUILD=$BUILD --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD.js
docker tag $IMAGE:$BUILD.js $IMAGE:$BRANCH.js
docker tag $IMAGE:$BUILD.js $IMAGE:$BUILD.js-$jsModuleBuild
docker tag $IMAGE:$BRANCH.js $IMAGE:$BRANCH.js-$jsModuleBuild

docker build . -f ./nodejs-dotnet.Dockerfile --build-arg BUILD=$BUILD-dotnet --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD.js.dotnet
docker tag $IMAGE:$BUILD.js.dotnet $IMAGE:$BRANCH.js.dotnet
docker tag $IMAGE:$BUILD.js.dotnet $IMAGE:$BUILD.js-$jsModuleBuild.dotnet-$csharpModuleBuild
docker tag $IMAGE:$BRANCH.js.dotnet $IMAGE:$BRANCH.js-$jsModuleBuild.dotnet-$csharpModuleBuild

# push it!

docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH

docker push $IMAGE:$BRANCH.dotnet
docker push $IMAGE:$BRANCH.dotnet-$csharpModuleBuild
docker push $IMAGE:$BUILD.dotnet
docker push $IMAGE:$BUILD.dotnet-$csharpModuleBuild

docker push $IMAGE:$BUILD.js
docker push $IMAGE:$BUILD.js-$jsModuleBuild
docker push $IMAGE:$BRANCH.js
docker push $IMAGE:$BRANCH.js-$jsModuleBuild

docker push $IMAGE:$BUILD.js.dotnet
docker push $IMAGE:$BUILD.js-$jsModuleBuild.dotnet-$csharpModuleBuild
docker push $IMAGE:$BRANCH.js.dotnet
docker push $IMAGE:$BRANCH.js-$jsModuleBuild.dotnet-$csharpModuleBuild
