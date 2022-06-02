#!/usr/bin/env bash

[[ -z "${IMAGE:-}" ]] && echo -n "Enter Image Name: " && read IMAGE
[[ -z "${TAG:-}" ]] && echo -n "Enter Container Tag: " && read TAG
[[ -z "${PORT:-}" ]] && echo -n "Enter Port: " && read PORT

docker run -p ${PORT}:${PORT} -e LISTEN_ADDR=":${PORT}" ${IMAGE}:${TAG}
