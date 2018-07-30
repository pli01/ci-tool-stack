#!/bin/bash

[ -z "$REPOSITORY_USERNAME" -o -z "$REPOSITORY_PASSWORD" ] && exit 1
echo "# Get $PACKAGENAME from $URL"
rm -rf $PACKAGENAME
mkdir $PACKAGENAME
( cd $PACKAGENAME && \
  curl -u $REPOSITORY_USERNAME:$REPOSITORY_PASSWORD -L -k -sSf -o - $URL | tar -zxvf -
)
