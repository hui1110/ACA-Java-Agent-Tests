#!/bin/bash

set -Eeuo pipefail

pwd

cp -f ../../../spring-boot-docker/Dockerfile ../../../Dockerfile

az acr login --name $ACR_NAME  --expose-token

az acr build --registry $ACR_NAME --image $ACR_NAME/asa-agent:$PROJECT_NAME --build-arg PROJECT_NAME=$PROJECT_NAME https://github.com/hui1110/JavaLogTestProject.git
