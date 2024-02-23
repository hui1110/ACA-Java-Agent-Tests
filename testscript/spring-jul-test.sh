echo 'Start to test ACA Java Agent in Spring jul...'
export URL_PREFIX="https://"
export SPRING_JUL_RESOURCE_GROUP="springjul"
export PROJECT_NAME="spring-jul"
export PROJECT_NAME_JAVA_8_ACA="spring-jul-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-jul-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-jul-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-jul-21-aca"
export ACA_DOCKERFILE_NAME="ACASpringDockerfile"


cd ../ACA-Java-Agent-Log-Level/spring-jul

az group create -l eastus -n $SPRING_JUL_RESOURCE_GROUP
echo '---Spring jul resource group created---'

# ------------------------Spring jul Java 8 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring jul Java 8 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_JUL_RESOURCE_GROUP --name app-$SPRING_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring jul Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_JUL_RESOURCE_GROUP --resource-group $SPRING_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring jul Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring jul Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring jul Java 8 ACA test done------------\\e[0m"

# ------------------------Spring jul Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring jul Java 11 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_JUL_RESOURCE_GROUP --name app-$SPRING_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring jul Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_JUL_RESOURCE_GROUP --resource-group $SPRING_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring jul Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring jul Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring jul Java 11 ACA test done------------\\e[0m"

# ------------------------Spring jul Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring jul Java 17 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_JUL_RESOURCE_GROUP --name app-$SPRING_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring jul Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_JUL_RESOURCE_GROUP --resource-group $SPRING_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring jul Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring jul Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring jul Java 17 ACA test done------------\\e[0m"

# ------------------------Spring jul Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring jul Java 21 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_JUL_RESOURCE_GROUP --name app-$SPRING_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring jul Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_JUL_RESOURCE_GROUP --resource-group $SPRING_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring jul Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring jul Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring jul Java 21 ACA test done------------\\e[0m"

az group delete -n $SPRING_JUL_RESOURCE_GROUP --yes --no-wait
echo '---Spring jul resource group deleted---'
