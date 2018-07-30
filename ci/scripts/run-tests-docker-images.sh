#!/bin/bash
set -e
if [ -f build-config.sh ]; then
echo "# Source build-config param"
source build-config.sh
fi

[ -z "$VERSION" ] && VERSION=$( cd $PACKAGENAME && cat VERSION)

echo "# Build & test $PACKAGENAME $VERSION"
( cd $PACKAGENAME && make rmi build test clean-image VERSION=$VERSION )
