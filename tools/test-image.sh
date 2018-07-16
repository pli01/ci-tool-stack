#!/bin/bash

## TODO: extract in shell var
#REGISTRY_HOST=localhost
#REPOSITORY_HOST=localhost
#REGISTRY_URL=$REGISTRY_HOST
#REPOSITORY_URL=http://$REPOSITORY_HOST/nexus/repository/modules-docker/
#export REPOSITORY_URL REGISTRY_URL
#
## build params
#MIRROR_DEBIAN=http://$REPOSITORY_HOST/nexus/repository
#MIRROR_DOCKER=http://$REPOSITORY_HOST/nexus/repository/docker-project/linux
#MIRROR_DOCKER_COMPOSE=http://$REPOSITORY_HOST/nexus/repository/docker-compose
#JENKINS_UC_URL=http://localhost/$REPOSITORY_HOST/repository/jenkins-updates
#PYPI_URL=http://$REPOSITORY_HOST/nexus/repository/pypi/simple
#PYPI_HOST=$REPOSITORY_HOST
#export MIRROR_DEBIAN MIRROR_DOCKER MIRROR_DOCKER_COMPOSE JENKINS_UC_URL PYPI_URL PYPI_HOST

[ -z "$http_proxy" ] || http_proxy="$http_proxy"
[ -z "$https_proxy" ] || https_proxy="$https_proxy"
[ -z "$no_proxy" ] || no_proxy="$no_proxy"
export http_proxy https_proxy no_proxy

echo "# Build & test"
( cd build/docker
  for image in * ; do
    [ -d "$image" ] || continue
    echo "# Build & test $image"
    [ -d "$image" ] && ( cd $image && make test -n )
  done
)
