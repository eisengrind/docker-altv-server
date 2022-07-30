#!/bin/bash

export IMAGE=$1
export BRANCH=$2
export BUILD=$3
export HASH=$(echo "$BRANCH-$BUILD-$(date --iso-8601=minutes)" | sha1sum | head -c 40)
export SHORT_HASH=$(echo $HASH | cut -c1-8)

./image-build.sh
