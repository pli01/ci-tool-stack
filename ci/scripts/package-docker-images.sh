#!/bin/bash
set -e
if [ -f build-config.sh ]; then
echo "# Source build-config param"
source build-config.sh
fi

export BUILD_VERSION VERSION
( cd $PACKAGENAME
[ -z "$VERSION" ] && VERSION="$(cat VERSION)"
BUILD_VERSION=${VERSION}-$(git rev-parse --short HEAD)

echo "# Build, test, publish and push  $PACKAGENAME $VERSION"
echo "# Build $PACKAGENAME $VERSION"
make build VERSION=$VERSION
echo "# Publish $PACKAGENAME $VERSION"
make publish VERSION=$VERSION
echo "# Publish $PACKAGENAME $BUILD_VERSION"
make publish VERSION=$BUILD_VERSION
echo "# Publish $PACKAGENAME latest"
make publish VERSION=latest
echo "# Push $PACKAGENAME $VERSION"
make push VERSION=$VERSION
echo "# Push $PACKAGENAME $BUILD_VERSION"
make push VERSION=$VERSION BUILD_VERSION=$BUILD_VERSION
echo "# Push $PACKAGENAME latest"
make push VERSION=$VERSION BUILD_VERSION=$BUILD_VERSION

make clean-image VERSION=$VERSION
)
echo "# Build, test, publish and push  $PACKAGENAME $VERSION SUCCESS"
