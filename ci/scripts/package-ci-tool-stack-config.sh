#!/bin/bash

## TODO: extract in shell var
REPOSITORY_URL=${DML_URL}/nexus/repository/${PACKAGENAME}
export REPOSITORY_URL

echo "# Build & publish"
( cd $PACKAGENAME && make clean build package publish VERSION=$VERSION APP_ENV=$APP_ENV)
