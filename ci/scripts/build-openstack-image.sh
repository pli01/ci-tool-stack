#!/bin/bash

# run build-image
stack_name=build-image
time make build stack_dir=openstack-heat/docker-net stack_name=${stack_name} heat_parameters=heat-parameters-build-test.yaml registry=env-build.yaml

# build-image
for image in forge-test-bastion-0 forge-test-front-node-0 ;do
time bash tools/build-image.sh $image
done

# clean build-image
time make build stack_dir=openstack-heat/docker-net stack_name=${stack_name} heat_parameters=heat-parameters-build-test.yaml registry=env-build.yaml
