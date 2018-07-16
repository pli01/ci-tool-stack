#!/bin/bash
set -e

[ -z "$http_proxy" ] || http_proxy="$http_proxy"
[ -z "$https_proxy" ] || https_proxy="$https_proxy"
[ -z "$no_proxy" ] || no_proxy="$no_proxy"
export http_proxy https_proxy no_proxy

echo "# Pull"
( cd build/docker
  for image in * ; do
    [ -d "$image" ] || continue
    echo "# Pull $image"
    ( cd $image ; 
      make prepare || { echo "BAD $image" ; exit 1 }
    )
  done
)
