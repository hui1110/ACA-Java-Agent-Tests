#!/bin/bash

set -Eeuo pipefail

az acr login --name $ACR_NAME  --expose-token

az acr build --registry $ACR_NAME --image $ACR_NAME/asa-agent:$TAG_NAME --file $DOCKERFILE_NAME --build-arg PROJECT_NAME=$PROJECT_NAME --build-arg TAG_NAME=$TAG_NAME https://github.com/hui1110/JavaLogTestProject.git
