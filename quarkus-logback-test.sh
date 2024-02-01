echo 'Start to test ACA Java Agent in Quarkus logback...'
export URL_PREFIX="https://"
export QUARKUS_LOGBACK_RESOURCE_GROUP="acaquarkuslogback00"
export PROJECT_NAME_JAVA_11_ACA="quarkus-logback-11-aca"
export PROJECT_NAME_JAVA_17_ACA="quarkus-logback-17-aca"
export PROJECT_NAME_JAVA_21_ACA="quarkus-logback-21-aca"
export PROJECT_NAME_JAVA_11_ACA_AI="quarkus-logback-11-aca-ai"
export PROJECT_NAME_JAVA_17_ACA_AI="quarkus-logback-17-aca-ai"
export PROJECT_NAME_JAVA_21_ACA_AI="quarkus-logback-21-aca-ai"
export PROJECT_NAME_JAVA_11_ACA_OTLP="quarkus-logback-11-aca-otlp"
export PROJECT_NAME_JAVA_17_ACA_OTLP="quarkus-logback-17-aca-otlp"
export PROJECT_NAME_JAVA_21_ACA_OTLP="quarkus-logback-21-aca-otlp"
export DOCKERFILE_NAME="ACAQuarkusLogbackDockerfile"

cd ACA-Java-Agent-Log-Level/quarkus-logback

az group create -l eastus -n $QUARKUS_LOGBACK_RESOURCE_GROUP
echo '---Quarkus logback resource group created---'

# ------------------------quarkus-logback-11-aca------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$DOCKERFILE_NAME
echo '---Quarkus logback resource created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Quarkus logback application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------quarkus-logback-11-aca test done------------\\e[0m"
# ------------------------quarkus-logback-17-aca------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$DOCKERFILE_NAME
echo '---Quarkus logback resource created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Quarkus logback application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------quarkus-logback-17-aca test done------------\\e[0m"
# ------------------------quarkus-logback-21-aca------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$DOCKERFILE_NAME
echo '---Quarkus logback resource created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Quarkus logback application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------quarkus-logback-21-aca test done------------\\e[0m"
