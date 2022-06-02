#!/usr/bin/env bash

# https://docs.docker.com/buildx/working-with-buildx/#build-multi-platform-images

[[ -z "${IMAGE:-}" ]] && echo -n "Enter Image Name: " && read IMAGE
[[ -z "${TAG:-}" ]] && echo -n "Enter Container Tag: " && read TAG

docker buildx build -t ${IMAGE}:${TAG} --platform linux/amd64 .