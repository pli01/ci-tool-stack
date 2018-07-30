#!/bin/bash
set -e
if [ -f build-config.sh ]; then
echo "# Source build-config param"
source build-config.sh
fi

echo "# Build & test"
( cd $PACKAGENAME && make rmi build test VERSION=$VERSION )
