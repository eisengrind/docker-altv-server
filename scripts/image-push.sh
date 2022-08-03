
# push it!

echo "pushing base image"
docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH
docker push $IMAGE:$BRANCH-$BUILD
docker push $IMAGE:$HASH
docker push $IMAGE:$BRANCH-$BUILD-$SHORT_HASH

docker push $IMAGE:csharp.js-$BRANCH
docker push $IMAGE:csharp.js-$BRANCH-$BUILD
docker push $IMAGE:csharp.js-$HASH
docker push $IMAGE:csharp.js-$BRANCH-$BUILD-$SHORT_HASH

echo "pushing js-only image"
docker push $IMAGE:js-$BUILD
docker push $IMAGE:js-$BRANCH
docker push $IMAGE:js-$BRANCH-$BUILD
docker push $IMAGE:js-$HASH
docker push $IMAGE:js-$BRANCH-$BUILD-$SHORT_HASH

echo "pushing csharp-only image"
docker push $IMAGE:csharp-$BUILD
docker push $IMAGE:csharp-$BRANCH
docker push $IMAGE:csharp-$BRANCH-$BUILD
docker push $IMAGE:csharp-$HASH
docker push $IMAGE:csharp-$BRANCH-$BUILD-$SHORT_HASH
