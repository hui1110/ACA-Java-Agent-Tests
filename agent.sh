echo 'start to test ACA Java Agent'

cd ACA-Java-Agent-Log-Level/spring-boot-log4j2

az group create -l eastus -n acaspringbootlog4j2test

echo ' spring boot log4j2 test resource group created'

az deployment group create --name arm-deployment --resource-group acaspringbootlog4j2test --template-file test-resource/test-resources.json --parameters projectName=spring-boot-log4j2

echo ' spring boot log4j2 test resource created'

cd ../spring-boot-logback

az group create -l eastus -n acaspringbootlogback

echo ' spring boot logback resource group created'

az deployment group create --name arm-deployment --resource-group acaspringbootlogback --template-file test-resource/test-resources.json --parameters projectName=spring-boot-logback

echo ' spring boot logback resource created'

cd ../spring-log4j2

az group create -l eastus -n acaspringlog4j2

echo ' spring log4j2 resource group created'

az deployment group create --name arm-deployment --resource-group acaspringlog4j2 --template-file test-resource/test-resources.json --parameters projectName=spring-log4j2

echo ' spring log4j2 resource created'

cd ../spring-logback

az group create -l eastus -n acaspringlogback

echo ' spring logback resource group created'

az deployment group create --name arm-deployment --resource-group acaspringlogback --template-file test-resource/test-resources.json --parameters projectName=spring-logback

echo ' spring logback resource created'