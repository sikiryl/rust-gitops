#!/bin/bash

export TAG=$(cargo get package.version)
export REGISTRY="jumpboxacademy/nongkai"
export IMAGE=$REGISTRY:$TAG
echo current image: $IMAGE
# docker build -t $REGISTRY:$TAG .
# echo $REGISTRY_PASS | docker login -u jumpboxacademy --password-stdin
#docker push $REGISTRY:$TAG
yq -i '.spec.template.spec.containers[0].image=strenv(IMAGE)' manifests/deployment.yaml