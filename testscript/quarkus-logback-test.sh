echo 'Start to test ACA Java Agent in Quarkus logback...'
export URL_PREFIX="https://"
export QUARKUS_LOGBACK_RESOURCE_GROUP="quarkuslogback"
export PROJECT_NAME="quarkus-logback"
export PROJECT_NAME_JAVA_11_ACA="quarkus-logback-11-aca"
export PROJECT_NAME_JAVA_17_ACA="quarkus-logback-17-aca"
export PROJECT_NAME_JAVA_21_ACA="quarkus-logback-21-aca"
export ACA_DOCKERFILE_NAME="ACAQuarkusDockerfile"

cd ../ACA-Java-Agent-Log-Level/quarkus-logback

az group create -l eastus -n $QUARKUS_LOGBACK_RESOURCE_GROUP
echo '---Quarkus logback resource group created---'

# ------------------------Quarkus logback Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus logback Java 11 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 11 ACA test done------------\\e[0m"

# ------------------------Quarkus logback Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus logback Java 17 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 17 ACA test done------------\\e[0m"

# ------------------------Quarkus logback Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus logback Java 21 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Quarkus logback Java 21 ACA test done------------\\e[0m"

az group delete --name $QUARKUS_LOGBACK_RESOURCE_GROUP --yes --no-wait
echo '---Quarkus logback resource group deleted---'
