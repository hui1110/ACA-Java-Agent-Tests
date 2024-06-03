echo 'Start to test ACA Java Agent in Quarkus jul...'
export URL_PREFIX="https://"
export QUARKUS_JUL_RESOURCE_GROUP="quarkusjul"
export PROJECT_NAME="quarkus-jul"
export PROJECT_NAME_JAVA_11_ACA="quarkus-jul-11-aca"
export PROJECT_NAME_JAVA_17_ACA="quarkus-jul-17-aca"
export PROJECT_NAME_JAVA_21_ACA="quarkus-jul-21-aca"
export ACA_DOCKERFILE_NAME="ACAQuarkusDockerfile"

cd ../ACA-Java-Agent-Log-Level/quarkus-jul

az group create -l eastus -n $QUARKUS_JUL_RESOURCE_GROUP
echo '---Quarkus jul resource group created---'

# ------------------------Quarkus jul Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus jul Java 11 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_JUL_RESOURCE_GROUP --name app-$QUARKUS_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus jul Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_JUL_RESOURCE_GROUP --resource-group $QUARKUS_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus jul Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus jul Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus jul Java 11 ACA test done------------\\e[0m"

# ------------------------Quarkus jul Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus jul Java 17 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_JUL_RESOURCE_GROUP --name app-$QUARKUS_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus jul Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_JUL_RESOURCE_GROUP --resource-group $QUARKUS_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus jul Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus jul Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus jul Java 17 ACA test done------------\\e[0m"

# ------------------------Quarkus jul Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $QUARKUS_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Quarkus jul Java 21 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_JUL_RESOURCE_GROUP --name app-$QUARKUS_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus jul Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_JUL_RESOURCE_GROUP --resource-group $QUARKUS_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus jul Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus jul Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Quarkus jul Java 21 ACA test done------------\\e[0m"

az group delete --name $QUARKUS_JUL_RESOURCE_GROUP --yes --no-wait
echo '---Quarkus jul resource group deleted---'
