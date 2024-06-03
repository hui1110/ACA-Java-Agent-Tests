echo 'Start to test ACA Java Agent in Quarkus log4j2...'
export URL_PREFIX="https://"
export QUARKUS_LOG4J2_RESOURCE_GROUP="quarkuslog4j2"
export PROJECT_NAME="quarkus-log4j2"
export PROJECT_NAME_JAVA_11_ACA="quarkus-log4j2-11-aca"
export PROJECT_NAME_JAVA_17_ACA="quarkus-log4j2-17-aca"
export PROJECT_NAME_JAVA_21_ACA="quarkus-log4j2-21-aca"
export ACA_DOCKERFILE_NAME="ACAQuarkusDockerfile"

cd ../ACA-Java-Agent-Log-Level/quarkus-log4j2

az group create -l eastus -n $QUARKUS_LOG4J2_RESOURCE_GROUP
echo '---Quarkus log4j2 resource group created---'

# ------------------------Quarkus log4j2 Java 11 ACA------------------------
echo '---Start creating the Quarkus log4j2 Java 11 ACA image---'
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus log4j2 Java 11 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_11_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 10
curl $APPLICATION_URL/hello
echo '---Quarkus log4j2 Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_11_ACA --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "quarkus-log4j2-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus log4j2 Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus log4j2 Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus log4j2 Java 11 ACA test done------------\\e[0m"

# ------------------------Quarkus log4j2 Java 17 ACA------------------------
echo '---Start creating the Quarkus log4j2 Java 17 ACA image---'
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus log4j2 Java 17 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_17_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 10
curl $APPLICATION_URL/hello
echo '---Quarkus log4j2 Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_17_ACA --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "quarkus-log4j2-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus log4j2 Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus log4j2 Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus log4j2 Java 17 ACA test done------------\\e[0m"

# ------------------------Quarkus log4j2 Java 21 ACA------------------------
echo '---Start creating the Quarkus log4j2 Java 21 ACA image---'
az deployment group create --name arm-deployment --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus log4j2 Java 21 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_21_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 10
curl $APPLICATION_URL/hello
echo '---Quarkus log4j2 Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_21_ACA --resource-group $QUARKUS_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "quarkus-log4j2-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus log4j2 Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus log4j2 Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Quarkus log4j2 Java 21 ACA test done------------\\e[0m"

az group delete --name $QUARKUS_LOG4J2_RESOURCE_GROUP --yes --no-wait
echo '---Quarkus log4j2 resource group deleted---'
