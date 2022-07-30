
# push it!

echo "pushing base image"
docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH
docker push $IMAGE:$BRANCH-$BUILD
docker push $IMAGE:$HASH
docker push $IMAGE:$BRANCH-$BUILD-$SHORT_HASH
