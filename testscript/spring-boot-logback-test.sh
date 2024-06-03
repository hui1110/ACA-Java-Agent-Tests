echo 'Start to test ACA Java Agent in Spring Boot logback...'
export URL_PREFIX="https://"
export SPRING_BOOT_LOGBACK_RESOURCE_GROUP="springbootlogbackit"
export PROJECT_NAME="spring-boot-logback"
export PROJECT_NAME_JAVA_8_ACA="spring-boot-logback-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-boot-logback-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-boot-logback-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-boot-logback-21-aca"
export ACA_DOCKERFILE_NAME="ACASpringBootDockerfile"

cd ../ACA-Java-Agent-Log-Level/spring-boot-logback

az group create -l eastus -n $SPRING_BOOT_LOGBACK_RESOURCE_GROUP
echo '---Spring Boot logback resource group created---'

# ------------------------Spring Boot logback Java 8 ACA------------------------
echo '---Start creating the Spring Boot logback Java 8 ACA image---'
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot logback Java 8 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_8_ACA --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot logback Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_8_ACA --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-boot-logback" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot logback Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot logback Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot logback Java 8 ACA test done------------\\e[0m"

# ------------------------Spring Boot logback Java 11 ACA------------------------
echo '---Start creating the Spring Boot logback Java 11 ACA image---'
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot logback Java 11 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_11_ACA --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot logback Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_11_ACA --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-boot-logback" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot logback Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot logback Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot logback Java 11 ACA test done------------\\e[0m"

# ------------------------Spring Boot logback Java 17 ACA------------------------
echo '---Start creating the Spring Boot logback Java 17 ACA image---'
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot logback Java 17 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_17_ACA --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot logback Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_17_ACA --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-boot-logback" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot logback Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot logback Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot logback Java 17 ACA test done------------\\e[0m"

# ------------------------Spring Boot logback Java 21 ACA------------------------
echo '---Start creating the Spring Boot logback Java 21 ACA image---'
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot logback Java 21 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --name app-$PROJECT_NAME_JAVA_21_ACA --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot logback Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$PROJECT_NAME_JAVA_21_ACA --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --type console --tail 100 | grep "spring-boot-logback" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot logback Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot logback Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring Boot logback Java 21 ACA test done------------\\e[0m"

az group delete -n $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --yes --no-wait
echo '---Spring Boot logback resource group deleted---'
