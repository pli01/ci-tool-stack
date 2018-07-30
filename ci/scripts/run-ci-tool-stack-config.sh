#!/bin/bash

## TODO: extract in shell var
REPOSITORY_URL=${DML_URL}/nexus/repository/${PACKAGENAME}
export REPOSITORY_URL

echo "# Build & test "
( cd $PACKAGENAME && make clean build test VERSION=$VERSION APP_ENV=$APP_ENV)
