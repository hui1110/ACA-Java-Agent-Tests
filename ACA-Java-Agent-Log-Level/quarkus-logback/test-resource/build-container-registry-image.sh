#!/bin/bash

set -Eeuo pipefail

az acr login --name $ACR_NAME  --expose-token

az acr build --registry $ACR_NAME --image $ACR_NAME/asa-agent:quarkus-logback --file ACA-Java-Agent-Log-Level/quarkus-logback/Dockerfile https://github.com/hui1110/JavaLogTestProject.git
