#!/bin/bash

set -Eeuo pipefail

az acr login --name $ACR_NAME  --expose-token

ll

az acr build --registry $ACR_NAME --image $ACR_NAME/asa-agent:quarkus-logback:v1 .
