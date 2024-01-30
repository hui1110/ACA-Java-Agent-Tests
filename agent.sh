echo 'Start to test ACA Java Agent...'
export URL_PREFIX="https://"
export QUARKUS_LOGBACK_RESOURCE_GROUP="acaquarkuslogback"
export SPRING_BOOT_LOG4J2_RESOURCE_GROUP="acaspringbootlog4j2"
export SPRING_BOOT_LOGBACK_RESOURCE_GROUP="acaspringbootlogback"
export SPRING_LOG4J2_RESOURCE_GROUP="acaspringlog4j2"
export SPRING_LOGBACK_RESOURCE_GROUP="acaspringlogback"


cd ACA-Java-Agent-Log-Level/quarkus-logback

az group create -l eastus -n $QUARKUS_LOGBACK_RESOURCE_GROUP
echo '---Quarkus logback resource group created---'

az deployment group create --name arm-deployment --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=quarkus-logback
echo '---Quarkus logback resource created---'

#curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.quarkus.accelerator.logback
#echo '---Updated Quarkus logback log level to debug---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Quarkus logback application debug API access---'

if [ $(az containerapp logs show --name app-$QUARKUS_LOGBACK_RESOURCE_GROUP --resource-group $QUARKUS_LOGBACK_RESOURCE_GROUP --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mQuarkus logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mQuarkus logback DEBUG log no output\\e[0m"
fi

cd ../spring-boot-log4j2

az group create -l eastus -n $SPRING_BOOT_LOG4J2_RESOURCE_GROUP
echo '---Spring Boot log4j2 test resource group created---'

az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=spring-boot-log4j2
echo '---Spring Boot log4j2 test resource created---'

#curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.boot.accelerator.log4j2
#echo '---Updated Spring Boot log4j2 log level to debug---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot log4j2 application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOG4J2_RESOURCE_GROUP --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 DEBUG log no output\\e[0m"
fi

cd ../spring-boot-logback

az group create -l eastus -n $SPRING_BOOT_LOGBACK_RESOURCE_GROUP
echo '---Spring Boot logback resource group created---'

az deployment group create --name arm-deployment --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=spring-boot-logback
echo '---Spring Boot logback resource created---'

#curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.boot.accelerator.logback
#echo '---Updated Spring Boot logback log level to debug---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --name app-$SPRING_BOOT_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring Boot logback application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_BOOT_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_BOOT_LOGBACK_RESOURCE_GROUP --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot logback DEBUG log no output\\e[0m"
fi

cd ../spring-log4j2

az group create -l eastus -n $SPRING_LOG4J2_RESOURCE_GROUP
echo '---Spring log4j2 resource group created---'

az deployment group create --name arm-deployment --resource-group $SPRING_LOG4J2_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=spring-log4j2
echo '---Spring log4j2 resource created---'

#curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.accelerator.log4j2
#echo '---Updated Spring log4j2 log level to debug---'

export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOG4J2_RESOURCE_GROUP --name app-$SPRING_LOG4J2_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring log4j2 application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOG4J2_RESOURCE_GROUP --resource-group $SPRING_LOG4J2_RESOURCE_GROUP --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring log4j2 DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring log4j2 DEBUG log no output\\e[0m"
fi

cd ../spring-logback

az group create -l eastus -n $SPRING_LOGBACK_RESOURCE_GROUP
echo '---Spring logback resource group created---'

az deployment group create --name arm-deployment --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --template-file test-resource/test-resources.json --parameters projectName=spring-logback
echo '---Spring logback resource created---'

#curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.accelerator.logback
#echo '---Updated Spring logback log level to debug---'


export APPLICATION_URL=$URL_PREFIX$(az containerapp show --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --name app-$SPRING_LOGBACK_RESOURCE_GROUP --query properties.configuration.ingress.fqdn --output tsv)
curl $APPLICATION_URL/hello
echo '---Spring logback application debug API access---'

if [ $(az containerapp logs show --name app-$SPRING_LOGBACK_RESOURCE_GROUP --resource-group $SPRING_LOGBACK_RESOURCE_GROUP --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback DEBUG log no output\\e[0m"
fi
