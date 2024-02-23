echo 'Start to test ACA Java Agent in Spring log4j...'
export URL_PREFIX="https://"
export SPRING_LOG4J_RESOURCE_GROUP="springlog4j"
export PROJECT_NAME="spring-log4j"
export PROJECT_NAME_JAVA_8_ACA="spring-log4j-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-log4j-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-log4j-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-log4j-21-aca"
export ACA_DOCKERFILE_NAME="ACASpringDockerfile"


cd ../ACA-Java-Agent-Log-Level/spring-log4j

az group create -l eastus -n $SPRING_LOG4J_RESOURCE_GROUP
echo '---Spring log4j resource group created---'

# ------------------------Spring log4j Java 8 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring log4j Java 8 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOG4J_RESOURCE_GROUP --name app-$SPRING_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring log4j Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOG4J_RESOURCE_GROUP --resource-group $SPRING_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring log4j Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring log4j Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring log4j Java 8 ACA test done------------\\e[0m"

# ------------------------Spring log4j Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring log4j Java 11 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOG4J_RESOURCE_GROUP --name app-$SPRING_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring log4j Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOG4J_RESOURCE_GROUP --resource-group $SPRING_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring log4j Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring log4j Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring log4j Java 11 ACA test done------------\\e[0m"

# ------------------------Spring log4j Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring log4j Java 17 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOG4J_RESOURCE_GROUP --name app-$SPRING_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring log4j Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOG4J_RESOURCE_GROUP --resource-group $SPRING_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring log4j Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring log4j Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring log4j Java 17 ACA test done------------\\e[0m"

# ------------------------Spring log4j Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOG4J_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring log4j Java 21 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOG4J_RESOURCE_GROUP --name app-$SPRING_LOG4J_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring log4j Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOG4J_RESOURCE_GROUP --resource-group $SPRING_LOG4J_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring log4j Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring log4j Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring log4j Java 21 ACA test done------------\\e[0m"

az group delete -n $SPRING_LOG4J_RESOURCE_GROUP --yes --no-wait
echo '---Spring log4j resource group deleted---'
