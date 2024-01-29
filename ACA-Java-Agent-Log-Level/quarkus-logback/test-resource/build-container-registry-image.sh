#!/bin/bash

set -Eeuo pipefail

az acr login --name $ACR_NAME  --expose-token

git clone https://github.com/hui1110/JavaLogTestProject.git

az acr build --registry $ACR_NAME --image $ACR_NAME/asa-agent:quarkus-logback --file JavaLogTestProject/ACA-Java-Agent-Log-Level/quarkus-logback/Dockerfile JavaLogTestProject/ACA-Java-Agent-Log-Level/quarkus-logback
