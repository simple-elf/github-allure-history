#!/bin/sh -l

RELEASE=$1
echo "Creating docker action with args: $ALPINE_VERSION"

cd /docker-action

# here we can make the construction of the image as customizable as we need
# and if we need parameterizable values it is a matter of sending them as inputs
docker build -t docker-action --build-arg RELEASE="$RELEASE" . && docker run docker-action