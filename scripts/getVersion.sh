#!/bin/bash

wget --no-cache -qO- http://cdn.altv.mp/server/$1/x64_linux/update.json > /tmp/update.json

if [ $(cat /tmp/update.json | jq '.version') == 'null' ]
then
        jq '.latestBuildNumber' < /tmp/update.json
else
        jq -r '.version' < /tmp/update.json
fi
