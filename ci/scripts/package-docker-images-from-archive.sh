#!/bin/bash
set -e
if [ -f build-config.sh ]; then
echo "# Source build-config param"
source build-config.sh
fi

echo "# Build, test, and push"
( cd $PACKAGENAME && make rmi build push clean-image VERSION=$VERSION )
#( cd $PACKAGENAME && make rmi build test publish push clean-image VERSION=$VERSION )
