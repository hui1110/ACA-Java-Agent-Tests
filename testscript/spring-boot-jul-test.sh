echo 'Start to test ACA Java Agent in Spring Boot jul...'
export URL_PREFIX="https://"
export SPRING_BOOT_JUL_RESOURCE_GROUP="springbootjul"
export PROJECT_NAME="spring-boot-jul"
export PROJECT_NAME_JAVA_8_ACA="spring-boot-jul-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-boot-jul-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-boot-jul-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-boot-jul-21-aca"
export ACA_DOCKERFILE_NAME="ACASpringBootDockerfile"

cd ../ACA-Java-Agent-Log-Level/spring-boot-jul

az group create -l eastus -n $SPRING_BOOT_JUL_RESOURCE_GROUP
echo '---Spring Boot jul resource group created---'

# ------------------------Spring Boot jul Java 8 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot jul Java 8 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot jul Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot jul Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot jul Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot jul Java 8 ACA test done------------\\e[0m"

# ------------------------Spring Boot jul Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot jul Java 11 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot jul Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot jul Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot jul Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot jul Java 11 ACA test done------------\\e[0m"

# ------------------------Spring Boot jul Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot jul Java 17 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot jul Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot jul Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot jul Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot jul Java 17 ACA test done------------\\e[0m"

# ------------------------Spring Boot jul Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot jul Java 21 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot jul Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_JUL_RESOURCE_GROUP --resource-group $SPRING_BOOT_JUL_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot jul Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot jul Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring Boot jul Java 21 ACA test done------------\\e[0m"

az group delete --name $SPRING_BOOT_JUL_RESOURCE_GROUP --yes --no-wait
echo '---Spring Boot jul resource group deleted---'
