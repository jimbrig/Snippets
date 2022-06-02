#!/usr/bin/env bash

[[ -z "${OWNER:-}" ]] && echo -n "Enter Container Owner: " && read OWNER
[[ -z "${IMAGE:-}" ]] && echo -n "Enter Image Name: " && read IMAGE
[[ -z "${TAG:-}" ]] && echo -n "Enter Container Tag: " && read TAG

# [[ -z "${OWNER:-}" ]] && OWNER='asw101'
# [[ -z "${LOCAL:-}" ]] && LOCAL='test'
# [[ -z "${IMAGE:-}" ]] && IMAGE='test'
# [[ -z "${TAG:-}" ]] && TAG='latest'

echo "ghcr.io/${OWNER}/${IMAGE}:${TAG}"

docker tag ${IMAGE} ghcr.io/${OWNER}/${IMAGE}:${TAG}
docker push ghcr.io/${OWNER}/${IMAGE}:${TAG}
