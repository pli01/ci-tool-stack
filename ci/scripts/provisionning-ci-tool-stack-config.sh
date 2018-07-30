#!/bin/bash
#set -e
## TODO: extract in shell var
REPOSITORY_URL=${DML_URL}/nexus/repository/${PACKAGENAME}
export REPOSITORY_URL

echo "# Provisionning $APP_ENV"
#( cd $PACKAGENAME && make clean build package publish VERSION=$VERSION APP_ENV=$APP_ENV)
#find . -type f

# direct access to API
export no_proxy=$no_proxy,.api.mycloud.fr

if [ "$APP_ENV" == "prod" ] ;then
  echo "# provisionning env ${APP_ENV}:"
 (
  cd $PACKAGENAME/openstack-heat-templates/
  make stack_dir=openstack-heat/docker-net heat_parameters='heat-parameters-$(stack_name).yaml' stack_name=forge-${APP_ENV} build-all FORCE=${FORCE}
  )
elif [ "$APP_ENV" == "preprod" ] ;then
  echo "# provisionning env ${APP_ENV}:"
 (
  cd $PACKAGENAME/openstack-heat-templates/
  make stack_dir=openstack-heat/docker-net heat_parameters='heat-parameters-$(stack_name).yaml' stack_name=forge-${APP_ENV} build-all FORCE=${FORCE}
  )

elif [ "$APP_ENV" == "dev" ] ;then
  echo "# provisionning env ${APP_ENV}:"
 (
  cd $PACKAGENAME/openstack-heat-templates/
  make stack_dir=openstack-heat/docker-net heat_parameters='heat-parameters-$(stack_name).yaml' stack_name=forge-${APP_ENV} build-all FORCE=${FORCE}
  )
else
  echo "# provisionning env ${APP_ENV}:"
 (
  cd $PACKAGENAME/openstack-heat-templates/
  make stack_dir=openstack-heat/docker-net heat_parameters='heat-parameters-$(stack_name).yaml' stack_name=forge-${APP_ENV} build-all FORCE=${FORCE}
  )
fi
