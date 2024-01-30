echo 'Start to test ACA Java Agent...'

cd ACA-Java-Agent-Log-Level/spring-boot-log4j2

az group create -l eastus -n acaspringbootlog4j2

echo '---Spring Boot log4j2 test resource group created---'

az deployment group create --name arm-deployment --resource-group acaspringbootlog4j2 --template-file test-resource/test-resources.json --parameters projectName=spring-boot-log4j2

echo '---Spring Boot log4j2 test resource created---'

curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.boot.accelerator.log4j2

echo '---Updated Spring Boot log4j2 log level to debug---'

if [ $(az containerapp logs show --name app-acaspringbootlog4j2 --resource-group acaspringbootlog4j2 --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot log4j2 DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot log4j2 DEBUG log no output\\e[0m"
fi

cd ../spring-boot-logback

az group create -l eastus -n acaspringbootlogback

echo '---Spring Boot logback resource group created---'

az deployment group create --name arm-deployment --resource-group acaspringbootlogback --template-file test-resource/test-resources.json --parameters projectName=spring-boot-logback

echo '---Spring Boot logback resource created---'

curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.boot.accelerator.logback

echo '---Updated Spring Boot logback log level to debug---'

if [ $(az containerapp logs show --name app-acaspringbootlogback --resource-group acaspringbootlogback --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring Boot logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring Boot logback DEBUG log no output\\e[0m"
fi

cd ../spring-log4j2

az group create -l eastus -n acaspringlog4j2

echo '---Spring log4j2 resource group created---'

az deployment group create --name arm-deployment --resource-group acaspringlog4j2 --template-file test-resource/test-resources.json --parameters projectName=spring-log4j2

echo '---Spring log4j2 resource created---'

curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=debug&logPkgName=com.microsoft.azure.spring.accelerator.log4j2

echo '---Updated Spring log4j2 log level to debug---'

if [ $(az containerapp logs show --name app-acaspringlog4j2 --resource-group acaspringlog4j2 --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring log4j2 DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring log4j2 DEBUG log no output\\e[0m"
fi

cd ../spring-logback

az group create -l eastus -n acaspringlogback

echo '---Spring logback resource group created---'

az deployment group create --name arm-deployment --resource-group acaspringlogback --template-file test-resource/test-resources.json --parameters projectName=spring-logback

echo '---Spring logback resource created---'

curl https://capps-azapi-rp-cca89.azurewebsites.net/subscriptions/799c12ba-353c-44a1-883d-84808ebb2216/resourcegroups/yonghui-agent-rg/providers/Microsoft.App/containerApps/yonghui-agent-container-app/setLogger?logLevel=error&logPkgName=com.microsoft.azure.spring.accelerator.logback

echo '---Updated Spring logback log level to debug---'

if [ $(az containerapp logs show --name app-acaspringlogback --resource-group acaspringlogback --type console --tail 50 | grep "DEBUG" | wc -l) -gt 0 ]
then
   echo -e "\\e[34mSpring logback DEBUG log has output\\e[0m"
else
   echo -e "\\e[31mSpring logback DEBUG log no output\\e[0m"
fi
