#!/usr/bin/env bash

# https://docs.microsoft.com/en-us/azure/container-registry/container-registry-quickstart-task-cli

[[ -z "${RESOURCE_GROUP:-}" ]] && echo -n "Enter Resource Group Name: " && read RESOURCE_GROUP
ACR_NAME=$(az acr list --resource-group $RESOURCE_GROUP --query '[0].name' --out tsv)
echo "Found Container Registry: ${ACR_NAME}"

[[ -z "${OWNER:-}" ]] && echo -n "Enter Container Owner: " && read OWNER
[[ -z "${IMAGE:-}" ]] && echo -n "Enter Image Name: " && read IMAGE
[[ -z "${TAG:-}" ]] && echo -n "Enter Container Tag: " && read TAG

echo "Will deploy container image to ${ACR_NAME}.azurecr.io/${OWNER}/${IMAGE}:${TAG}."
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

if [ $confirm = "y" ]
    then
        az acr build -t ${OWNER}/${IMAGE}:${TAG} -r $ACR_NAME .
fi

