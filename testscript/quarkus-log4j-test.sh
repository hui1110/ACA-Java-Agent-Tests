echo 'Start to test ACA Java Agent in Quarkus log4j...'
export URL_PREFIX="https://"
export QUARKUS_LOG4J_RESOURCE_GROUP="quarkuslog4j"
export PROJECT_NAME="quarkus-log4j"
export PROJECT_NAME_JAVA_11_ACA="quarkus-log4j-11-aca"
export PROJECT_NAME_JAVA_17_ACA="quarkus-log4j-17-aca"
export PROJECT_NAME_JAVA_21_ACA="quarkus-log4j-21-aca"
export ACA_DOCKERFILE_NAME="ACAQuarkusDockerfile"

cd ../ACA-Java-Agent-Log-Level/quarkus-log4j

az group create -l eastus -n $QUARKUS_LOG4J_RESOURCE_GROUP
echo '---Quarkus log4j resource group created---'

# ------------------------Quarkus log4j Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus log4j Java 11 ACA image created---'

sleep 60
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --name app-$QUARKUS_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus log4j Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOG4J_RESOURCE_GROUP --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus log4j Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus log4j Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus log4j Java 11 ACA test done------------\\e[0m"

# ------------------------Quarkus log4j Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus log4j Java 17 ACA image created---'

ssleep 60
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --name app-$QUARKUS_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus log4j Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOG4J_RESOURCE_GROUP --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus log4j Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus log4j Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus log4j Java 17 ACA test done------------\\e[0m"

# ------------------------Quarkus log4j Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus log4j Java 21 ACA image created---'

sleep 60
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --name app-$QUARKUS_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus log4j Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOG4J_RESOURCE_GROUP --resource-group $QUARKUS_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus log4j Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus log4j Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Quarkus log4j Java 21 ACA test done------------\\e[0m"

az group delete --name $QUARKUS_LOG4J_RESOURCE_GROUP --yes --no-wait
echo '---Quarkus log4j resource group deleted---'
