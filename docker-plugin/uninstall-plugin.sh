#!/usr/bin/env bash

PLUGINNAME=ngpbach/rustycan4docker

# Remove active networks
docker network ls | grep can && \
    docker network ls | grep can | cut -f 1 -d ' ' | tr '\n' '\0' | xargs -0 -n1 docker network rm

# Disable the plugin
docker plugin ls --filter enabled=true | grep $PLUGINNAME > /dev/null && \
    docker plugin disable $PLUGINNAME

# Remove the plugin
docker plugin ls | grep $PLUGINNAME > /dev/null && \
    docker plugin rm $PLUGINNAME
