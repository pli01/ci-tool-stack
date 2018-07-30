#!/bin/bash
set -e
if [ -f build-config.sh ]; then
echo "# Source build-config param"
source build-config.sh
fi

echo "# Build, test, publish and push"
( cd $PACKAGENAME && make clean && make package publish clean )
echo "# Publish $PACKAGENAME $VERSION SUCCESS"
