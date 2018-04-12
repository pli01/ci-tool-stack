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

echo "# Build & push"
( cd build/docker
  for image in * ; do
    [ -d "$image" ] && ( cd $image && make rmi build push clean-image -n )
  done
)
