echo 'Start to test ACA Java Agent in Spring logback...'
export URL_PREFIX="https://"
export SPRING_LOGBACK_RESOURCE_GROUP="springlogback"
export PROJECT_NAME="spring-logback"
export PROJECT_NAME_JAVA_8_ACA="spring-logback-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-logback-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-logback-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-logback-21-aca"
export ACA_DOCKERFILE_NAME="ACASpringDockerfile"

cd ../ACA-Java-Agent-Log-Level/spring-logback

az group create -l eastus -n $SPRING_LOGBACK_RESOURCE_GROUP
echo '---Spring logback resource group created---'

# ------------------------Spring logback Java 8 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 8 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_8_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 30
curl $APPLICATION_URL/hello
echo '---Spring logback Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_8_ACA --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-logback-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 8 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 11 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_11_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 30
curl $APPLICATION_URL/hello
echo '---Spring logback Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_11_ACA --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-logback-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 11 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 17 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_17_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 30
curl $APPLICATION_URL/hello
echo '---Spring logback Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_17_ACA --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-logback-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring logback Java 17 ACA test done------------\\e[0m"

# ------------------------Spring logback Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring logback Java 21 ACA image created---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_21_ACA --query properties.configuration.ingress.fqdn --output tsv)
sleep 30
curl $APPLICATION_URL/hello
echo '---Spring logback Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_21_ACA --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-logback-sample" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring logback Java 21 ACA test done------------\\e[0m"

az group delete -n $SPRING_LOGBACK_RESOURCE_GROUP --yes --no-wait
echo '---Spring logback resource group deleted---'
