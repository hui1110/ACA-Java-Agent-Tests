echo 'Start to test ACA Java Agent in Spring Boot log4j2...'
export URL_PREFIX="https://"
export SPRING_BOOT_LOG4J2_RESOURCE_GROUP="acaspringbootlog4j2"
export PROJECT_NAME="spring-boot-log4j2"
export PROJECT_NAME_JAVA_8_ACA="spring-boot-log4j2-8-aca"
export PROJECT_NAME_JAVA_11_ACA="spring-boot-log4j2-11-aca"
export PROJECT_NAME_JAVA_17_ACA="spring-boot-log4j2-17-aca"
export PROJECT_NAME_JAVA_21_ACA="spring-boot-log4j2-21-aca"
export PROJECT_NAME_JAVA_8_ACA_AI="spring-boot-log4j2-8-aca-ai"
export PROJECT_NAME_JAVA_11_ACA_AI="spring-boot-log4j2-11-aca-ai"
export PROJECT_NAME_JAVA_17_ACA_AI="spring-boot-log4j2-17-aca-ai"
export PROJECT_NAME_JAVA_21_ACA_AI="spring-boot-log4j2-21-aca-ai"
export PROJECT_NAME_JAVA_8_ACA_OTLP="spring-boot-log4j2-8-aca-otlp"
export PROJECT_NAME_JAVA_11_ACA_OTLP="spring-boot-log4j2-11-aca-otlp"
export PROJECT_NAME_JAVA_17_ACA_OTLP="spring-boot-log4j2-17-aca-otlp"
export PROJECT_NAME_JAVA_21_ACA_OTLP="spring-boot-log4j2-21-aca-otlp"
export ACA_DOCKERFILE_NAME="ACASpringBootDockerfile"
export ACA_AI_DOCKERFILE_NAME="ACAAISpringBootDockerfile"
export ACA_OTLP_DOCKERFILE_NAME="ACAOTLPSpringBootDockerfile"

cd ACA-Java-Agent-Log-Level/spring-boot-log4j2

az group create -l eastus -n $SPRING_BOOT_LOG4J2_RESOURCE_GROUP
echo '---Spring Boot log4j2 resource group created---'

# ------------------------Spring Boot log4j2 Java 8 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 8 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 8 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 8 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 8 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 8 ACA test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 11 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 11 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 11 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 11 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 11 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 11 ACA test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 17 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 17 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 17 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 17 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 17 ACA DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 17 ACA test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 21 ACA------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA dockerfile_name=$ACA_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 21 ACA image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 21 ACA application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 21 ACA DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 21 ACA DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring Boot log4j2 Java 21 ACA test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 8 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 8 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 8 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 8 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 8 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 8 ACA AI test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 11 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 11 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 11 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 11 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 11 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 11 ACA AI test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 17 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 17 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 17 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 17 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 17 ACA AI DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 17 ACA AI test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 21 ACA AI------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_21_ACA_AI dockerfile_name=$ACA_AI_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 21 ACA AI image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 21 ACA AI application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 21 ACA AI DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 21 ACA AI DEBUG log no output\\e[0m"
fi
echo -e "\\e[33m----------Spring Boot log4j2 Java 21 ACA AI test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 8 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_8_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 8 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 8 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 8 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 8 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 11 ACA OTLP test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 11 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_11_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 11 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 11 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 11 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 11 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 11 ACA OTLP test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 17 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME tagName=$PROJECT_NAME_JAVA_17_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 17 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 17 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 17 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 17 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Spring Boot log4j2 Java 17 ACA OTLP test done------------\\e[0m"

# ------------------------Spring Boot log4j2 Java 21 ACA OTLP------------------------
az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=$PROJECT_NAME  tagName=$PROJECT_NAME_JAVA_21_ACA_OTLP dockerfile_name=$ACA_OTLP_DOCKERFILE_NAME
echo '---Spring Boot log4j2 Java 21 ACA OTLP image created---'

sleep 10
export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
sleep 5
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 Java 21 ACA OTLP application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 100 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 Java 21 ACA OTLP DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 Java 21 ACA OTLP DEBUG log no output\\e[0m"
fi

echo -e "\\e[33m----------Quarkus logback Java 21 ACA OTLP test done------------\\e[0m"
