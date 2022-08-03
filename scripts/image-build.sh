#!/bin/bash

echo "building image"
docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD

docker tag $IMAGE:$BUILD $IMAGE:$BRANCH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$HASH
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH-$BUILD-$SHORT_HASH

docker tag $IMAGE:$BUILD $IMAGE:csharp.js-$BRANCH
docker tag $IMAGE:$BUILD $IMAGE:csharp.js-$BRANCH-$BUILD
docker tag $IMAGE:$BUILD $IMAGE:csharp.js-$HASH
docker tag $IMAGE:$BUILD $IMAGE:csharp.js-$BRANCH-$BUILD-$SHORT_HASH

echo "building js-only image"
docker build . --build-arg BRANCH=$BRANCH --build-arg INSTALL_CSHARP_MODULE="false" --build-arg ALTV_SERVER_MODULES="js-module" -t $IMAGE:js-$BUILD

docker tag $IMAGE:js-$BUILD $IMAGE:js-$BRANCH
docker tag $IMAGE:js-$BUILD $IMAGE:js-$BRANCH-$BUILD
docker tag $IMAGE:js-$BUILD $IMAGE:js-$HASH
docker tag $IMAGE:js-$BUILD $IMAGE:js-$BRANCH-$BUILD-$SHORT_HASH

echo "building csharp-only image"
docker build . --build-arg BRANCH=$BRANCH --build-arg INSTALL_JS_MODULE="false" --build-arg ALTV_SERVER_MODULES="csharp-module" -t $IMAGE:csharp-$BUILD

docker tag $IMAGE:csharp-$BUILD $IMAGE:csharp-$BRANCH
docker tag $IMAGE:csharp-$BUILD $IMAGE:csharp-$BRANCH-$BUILD
docker tag $IMAGE:csharp-$BUILD $IMAGE:csharp-$HASH
docker tag $IMAGE:csharp-$BUILD $IMAGE:csharp-$BRANCH-$BUILD-$SHORT_HASH
