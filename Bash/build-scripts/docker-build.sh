#!/usr/bin/env bash

# https://docs.docker.com/engine/reference/commandline/build/

[[ -z "${IMAGE:-}" ]] && echo -n "Enter Image Name: " && read IMAGE
[[ -z "${TAG:-}" ]] && echo -n "Enter Container Tag: " && read TAG

docker build -t ${IMAGE}:${TAG} .